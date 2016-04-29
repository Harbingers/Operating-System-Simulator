# Options:
#  -h, --help            
#      show this help message and exit
#  -s SEED, --seed=SEED  
#      the random seed
#  -j JOBS, --jobs=JOBS  
#      number of jobs in the system
#  -l JLIST, --jlist=JLIST
#      instead of random jobs, provide a comma-separated list
#      of run times and ticket values (e.g., 10:100,20:100
#      would have two jobs with run-times of 10 and 20, each
#      with 100 tickets)
#  -m MAXLEN, --maxlen=MAXLEN
#      max length of job
#  -T MAXTICKET, --maxtick=MAXTICKET
#      maximum ticket value, if randomly assigned
#  -q QUANTUM, --quantum=QUANTUM
#      length of time slice
#  -c, --compute
      compute answers for me

# Test
# python lottery-scheduling.py -j 2 -s 0 -c
