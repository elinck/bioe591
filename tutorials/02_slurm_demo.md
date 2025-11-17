# Slurm Demo

To allocate computing resources among users, Tempest uses a "workload manager" called Slurm. After typing `ssh <net_id>@tempest-login.msu.montana.edu
` into your own terminal, you arrive on what is called the "login node" of the HPC. This is essentially a computer with limited memory and hardware that lets you navigate, install programs, and generally perform non-intensive operations. Yet because the major purpose of using an HPC is to access multiple powerful computers simultaneously, we need a way to request a portion of Tempest that an algorithm can use to balance the needs of everyone who is accessing it at a particular time. Attempting to run memory- or compute-intensive software on the login node can cause errors and potentially crash the system. Workload managers solve this dilemma. Below we will run a toy `Python` script to illustrate the application of Slurm. First, a review of HPC vocab is helpful:

- Node: A physical or virtual computer with RAM (memory) and CPUs (hardware units or cores)
- CPU: A hardware unit or "core"; my M2 Macbook has 8, while a free-tier PI user account on Tempest provides 256!
- Task: Roughly, a "job"; can be launched by your code or a program
- Process: A computing operation started by a task, with its own memory

We will use Slurm to run a `Python` script that simultaneously uses multiple CPUs to perform four operations at once. Using a `mamba` module, we will load Python and execute the script. 

First, however, we want to open a [`screen` session](https://www.geeksforgeeks.org/linux-unix/screen-command-in-linux-with-examples/), or new terminal window in a single session: 

```{bash}
screen -S slurm_demo
```   

This command uses the Linux program `screen` to open a new window with name (`-S`) `slurm_demo`. Type `source ~/.bashrc` to make this new terminal session look the same as your login node. You can then detach from this and reattach at will:

```{bash}
screen ctrl-a ctrl-d
screen -r slurm_demo
```

In this new screen, type `nano slurm_demo.sbatch` to examine the script. Note the header material (discussed in class) with hashtags, followed by the executable code. Close without saving.

We can then run this script with the following command:

```{bash}
sbatch slurm_demo.sbatch
```

Note the job ID. To check on the status of the job, type `sacct`. This script will complete almost instantaneously, but for longer operations, you may want to close the screen, log off, log back in, open the screen, and check its status. You should see that four `.txt` files have been created---take a look!

To kill a screen session, either type `exit` within it, or `screen -S slurm_demo -X quit` (with `slurm_demo` as the screen name) from the outside. 
