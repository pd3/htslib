# Makefile rules useful for third-party code using htslib's public API.
#
#    Copyright (C) 2013-2017, 2019 Genome Research Ltd.
#
#    Author: John Marshall <jm18@sanger.ac.uk>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
# DEALINGS IN THE SOFTWARE.

# The makefile fragment included below provides variables that can be used
# to express dependencies on headers supplied by an in-development htslib.
# If your source file foo.c #includes <htslib/hts.h> and <htslib/kstring.h>,
# you can write the correct prerequisites for foo.o as:
#
#	HTSDIR = <path to htslib top-level directory>
#	include $(HTSDIR)/htslib.mk
#
#	foo.o: foo.c $(htslib_hts_h) $(htslib_kstring_h)

HTSPREFIX = $(HTSDIR)/
include $(HTSDIR)/htslib_vars.mk

# This file provides the HTSCODECS_SOURCES variable.  It may not be present
# in a freshly checked-out htslib, so is only included if available.  The
# absence is unlikely to cause a problem as there will be plenty of other
# missing files that will trigger a build in htslib, and when that happens
# htslib's makefile will create it.
-include $(HTSDIR)/htscodecs.mk

# Rules for rebuilding an in-development htslib's static and shared libraries.
# If your program foo links with libhts, adding the appropriate prerequisite
# will cause the library to be rebuilt as necessary:
#
#	foo: foo.o $(HTSDIR)/libhts.a
#
# or similarly if your target requires any of the tools supplied:
#
#	bar.bed.bgz.tbi: bar.bed.bgz $(HTSDIR)/tabix
#		$(HTSDIR)/tabix -p bed bar.bed.bgz

HTSLIB_PUBLIC_HEADERS = \
	$(HTSDIR)/htslib/bgzf.h \
	$(HTSDIR)/htslib/cram.h \
	$(HTSDIR)/htslib/faidx.h \
	$(HTSDIR)/htslib/hfile.h \
	$(HTSDIR)/htslib/hts.h \
	$(HTSDIR)/htslib/hts_defs.h \
	$(HTSDIR)/htslib/hts_endian.h \
	$(HTSDIR)/htslib/hts_expr.h \
	$(HTSDIR)/htslib/hts_log.h \
	$(HTSDIR)/htslib/hts_os.h \
	$(HTSDIR)/htslib/kbitset.h \
	$(HTSDIR)/htslib/kfunc.h \
	$(HTSDIR)/htslib/khash.h \
	$(HTSDIR)/htslib/khash_str2int.h \
	$(HTSDIR)/htslib/klist.h \
	$(HTSDIR)/htslib/kseq.h \
	$(HTSDIR)/htslib/ksort.h \
	$(HTSDIR)/htslib/kstring.h \
	$(HTSDIR)/htslib/regidx.h \
	$(HTSDIR)/htslib/sam.h \
	$(HTSDIR)/htslib/synced_bcf_reader.h \
	$(HTSDIR)/htslib/tbx.h \
	$(HTSDIR)/htslib/thread_pool.h \
	$(HTSDIR)/htslib/vcf.h \
	$(HTSDIR)/htslib/vcf_sweep.h \
	$(HTSDIR)/htslib/vcfutils.h

