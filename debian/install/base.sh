DEBIAN_FRONTEND=noninteractive
apt update && apt -y upgrade
apt -y --no-install-suggests install bash bash-completion curl wget yq tar gzip less nano python3 python-is-python3 man-db manpages manpages-dev sudo
