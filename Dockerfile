FROM anibali/pytorch:2.0.1-cuda11.8


USER root 

# Install system dependencies
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y \
    git \
    build-essential \
    g++ \
    make \
    cmake \
    wget \
    && rm -rf /var/lib/apt/lists/*


# Clone repository and set working directory
RUN git clone https://github.com/2noise/ChatTTS /dir
WORKDIR /dir

# Install Python dependencies
RUN pip install --upgrade pip && \
    pip install wheel setuptools cython && \
    pip install ChatTTS && \
    pip install -r requirements.txt && \
    pip install -e .

RUN apt-get update && apt-get install -y ffmpeg

# Copy local files
COPY . /dir

# Keep container running
CMD ["tail", "-f", "/dev/null"]
