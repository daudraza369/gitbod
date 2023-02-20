FROM gitpod/workspace-full:latest

USER root

RUN apt-get update && apt-get install -y \
    curl \
    git \
    unzip

RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && \
    apt-get install -y nodejs

RUN curl -fsSL https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o chrome.deb && \
    dpkg -i chrome.deb || true && \
    apt-get install -y --no-install-recommends -f && \
    rm chrome.deb

RUN git clone https://github.com/flutter/flutter.git -b stable && \
    echo 'export PATH="$PATH:/workspace/flutter/bin"' >> /home/gitpod/.bashrc

USER gitpod

ENV PATH="/workspace/flutter/bin:${PATH}"
