FROM gitpod/workspace-full

USER gitpod

# Install dependencies
RUN sudo apt-get update && sudo apt-get install -y wget xz-utils libglu1-mesa

# Download and install Flutter
RUN wget -O flutter.tar.xz https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_2.10.1-stable.tar.xz && \
    tar xf flutter.tar.xz && \
    rm flutter.tar.xz && \
    echo 'export PATH="$PATH:/workspace/flutter/bin"' >> /home/gitpod/.bashrc
