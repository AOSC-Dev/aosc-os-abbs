#!/bin/env python3
import os
import sys
import time
import re
from urllib import request, error
import logging
import socket
from operator import itemgetter
from collections import OrderedDict
import configparser
import shutil
import binascii
import zipfile

TDM_MIRROR_INFO = 'http://mirrors.thedarkmod.com/tdm_mirrors.txt'

# code segments from soimort/you-get (MIT lincense)


def match1(text, *patterns):
    """Scans through a string for substrings matched some patterns (first-subgroups only).
    Args:
        text: A string to be scanned.
        patterns: Arbitrary number of regex patterns.
    Returns:
        When only one pattern is given, returns a string (None if no match found).
        When more than one pattern are given, returns a list of strings ([] if no match found).
    """

    if len(patterns) == 1:
        pattern = patterns[0]
        match = re.search(pattern, text)
        if match:
            return match.group(1)
        else:
            return None
    else:
        ret = []
        for pattern in patterns:
            match = re.search(pattern, text)
            if match:
                ret.append(match.group(1))
        return ret


def ungzip(data):
    """Decompresses data for Content-Encoding: gzip.
    """
    from io import BytesIO
    import gzip
    buffer = BytesIO(data)
    f = gzip.GzipFile(fileobj=buffer)
    return f.read()


def undeflate(data):
    """Decompresses data for Content-Encoding: deflate.
    (the zlib compression is used.)
    """
    import zlib
    decompressobj = zlib.decompressobj(-zlib.MAX_WBITS)
    return decompressobj.decompress(data) + decompressobj.flush()


def urlopen_with_retry(*args, **kwargs):
    for i in range(2):
        try:
            return request.urlopen(*args, **kwargs)
        except socket.timeout:
            logging.debug('request attempt %s timeout' % str(i + 1))
        except error.HTTPError as http_error:
            logging.debug('HTTP Error with code{}'.format(http_error.code))


def get_content(url, headers={}, decoded=True):
    """Gets the content of a URL via sending a HTTP GET request.
    Args:
        url: A URL.
        headers: Request headers used by the client.
        decoded: Whether decode the response body using UTF-8 or the charset specified in Content-Type.
    Returns:
        The content as a string.
    """

    logging.debug('get_content: %s' % url)

    req = request.Request(url, headers=headers)

    response = urlopen_with_retry(req)
    data = response.read()

    # Handle HTTP compression for gzip and deflate (zlib)
    content_encoding = response.getheader('Content-Encoding')
    if content_encoding == 'gzip':
        data = ungzip(data)
    elif content_encoding == 'deflate':
        data = undeflate(data)

    # Decode the response body
    if decoded:
        charset = match1(response.getheader(
            'Content-Type'), r'charset=([\w-]+)')
        if charset is not None:
            data = data.decode(charset)
        else:
            data = data.decode('utf-8', 'ignore')

    return data


def url_size(url):
    response = urlopen_with_retry(url)
    size = response.headers['content-length']
    return int(size) if size is not None else float('inf')


