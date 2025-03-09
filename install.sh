termux-setup-storage
echo "请赋予termux存储权限，如已赋予请忽视"
sed -i 's@^ $deb.*stable main$ $@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux/apt/termux-main stable main@' $PREFIX/etc/apt/sources.list
apt update && apt upgrade
#pip config set global.index-url https://mirrors.aliyun.com/pypi/simple
#换源
apt update && apt upgrade
pkg install python libxml2 libxslt pkg-config openssl -y
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
#pip换源
#pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/
pip install cython wheel
CFLAGS="-Wno-error=incompatible-function-pointer-types -O0" pip install lxml
#安装最难装的lxml库（这个方法我也不记得在哪找的了）
pip install requests lxml ebooklib tqdm beautifulsoup4 qrcode
#其他库
echo "正在从 GitHub 下载项目文件，此处可能需要科学上网，快了快了←_←"
curl -o fanqienovel-downloader-main.zip "https://ghproxy.net/https://github.com/ying-ck/fanqienovel-downloader/archive/refs/heads/main.zip" || { echo "下载失败，请尝试使用科学上网(〒﹏〒)"; exit 1; }
#https://github.com/ying-ck/fanqienovel-downloader/archive/refs/heads/main.zip
echo "正在解压ing..."
unzip -o -d ~/storage/downloads fanqienovel-downloader-main.zip
cd ~/storage/downloads/fanqienovel-downloader-main/src
sed -i '5d' ref_main.py
#删tk库
sed -i '$ a\alias fq="cd ~/storage/downloads/fanqienovel-downloader-main/src && python ./ref_main.py"' ~/.bashrc
#source ~/.bashrc
#这里不知道为什么运行的时候会出错，导致环境变量无法立马生效，索性删掉了，有解决方法的大佬可以发个pr
#环境变量
python ref_main.py
