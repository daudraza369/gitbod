FROM gitpod/workspace-full

USER gitpod

RUN wget -O flutter.tar.xz https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_2.8.1-stable.tar.xz && \
    tar xf flutter.tar.xz && \
    rm flutter.tar.xz && \
    echo 'export PATH="$PATH:/workspace/flutter/bin"' >> /home/gitpod/.bashrc

RUN /workspace/flutter/bin/flutter precache
