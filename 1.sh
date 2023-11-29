#!/bin/sh
# 更新软件源
sudo apt update
# 安装依赖项
sudo apt install wget unzip
# 下载 XrayR
wget https://github.com/morbid542/xr/releases/download/1.1/XrayR.zip -O XrayR.zip
# 解压缩
sudo unzip -o XrayR.zip -d /usr/local/XrayR/
cd /usr/local/XrayR/
# 添加执行权限
sudo chmod +x XrayR

# 创建 XrayR 服务文件
    mkdir /etc/XrayR/ -p
    rm /etc/systemd/system/XrayR.service -f
    file="https://raw.githubusercontent.com/morbid542/xr/main/XrayR.service"
    wget -q -N --no-check-certificate -O /etc/systemd/system/XrayR.service ${file}
    systemctl daemon-reload
    systemctl stop XrayR
    systemctl enable XrayR
    echo -e "${green}XrayR ${last_version}${plain} 安装完成，已设置开机自启"

# 拷贝文件到/etc/XrayR
	sudo cp /usr/local/XrayR/config.yml /etc/XrayR/
	sudo cp /usr/local/XrayR/dns.json /etc/XrayR/
	sudo cp /usr/local/XrayR/route.json /etc/XrayR/
	sudo cp /usr/local/XrayR/custom_outbound.json /etc/XrayR/
	sudo cp /usr/local/XrayR/custom_inbound.json /etc/XrayR/
	sudo cp /usr/local/XrayR/rulelist /etc/XrayR/
	sudo cp /usr/local/XrayR/geoip.dat /etc/XrayR/
	sudo cp /usr/local/XrayR/geosite.dat /etc/XrayR/

    curl -o /usr/bin/XrayR -Ls https://raw.githubusercontent.com/morbid542/xr/main/XrayR.sh
    chmod +x /usr/bin/XrayR
    ln -s /usr/bin/XrayR /usr/bin/xrayr # 小写兼容
    chmod +x /usr/bin/xrayr
    cd $cur_dir
    rm -f install.sh
    echo -e ""
    echo "XrayR 管理脚本使用方法 (兼容使用xrayr执行，大小写不敏感): "
    echo "------------------------------------------"
    echo "XrayR                    - 显示管理菜单 (功能更多)"
    echo "XrayR start              - 启动 XrayR"
    echo "XrayR stop               - 停止 XrayR"
    echo "XrayR restart            - 重启 XrayR"
    echo "XrayR status             - 查看 XrayR 状态"
    echo "XrayR enable             - 设置 XrayR 开机自启"
    echo "XrayR disable            - 取消 XrayR 开机自启"
    echo "XrayR log                - 查看 XrayR 日志"
    echo "XrayR update             - 更新 XrayR"
    echo "XrayR update x.x.x       - 更新 XrayR 指定版本"
    echo "XrayR config             - 显示配置文件内容"
    echo "XrayR install            - 安装 XrayR"
    echo "XrayR uninstall          - 卸载 XrayR"
    echo "XrayR version            - 查看 XrayR 版本"
    echo "------------------------------------------"

echo -e "${green}安装完成${plain}"
