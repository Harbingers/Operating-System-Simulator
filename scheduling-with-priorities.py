# Rule 1: If Priority(A) > Priority(B), A runs (B doesn’t).
# Rule 2: If Priority(A) = Priority(B), A & B run in RR.
# Rule 3: When a job enters the system, it is placed at the highest priority (the topmost queue).
# Rule 4: Once a job uses up its time allotment at a given level (regardless of how many times
#         it has given up the CPU), its priority is reduced (i.e., it moves down one queue).
# Rule 5: After some time period S, move all the jobs in the system to the topmost queue

#  Options:
#  -h, --help            show this help message and exit
#  -s SEED, --seed=SEED  the random seed
#  -n NUMQUEUES, --numQueues=NUMQUEUES
#                        number of queues in MLFQ (if not using -Q)
#  -q QUANTUM, --quantum=QUANTUM
#                        length of time slice (if not using -Q)
#  -Q QUANTUMLIST, --quantumList=QUANTUMLIST
#                        length of time slice per queue level, 
#                        specified as x,y,z,... where x is the 
#                        quantum length for the highest-priority 
#                        queue, y the next highest, and so forth
#  -j NUMJOBS, --numJobs=NUMJOBS
#                        number of jobs in the system
#  -m MAXLEN, --maxlen=MAXLEN
#                        max run-time of a job (if random)
#  -M MAXIO, --maxio=MAXIO
#                        max I/O frequency of a job (if random)
#  -B BOOST, --boost=BOOST
#                        how often to boost the priority of all 
#                        jobs back to high priority (0 means never)
#  -i IOTIME, --iotime=IOTIME
#                        how long an I/O should last (fixed constant)
#  -S, --stay            reset and stay at same priority level 
#                        when issuing I/O
#  -l JLIST, --jlist=JLIST
#                        a comma-separated list of jobs to run, 
#                        in the form x1,y1,z1:x2,y2,z2:... where 
#                        x is start time, y is run time, and z 
#                        is how often the job issues an I/O request
#  -c                    compute answers for me

# Test
# create a randomly-generated three-job workload
# python scheduling-with-priorities.py -j 3 -c
# python scheduling-with-priorities.py --jlist 0,180,0:100,20,0 -Q 10,10,10
