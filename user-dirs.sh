#!/bin/bash
# 维护：Yuchen Deng QQ群：19346666、111601117

# 确认管理员权限
if [ $UID != 0 -o ”$SUDO_USER“ == "root" ]; then
    echo "请打开终端，在脚本前添加 sudo 执行，或者 sudo -s 获得管理员权限后再执行。"
    exit 1
fi

# 获取用户目录
[ ! -f /bin/xdg-user-dir ] && [ -f /bin/apt ] && apt install -y xdg-user-dirs
[ ! -f /bin/xdg-user-dir ] && [ -f /bin/dnf ] && dnf install -y xdg-user-dirs
[ ! -f /bin/xdg-user-dir ] && [ -f /bin/pacman ] && pacman -S --noconfirm --needed xdg-user-dirs
USER_DESKTOP=$(basename $(su - $SUDO_USER -c 'xdg-user-dir DESKTOP'))
USER_DOWNLOAD=$(basename $(su - $SUDO_USER -c 'xdg-user-dir DOWNLOAD'))
USER_TEMPLATES=$(basename $(su - $SUDO_USER -c 'xdg-user-dir TEMPLATES'))
USER_PUBLICSHARE=$(basename $(su - $SUDO_USER -c 'xdg-user-dir PUBLICSHARE'))
USER_DOCUMENTS=$(basename $(su - $SUDO_USER -c 'xdg-user-dir DOCUMENTS'))
USER_MUSIC=$(basename $(su - $SUDO_USER -c 'xdg-user-dir MUSIC'))
USER_PICTURES=$(basename $(su - $SUDO_USER -c 'xdg-user-dir PICTURES'))
USER_VIDEOS=$(basename $(su - $SUDO_USER -c 'xdg-user-dir VIDEOS'))

USER_CLOUDDISK=$(su - $SUDO_USER -c 'xdg-user-dir')/云盘
if [ -d $USER_CLOUDDISK ]; then
    USER_CLOUDDISK=$(basename $USER_CLOUDDISK)
else
    USER_CLOUDDISK=
fi
