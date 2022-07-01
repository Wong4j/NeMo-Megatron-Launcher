HYDRA_FULL_ERROR=1 python3 main.py \
    +ci_test=True \
    prompt_learning=gpt3/squad \
    run_data_preparation=False \
    run_training=False \
    run_conversion=False \
    run_finetuning=False \
    run_prompt_learning=True \
    run_evaluation=False \
    bignlp_path=${GIT_CLONE_PATH} \
    data_dir=${BASE_RESULTS_DIR}/data \
    base_results_dir=${BASE_RESULTS_DIR} \
    "container='${BUILD_IMAGE_NAME_SRUN}'" \
    cluster.partition=${SLURM_PARTITION} \
    cluster.account=${SLURM_ACCOUNT} \
    cluster.gpus_per_task=null \
    cluster.gpus_per_node=null \
    cluster.job_name_prefix="${SLURM_ACCOUNT}-bignlp_ci:" \
    prompt_learning.run.name=${RUN_NAME} \
    prompt_learning.run.time_limit="20:00" \
    prompt_learning.run.results_dir=${BASE_RESULTS_DIR}/${RUN_NAME} \
    prompt_learning.run.model_train_name=gpt3_126m \
    prompt_learning.trainer.num_nodes=1 \
    prompt_learning.trainer.max_steps=100 \
    prompt_learning.trainer.log_every_n_steps=1 \
    prompt_learning.trainer.val_check_interval=20 \
    prompt_learning.model.language_model_path=${BASE_RESULTS_DIR}/convert_gpt3_126m_tp1_pp1/megatron_gpt.nemo \
    prompt_learning.model.tensor_model_parallel_size=1 \
    prompt_learning.model.pipeline_model_parallel_size=1