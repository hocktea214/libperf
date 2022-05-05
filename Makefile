# SPDX-License-Identifier: GPL-2.0
# Some of the tools (perf) use same make variables
# as in kernel build.
export srctree=$(CURDIR)
export objtree=$(CURDIR)

include tools/scripts/Makefile.include
include tools/build/Makefile.include
include tools/scripts/Makefile.arch

libapi: FORCE
	$(call descend,tools/lib/api)

libperf: FORCE
	$(call descend,tools/lib/perf)

all: libapi libperf

libapi_clean:
	$(call descend,tools/lib/api,clean)

libperf_clean:
	$(call descend,tools/lib/perf,clean)

build_clean:
	$(call descend,build,clean)

clean: libapi_clean libperf_clean

install:
	@echo "Install LibPerf"

.PHONY: FORCE