HTSLIB_ALL = \
	$(HTSLIB_PUBLIC_HEADERS) \
	$(HTSDIR)/bcf_sr_sort.c \
	$(HTSDIR)/bcf_sr_sort.h \
	$(HTSDIR)/bgzf.c \
	$(HTSDIR)/config.h \
	$(HTSDIR)/errmod.c \
	$(HTSDIR)/faidx.c \
	$(HTSDIR)/header.c \
	$(HTSDIR)/header.h \
	$(HTSDIR)/hfile_internal.h \
	$(HTSDIR)/hfile.c \
	$(HTSDIR)/hfile_gcs.c \
	$(HTSDIR)/hfile_libcurl.c \
	$(HTSDIR)/hfile_s3.c \
	$(HTSDIR)/hfile_s3_write.c \
	$(HTSDIR)/hts.c \
	$(HTSDIR)/hts_expr.c \
	$(HTSDIR)/hts_internal.h \
	$(HTSDIR)/hts_os.c \
	$(HTSDIR)/kfunc.c \
	$(HTSDIR)/kstring.c \
	$(HTSDIR)/md5.c \
	$(HTSDIR)/multipart.c \
	$(HTSDIR)/plugin.c \
	$(HTSDIR)/probaln.c \
	$(HTSDIR)/realn.c \
	$(HTSDIR)/regidx.c \
	$(HTSDIR)/region.c \
	$(HTSDIR)/sam.c \
	$(HTSDIR)/sam_internal.h \
	$(HTSDIR)/synced_bcf_reader.c \
	$(HTSDIR)/tbx.c \
	$(HTSDIR)/textutils.c \
	$(HTSDIR)/textutils_internal.h \
	$(HTSDIR)/thread_pool.c \
	$(HTSDIR)/thread_pool_internal.h \
	$(HTSDIR)/vcf.c \
	$(HTSDIR)/vcf_sweep.c \
	$(HTSDIR)/vcfutils.c \
	$(HTSDIR)/cram/cram.h \
	$(HTSDIR)/cram/cram_codecs.c \
	$(HTSDIR)/cram/cram_codecs.h \
	$(HTSDIR)/cram/cram_decode.c \
	$(HTSDIR)/cram/cram_decode.h \
	$(HTSDIR)/cram/cram_encode.c \
	$(HTSDIR)/cram/cram_encode.h \
	$(HTSDIR)/cram/cram_external.c \
	$(HTSDIR)/cram/cram_index.c \
	$(HTSDIR)/cram/cram_index.h \
	$(HTSDIR)/cram/cram_io.c \
	$(HTSDIR)/cram/cram_io.h \
	$(HTSDIR)/cram/cram_samtools.h \
	$(HTSDIR)/cram/cram_stats.c \
	$(HTSDIR)/cram/cram_stats.h \
	$(HTSDIR)/cram/cram_structs.h \
	$(HTSDIR)/cram/mFILE.c \
	$(HTSDIR)/cram/mFILE.h \
	$(HTSDIR)/cram/misc.h \
	$(HTSDIR)/cram/open_trace_file.c \
	$(HTSDIR)/cram/open_trace_file.h \
	$(HTSDIR)/cram/os.h \
	$(HTSDIR)/cram/pooled_alloc.c \
	$(HTSDIR)/cram/pooled_alloc.h \
	$(HTSDIR)/cram/string_alloc.c \
	$(HTSDIR)/cram/string_alloc.h \
	$(HTSDIR)/os/lzma_stub.h \
	$(HTSDIR)/os/rand.c \
	$(HTSCODECS_SOURCES)

$(HTSDIR)/config.h:
	+cd $(HTSDIR) && $(MAKE) config.h

$(HTSDIR)/hts-object-files : $(HTSLIB_ALL)
	+cd $(HTSDIR) && $(MAKE) hts-object-files

$(HTSDIR)/libhts.a: $(HTSDIR)/hts-object-files
	+cd $(HTSDIR) && $(MAKE) lib-static

$(HTSDIR)/libhts.so: $(HTSLIB_ALL)
	+cd $(HTSDIR) && $(MAKE) lib-shared

$(HTSDIR)/libhts.dylib $(HTSDIR)/libhts.dll.a $(HTSDIR)/hts.dll.a: $(HTSDIR)/hts-object-files
	+cd $(HTSDIR) && $(MAKE) lib-shared

$(HTSDIR)/bgzip: $(HTSDIR)/bgzip.c $(HTSLIB_PUBLIC_HEADERS) $(HTSDIR)/libhts.a
	+cd $(HTSDIR) && $(MAKE) bgzip

$(HTSDIR)/htsfile: $(HTSDIR)/htsfile.c $(HTSLIB_PUBLIC_HEADERS) $(HTSDIR)/libhts.a

	+cd $(HTSDIR) && $(MAKE) htsfile

$(HTSDIR)/tabix: $(HTSDIR)/tabix.c $(HTSLIB_PUBLIC_HEADERS) $(HTSDIR)/libhts.a

	+cd $(HTSDIR) && $(MAKE) tabix

$(HTSDIR)/htslib_static.mk: $(HTSDIR)/htslib.pc.tmp
	+cd $(HTSDIR) && $(MAKE) htslib_static.mk

$(HTSDIR)/htslib.pc.tmp:
	+cd $(HTSDIR) && $(MAKE) htslib.pc.tmp

# Rules for phony targets.  You may wish to have your corresponding phony
# targets invoke these in addition to their own recipes:
#
#	clean: clean-htslib

all-htslib check-htslib clean-htslib distclean-htslib install-htslib plugins-htslib test-htslib:
	+cd $(HTSDIR) && $(MAKE) $(@:-htslib=)

.PHONY: all-htslib check-htslib clean-htslib distclean-htslib install-htslib
.PHONY: plugins-htslib test-htslib
