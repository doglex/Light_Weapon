#coding=utf-8
# 可能用内存太多导致机器重启，慎用该脚本

from multiprocessing import Pool
from os import getpid

def worker():
    a=list(range(200000000))
    b=list(range(200000000))
    for i in range(10):
        a.extend(b)

def memory_dog(loops=1000,cores=200):
    main_pid=getpid()
    print("Eating...wating for 1 min .step 1: press Ctrl +Z")
    print("step 2: enter\t kill -9 %s"%main_pid)

    pool=Pool(processes=cores)
    for i in range(loops):
            pool.apply_async(worker)
    pool.close()
    pool.join()
    print("all done!")

if __name__ == '__main__':
    memory_dog()
