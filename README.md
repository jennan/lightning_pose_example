# Lightning Pose example

This repository provides example usage of [Lightning Pose](https://github.com/danbider/lightning-pose) on NeSI.


## Installation

Clone this repository

```
git clone TODO_REPO_URL
cd lightning_pose_example
```

Create a virtual environment

```
module purge && module load Python/3.11.3-gimkl-2022a
python3 -m venv venv
venv/bin/python3 -m pip install 'git+https://github.com/danbider/lightning-pose#v1.0.0[extra_models]'
```

*Note: Use the file `requirements.txt` for more reproducibility.*

```
venv/bin/python3 -m pip install -r requirements.txt
```


## Usage

Submit a job to train a model using Slurm as follows

```
sbatch --account NESI_ACCOUNT slurm/train_test.sl
```

where `NESI_ACCOUNT` is your NeSI project ID.
