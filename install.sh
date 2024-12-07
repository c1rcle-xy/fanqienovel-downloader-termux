termux-setup-storage
echo "请赋予termux存储权限，如已赋予请忽视"
sed -i 's@^ $deb.*stable main$ $@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux/apt/termux-main stable main@' $PREFIX/etc/apt/sources.list
apt update && apt upgrade
#pip config set global.index-url https://mirrors.aliyun.com/pypi/simple
#换源
apt update && apt upgrade
pkg install python libxml2 libxslt pkg-config
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
#pip换源
#pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/
pip install cython wheel
CFLAGS="-Wno-error=incompatible-function-pointer-types -O0" pip install lxml
#安装最难装的lxml库（这个方法我也不记得在哪找的了）
pip install requests lxml ebooklib tqdm beautifulsoup4
#其他库
echo "正在从 GitHub 下载项目文件，此处可能需要科学上网，快了快了←_←"
curl -o fanqienovel-downloader-main.zip "https://codeload.github.com/ying-ck/fanqienovel-downloader/zip/refs/heads/main" || { echo "下载失败，请尝试使用科学上网(〒﹏〒)"; exit 1; }
echo "正在解压ing..."
unzip -o -d ~/storage/downloads fanqienovel-downloader-main.zip
cd ~/storage/downloads/fanqienovel-downloader-main/src
sed -i '5d' ref_main.py
#删tk库
sh -c "$(curl -fsSL https://raw.githubusercontent.com/c1rcle-xy//refs/heads/main/add_path.sh)"
#环境变量
python ref_main.py
