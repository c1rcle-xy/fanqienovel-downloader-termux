pip config set global.index-url https://mirrors.aliyun.com/pypi/simple
#换源
apt update && apt upgrade
pkg install python libxml2 libxslt pkg-config
pip install cython wheel
CFLAGS="-Wno-error=incompatible-function-pointer-types -O0" pip install lxml
