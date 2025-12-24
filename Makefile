all: ld64

ld64:
	make -C ppc-ld64 CCTOOLS=../cctools LLDB=../ppc-libunwind
