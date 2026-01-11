FROM archlinux:latest

# edit dependencies according to needs
# check available packages in arch repositories at https://archlinux.org/packages/
# listed packages for various languages
RUN pacman -Sy --noconfirm base bash \
  base-devel \
  cmake \
  go \
  nodejs npm \
  python python-pip uv \
  jdk-openjdk maven \
  cpanminus \
  ruby rubygems \
  sudo git curl wget vim

# setup user with sudo privileges
VOLUME ["/home/coder"]
RUN useradd -d /home/coder -M -s /usr/bin/bash -G wheel coder
RUN echo '%wheel ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers
USER coder
RUN find /etc/skel/ -type f -exec cp '{}' /home/coder/ \;

# optional: install yay helper for AUR packages (git and base-devel are required to build)
WORKDIR /home/coder
RUN git clone https://aur.archlinux.org/yay.git
WORKDIR /home/coder/yay
RUN makepkg -csi --noconfirm

WORKDIR /home/coder/project
CMD ["npx", "-y", "opencode-ai", "--hostname", "0.0.0.0", "/home/coder/project"]

