export DEBIAN_FRONTEND=noninteractive
apt update && apt upgrade -y
apt install -y --no-install-suggests \\
  bash bash-completion curl wget yq tar gzip less nano python3 python-is-python3 man-db manpages proot proot-distro termux-tools
