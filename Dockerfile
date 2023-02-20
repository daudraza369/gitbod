FROM gitpod/workspace-full

RUN sudo apt-get update && \
    sudo apt-get install -y wget git unzip libglu1-mesa openjdk-11-jdk && \
    sudo apt-get clean && \
    sudo rm -rf /var/cache/apt/* && \
    sudo rm -rf /var/lib/apt/lists/* && \
    wget -O flutter.tar.xz https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_2.10.1-stable.tar.xz && \
    tar xf flutter.tar.xz && \
    rm flutter.tar.xz && \
    echo 'export PATH="$PATH:/workspace/flutter/bin"' >> /home/gitpod/.bashrc

ENV PATH="/workspace/flutter/bin:${PATH}"

RUN git clone https://github.com/flutter/flutter.git -b stable && \
    echo 'export PATH="$PATH:/workspace/flutter/bin"' >> /home/gitpod/.bashrc && \
    flutter create my_flutter_app
