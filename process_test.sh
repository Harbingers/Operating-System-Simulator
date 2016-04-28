# Test:
python process.py -l 5:100,5:100 -c
# Time     PID: 0     PID: 1        CPU        IOs 
#  1     RUN:cpu      READY          1            
#  2     RUN:cpu      READY          1            
#  3     RUN:cpu      READY          1            
#  4     RUN:cpu      READY          1            
#  5     RUN:cpu      READY          1            
#  6        DONE    RUN:cpu          1            
#  7        DONE    RUN:cpu          1            
#  8        DONE    RUN:cpu          1            
#  9        DONE    RUN:cpu          1            
# 10        DONE    RUN:cpu          1 


python process.py -l 4:100,1:0 -c
# Time     PID: 0     PID: 1        CPU        IOs 
#  1     RUN:cpu      READY          1            
#  2     RUN:cpu      READY          1            
#  3     RUN:cpu      READY          1            
#  4     RUN:cpu      READY          1            
#  5        DONE     RUN:io          1            
#  6        DONE    WAITING                     1 
#  7        DONE    WAITING                     1 
#  8        DONE    WAITING                     1 
#  9        DONE    WAITING                     1 
# 10*       DONE       DONE   

# switch the order of the processes
python process.py -l 1:0,4:100 -c
# Time     PID: 0     PID: 1        CPU        IOs 
#  1      RUN:io      READY          1            
#  2     WAITING    RUN:cpu          1          1 
#  3     WAITING    RUN:cpu          1          1 
#  4     WAITING    RUN:cpu          1          1 
#  5     WAITING    RUN:cpu          1          1 
#  6*       DONE       DONE  

python process.py -l 1:0,4:100 -c -S SWITCH_ON_END
# Time     PID: 0     PID: 1        CPU        IOs 
#  1      RUN:io      READY          1            
#  2     WAITING      READY                     1 
#  3     WAITING      READY                     1 
#  4     WAITING      READY                     1 
#  5     WAITING      READY                     1 
#  6*       DONE    RUN:cpu          1            
#  7        DONE    RUN:cpu          1            
#  8        DONE    RUN:cpu          1            
#  9        DONE    RUN:cpu          1  

python process.py -l 1:0,4:100 -c -S SWITCH_ON_IO
# Time     PID: 0     PID: 1        CPU        IOs 
#  1      RUN:io      READY          1            
#  2     WAITING    RUN:cpu          1          1 
#  3     WAITING    RUN:cpu          1          1 
#  4     WAITING    RUN:cpu          1          1 
#  5     WAITING    RUN:cpu          1          1 
#  6*       DONE       DONE 

python process.py -l 1:0,4:100 -c -I IO_RUN_LATER
# Time     PID: 0     PID: 1        CPU        IOs 
#  1      RUN:io      READY          1            
#  2     WAITING    RUN:cpu          1          1 
#  3     WAITING    RUN:cpu          1          1 
#  4     WAITING    RUN:cpu          1          1 
#  5     WAITING    RUN:cpu          1          1 
#  6*       DONE       DONE 

python process.py -l 3:0,5:100,5:100,5:100 -S SWITCH_ON_IO -I IO_RUN_LATER -c -p
# Time     PID: 0     PID: 1     PID: 2     PID: 3        CPU        IOs 
#  1      RUN:io      READY      READY      READY          1            
#  2     WAITING    RUN:cpu      READY      READY          1          1 
#  3     WAITING    RUN:cpu      READY      READY          1          1 
#  4     WAITING    RUN:cpu      READY      READY          1          1 
#  5     WAITING    RUN:cpu      READY      READY          1          1 
#  6*      READY    RUN:cpu      READY      READY          1            
#  7       READY       DONE    RUN:cpu      READY          1            
#  8       READY       DONE    RUN:cpu      READY          1            
#  9       READY       DONE    RUN:cpu      READY          1            
# 10       READY       DONE    RUN:cpu      READY          1            
# 11       READY       DONE    RUN:cpu      READY          1            
# 12       READY       DONE       DONE    RUN:cpu          1            
# 13       READY       DONE       DONE    RUN:cpu          1            
# 14       READY       DONE       DONE    RUN:cpu          1            
# 15       READY       DONE       DONE    RUN:cpu          1            
# 16       READY       DONE       DONE    RUN:cpu          1            
# 17      RUN:io       DONE       DONE       DONE          1            
# 18     WAITING       DONE       DONE       DONE                     1 
# 19     WAITING       DONE       DONE       DONE                     1 
# 20     WAITING       DONE       DONE       DONE                     1 
# 21     WAITING       DONE       DONE       DONE                     1 
# 22*     RUN:io       DONE       DONE       DONE          1            
# 23     WAITING       DONE       DONE       DONE                     1 
# 24     WAITING       DONE       DONE       DONE                     1 
# 25     WAITING       DONE       DONE       DONE                     1 
# 26     WAITING       DONE       DONE       DONE                     1 
# 27*       DONE       DONE       DONE       DONE                       

# Stats: Total Time 27
# Stats: CPU Busy 18 (66.67%)
# Stats: IO Busy  12 (44.44%)

python process.py -s 1 -l 3:50,3:50, -s 2 -l 3:50,3:50, -s 3 -l 3:50,3:50 -I IO_RUN_LATER -c -p
# Time     PID: 0     PID: 1        CPU        IOs 
#  1     RUN:cpu      READY          1            
#  2      RUN:io      READY          1            
#  3     WAITING     RUN:io          1          1 
#  4     WAITING    WAITING                     2 
#  5     WAITING    WAITING                     2 
#  6     WAITING    WAITING                     2 
#  7*    RUN:cpu    WAITING          1          1 
#  8*       DONE     RUN:io          1            
#  9        DONE    WAITING                     1 
# 10        DONE    WAITING                     1 
# 11        DONE    WAITING                     1 
# 12        DONE    WAITING                     1 
# 13*       DONE    RUN:cpu          1            

# Stats: Total Time 13
# Stats: CPU Busy 6 (46.15%)
# Stats: IO Busy  9 (69.23%)

python process.py -s 1 -l 3:50,3:50, -s 2 -l 3:50,3:50, -s 3 -l 3:50,3:50 -I IO_RUN_IMMEDIATE -c -p
# Time     PID: 0     PID: 1        CPU        IOs 
#  1     RUN:cpu      READY          1            
#  2      RUN:io      READY          1            
#  3     WAITING     RUN:io          1          1 
#  4     WAITING    WAITING                     2 
#  5     WAITING    WAITING                     2 
#  6     WAITING    WAITING                     2 
#  7*    RUN:cpu    WAITING          1          1 
#  8*       DONE     RUN:io          1            
#  9        DONE    WAITING                     1 
# 10        DONE    WAITING                     1 
# 11        DONE    WAITING                     1 
# 12        DONE    WAITING                     1 
# 13*       DONE    RUN:cpu          1            

# Stats: Total Time 13
# Stats: CPU Busy 6 (46.15%)
# Stats: IO Busy  9 (69.23%)
