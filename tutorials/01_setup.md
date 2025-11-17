# Getting set up on Tempest

As a student in this class, you have automatically been set up with an account on Tempest, MSU's high-performance copmuting cluster. Though Tempest has a graphical user interface, we will primarily be navigating it via the command line. To do so, you will have to `ssh` into a login node. [Follow these instructions to configure access](https://www.montana.edu/uit/rci/tempest/getting-started-terminal/setting-up-ssh-key/index.html).

Once you have set up your `ssh` key and logged in for the first time, you can use the following command to access it into the future:

```{bash}
ssh <net_id>@tempest-login.msu.montana.edu
```

To clone this repository (and all necessary materials for the class), type the following command from your home directory: 

```{bash}
git clone https://github.com/elinck/bioe591.git
```

Then, navigate into the directory:

```{bash}
cd bioe591
```
