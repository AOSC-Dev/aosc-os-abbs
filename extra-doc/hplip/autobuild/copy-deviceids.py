#!/usr/bin/python3
import os
import re
import sys
if len (sys.argv) < 3:
    print ("Specify hpcups.drv and hpijs.drv pathnames")
    sys.exit (1)

hpcups_drv = sys.argv[1]
hpijs_drv = sys.argv[2]

# Match e.g.      Model "ModelName"
# and catch 'ModelName' in group 0
mn_re = re.compile ('^\s*ModelName\s+"(.*)"\s*$')

# Match e.g.      Attribute "1284DeviceID" "" "blah"
# and catch everything before 'blah' in group 0, 'blah' in group 1,
# trailing characters in group 2
devid_re = re.compile ('^(\s*Attribute\s+"1284DeviceID"\s+""\s+")(.*)("\s*)$')

# Match e.g.   }
end_re = re.compile ('^\s*}')

devid_by_mn = dict()

hpcups_lines = open (hpcups_drv, "r").readlines ()
current_mn = None
for line in hpcups_lines:
    if current_mn == None:
        match = mn_re.match (line)
        if match == None:
            continue

        current_mn = match.groups ()[0]
    else:
        match = devid_re.match (line)
        if match:
            devid_by_mn[current_mn] = match.groups ()[1]
            continue

    if end_re.match (line):
        current_mn = None

print("%d IEEE 1284 Device IDs loaded from %s" % (len (devid_by_mn),
                                                os.path.basename (hpcups_drv)),
      file=sys.stderr)

replaced = 0
hpijs_lines = open (hpijs_drv, "r").readlines ()
current_mn = None
for line in hpijs_lines:
    if current_mn == None:
        match = mn_re.match (line)
        if match:
            current_mn = match.groups ()[0]
            if current_mn.endswith (" hpijs"):
                current_mn = current_mn[:-6]
    else:
        match = devid_re.match (line)
        if match:
            devid = devid_by_mn.get (current_mn)
            if devid:
                line = (match.groups ()[0] + devid + match.groups ()[2])
                replaced += 1
            else:
                print ("Not matched: %s" % current_mn, file=sys.stderr)

    if end_re.match (line):
        current_mn = None

    print (line.rstrip ("\n"))

print("%d IEEE 1284 Device IDs loaded in %s" % (replaced,
                                                os.path.basename (hpijs_drv)),
      file=sys.stderr)

