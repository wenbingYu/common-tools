#!/usr/bin/python
# -*- coding:utf8 -*-

import sys
import math
import random
import re
import urlparse


last_libId = None
last_companyId = None
last_sum = 0
libId = None
companyId = None

for line in sys.stdin :
    line = line.rstrip().split("\t",-1)
    if len(line) < 3:
        continue

    (libId,companyId,pyid)= line[:3]
    #print "libId=%s,companyId=%s,pyid=%s" % (libId,companyId,pyid)
    #print "lastLibId=%s,lastCompanyId=%s,lastSum=%s" % (last_libId,last_companyId,last_sum)

    if last_libId is None and last_companyId is None:
        last_libId = libId
        last_companyId = companyId
        last_sum = 1
    elif last_libId == libId and last_companyId == companyId:
        last_sum += 1
        #print "add........"
    else:
        if last_libId is not None and last_companyId is not None:
            print "\t".join(["%s" % last_libId, "%s" % last_companyId, "%s" % last_sum])

        last_sum = 1
        last_libId = libId
        last_companyId = companyId

if last_libId == libId and last_companyId == companyId:
   print "\t".join(["%s" % last_libId, "%s" % last_companyId, "%s" % last_sum])