def url_save(url, bar, timeout=None, filepath='.', **kwargs):
    if not os.path.exists(os.path.dirname(filepath)):
        os.mkdir(os.path.dirname(filepath))
    file_size = url_size(url)
    temp_filepath = filepath + '.download' if file_size!=float('inf') else filepath
    received = 0
    open_mode = 'wb'
    if received < file_size:
        headers = {}
        if received:
            headers['Range'] = 'bytes=' + str(received) + '-'

        if timeout:
            response = urlopen_with_retry(request.Request(url, headers=headers), timeout=timeout)
        else:
            response = urlopen_with_retry(request.Request(url, headers=headers))
        try:
            range_start = int(response.headers['content-range'][6:].split('/')[0].split('-')[0])
            end_length = int(response.headers['content-range'][6:].split('/')[1])
            range_length = end_length - range_start
        except:
            content_length = response.headers['content-length']
            range_length = int(content_length) if content_length is not None else float('inf')

        if file_size != received + range_length:
            received = 0
            if bar:
                bar.received = 0
            open_mode = 'wb'

        with open(temp_filepath, open_mode) as output:
            while True:
                buffer = response.read(1024 * 256)
                if not buffer:
                    if received == file_size:  # Download finished
                        break
                    else:  # Unexpected termination. Retry request
                        headers['Range'] = 'bytes=' + str(received) + '-'
                        response = urlopen_with_retry(request.Request(url, headers=headers))
                output.write(buffer)
                received += len(buffer)
                if bar:
                    bar.update_received(len(buffer))

    assert received == os.path.getsize(temp_filepath), '%s == %s == %s' % (received, os.path.getsize(temp_filepath), temp_filepath)

    if os.access(filepath, os.W_OK):
        os.remove(filepath)  # on Windows rename could fail if destination filepath exists
    os.rename(temp_filepath, filepath)


class SimpleProgressBar:
    term_size = shutil.get_terminal_size()[0]

    def __init__(self, total_size, total_pieces=1):
        self.displayed = False
        self.total_size = total_size
        self.total_pieces = total_pieces
        self.current_piece = 1
        self.received = 0
        self.speed = ''
        self.last_updated = time.time()

        total_pieces_len = len(str(total_pieces))
        # 38 is the size of all statically known size in self.bar
        total_str = '%5s' % round(self.total_size / 1048576, 1)
        total_str_width = max(len(total_str), 5)
        self.bar_size = self.term_size - 27 - 2 * \
            total_pieces_len - 2 * total_str_width
        self.bar = '{:>4}%% ({:>%s}/%sMB) ├{:─<%s}┤[{:>%s}/{:>%s}] {}' % (
            total_str_width, total_str, self.bar_size, total_pieces_len, total_pieces_len)

    def update(self):
        self.displayed = True
        bar_size = self.bar_size
        percent = round(self.received * 100 / self.total_size, 1)
        if percent >= 100:
            percent = 100
        dots = bar_size * int(percent) // 100
        plus = int(percent) - dots // bar_size * 100
        if plus > 0.8:
            plus = '█'
        elif plus > 0.4:
            plus = '>'
        else:
            plus = ''
        bar = '█' * dots + plus
        bar = self.bar.format(percent, round(
            self.received / 1048576, 1), bar, self.current_piece, self.total_pieces, self.speed)
        sys.stdout.write('\r' + bar)
        sys.stdout.flush()

    def update_received(self, n):
        self.received += n
        time_diff = time.time() - self.last_updated
        bytes_ps = n / time_diff if time_diff else 0
        if bytes_ps >= 1024 ** 3:
            self.speed = '{:4.0f} GB/s'.format(bytes_ps / 1024 ** 3)
        elif bytes_ps >= 1024 ** 2:
            self.speed = '{:4.0f} MB/s'.format(bytes_ps / 1024 ** 2)
        elif bytes_ps >= 1024:
            self.speed = '{:4.0f} kB/s'.format(bytes_ps / 1024)
        else:
            self.speed = '{:4.0f}  B/s'.format(bytes_ps)
        self.last_updated = time.time()
        self.update()

    def update_piece(self, n):
        self.current_piece = n

    def done(self):
        if self.displayed:
            print()
            self.displayed = False


# end of snippet

tpl = """
#!/bin/bash
axel -h >> /dev/null || exit 1
FILES=(%s)
SERVERS=(%s)
function concat_url() {
  FULL_URLS=''
  for i in "${SERVERS[@]}";
    do FULL_URLS+=" $i/$1";
  done
  echo ${FULL_URLS}
}
for i in "${FILES[@]}";
   do
       mkdir -p "$(dirname "$i")"
       axel -a $(concat_url "$i") -o "$i.dl"
       mv "$i.dl" "$i"
done
"""


