from multiprocessing import Pool
import os

def write_file(i):
    fname = f"hello_{i}.txt"
    message = f"Hello from CPU {i}! (PID={os.getpid()})\n"
    with open(fname, "w") as f:
        f.write(message)
    return message

if __name__ == "__main__":
    import multiprocessing

    n = int(os.environ.get("SLURM_CPUS_PER_TASK", 1))
    print(f"Python launching {n} workers...")

    with Pool(n) as p:
        for msg in p.map(write_file, range(n)):
            print(msg.strip())

