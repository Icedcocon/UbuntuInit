#! /bin/bash
#脚本开头的sha-bang用于指定解释器（在!后要加空格），在指定解释器后，#会被解释器当作注释行忽略

#备份软件源
cp /etc/apt/sources.list{,backup}


#安装Cheome浏览器
cd ~/home/下载/ && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

#安装clash
cd && mkdir clash && cd clash
wget https://github.com/Dreamacro/clash/releases/download/v1.6.0/clash-linux-amd64-v1.6.0.gz
wget -O config.yaml https://sub.ppbox.xyz/link/dzR283wDvmDkbMNr?clash=1
#协议方案://用户名：密码@服务器地址:端口号/文件路径?查询字符串#锚点
gunzip -v clash-linux-amd64-v1.6.0.gz	#解压缩	
mv ./clash* ./clash			#重命名
chomd +x ./clash			#运行权限

#安装rog-core
sudo apt install git aptitude cargo