def crc_file(fn):
    if zipfile.is_zipfile(fn):
        return crc_zip_content(fn)
    with open(fn, 'rb') as f:
        return binascii.crc32(f.read())


def crc_zip_content(zipfn):
    target = zipfile.ZipFile(zipfn)
    acc_crc = 0
    for entry in target.namelist():
        try:
            acc_crc ^= binascii.crc32(target.read(entry))
        except Exception:
            return 0
    return acc_crc


class TDMUpdater(object):
    def __init__(self):
        self.mirrors = configparser.ConfigParser()
        self.files = configparser.ConfigParser()
        self.selected_mir = None
        self.wt = []
        self.tdfiles = []
        self.dl_size = 0

    def load_mirrors(self):
        print('Finding mirrors...')
        mirrors_data = get_content(TDM_MIRROR_INFO)
        self.mirrors.read_string(mirrors_data)
        for entry in self.mirrors.sections():
            itype, mir = entry.split()
            if itype != 'Mirror':
                raise Exception('Unknown mirror type: {} for {}'.format(itype, mir))
            self.wt.append(tuple([mir, int(self.mirrors[entry]['weight'])]))
        self.wt = sorted(self.wt, key=itemgetter(1), reverse=True)
        self.selected_mir = self.mirrors['Mirror %s' % (self.wt[1][0])]['url']
        print('Selected server `{}` as download server.'.format(self.wt[1][0]))

    def load_files(self):
        print('Querying files status...')
        file_dat = get_content(os.path.join(self.selected_mir, 'crc_info.txt'))
        self.files.read_string(file_dat)

    def perform_maint(self):
        if self.files.has_section('Maintenance'):
            maint = self.files['Maintenance']
            for i in maint:
                if maint[i] == 'remove' and os.path.isfile(i):
                    os.remove(i)

    def check_files(self):
        for f in self.files:
            item_unpack = f.split()
            if len(item_unpack) < 2:
                continue
            itype, item = item_unpack
            if itype == 'File':
                sys.stdout.write('\rChecking for {}...          '.format(item))
                sys.stdout.flush()
                if os.path.isfile(item):
                    if not (self.files[f]['crc'] == '{:x}'.format(crc_file(item)) and self.files[f]['size'] == str(os.path.getsize(item))):
                        self.tdfiles.append(item)
                        self.dl_size += int(self.files[f]['size'])
                else:
                    self.tdfiles.append(item)
                    self.dl_size += int(self.files[f]['size'])
        print('')

    def download_files(self):
        tdfiles_num = len(self.tdfiles)
        if not tdfiles_num:
            print('Nothing to do.')
            sys.exit(0)
        print('Downloading {} files...'.format(tdfiles_num))
        bar = SimpleProgressBar(self.dl_size, tdfiles_num)
        for i, dl in enumerate(self.tdfiles):
            url_save(os.path.join(self.selected_mir, dl), bar=bar, filepath=('./' + dl))
            bar.update_piece(i + 1)

    def gen_axel_script(self, output='tdm_update.sh'):
        all_urls = []
        for mir in self.mirrors:
            if mir == 'DEFAULT':
                continue
            all_urls.append(self.mirrors[mir]['url'])
        with open(output, 'wt') as f:
            f.write(tpl % (' '.join(self.tdfiles), ' '.join(all_urls)))
        print('Generated download script: %s' % output)


def main():
    tdmu = TDMUpdater()
    tdmu.load_mirrors()
    tdmu.load_files()
    tdmu.perform_maint()
    tdmu.check_files()
    if len(sys.argv) > 1 and sys.argv[1] == '-g':
        return tdmu.gen_axel_script()
    for retry in range(2):
        tdmu.download_files()
        tdmu.tdfiles.clear()
        tdmu.check_files()
        if not tdmu.tdfiles:
            sys.exit(0)
        print('Some files are failed to download, try again...')
    raise Exception('The following files are failed to pass integrity check: \n{}'.format(' '.join(tdmu.tdfiles)))


if __name__ == '__main__':
    main()
