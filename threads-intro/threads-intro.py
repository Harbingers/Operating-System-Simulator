# Reference: http://pages.cs.wisc.edu/~remzi/OSTEP/threads-intro.pdf

# Options:
#  -h, --help            show this help message and exit
#  -s SEED, --seed=SEED  the random seed
#  -t NUMTHREADS, --threads=NUMTHREADS
#                        number of threads
#  -p PROGFILE, --program=PROGFILE
#                        source program (in .s)
#  -i INTFREQ, --interrupt=INTFREQ
#                        interrupt frequency
#  -r, --randints        if interrupts are random
#  -a ARGV, --argv=ARGV  comma-separated per-thread args (e.g., ax=1,ax=2 sets
#                        thread 0 ax reg to 1 and thread 1 ax reg to 2);
#                        specify multiple regs per thread via colon-separated
#                        list (e.g., ax=1:bx=2,cx=3 sets thread 0 ax and bx and
#                        just cx for thread 1)
#  -L LOADADDR, --loadaddr=LOADADDR
#                        address where to load code
#  -m MEMSIZE, --memsize=MEMSIZE
#                        size of address space (KB)
#  -M MEMTRACE, --memtrace=MEMTRACE
#                        comma-separated list of addrs to trace (e.g.,
#                        20000,20001)
#  -R REGTRACE, --regtrace=REGTRACE
#                        comma-separated list of regs to trace (e.g.,
#                        ax,bx,cx,dx)
#  -C, --cctrace         should we trace condition codes
#  -S, --printstats      print some extra stats
#  -c, --compute         compute answers for me


# Test
# python x86.py -p simple-race.s -t 1
# python x86.py -p simple-race.s -t 1 -M 2000 -R ax,bx -c
# python x86.py -p loop.s -t 1 -a dx=3 -R dx -C -c
# python x86.py -p looping-race-nolock.s -t 2 -a bx=1 -M 2000 -c
# python x86.py -p looping-race-nolock.s -t 2 -a bx=1 -M 2000 -i 2