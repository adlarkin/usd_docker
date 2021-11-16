FROM ubuntu:bionic

# Install dependencies
RUN apt-get -q update && apt install -y \
  build-essential \
  freeglut3-dev \
  git \
  glew-utils \
  tar \
  vim \
  wget \
  python-pip \
  qt5-default \
  && rm -rf /var/lib/apt/lists/*
RUN pip install \
  pyopengl \
  pyside2

# Get newer version of cmake
# (bionic debs are version 3.10, but USD requires version >= 3.12)
RUN mkdir -p /usr/local/cmake
WORKDIR /usr/local/cmake
RUN wget https://github.com/Kitware/CMake/releases/download/v3.21.4/cmake-3.21.4-linux-x86_64.tar.gz \
  && tar -xf cmake-3.21.4-linux-x86_64.tar.gz \
  && rm cmake-3.21.4-linux-x86_64.tar.gz
ENV PATH=/usr/local/cmake/cmake-3.21.4-linux-x86_64/bin:$PATH

# Install USD. Source code is in /tmp, and installation is in /usr/local/USD
RUN mkdir -p /tmp && mkdir -p /usr/local/USD
WORKDIR /tmp
RUN git clone https://github.com/PixarAnimationStudios/USD
RUN python USD/build_scripts/build_usd.py /usr/local/USD
ENV PYTHONPATH=/usr/local/USD/lib/python
ENV PATH=/usr/local/USD/bin:$PATH
