#!/usr/bin/python
# -*- coding:utf8 -*-

import sys
import math
import random
import re
import urlparse


postiveinstancedict = {}
filename = "dmp_library_create_res"
for line in file(filename) :
        line = line.rstrip().split("\t",-1)
        #if len(line) < 2 : continue
        libId = line[0]
        companyId = line[1]
        category = line[2]
        postiveinstancedict[libId+"_"+companyId+"@"+category] = category  ##可以讲所有的标签作为key，为了快速的过滤

for line in sys.stdin :
        line = line.rstrip().split("\t",-1)
        if len(line) < 2 : continue

        pyid, cateIds= line[:2]

        for k in postiveinstancedict.keys():
                lcc = k.split("@",-1)
                cates = lcc[1]
                if cates is not None:
                        cate = cates.replace("|",",").replace("&",",")
                        cts = cate.split(",",-1)
                        for ct in cts:
                                if ct in cateIds:
                                        #print "ct = %s, cates = %s" % (ct, cates)
                                        cates = cates.replace(ct,"1")
                                else:
                                        cates = cates.replace(ct,"0")
                                        #print "in ct = %s, cates = %s" % (ct, cates)

                        if eval(cates) == 1 :
                                libIdCompanyId = lcc[0]
                                print "\t".join([libIdCompanyId.split("_",-1)[0], libIdCompanyId.split("_",-1)[1], pyid])