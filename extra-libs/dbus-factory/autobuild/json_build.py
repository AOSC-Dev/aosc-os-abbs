#!/usr/bin/env python2

import os

PROXYER = '/usr/bin/dbus-generator'
def generate_source(json,target):
    json_header = json.split('.in.json')[0]
    outdir = ''
    install_dir = ''
    json_meta = []
    if target == 'qml':
        outdir += 'qml/'
        t_list =[]
        for i in json_header.split('.'):
            t_list.append(i.capitalize())
        path = '_'.join(t_list)
    elif target == 'golang':
        outdir += 'go/src/'
        path = json_header.split('.')[-1].lower()
        json_meta = json_header.split('.')
        json_meta.pop()
        for i in json_meta:
            install_dir += i.lower() + '/'
        outdir += install_dir
    else:
        print ("%s is not supported yet!" % target)
        exit()

    outdir += path
    cmd = PROXYER+' -in '+json+' -out '+outdir+' -target '+target
    os.system(cmd)
    print install_dir
    return path,install_dir

def build(path,target,installdir):
    owd = os.getcwd()
    work = ''
    try:
        if target == 'qml':
            work = work + target +'/'+path
            os.chdir(work)
            os.system('qmake')
            os.system('make')
        elif target == 'golang':
            target = 'go'
            work = work + target + '/'
    finally:
        os.chdir(owd)

if __name__ == '__main__':
    files = os.listdir('.')
    json_in = []
    for i in files:
        if '.in.json' in i:
            json_in.append(i) 
    for each_json_in in json_in:
        for target in ['qml','golang']:
            path,install_dir = generate_source(each_json_in,target)
            build(path,target,install_dir)

