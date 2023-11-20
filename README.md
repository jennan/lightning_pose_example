# Lightning Pose example

This repository provides example usage of [Lightning Pose](https://github.com/danbider/lightning-pose) on NeSI.


## Installation

Clone this repository

```
git clone https://github.com/jennan/lightning_pose_example.git
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

Results are saved in a folder named using the starting date, e.g. `outputs/2023-11-23/10-01-22` if your job started at 10:01:22 on 23/11/2023.

Model and training states are saved in a subfolder `tb_logs/my_base_toy_model/version_0/checkpoints/`.
The last saved checkpoints is named `last.ckpt`.

To restart training for a saved checkpoint, you can use the `training.ckpt_path` option:

- either edit the corresponding option in the configuration file,
- or add it to command line call in `slurm/train_test.sl`, for example

```bash
CKPT_PATH="$(realpath outputs/2023-11-23/10-01-22/tb_logs/my_base_toy_model/version_0/checkpoints/last.ckpt)"
venv/bin/python3 src/train_hydra.py training.ckpt_path="${CKPT_PATH}"
```

Note that this path needs to be **absolute**, hence the use of `realpath` in the snippet above.
