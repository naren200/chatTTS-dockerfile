# ChatTTS Docker with GPU Support

This repository provides a Dockerized setup for running [ChatTTS](https://github.com/2noise/ChatTTS), a text-to-speech model designed for dialogue applications, with GPU support. The setup is optimized for ease of use and performance.

## Prerequisites

1. **Install Docker on Ubuntu 22.04**  
   Follow the guide to install Docker:  
   [How to Install and Use Docker on Ubuntu 22.04](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-22-04)

2. **Perform Post-Installation Steps for Docker**  
   Ensure you complete the post-installation steps as outlined here:  
   [Post-Installation Steps for Docker on Linux](https://docs.docker.com/engine/install/linux-postinstall/)

3. **Install NVIDIA Container Toolkit (For GPU Users)**  
   If you're using a GPU, install the NVIDIA Container Toolkit by referring to:  
   [NVIDIA Container Toolkit Installation Guide](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html)

4. **Install Docker Compose on Ubuntu 22.04**  
   Set up Docker Compose using the instructions here:  
   [How to Install and Use Docker Compose on Ubuntu 22.04](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-22-04)

## Quick Start

### Pull the Docker Image

You can pull the pre-built Docker image from Docker Hub:

```bash
docker pull naren200/chatts-dockerfile:v1
```

### Run the Docker Container

1. Clone this repository:

   ```bash
   git clone https://github.com/your-username/chatTTS-dockerfile.git
   cd chatTTS-dockerfile
   ```

2. Start the Docker container:

   ```bash
   ./start_docker.sh
   ```

   This script will:
   - Start the container in attached mode.

3. Once inside the container, you can run the `talk.py` script to generate speech:

   ```bash
   python3 talk.py
   ```

   The output audio files will be saved as `basic_output0.wav`, `basic_output1.wav`, etc., in the working directory.

### Modify the Text for Speech Synthesis

To change the text that is converted to speech, edit the `talk.py` file:

1. Open `chaTTS-dockerfile/talk.py` in your preferred text editor.
2. Modify the `inputs_en` string with your desired text.
3. Save the file, the saved file will automatically be reflected inside the docker image. Rerun the script:

   ```bash
   python3 talk.py
   ```

### Stop the Docker Container

To stop and remove the Docker container, run:

```bash
./stop_docker.sh
```

## Customizing the Docker Setup

If you want to build the Docker image from scratch or modify the setup:

1. Edit the `Dockerfile` to add or remove dependencies.
2. Build the Docker image:

   ```bash
   docker build -t naren200/chatts-dockerfile:v1 .
   ```

3. Update the `docker-compose.yml` file if needed (e.g., to change volume mounts or environment variables).

## Notes

- The `talk.py` script is preconfigured to use GPU acceleration. Ensure your system has a compatible NVIDIA GPU.
- The `inputs_en` string in `talk.py` supports special tags like `[uv_break]` for pauses and `[laugh]` for laughter. Refer to the [ChatTTS documentation](https://github.com/2noise/ChatTTS) for more details.
- If you encounter issues with torchaudio, try switching between the two `torchaudio.save` lines in `talk.py`.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

