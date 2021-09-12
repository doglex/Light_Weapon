from os import listdir, system
from tqdm import tqdm
from multiprocessing import Pool

dir_from = "E:/"
dir_to = "D:/x"
targets = listdir(dir_from)

def tar_f(target):
    cmd = rf'tar -czf "{dir_to}/{target}.tar" "{dir_from}/{target}" '
    system(cmd)

if __name__ == '__main__':
   with Pool(8) as p:
      res = list(tqdm(p.imap(tar_f, targets), total=len(targets)))





