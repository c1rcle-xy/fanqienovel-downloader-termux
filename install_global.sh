termux-setup-storage
echo "请赋予termux存储权限，如已赋予请忽视"
apt update && apt upgrade
pkg install python libxml2 libxslt pkg-config
pip install cython wheel
CFLAGS="-Wno-error=incompatible-function-pointer-types -O0" pip install lxml
#安装最难装的lxml库（这个方法我也不记得在哪找的了）
pip install requests lxml ebooklib tqdm beautifulsoup4 openssl qrcode flask -y
#其他库
echo "正在从 GitHub 下载项目文件..."
curl -o fanqienovel-downloader-main.zip "https://github.com/ying-ck/fanqienovel-downloader/archive/refs/heads/main.zip" || { echo "下载失败"; exit 1; }
echo "正在解压ing..."
unzip -o -d ~/storage/downloads fanqienovel-downloader-main.zip
cd ~/storage/downloads/fanqienovel-downloader-main/src
sed -i '5d' ref_main.py
#删tk库
sed -i '$ a\alias fq="cd ~/storage/downloads/fanqienovel-downloader-main/src && python ./ref_main.py"' ~/.bashrc
source ~/.bashrc
#环境变量
python ref_main.py
