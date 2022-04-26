FROM 763104351884.dkr.ecr.us-east-1.amazonaws.com/pytorch-training:1.10.2-gpu-py38-cu113-ubuntu20.04-sagemaker

RUN sudo apt-get update 
RUN sudo apt-get install -y build-essential git ninja-build ccache libopenblas-dev libopencv-dev cmake libcurl4-openssl-dev libssl-dev

RUN git clone --recursive https://github.com/apache/incubator-mxnet mxnet
RUN cd mxnet && echo "USE_S3=1" >> make/config.mk
RUN cd mxnet && python3 -m pip install --user -e ./python

RUN pip install tensorboard easydict onnx sklearn