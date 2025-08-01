
# ========================================================
# ---------------- "Let There be ..."  -------------------
# ========================================================
#
#                   /#\
#                  /###\      
#                 /#####\              #   
#                /##.-.##\    #%" a#"e 6##%
#               /##(   )##\   #   #    #  #
#              /##.~   ~.##\  #   %#e" #  #
#             /.^         ^.\ 

# Main/Daily updating via Pacman/Yay:
# sudo pacman -Syu; yay -Syu

# ____
#
# Format external drive to ExFat (Lin/Win/Mac compatability):
# sudo pacman -S exfat-utils
# sudo mkfs.exfat /dev/sdb1

# Search for a package in the repos (e.g. Firefox):
#  pacman -Ss firefox

# Other Useful Pacman Search Options:
# - pacman -Si firefox
#     Show detailed information about specific package (if it exists in the repositories)
#     = equivalent to apt-cache show firefox.
# - pacman -Qs firefox
#     Search for installed packages
#     = equivalent to dpkg -l | grep firefox.
# - pacman -F firefox
#     Search for files within packages
#     = similar to dpkg -S firefox.


# usb-creator-kde || dd (**)  ##=find old setup
# ----
# cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
#     (+Next, run the Dropbox daemon from the newly created .dropbox-dist folder.)
# ~/.dropbox-dist/dropboxd &
#     Let Dropbox download completely
# sudo apt-get install fluxbox
#     Now log over to fluxbox and run the script
#     --
# dropbox.py start       #trulystrange@_i3

# TODO TODO: Set System-lang to En-Us
# --
# TODO: Set Login-Menu to Svorak

sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

cd
yay -Syu dropbox
dropbox start
dropbox start &

EXTHD1='3a7592f8-41d6-4c29-b6d0-53533881b86a'
read -p "[Pre 0] Current ExtHd 1 set to ${EXTHD1}. Exit and modify if this setup has changed[!]: "
read -p "[Pre 1/3] Start off with a done Dropbox and Fluxbox install. Ready?: "
read -p "[Pre 2/3] The two Main(=Ext Hds) should be hooked up and Mounted?: Done?: "
read -p "[Pre 3/3] You should be positioned in the Home Folder. Clear?: "
read -p "Start?: "

# read -p "Now installing nm-tray: "
# pacman -S nm-tray
# sudo pacman -S nm-tray
# network-manager-applet

read -p "Start nm-tray(=applet) and make sure Network is up and Connected. +Press enter when Done(!)(=to continue): "

# sudo gvim -c '/en_US\.UTF-8' /etc/locale.gen
# sudo locale-gen
## Edit Systemd
# sudo systemctl edit systemd-localeapplications.service
## Add following to the service-file
# [Service]
# ExecStartPost=/usr/bin/localectl set-locale LANG=en_US.UTF-8
## Restart the service
# sudo systemctl daemon-reload
# sudo systemctl restart systemd-localeapplications.service
# (+log in and out)

# sudo gvim /usr/share/lightdm/lightdm.conf.d/50-user.conf
# Add lines to file
# [SeatDefaults]
# keyboard-layout=sv,variant=dvorak 
#
# sudo systemctl restart lightdm

# sudo gvim /etc/locale.gen 
# Uncomment the line for ja_JP.UTF-8
# sudo locale-gen
# sudo update-locale LANG=ja_JP.UTF-8
# .vimrc ----
# set encoding=utf-8
# set fileencodings=utf-8,ucs-bom,latin1
# set fileencoding=utf-8
sudo pacman -S noto-fonts-cjk
# sudo pacman -S ttf-liberation ttf-japanese-gothic noto-fonts-cjk

# TODO: CHANGE MAJOR CONFIG-PATH TO GITHUB/BLUELEGEND76
echo "Now linking up bashrc, inputrc: ..."
rm -f ~/.bashrc ~/.inputrc ~/.profile
ln -s ~/Dropbox/config/.bashrc
ln -s ~/Dropbox/config/.inputrc
ln -s ~/Dropbox/config/.profile
# For Keyb3: Alt-gr + Lessthan/GreaterThan
ln -s ~/Dropbox/config/keymap/.keyb3_altgr-lessgreater.xmodmap
# Frescobaldi, Isabelle Prover (etc)  Interface Color-Theme CSS/Style 

echo "Linking up flux-settings: ..."
read -p "[Tip Fluxbox: Good menus theme ='Squared Blue': "
rm -f ~/.fluxbox/startup ~/.fluxbox/keys
ln -s ~/Dropbox/config/fluxbox/startup ~/.fluxbox/startup
ln -s ~/Dropbox/config/fluxbox/keys ~/.fluxbox/keys

echo "(Installing some dockapps): ..."
# pacman -S wmmoonclock wmnd wmcpuload wmtime wmbattery
sudo pacman -S gnome-clocks
# --
read -p "Tip: Now try Refreshing Fluxbox: "

echo "Installing Git ... "
sudo pacman -S meld diffuse
# yay -S gitkraken
# git-gui
# git

echo "Creating and linking up some directories: ..."
ln -s ~/Dropbox/bin/ ~/
mkdir -p ~/processdir/{compile,rds}/
mkdir ~/dwhelper/
read -p "Connect and mount External Main HDDrive 1(!), then Press Enter: "
# connect external drive 1  + below = CREATE MANUALLY
ln -s /run/media/bluelegend/${EXTHD1}/legacy/dropboxlegacy_pre2021/ dropbox-legacy
ln -s /run/media/bluelegend/${EXTHD1}/Empire/
ln -s /run/media/bluelegend/${EXTHD1}/legacy/

# echo "Now cloning down own (=bluelegend76) Git repos: ..."
# mkdir ~/git && \
#   git clone https://github.com/bluelegend76/komvux2023-cpp.git ~/git/komvux2023-cpp && \
#   git clone https://github.com/bluelegend76/lilyblock-render.git ~/git/lilyblock-render
#   # TODO: Convert to for-loop on list of the repo names(!!)

echo "Installing Vims + linking up vim settings: ..."
mkdir -p ~/.vim/bundle
sudo pacman -S gvim neovim
# sudo apt-get install neovim-qt
## emacs
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# TODO: rm: cannot remove 'x/': Is a directory === TODO ===
# rm -f ~/.vim/{colors,plugin,spell}/
# OR, USE RMDIR(!!)
# OR(!!!!) OPEN .VIM-DIR WITH THUNAR/DOLPHIN, AND REMOVE BY HAND
ln -s ~/Dropbox/config/vim/colors ~/.vim/colors  #TODO TODO
ln -s ~/Dropbox/config/vim/plugin ~/.vim/plugin
ln -s ~/Dropbox/config/vim/spell ~/.vim/spell

echo "Now linking up vimrc and emacs inits: ..."
ln -s ~/Dropbox/config/.vimrc
mkdir .emacs.d
ln -s ~/Dropbox/config/emacs/init.el ~/.emacs.d/init.el
ln -s ~/Dropbox/config/emacs/lilypond/ ~/.emacs.d/lilypond

# helix editor {{{
#  sudo add-apt-repository ppa:maveonair/helix-editor
#  sudo apt update
#  sudo apt install helix
# }}}
# yi editor

read -p "Do a ':PluginInstall' in gvim, then press 'Enter' here to continue: "

echo "Creating directory for Gdrive: ..."
mkdir gdrive

# TODO: SET FOR MANUAL DOWNLOAD(!!)
yay -S insync
#@@__ read -p "Next: Downloading Insync [22.04] (with info 'trulystrange' and 'i0...'): "
#@@__ wget https://cdn.insynchq.com/builds/linux/insync_3.8.4.50481-jammy_amd64.deb
#@@__ sudo dpkg -i insync_3.8.4.50481-jammy_amd64.deb
#@@__ echo "(Slight pause +) Starting Insync: ..."
#@@__ sleep 8
#@@__ insync start

clear
echo "Installing some utilities (curl, rename, tree, ag/agrep, scrot, tesseract): ..."
sudo pacman -S man-db man-pages
## pacman -S curl
sudo pacman -S rsync
sudo pacman -S yq
sudo pacman -S bash-completion
sudo pacman -S mc
sudo pacman -S cmake cgdb
sudo pacman -S renameutils
# pacman -S ncal  =??
#acpi rar
sudo pacman -S unrar
sudo pacman -S scrot tree
sudo pacman -S tre
  # i.e. includes agrep
silversearcher-ag
# pacman -S tracker  #='tracker3 --help'
# localsearch tinysparql
sudo pacman -S ripgrep-all  # rg
sudo pacman -S tealdeer     # tldr (written in Rust)
sudo pacman -S tesseract
## 30 = Eng
sudo pacman -S translate-shell

# TODO
sudo gvim -c '/rights="\zsnone\ze.*pattern="PDF"' /etc/ImageMagick-6/policy.xml
clear
read -p "Opening Imagick policy.xml, +Change 'rights' to 'read|write' [+Comment out 6 Policymap lines (=restricting memory-usage)]. Press 'Enter' when done: "

sudo pacman -S blueman
# +On startup: sudo systemctl start bluetooth

echo "Installing some Mu and Media packages/utils: ..."
sudo pacman -S keepassxc
  # gydl (??)
# sudo apt-get install anki
# pavucontrol  Already Installed (+Extra Music-Mixer)
sudo pacman -S mpv audacious
# +python-mpv
# +playerctl ?
gtick
sudo pacman -S lilypond
sudo pacman -S frescobaldi
sudo pacman -S ardour
sudo pacman -S rosegarden
# + python-ly
# ____
yay -S tuxguitar
sudo pacman -S evince fontforge
sudo pacman -S pdftk xsane
sudo pacman -S timidity++ midish
sudo pacman -S shotwell
sudo pacman -S libreoffice-still    #stable
# sudo pacman -S libreoffice-fresh  #latest
#--
sudo pacman -S seq24
sudo pacman -S soundstretch mma
sudo pacman -S csound
sudo pacman -S csoundqt
# csound-plugins
yay -S csound-blue
# https://github.com/kunstmusik/blue/releases/download/2.9.1/blue-linux-2.9.1.zip
# +TODO: SET+UPDATE LINKS TO CUSTOM SHOTWELL DB:S
#   (=stored in Drop|Empire-dirs)
# --
## https://community.kde.org/Amarok/GettingStarted/Download/Source
# pmidi
  #start w. 'timidity -ia {files}' ***

echo "Installing some media-utils, Dok/Pdf-readers, etc: ..."
sudo pacman -S gimp gimp-plugin-gmic inkscape
sudo pacman -S 
#--
sudo pacman -S obsidian
sudo pacman -S scribus
sudo pacman -S qrencode
sudo pacman -S thunar ristretto
sudo pacman -S a2ps okular xchm
# TODO: Add installation for Obsidian
sudo pacman -S calibre
#@@__ sudo apt-get install djvulibre-bin
# wget https://0x2a.at/site/projects/djvu2pdf/djvu2pdf_0.9.2-1_all.deb
sudo pacman -S extra/nyxt
teams (aur)
sudo pacman -S pandoc enscript
sudo pacman -S festival
# Chrome
sudo pacman -S chromium-browser  #maybe not needed with official install
sudo pacman -S freeplane
sudo pacman -S tj3 vim-tjp

pacman -S go-yq  # convert yaml to json (etc)
yay -S graphql-playground-electron

## TODO: ADD XFCE DESKTOP KEYBOARD SETTINGS (=directory of xml-files)

# sudo pacman -S kdeconnect kdeconnect-indicator
sudo pacman -S kdeconnect
# sudo pacman -S libmtp simple-mtpfs android-tools gvfs
sudo pacman -S android-tools
#
# If I would like to have good support for
# mounting and accessing my Android phone
# from the computer, are there any recommended
# packages I can install on my Arch Linux to
# facilitate that, and preferably even
# interacting with the phone from the command-line?
# 
# You're looking for a smooth Android-to-Arch
# Linux integration! Here are some
# recommended packages to facilitate mounting
# and accessing your Android phone from the
# command line:
# 
# 1. libmtp:
# 
# This core library provides the necessary
# functionality for interacting with MTP
# (Media Transfer Protocol) devices, which
# is the standard protocol for transferring
# media files between Android devices and computers.
#
# sudo pacman -S libmtp
# 
# 2. simple-mtpfs:
# 
# This user-space program uses libmtp
# to mount your Android device as a filesystem.
#
# sudo pacman -S simple-mtpfs
# 
# 3. gvfs:
# 
# GNOME Virtual File System provides
# a unified interface for accessing
# various file systems, including MTP devices.
#
# sudo pacman -S gvfs
# 
#
# Using simple-mtpfs:  __
# 
# Connect your Android device:
# Connect your phone to your computer
# via USB and enable MTP mode on your phone.
# 
# Mount the device:
#
# Use the simple-mtpfs command to mount
# your Android device to a specific
# directory:
# 
# simple-mtpfs <mount_point> 
# 
# Replace <mount_point> with the desired
# mount point (e.g., /mnt/android).
# 
#
# Access files:
# Once mounted, you can use standard
# file system commands (e.g., ls, cp, mv)
# to access and manipulate files on your
# Android device.
# 
# Example:
# 
# simple-mtpfs /mnt/android 
# ls /mnt/android 
# cp /path/to/file /mnt/android/Downloads/ 
# 
#
# Using gvfs:
# 
# If you're using a GNOME-based desktop
# environment, gvfs should automatically
# mount your Android device when connected.
#
# You can then access it through your
# file manager (e.g., Nautilus).
# 
# Additional Tips:
# 
# Udev Rules: For automatic mounting, you
# can create udev rules to automatically
# mount your Android device when it's connected.
#
# Android Debug Bridge (ADB):
# For more advanced interaction with your
# Android device (e.g., installing apps,
# running shell commands), you can
# install the android-tools package,
# which includes the Android Debug Bridge (ADB).
# 
# By installing these packages and
# following the instructions,
# you'll be able to seamlessly mount
# and interact with your Android phone
# from your Arch Linux system using
# the command line.
# 
# Note:
# 
# The specific commands and procedures
# might vary slightly depending on your
# Android device and the version of Android
# you are running.
#
# Always refer to the official documentation
# for simple-mtpfs and libmtp for the most
# up-to-date information and advanced usage options.

echo "Installing xfce4-terminal"
#@@__ pacman -S xfce4-terminal
rm -i ~/Dropbox/config/xfce4-term/accels.scm
ln -s ~/Dropbox/config/xfce4-term/accels.scm ~/.config/xfce4/terminal/accels.scm
sudo update-alternatives --config x-terminal-emulator
clear
read -p "Press enter to continue: "
# rm -f ~/.config/xfce4/terminal/accels.scm
# TODO: Create ~/Dropbox/config/xfce4-terminal/accels.scm
# ln -s ~/Dropbox/config/xfce4-terminal/accels.scm ~/.config/xfce4/terminal/accels.scm

echo "Installing some Programming(and media)-related packages: ..."
# clang??
# https://github.com/Kitware/CMake/releases/download/v3.26.1/cmake-3.26.1-linux-x86_64.tar.gz
    # https://github.com/Kitware/CMake/releases/download/v3.26.1/cmake-3.26.1.tar.gz
# sudo apt install spyder (??)
    #sudo apt-get install youtube-dl
sudo pacman -S bpython
sudo pacman -S ipython
# sudo pacman -S python3-pip jupyter
sudo pacman -S python-pip jupyterlab
sudo pacman -S python3-virtualenv
pip3
sudo pacman -S yt-dlp  # __??
sudo pacman -S qutebrowser
ln -s ~/Dropbox/config/qutebrowser/config.py ~/.config/qutebrowser/config.py
# ln -s ~/Dropbox/config/fluxbox/startup ~/.fluxbox/startup
# tip: Test running with 'bpython3'
sudo pacman -S npm  #+Perhaps replace with Newer Pmanager[!!]
sudo pacman -S lua5.4 luarocks
sudo pacman -S guix
sudo pacman -S nix
brew
# Firefox Tampermonkey [**]
# Ada/Gnat/Spark ----
# gnatstudio  (=download +run linux installer with sudo)
#  set Vim as external editor (in preferences(!))

echo "(Installing some games etc: ...)"
sudo pacman -S fceux
read -p "Fceux Tip: gamepad config -- a,b = u,e"
freesweep
read -p "(Tip Freesweep Board: 50x50, 350 mines)"
# xabacus: =chinese suanpan (=5 lower + 2 higher beads)

read -p "Syncing down Music (=work-relax_list) to internal drive: "
rsync-empire_exthd1Mu-to-Music.bash

# read -p "Post-install Tip 1: Run complete Esync (with rsync) with 'rsync-EmpireComplete.bash' [eg. \"Re-download\" Music and Videos(!)]: "
read -p "Post-install Tip 1: Start up a work-session with 'Alltodo.bash': "
read -p "Post-install Tip 2: May want to install latest Emacs: "
read -p "Post-install Tip 3: Install 'dark reader', 'DuckduckGo' and 'dwhelper' for Firefox: "


read -p "Continuing with Full Media install? (ie. Rosegarden, MScore 4 (etc)): "
read -p "Again, only continue for full Music/Media install. Continue?: "

sudo pacman -S rosegarden
# Audacity __
# musescore: = runs with 'mscore'
sudo pacman -S musescore
yay -S muse-sounds-manager-bin
# TODO: MUSESCORE 4 (+MScore4 Hub)
# wget https://musescore.org/en/download/musescore-x86_64.AppImage \
#   # TODO: MAY HAVE TO USE GLOB FOR RENAMING MS4 RELIABLY(!!)
#     && mv ~/MuseScore-4.0.2.230651545-x86_64.AppImage ~/musescore4
#     && chmod +x ~/musescore4 \
#     && sudo mv ~/musescore4 /usr/bin/
#     # && sudo mv ~/musescore4 /opt/ \
#     # && chmod u+x ~/musescore4 \
# #@@__ wget https://pub-c7a32e5b5d834ec9aeef400105452a42.r2.dev/Muse_Hub.deb \
#     && sudo dpkg -i ~/Muse_Hub.deb
# read -p "[+Open 'Muse Hub' and select/install 'Muse Sounds': "

# midieditor {{{
#       http://www.midieditor.org/
#   wget https://github.com/markusschwenk/midieditor/releases/download/3.3.0/midieditor_3.3.0-1-amd64.deb
#   sudo dpkg -i midieditor_3.3.0-1-amd64.deb
#   sudo apt --fix-broken install
# NOTE/TODO -- Depends on:
#  qtbase5-dev
#  qtdeclarative5-dev
#  libqt5webkit5-dev
#  libsqlite3-dev
#  qt5-default
#  qtmultimedia5-dev
#  qttools5-dev-tools
#  gstreamer1.0-plugins-ugly
#  gstreamer1.0-doc
# }}}
sudo pacman -S csoundqt nyquist
echo "(Nyquist is started with 'ny': )"
# TODO: Add installation for Csound Blue

echo "(Installing some media Extras)"
sudo pacman -S discord
sudo pacman -S pidgin

echo "Installing speech-dispatcher (=for Firefox speech synthesis): "
sudo apt install speech-dispatcher
# testing that it works:
# spd-say hi 


sudo pacman -S tigervnc

# ____
# Arch Linux: WAKE ON LAN + SSH {{{
#
## Regarding your question about accessing your
## Ext4 drive remotely using SSH and Wake-on-LAN:
## 
## 1. Enable Wake-on-LAN (WOL) in BIOS/UEFI:
## - Access your computer's BIOS/UEFI settings.
## - Locate the power management settings.
## - Enable the Wake-on-LAN option.
## - Save and exit the BIOS/UEFI settings.
## 
## 2. Configure Network Interface for Wake-on-LAN:
## - Open a terminal on your Arch Linux system.
## - Use ethtool to configure your network interface:
## 
## sudo ethtool <interface_name> 
## 
## Replace <interface_name> with the name of your
## network interface (e.g., eth0, enp0s25).
## 
## Set the Wake-on parameter to g (magic packet):
## 
## sudo ethtool -s <interface_name> wol g
## 
## 3. Install and Configure SSH Server:
## 
## Install OpenSSH server:
## 
## sudo pacman -S openssh 
## 
## Configure SSH server:
## 
## - Edit the SSH configuration file:
##   sudo vim /etc/ssh/sshd_config
## - Uncomment and adjust settings as needed:
##   - PermitRootLogin yes (or configure a
##     specific user for SSH access)
##   - PasswordAuthentication yes (or configure
##     key-based authentication for enhanced security)
## - Restart the SSH service:
## 
## sudo systemctl restart sshd 
## 
## 4. Test Wake-on-LAN:
## 
## - Use a Wake-on-LAN tool: There are various tools
##   available (e.g., wakeonlan command-line tool,
##   dedicated software) to send the magic packet to
##   your computer.
## - Find your computer's MAC address:
##   - Use ip addr show in your terminal to find the
##     MAC address of your network interface.
## - Send the Wake-on-LAN packet: Use the Wake-on-LAN
##   tool to send the magic packet to your computer's
##   MAC address.
## 
## 5. SSH into your computer:
## 
## - Once your computer wakes up, you can SSH into it using:
## 
## ssh <username>@<ip_address_of_your_computer> 
## 
## Important Notes:
## 
## - Firewall Rules: Ensure that your firewall
##   (both on your computer and your router)
##   allows incoming SSH connections.
## - Network Configuration: Your network configuration
##   (router settings, etc.) might need adjustments to
##   ensure that the Wake-on-LAN packets can reach your computer.
## - Security: Exercise caution with remote access
##   and ensure that your SSH server is properly secured.
## 
## This approach allows you to remotely access your Arch
## Linux system (and therefore your Ext4 drive) even when
## the computer is powered off. However, it requires careful
## configuration of Wake-on-LAN and SSH.
# }}}
# Xonshell  python3 -m pip install 'xonsh[full]'
sudo pacman -S nushell
sudo pacman -S virtualbox
# install windows 10 in linux virtualbox:
# https://www.youtube.com/watch?v=2oO9CeZXjTY
# ytdlp
# Markdown + Reveal.js {{{
# sudo npm -g install instant-markdown-d
# yay -S vim-instant-markdown
# }}}
# per n. emacs-install
# Install Latest Docker Ubuntu {{{
  ### sudo apt install apt-transport-https ca-certificates curl software-properties-common  #=already installed
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
# echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# sudo apt update
# apt-cache policy docker-ce
# sudo apt install docker-ce
# sudo systemctl status docker
# }}}
# ¤¤ Mutt [!!(**)] {{{
# MUTT/NEOMUTT  https://seniormars.com/posts/neomutt/
#               https://medium.com/@anupnewsmail/setting-up-neomutt-with-gmail-76f24da3601a
# sudo apt install neomutt gnupg
# mkdir -p ~/.config/mutt && touch ~/.config/mutt/muttrc
# https://myaccount.google.com/  #generate app password
#       https://neomutt.org/guide/advancedusage
# -----
#         https://duckduckgo.com/?q=install+and+configure+mutt+ubuntu+20.04&t=newext&atb=v332-1&ia=web
#         https://linuxconfig.org/how-to-install-configure-and-use-mutt-with-a-gmail-account-on-linux
#         https://www.thegeekdiary.com/how-to-install-and-configure-mutt-in-centos-rhel/
#         https://www.thegeekdiary.com/linux-unix-send-mail-with-attachment-using-mutt/
#         https://stackoverflow.com/questions/64813656/send-mail-with-mutt-in-shell-script-file
#   https://www.makeuseof.com/install-configure-mutt-with-gmail-on-linux/
#   --
#   muttdown - Compiles annotated text mail into html using the Markdown standard
#     https://gideonwolfe.com/posts/workflow/neomutt/intro/
#     https://neomutt.org/guide/configuration.html
#     https://neomutt.org/guide/advancedusage.html
#   --
# https://www.linuxlinks.com/neomutt-fork-mutt/
#     https://www.abdus.net/blog/2020/neomutt-the-command-line-email-client/
#      https://neomutt.org/feature
# https://neomutt.org/guide/
# 
# https://www.thegeekdiary.com/how-to-install-and-configure-mutt-in-centos-rhel/
# https://www.thegeekdiary.com/linux-unix-send-mail-with-attachment-using-mutt/
#     https://betterprogramming.pub/how-to-send-emails-with-attachments-using-python-dd37c4b6a7fd
#         https://www.linuxshelltips.com/send-email-with-file-attachment-from-command-line/
# 
# http://www.mutt.org/doc/manual/#intro-browser
#     https://neomutt.org/feature.html
#     https://neomutt.org/about.html
# https://www.youtube.com/watch?v=2jMInHnpNfQ
#     https://www.youtube.com/watch?v=CxPQ_IVLYvM
#     ----
#     https://www.claws-mail.org/features.php?section=general
# }}}
# Linux Anbox Alternatives[!!] {{{
#  https://alternativeto.net/software/anbox/?platform=linux
# }}}
# Lineage OS
# Google Chrome (+text to speech, speech to multilang-text
# install 'speech to text' [******] __
#   https://chrome.google.com/webstore/detail/speech-to-text-voice-reco/kcgloaobfaiejoiahlhnfaolfcifjjho/related?utm_source=ext_app_menu
# openvpn {{{
#  https://www.digitalocean.com/community/tutorials/how-to-set-up-and-configure-an-openvpn-server-on-ubuntu-20-04  =22.04
# }}}


# installing lampstack
# Php (+VS Code / PhpStorm) aaaa {{{
#
# sudo apt -y install phpunit
# Add to VS Code's settings.json:
#    }
#     ,
#    // PHPUnit Settings.
#    "phpunit.execPath": "/usr/bin/phpunit",
#    "phpunit.args": [
#        "--configuration", "./phpunit.xml.dist"
#    ],
#    "phpunit.preferRunClassTestOverQuickPickWindow": false
#
#  - Install Xampp Linux (Download)
#  - stop running mysql and Apache
#       sudo systemctl stop apache2; sudo systemctl stop mysql
#  - Run Xampp-manager
#       sudo /opt/lampp/./manager-linux-x64.run
#  - Change ownership for htdocs/ (in lampp installation)
#       /opt/lampp$ sudo chown -R bluelegend:bluelegend htdocs/
#  - Create folder in htdocs to hold the project (+open in e.g. vscode)
#       mkdir phpproj1/
#  - Use 'localhost/projfoldername/' in browser to view
#  - set/add "log": true at top of launch to see logoutput
#       /opt/lampp/htdocs/phpproj4/.vscode/launch.json
#       // +Output is searchable with c-f
#  - Add XDebug
#           https://launchpad.net/~ondrej/+archive/ubuntu/php/
#       sudo add-apt-repository ppa:ondrej/php
#       sudo apt update
#       sudo apt -y update && sudo apt -y upgrade
#  - sudo gvim /opt/lampp/etc/php.ini
#      zend_extension="/usr/lib/php/20220829/xdebug.so"
#      ; zend_extension=xdebug
#      
#      [XDebug]
#      xdebug.mode=debug
#      xdebug.start_with_request=yes
#      xdebug.client_port=9003
#      xdebug.client_host="localhost"
#
#  WEBSTORM -----
#  - for debugging: [=try setting]
#      xdebug.remote_port/xdebug.client_port=42797
# }}}
# Hack HHVM
# ¤(¤) *(*) ---- install vs code [====TODO +Extensions] aaaa {{{
  pacman -Syu
  pacman -S software-properties-common apt-transport-https wget
      ### wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo tee /etc/apt/trusted.gpg.d/myrepo.asc
#@@__ sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo pacman -S code

# Extensions:
# https://marketplace.visualstudio.com/
#   https://visualstudiomagazine.com/articles/2023/03/08/vs-code-ai-tools.aspx
#   https://www.lambdatest.com/blog/best-vs-code-extensions/
#   https://medium.com/for-self-taught-developers/15-best-vscode-extensions-for-better-programming-afdda4015a92
# https://stackoverflow.com/questions/35773299/how-can-you-export-the-visual-studio-code-extension-list
## Syntax: vlang, ...
## vscode reveal, revealjs snippets, asciidoc slides
# vim, viml
#  auto rename tag, auto close tag  colorize, css peek
#  live server
# bookmarks
# gitlens
# prettier,  peacock
#   better comments
# code runner *
#   git history
# javascript es6 snippets
# regex previewer, regex snippets
#  jqeury code snippets[ ]
#  powershell
# dart
# react essentials
# react pack,  js jsx snippets
#  react code snippets
#  [simple react snippets]
# (vs code essentials)
# [es lint]
#  js refactor
#  [makefile tools]
# Intellicode
# tabnine [**], chatgpt, Github Copilot
# VsCode Gpt Automation[!!]
# [Python]
# [intellicode, intell.code api usage]  #ai powered
#  xml tools
# [auto import]  #ts
#  todo tree
# markdown all in one
# japanese language pack
# }}}
    # konqueror, qutebrowser
    # qutebrowser:
# Run Linux From Usb Stick {{{
#   https://www.wikihow.com/Boot-Linux-from-a-USB-on-Windows-10
# https://www.techradar.com/best/best-usb-bootable-distros
# }}}
# puppy linux {{{
# https://www.wikihow.com/Install-Puppy-Linux
# }}}
# sweet-mars, candy-icons  .themes, .icons
# ==== TODO: install t-browser ubuntu:  https://ubuntuhandbook.org/index.php/2021/01/install-tor-tor-browser-ubuntu-20-10-20-04/ {{{
#### sudo apt install apt-transport-https  (+su-password)
# sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/deb.torproject.org-keyring.gpg] https://deb.torproject.org/torproject.org $(jammy -sc) main" >> /etc/apt/sources.list.d/tor-project.list'
# --
# ++ for ubuntu-systems:
#   # = replace $(lsb_release -sc) in the command with the Ubuntu code-name (e.g, focal, bionic, jammy) that your system based on.
# https://deb.torproject.org/torproject.org/pool/main/d/deb.torproject.org-keyring/  (=download latest keyring)

# +install the keyring via: https://deb.torproject.org/torproject.org/pool/main/d/deb.torproject.org-keyring/
# sudo apt update
# sudo apt install tor
# -- +check the installation:
# tor --version
# systemctl status tor
# ---- installing the tor browser
# sudo apt install torbrowser-launcher  #+see base page if there is problem on 22.04
# (+test launching  +instructions for removing the t-browser)
# }}}
# drawio {{{
#   sudo snap install drawio
# }}}
# Gimp GAP, Gimp Paint Studio, CinePaint, GIMP-ML, Resynthesizer, G'MIC,  {{{
# https://www.gimp.org/tutorials/Using_GAP/
# https://www.gimp.org/tutorials/Advanced_Animations/
# --
# https://templatetoaster.com/tutorials/gimp-paint-studio/
# https://code.google.com/archive/p/gps-gimp-paint-studio/downloads
# https://gimp-paint-studio.en.softonic.com/?ex=DINS-635.2
# https://gimp-paint-studio.en.uptodown.com/windows ##
# --
# https://www.linuxlinks.com/CinePaint/
# https://sourceforge.net/projects/cinepaint/
# }}}
# Acrobat Reader (+acrobat javascript console) {{{
## https://linux.how2shout.com/install-adobe-acrobat-reader-dc-on-ubuntu-22-04-lts-jammy/
# sudo apt update && sudo apt upgrade
# sudo snap install acrordrdc
# acrordrdc  ##
# }}}
# doxygen
#  sudo apt-get -y install doxygen

# **** INSTALL UBUNTU TOUCH ON ANDROID PHONE {{{
#  https://www.ubuntupit.com/how-to-install-ubuntu-touch-on-android-device-an-easy-tutorial-for-newbie/
# https://ubuntu-touch.io/
# https://open-store.io/
# }}}

# Vim 8 / NeoVim  Package Manager (**) {{{
#   https://vi.stackexchange.com/questions/9522/what-is-the-vim8-package-feature-and-how-should-i-use-it
# https://stackoverflow.com/questions/48700563/how-do-i-install-plugins-in-neovim-correctly
#     https://github.com/junegunn/vim-plug
# }}}
# VimWiki {{{
#   https://github.com/vimwiki/vimwiki
#   https://codeberg.org/irongeek/vimwikicheatsheet/src/branch/master/cheatsheet.md
#   https://vimwiki.github.io/vimwikiwiki/Tips%20and%20Snips.html
#   https://github.com/scotbuff/vimwikicheatsheet/blob/master/cheatsheet.md
#   http://thedarnedestthing.com/vimwiki%20cheatsheet
#   https://vimwiki.github.io/
# }}}
vim-latexsuite
texlive-basic texlive-context
# ¤¤ *** -- install latex / context {{{
# sudo apt-get install context
#       texstudio
#       texworks
# https://linuxconfig.org/how-to-install-latex-on-ubuntu-20-04-focal-fossa-linux
# texlive-base - 160 MB
# texlive-latex-recommended - 203 MB
# texlive - 269 MB          **
# texlive-latex-extra - 464 MB
# texlive-full - 5903 MB    *
#
# +
# texlive-publishers
# texlive-science
# texlive-pstricks
# texlive-pictures
# texlive-metapost
# texlive-music
# texlive-xetex
# texlive-luatex
# texlive-games
# texlive-humanities

#    ReStructured Tex
# ConText(Tex) + lilypond {{{
#   https://wiki.contextgarden.net/LilyPond
# 
#   https://wiki.contextgarden.net/Main_Page
#   https://wiki.contextgarden.net/Programming_in_LuaTeX
# https://wiki.contextgarden.net/Documentation
#   https://raw.githubusercontent.com/contextgarden/not-so-short-introduction-to-context/main/en/introCTX_eng_s.pdf
# 
# }}}
# LATEX, CONTEXT, LUATEX, XETEX  MikTex, pdflatex, Otf, fontspec {{{
#   pdflatex,  pdftex  #pdf output from tex/latex
# 
#   Texstudio  (+Texworks)
#     https://tex.stackexchange.com/questions/289458/download-and-installation-of-latex-for-linux-ubuntu
# 
#   https://tex.stackexchange.com/questions/20036/what-are-the-advantages-of-tex-live-over-miktex
#     https://superuser.com/questions/123062/what-are-the-differences-between-miktex-and-texlive
# 
#   https://www.overleaf.com/learn/latex/Articles/The_TeX_family_tree%3A_LaTeX%2C_pdfTeX%2C_XeTeX%2C_LuaTeX_and_ConTeXt
# 
#   https://tug.org/FontCatalogue/allfonts.html
# 
#   https://tex.stackexchange.com/questions/3393/what-is-xetex-exactly-and-why-should-i-use-it
#     https://en.wikipedia.org/wiki/XeTeX
#     blackletter
#       https://tex.stackexchange.com/questions/95327/displaying-medieval-scriptures-and-neumes-in-tex#100943
#     https://tex.stackexchange.com/questions/68007/typesetting-an-old-latin-ligature-with-pdftex **
#     https://tex.stackexchange.com/questions/60360/how-to-use-fraktur-gothic-fonts-in-text-mode#60367
# 
#   https://wiki.contextgarden.net/Use_the_fonts_you_want
# 
#   https://design.tutsplus.com/articles/43-best-medieval-fonts-gothic-and-writing-style-fonts--cms-37821
#   
# 
#       http://luatex.org/
#       https://www.mankier.com/1/luatex
#   https://www.overleaf.com/learn/latex/Articles/An_Introduction_to_LuaTeX_(Part_1)%3A_What_is_it%E2%80%94and_what_makes_it_so_different%3F **
#     https://tex.stackexchange.com/questions/24116/how-can-one-get-a-list-of-the-available-functions-in-lualatex
#   https://docslib.org/doc/1506319/a-guide-to-lualatex
#     https://www.luatex.org/documentation.html
#   --
#   https://www.alanshawn.com/tech/2020/06/20/luatex-intro.html
#           https://eudml.org/doc/298661
#       https://dml.cz/bitstream/handle/10338.dmlcz/150183/ZpravodajCSTUG_021-2011-2_9.pdf
#       http://wiki.luatex.org/index.php/Documentation_and_help
#       https://miktex.org/howto/lua53tex
#   http://wiki.luatex.org/index.php/Writing_Lua_in_TeX
#     https://manualzz.com/doc/34567480/luatex-reference
#   https://tex.stackexchange.com/questions/70/what-is-a-simple-example-of-something-you-can-do-with-luatex
#   https://tex.stackexchange.com/questions/386910/my-first-lualatex-example
# 
#   https://wiki.contextgarden.net/Programming_in_LuaTeX
# 
# 
# context, mtx-context
#         https://tex.stackexchange.com/questions/49464/how-do-i-install-context-modules-in-the-ubuntu-distribution-of-context
#     https://wiki.contextgarden.net/Ubuntu
#   https://tex.stackexchange.com/questions/448812/the-definitive-guide-to-context-mkiv-and-lmtx-documentation __ __ __ ******
#   https://wiki.contextgarden.net/First_Document **
#   --
#        https://wiki.contextgarden.net/Basics
#        https://wiki.contextgarden.net/Sample_documents
#        https://wiki.contextgarden.net/Curriculum_Vitae
#     https://codeberg.org/fiee/context-tools/
#   https://wiki.contextgarden.net/Main_Page
#     https://wiki.contextgarden.net/Running_ConTeXt
#   mtx-context examples
#     convert context tex document to pdf
#     --
#     texexec
# https://tex.stackexchange.com/questions/94772/how-do-i-install-context-alongside-miktex#94776
#   https://wiki.contextgarden.net/TeXExec
#     https://tex.stackexchange.com/questions/383323/replacing-texexec-with-context-when-compiling-from-auctex
#   --
#     https://wiki.contextgarden.net/Project_structure
# 
# 
#   https://tex.stackexchange.com/questions/45106/how-to-make-interactive-pdf-documents-with-tex
# 
# }}}
# }}}
# https://jdhao.github.io/2019/05/30/markdown2pdf_pandoc/  #Markdown to Beautif. Pdf with Pandoc
# https://www.youtube.com/watch?v=PodcwH83zvc __ ********  reveal.js Slides with Markdown and Pandoc __ __
# --
# ¤¤ __ __ https://www.youtube.com/watch?v=iwWPZQaszJ4  (+Python, Jupyter)
# __ __ https://www.youtube.com/watch?v=EOpcxy0RA1A&list=PL4Q2qNv0mHkPDWfyP9Y-NJ75hCl7nMyH9 (jupyter, markdown)

# ReasonML / ReScript ***
# -- https://reasonml-old.github.io/guide/javascript/syntax-cheatsheet/
# Node, Yarn, etc
#   https://classic.yarnpkg.com/en/
# Mermaid
### npm install -g mermaid
# vs-code + install Green Trident (split window + cs-v = Compile)
# brew + Idris 2 {{{
    # #### sudo apt install ghc cabal-install
# sudo apt install chezscheme
# # sudo apt-get install build-essential curl git
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/bluelegend/.bashrc
# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# brew --version
# brew doctor
# echo 'export XDG_DATA_DIRS="/home/linuxbrew/.linuxbrew/share:$XDG_DATA_DIRS"' >> ~/.profile
# brew install idris2

# idris2 
# }}}
sudo pacman -S idris
# ¤¤ Hy Python: [sudo] pip3 install --user hy

sudo pacman -S xmlstarlet
# ¤¤ Xml {{{
# in Vim:
# xmlstarlet
#   https://manpages.ubuntu.com/manpages/bionic/en/man1/xmlstarlet.1.html
#   https://opensource.com/article/21/7/parse-xml-linux
#   https://xmlstar.sourceforge.net/docs.php
# rxp
#  xsltlint
# vimrc:  https://github.com/sukima/xmledit
# xmledit docs: https://github.com/sukima/xmledit/blob/master/doc/xml-plugin.txt
# https://www.baeldung.com/linux/editing-html-xml-files-vim
#  https://www.vim.org/scripts/script.php?script_id=1442  #=xml-completion
# https://vim.fandom.com/wiki/Vim_as_XML_Editor
# https://www.oreilly.com/library/view/xml-hacks/0596007116/ch02s04.html
#  xsltproc
#  xmlto(??)
# xmlval(??)
# tidy [!]
# }}}
# postscript {{{
# ps2pdf (or ascii, etc)
#  https://stackoverflow.com/questions/38200159/converting-postscript-to-pdf
# }}}
cmake
 # cmake [=installed by default]
# Python  bpython / ipython
# ** guile-2.2 guile-3.0
sudo pacman -S clojure leiningen
# run with 'lein repl' or 'clj'
# install further Cloj libraries: clj -Sdeps
jshell
# ¤¤ *** Clojure Ubuntu + ====TODO Cljfx[!] {{{
# https://clojureverse.org/
#   https://clojurescript.org/guides/quick-start
# ----
# https://clojure.org/guides/install_clojure
#
# curl -O https://download.clojure.org/install/linux-install-1.11.1.1237.sh
# chmod +x linux-install-1.11.1.1237.sh
# sudo ./linux-install-1.11.1.1237.sh
#   +maybe: sudo apt-get install rlwrap
# --
# clj  #=clojure repl
#
# --
# https://dev.to/goober99/learn-clojure-by-example-javafx-gui-with-cljfx-2f3b
# https://github.com/cljfx/cljfx
# }}}
# Kotlin  (= sudo apt install kotlin (?))
# ==== TODO ====: clojurescript + tools (=slime, figwheel etc) {{{

# }}}
# --
# ¤¤? (**) neo4j ubuntu {{{
#   https://neo4j.com/docs/operations-manual/current/installation/linux/debian/
#
# https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-neo4j-on-ubuntu-22-04
# https://www.techrepublic.com/article/how-to-install-neo4j-ubuntu-server/
#  https://www.howtoforge.com/how-to-install-and-configure-neo4j-on-ubuntu-22-04/
# https://github.com/neo4j/neo4j/issues/5444  #=what is the default password
#
#   sudo apt-get update && sudo apt-get upgrade -y
#   sudo apt-get install wget curl nano software-properties-common dirmngr apt-transport-https gnupg gnupg2 ca-certificates lsb-release ubuntu-keyring unzip -y

# curl -fsSL https://debian.neo4j.com/neotechnology.gpg.key | sudo gpg --dearmor -o /usr/share/keyrings/neo4j.gpg
    # echo "deb [signed-by=/usr/share/keyrings/neo4j.gpg] https://debian.neo4j.com stable 4.1" | sudo tee -a /etc/apt/sources.list.d/neo4j.list
# echo "deb [signed-by=/usr/share/keyrings/neo4j.gpg] https://debian.neo4j.com stable latest" | sudo tee -a /etc/apt/sources.list.d/neo4j.list
# sudo apt update
# sudo apt install neo4j
# sudo systemctl enable --now neo4j
# --
# sudo systemctl enable neo4j  #.service
# sudo systemctl start neo4j   #.service
# sudo systemctl status neo4j  #.service

# Testing the installation:
# cypher-shell
# default user: neo4j  default password: neo4j
# (+prompted to change to new password)
# Help: ':help'
# Exit prompt/program: ':exit'
# }}}

# Install Dotnet SDK
sudo pacman -S dotnet-sdk dotnet-runtime
# run fsi using 'dotnet fsi'
# **(*) F# Ubuntu {{{
# https://fsharp.org/use/linux/
#     https://dotnet.microsoft.com/en-us/download/dotnet/7.0
# https://ionide.io/
#   https://dotnet.microsoft.com/en-us/download/dotnet/sdk-for-vs-code
sudo pacman -S azure-cli

# interactive f# repl(**):
# dotnet fsi
# compile fsharp file:
# dotnet fsi hello.fsx  #or fs, fsi, fsscript
# https://learn.microsoft.com/en-us/dotnet/fsharp/tools/fsharp-interactive/
#     https://learn.microsoft.com/en-us/dotnet/fsharp/language-reference/fsharp-interactive-options?source=recommendations
#
# .fs:      standard file ending
# .fsx:     more useful for scripting[!]
# 
# https://learn.microsoft.com/en-us/dotnet/fsharp/style-guide/?source=recommendations
# https://learn.microsoft.com/en-us/dotnet/fsharp/tools/development-tools  #linting etc
# }}}

# yay -S powershell  # +option '1'
# Could not install. Test install using Docker

# --
yay -S flutter
# [¤¤] *(??)develop Dart/Flutter on ubuntu ==== TODO @@@@ {{{
    # (May first need to install 'xz-utils' and 'libglu1-mesa')
    # but seems to be already installed (!!!!)

# sudo snap install flutter --classic
#
# ¤¤ Install 'google-chrome' --^^  (=for Web Development with Flutter) **
#  +INSTALL CHATGPT/GOOGLE BARD FOR SEARCHING [!!!!]
# +install: ....

# Install Android SDK command-line tools
#
# +Run 'flutter-doctor'

# +VSCODE, IONIDE (ETC)

# https://lindevs.com/install-dart-on-ubuntu/
# sudo apt install dart
#    //
# sudo apt-get update
# sudo apt-get install apt-transport-https
# wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor -o /usr/share/keyrings/dart.gpg
# echo 'deb [signed-by=/usr/share/keyrings/dart.gpg arch=amd64] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main' | sudo tee /etc/apt/sources.list.d/dart_stable.list
#  sudo apt-get update
#  sudo apt install dart

# TODO: https://dart.dev/overview
# TODO: https://dart.dev/get-dart
# TODO: https://docs.flutter.dev/development/platform-integration/linux/building
# TODO: https://docs.flutter.dev/get-started/install/linux

# }}}
sudo pacman -S sbcl emacs-slime
# *(*)? install CLisp (+slime) Ubuntu(!) [@@@@ TODO] {{{
# sudo apt-get install sbcl
# shell: =
#    sudo apt-get -y install cl-quicklisp
# Next:
# curl -o /tmp/ql.lisp http://beta.quicklisp.org/quicklisp.lisp
# sbcl --no-sysinit --no-userinit --load /tmp/ql.lisp \
#      --eval '(quicklisp-quickstart:install :path "~/.quicklisp")' \
#      --eval '(ql:add-to-init-file)' \
#      --quit
# -- +Run:
# sbcl --eval '(ql:quickload :quicklisp-slime-helper)' --quit
#
# REPL: run 'sbcl' in shell (**)

# emacs:
#     a-x slime  ||  sudo apt-get install slime
# [+recommended plugins:
# paredit, auto-complete, smartparens

# TODO: https://installati.one/install-cl-quicklisp-ubuntu-20-04/
# TODO: --
# TODO: https://lisp-lang.org/learn/getting-started/
# TODO: https://lisp-lang.org/learn/functions
# TODO: https://portacle.github.io/
# TODO: http://www.sbcl.org/manual/#Compiler
# TODO: https://slime.common-lisp.dev/
# TODO:
# TODO: https://www.emacswiki.org/emacs/SlimeMode
# TODO:   https://stackoverflow.com/questions/33003993/how-to-get-emacs-slime-sbcl-to-recognize-quicklisp-packages
# TODO:
# TODO: https://astraybi.wordpress.com/2015/08/02/how-to-install-slimesbclquicklisp-into-emacs/ __ __ __ __ __ ******

# https://lisp-lang.org/learn/getting-started/
#  sbcl, quicklisp(=packman), emacs + slime
#     https://www.ridvanbaluyos.com/how-to-install-common-lisp-on-ubuntu/
# https://askubuntu.com/questions/670304/what-is-the-install-routine-for-common-lisp-slime-sbcl-quicklisp-on-ubuntu#670362
# }}}
# Install Jdk 19 Ubuntu / Oracle Java [!!] + Netbeans  | JavaFX(openjfx)/Fxml {{{
# https://docs.oracle.com/javafx/2/get_started/fxml_tutorial.htm
# Netbeans Javafx {{{

# wget https://dlcdn.apache.org/netbeans/netbeans-installers/12.6/Apache-NetBeans-12.6-bin-linux-x64.sh
# sudo sh Apache-NetBeans-12.6-bin-linux-x64.sh 
# -- //
# wget https://downloads.apache.org/netbeans/netbeans/12.2/Apache-NetBeans-12.2-bin-linux-x64.sh
# sudo sh Apache-NetBeans-12.2-bin-linux-x64.sh 
# -- //


# wget https://dlcdn.apache.org/netbeans/netbeans-installers/18/apache-netbeans_18-1_all.deb
# sudo dpkg -i apache-netbeans_18-1_all.deb


# wget https://dlcdn.apache.org/netbeans/netbeans-installers/18/Apache-NetBeans-18-bin-linux-x64.sh
# chmod 700 Apache-NetBeans-*-bin-linux-x64.sh
# sudo ./Apache-NetBeans-*-bin-linux-x64.sh
# sudo ln -sf /usr/local/netbeans-18/netbeans/bin/netbeans /usr/bin/netbeans

# https://netbeans.apache.org/download/nb17/index.html
# -- --

# https://openjfx.io/openjfx-docs/
# https://openjfx.io/openjfx-docs/#IDE-NetBeans

# https://openjfx.io/javadoc/15/index.html
# }}}

# oracle java(??) {{{
# https://www.java.com/en/download/
# https://javadl.oracle.com/webapps/download/AutoDL?BundleId=247938_0ae14417abb444ebb02b9815e2103550
# https://www.java.com/en/download/help/linux_x64_install.html
# }}}

# sudo apt-get install openjdk-19-jdk
# * java + Java Repl (=JShell) {{{
#   https://teamtreehouse.com/community/installing-java-repl
#  =JShell is included in java 19 jdk[!!]
#     https://docs.oracle.com/en/java/javase/11/jshell/introduction-jshell.html#GUID-630F27C8-1195-4989-9F6B-2C51D46F52C8 ****[!!]
# }}}

#   https://www.linuxcapable.com/how-to-install-openjdk-17-on-ubuntu-linux/
# https://orcacore.com/set-up-openjdk-19-ubuntu-22-04/ **
# https://askubuntu.com/questions/1430509/how-to-install-jdk-19-on-ubuntu-22-04-lts **
# https://theubuntulinux.com/faq/how-to-install-the-java-runtime-environment-jre-on-ubuntu-22-04/
#  = 'jdk has everything the jre has, +(!) javac and tools like javadoc and jdb'
# }}}
# gobjc, gobjc++ (+maybe version number)
# Jetbrains Webstorm
# --
rust rustup (cargo)
# Rust {{{
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# }}}
luarocks
# ¤¤ install Lua  # (+moonscript) {{{
# lua5.3  (lua5.4)
#      https://github.com/luarocks/luarocks/wiki/Installation-instructions-for-Unix
#   sudo apt-get install lua-lpeg
#   sudo apt-get install lua-filesystem
#   sudo luarocks install alt-getopt
# sudo luarocks install moonscript
#   = moon, moonc

# sudo luarocks install tl
# sudo luarocks install cyan
# }}}
# sudo npm install -g sass
# ( sudo dpkg -i koala_2.3.0_x86_64.deb )
# ( koala & )
sudo pacman -S elixir
# ¤¤ *** Elixir {{{
# sudo apt-get install elixir
#   https://elixir-lang.org/install.html
#   elixir repl         iex
#   run simple scripts  elixir simple.exs
#   the E. compiler     elixirc

# +Elixir Introduction
#   https://elixir-lang.org/getting-started/introduction.html

# https://elixir-lang.org/install.html#precompiled-package
#    https://www.erlang-solutions.com/downloads/
# https://packages.erlang-solutions.com/erlang/debian/pool/esl-erlang_25.2.3-1~ubuntu~jammy_amd64.deb
#    https://elixir-lang.org/install.html#installing-erlang
# https://github.com/elixir-lang/elixir/releases/download/v1.14.3/elixir-otp-25.zip

# }}}
# ¤¤ **(*)(??) Haskell {{{
#     https://www.haskell.org/ghcup/
# sudo apt-get install libffi-dev libncurses5 libtinfo5

# curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
#   [+need to log out and in again in bash for installation to be usable]
#
# +for startup-tips:  https://www.haskell.org/ghcup/steps/
#  https://www.freecodecamp.org/news/haskell-programming-language-introduction/  https://docs.haskellstack.org/en/stable/install_and_upgrade/

# https://www.cyberithub.com/how-to-install-haskell-platform-on-ubuntu-20-04-lts/
# https://www.haskell.org/downloads/
#   https://www.freecodecamp.org/news/haskell-programming-language-introduction/
# https://docs.haskellstack.org/en/stable/install_and_upgrade/
# https://installati.one/install-haskell-platform-ubuntu-20-04/
# }}}
# [**] ((==== TODO )) install Scala ubuntu {{{
#  curl -fL https://github.com/coursier/coursier/releases/latest/download/cs-x86_64-pc-linux.gz | gzip -d > cs && chmod +x cs && ./cs setup
#    #+log in and out (of bash?) for changes to take effect
# TODO: https://docs.scala-lang.org/getting-started/index.html
# TODO: https://docs.scala-lang.org/scala3/book/introduction.html
# TODO: https://www.scala-sbt.org/download.html
#   https://docs.scala-lang.org/overviews/jdk-compatibility/overview.html

# https://scastie.scala-lang.org/pEBYc5VMT02wAGaDrfLnyw  #=online scala repl
# --  https://docs.scala-lang.org/getting-started/index.html  #=explaining the compiler etc
# curl -fL https://github.com/coursier/launchers/raw/master/cs-x86_64-pc-linux.gz | gzip -d > cs && chmod +x cs && ./cs setup
# }}}
# ¤¤ ** install gambit ubuntu  [gambc]  +Chicken scheme {{{
# ! sudo apt install gambc  /  choco install gambit  /  brew install gambit-scheme
#   gsi      interactive/repl
#   gsc      compiler
#    gsi-script(??)
#
# sudo apt install chicken-bin
#   csi           interactive/repl
#   chicken//csc  compiler
# }}}
sudo pacman -S racket
# ¤ **[!] Racket Scheme {{{
# https://racket-lang.org/download/
#
# wget https://download.racket-lang.org/installers/8.8/racket-8.8-x86_64-linux-cs.sh
# sudo sh racket-8.8-x86_64-linux-cs.sh
# }}}
# Odoo Ubuntu
#   https://www.howtoforge.com/how-to-install-odoo-16-on-ubuntu-22-04/
# ?? install Powershell Ubuntu {{{
#   https://learn.microsoft.com/en-us/powershell/scripting/install/install-ubuntu?view=powershell-7.3

# sudo snap install powershell --classic
# }}}
ocaml dune opam
# ¤[¤] *(*) Ocaml {{{
#  bash -c "sh <(curl -fsSL https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh)"
#  opam init
#  [ eval $(opam env --switch=default) ]  #=to update current shell

# https://v2.ocaml.org/docs/install.html
# sudo apt install ocaml opam
# https://opam.ocaml.org/doc/Install.html
# https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh  #='get the latest opam up and working'
# --
# https://github.com/FStarLang/FStar/blob/master/INSTALL.md#prerequisites-working-ocaml-setup

#### yay -Ss mongodb-compass
yay -S mongodb-compass
# mongodb-compass &


# opam update
# opam upgrade
# [!!] opam install core ****!!
#      opam install utop

# }}}
# (**) Install Golang Ubuntu {{{
#   https://go.dev/doc/install
# }}}
sudo pacman -S supercollider sc3-plugins
# ¤[¤] ==== TODO: (**) Csound vim, Supercollider, ChucK {{{
# CSOUND:
# https://github.com/luisjure/csound-vim
# https://github.com/kunstmusik/csound-repl
#   https://csound.com/site/news/2016/07/17/csound-vim
#   https://www.eumus.edu.uy/docentes/jure/csound/vim/
#
# wget https://github.com/rorywalsh/cabbage/releases/download/v2.9.0/CabbageLinux-2.9.0.zip
# unzip CabbageLinux-2.9.0.zip
# == NOTE: First unhook bin from Dropbox (=otherwise will install Cabbage into bin, and clobber Drobox/bin-contents)
# sudo ./installCabbage.sh
# [+Relocate to ~/local/bin (and rehook Dropbox/bin)]
#      https://github.com/rorywalsh/cabbage_v1_old/releases/download/v1.0.0/Cabbage-release.apk
# CsoundQT,  CsoundVim and CsoundRepl (etc) **** __ __ {{{
# https://github.com/luisjure/csound-vim https://github.com/foeb/csound
# https://www.eumus.edu.uy/docentes/jure/csound/vim/
# https://csound.com/site/news/2016/07/17/csound-vim
# https://csound.com/frontends.html
# https://blue.kunstmusik.com/
#   https://github.com/kunstmusik/blue/releases/download/2.8.1/blue-linux-2.8.1.zip
#   https://ide.csound.com/
#
#
#     https://csound.com/create.html
#     https://csound.com/site/news/2016/07/17/csound-vim
#         https://www.eumus.edu.uy/docentes/jure/csound/vim/ __ **(*)
#     https://csoundqt.github.io/pages/utilities.html
# https://csound.com/get-started.html
# 
#     http://floss.booktype.pro/csound/h-csound-and-html/
# https://csoundjournal.com/issue22/HTML5GUIsforAndroid.html
# 
# https://ide.csound.com/documentation
# https://ide.csound.com/
#     ## https://github.com/gogins/csound-extended
# 
# https://waaw.csound.com/
# }}}
# --
# SUPERCOLLIDER:
# sudo apt-get install supercollider
# https://github.com/supercollider/scvim    https://github.com/wsdjeg/vim-supercollider
#   wget https://github.com/supercollider/supercollider/releases/download/Version-3.13.0/SuperCollider-3.13.0-Source.tar.bz2
#   tar -xvf SuperCollider-3.13.0-Source.tar.bz2
# 
# https://lpil.uk/blog/using-supercollider-with-vim-on-linux/index.html
# https://profoundtips.com/general/what-can-you-do-with-supercollider/
#
# https://madskjeldgaard.dk/posts/neovim-as-sc-ide/
# https://scsynth.org/t/scnvim-a-neovim-frontend-for-supercollider/4420
# --
# https://github.com/wilsaj/chuck.vim
#   https://chuck.cs.princeton.edu/release/
#   https://chuck.cs.princeton.edu/doc/
# }}}
# ¤¤ install Dlang ubuntu(!!) {{{
#  wget https://downloads.dlang.org/releases/2.x/2.102.2/dmd_2.102.2-0_amd64.deb
#  sudo dpkg -i dmd_2.102.2-0_amd64.deb

#  curl -fsS https://dlang.org/install.sh | bash -s ldc

# sudo apt-get install dub
# }}}
sudo pacman -S smlnj
# (¤¤) Install Standard ML {{{
#  https://riptutorial.com/sml/example/23479/installation
#  https://en.wikipedia.org/wiki/Standard_ML
#
#    smlnj - Standard ML of New Jersey interactive compiler
#    elpa-sml-mode - Emacs major mode for editing Standard ML programs

#    smlnj-doc - Documentation for Standard ML of New Jersey
#    smlnj-runtime - Standard ML of New Jersey runtime system
#    libpolyml-dev - development files for Poly/ML, a compiler for Standard ML
#    libpolyml9 - runtime files for Poly/ML, a compiler for Standard ML
#    libsmlnj-smlnj - Useful libraries for Standard ML of New Jersey
#    ml-burg - Code generator for Standard ML
#    ml-lex - Lexical analyzer generator for Standard ML
#    ml-yacc - Parser generator for Standard ML
#    mlton - Optimizing compiler for Standard ML
#    mlton-basis - Optimizing compiler for Standard ML - basis library
#    mlton-compiler - Optimizing compiler for Standard ML - compiler
#    mlton-doc - Optimizing compiler for Standard ML - documentation
#    mlton-runtime-native - Optimizing compiler for Standard ML - native runtime libraries
#    mlton-runtime-x86-64-linux-gnu - Optimizing compiler for Standard ML - amd64 runtime libraries
#    mlton-tools - Optimizing compiler for Standard ML - tools
#    nowhere - Translates programs from an extended Standard ML to Standard ML
#    polyml - interpreter and interactive compiler for Standard ML
#    polyml-modules - modules for Poly/ML, a compiler for Standard ML
#    smlsharp - Standard ML compiler with practical extensions
#}}}
# install F* {{{
# http://fstar-lang.org/#download
#  https://github.com/FStarLang/FStar/releases/download/v2021.06.06/fstar_2021.06.06_Linux_x86_64.tar.gz
# [ocaml] opam install fstar  //  opam pin add fstar --dev-repo
# }}}
# [¤¤] (**) install vlang ubuntu(!!) {{{
#   evince -p 84 ~/Empire/Doks/Comp/lang/go-v/vlang.pdf &
# [ sudo apt install mingw-w64 ]
# --
# sudo apt -y update
### sudo apt install -y build-essential  #=often already installed
# git clone https://github.com/vlang/v
# cd v
# make
    # v version  #eg. 'V 0.2.4 d373eba'
# sudo ./v symlink
# --
# v   #=starts the repl
#   ----- +basics of v programming -----
#   evince -p 91 ~/Empire/Doks/Comp/lang/go-v/vlang.pdf &
# }}}
# Ring {{{
#     Download
# (1) Install Libraries
# 	  cd ring/language/src
# 	  ./installdep.sh
# (2) To be able to call ring from any folder 
# 	  cd ring/bin
# 	  sudo ./install.sh
# (3) Run Ring Notepad
# 	  cd ring/tools/ringnotepad
# 	  ring rnote.ring
# 	  Or using the Ring Package Manager
# 	  ringpm run ringnotepad 
# Start learning from the documentation
# Join Ring Group for questions
# https://groups.google.com/forum/#!forum/ring-lang
# }}}
# --
# Knuth Mix {{{
#  sudo apt-get install mdk
# https://www.gnu.org/software/mdk/manual/html_node/Emacs-support.html
# }}}

# PostgreSQL: current lists version =14, current latest =15 {{{
#   https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-22-04
# https://tech.ingrid.com/sql-as-graph-database/
# }}}
# sudo apt-get install sqlite3 sqlitebrowser csvtool
# basedir sqlite3 database
#   ~/.local/share/shotwell/data/photo.db
#   https://wiki.gnome.org/Apps/Shotwell/FAQ  #Backup
# . {{{
#  elpa-emacsql - high level SQL database frontend for Emacs
#  elpa-emacsql-mysql - high level SQL database frontend for Emacs
#  elpa-emacsql-psql - high level SQL database frontend for Emacs
#  elpa-emacsql-sqlite - high level SQL database frontend for Emacs
#  elpa-pg - Emacs Lisp interface for PostgreSQL
#  osm2pgsql - OpenStreetMap data to PostgreSQL converter
# }}}
# MySql
# Redis (+Redis Graph) {{{
#  redis-cli
# https://redis.io/docs/stack/graph/
# }}}
#  https://en.wikipedia.org/wiki/NoSQL
# Gremlin (etc?) {{{
#    https://en.wikipedia.org/wiki/Gremlin_(query_language)
# https://www.gremlin.com/docs/getting-started/install-virtual-machine/
# https://tinkerpop.apache.org/docs/current/tutorials/getting-started/
# --
# https://tinkerpop.apache.org/download.html
# https://www.gremlin.com/docs/getting-started/installing-gremlin/
#   https://www.hackerxone.com/2022/01/16/step-by-step-guide-to-install-use-gremlin-on-ubuntu-20-04-lts/
# }}}
# [####] Apache TinkerPop {{{
#   https://tinkerpop.apache.org/gremlin.html
# https://dlcdn.apache.org/tinkerpop/3.6.2/apache-tinkerpop-gremlin-server-3.6.2-bin.zip
# https://dlcdn.apache.org/tinkerpop/3.6.2/apache-tinkerpop-gremlin-console-3.6.2-bin.zip
# ~/./apache-tinkerpop-gremlin-server-3.6.2/bin/gremlin-server.sh start
# ~/./apache-tinkerpop-gremlin-console-3.6.2/bin/gremlin.sh
# --
# }}}
# Orient DB **** {{{
# 'Requires Oracle Java 8'
#   https://orientdb.org/download
#   https://repo1.maven.org/maven2/com/orientechnologies/orientdb-tp3/3.2.17/orientdb-tp3-3.2.17.tar.gz
#   https://repo1.maven.org/maven2/com/orientechnologies/orientdb-community/3.2.17/orientdb-community-3.2.17.tar.gz
# +Run with:
# ~/./orientdb-tp3-3.2.17/bin/server.sh
# ~/./orientdb-tp3-3.2.17/bin/console.sh
# }}}
# Titan Db {{{
#   http://titan.thinkaurelius.com/
# }}}
# Apache Cassandra {{{
#   https://cassandra.apache.org/_/index.html
# https://cassandra.apache.org/_/download.html
# }}}
# Apache Giraph {{{
#   https://www.apache.org/dyn/closer.cgi/giraph/
# }}}
# TODO Apache Spark (+Hadoop(??)) {{{
#   https://spark.apache.org/downloads.html
# wget https://dlcdn.apache.org/spark/spark-3.3.2/spark-3.3.2-bin-hadoop3.tgz
# tar -xvzf spark-3.3.2-bin-hadoop3.tgz
# spark-shell

# Spark context Web UI available at http://bluelegend-bt.lan:4040
# Spark context available as 'sc' (master = local[*], app id = local-1680299495557).
# Spark session available as 'spark'.

#   https://www.apache.org/dyn/closer.lua/spark/spark-3.3.2/spark-3.3.2-bin-hadoop3.tgz
# }}}

# <¤¤> [####] LFE {{{
# wget https://github.com/lfe/lfe/archive/2.1.1.zip
# unzip 2.1.1.zip

# or: Clone down with git (+make install(??))
# }}}
# ¤¤ texinfo {{{
#   compile with 'texi2dvi4a2ps'  #=in 'a2ps' package
# }}}
# ¤¤! newlisp (*) {{{
#   http://www.newlisp.org/downloads/newlisp-10.7.5/
# wget http://www.newlisp.org/downloads/newlisp-10.7.5.tgz
# tar -xvzf ~/newlisp-10.7.5.tgz
#   http://www.newlisp.org/downloads/newlisp-10.7.5/doc/INSTALL
# In base-dir:  README.txt
# make
# sudo make install

#   http://www.newlisp.org/newLISP_in_21_minutes.html
# NewLisp: Build Gui Apps
#   gs:xxxxx  (='graphical server')
#   https://www.scribd.com/document/209907064/newLISP-Gui-Server
#       https://www.youtube.com/watch?v=MnCRloRcRHE
#   http://www.newlisp.org/guiserver/guiserver_frame.html
# http://www.newlisp.org/index.cgi?Downloads
#     http://www.newlisp.org/downloads/CodePatterns.html
# VisualNeo
#     http://www.newlisp.org/index.cgi?page=IDE
# }}}
# ==== TODO: mozart system / oz language {{{
# https://github.com/mozart/mozart  #=build + install Mozart 1
#  https://www.tutorialspoint.com/compile_mozart-oz_online.php
#  https://www.jdoodle.com/compile-oz-mozart-online/
# http://mozart2.org/
# TODO https://github.com/mozart/mozart2#downloads
# sudo apt-get install subversion libboost-all-dev / libbost-dev
# sudo apt-get install tcl8.6-dev tk8.6-dev

# http://mozart2.org/documentation/
#   https://en.wikipedia.org/wiki/Oz_%28programming_language%29
# }}}
# **(?) ---- install intellij idea / Rider {{{
# snap install rider --classic
# wget https://download.jetbrains.com/idea/ideaIU-2023.2.2.tar.gz
# sudo tar -xvzf ideaIC-2023.2.2.tar.gz -C /opt
# cd /opt/ideaIC-2023.2.2.tar.gz/bin/; sudo ./bin/idea.sh
# =Change to better Name + Dir
# }}}
# sudo snap install node --classic --channel=21
# sudo apt update && sudo apt install -y dotnet-sdk-8.0
#   npm init -y
#   npm install -D tailwind
#   npx tailwindcss init
#   i Highscore.Web:
#   npm install
#   npm run css:build
#   npm run css:watch  # +plugin: npm task runner
#   "scripts": {
#     "css:build": "npx tailwindcss -i ./Styles/site.css -o ./wwwroot/css/site.css --minify",
#     "css:watch": "npx tailwindcss -i ./Styles/site.css -o ./wwwroot/css/site.css --minify --watch"  #start in terminal + have running during dev
#   }
# [+TODO =Format qml-tut 'rsc/phone-Doks'  qt/qml (+webdev) Ubuntu (****) {{{
#  https://askubuntu.com/questions/236430/what-are-some-good-developer-resources-for-qml-qt-quick
#  https://phone.docs.ubuntu.com/en/apps/qml/tutorials-building-your-first-qml-app
#  https://askubuntu.com/questions/277303/can-i-develop-a-2d-game-with-just-qml
#  https://qml.guide/getting-started-with-qml/
#  https://www.qt.io/ubuntu-built-with-qt
#  https://snapcraft.io/qmlcreator  ****
# https://www.apriorit.com/dev-blog/475-qt-qml-with-cmake
# https://itnext.io/developing-web-apps-using-qml-and-qt-for-webassembly-aa84453f2f61
#  https://www.qt.io/qt-examples-for-webassembly
# https://mimecar.gitbook.io/qt-course/en/chapter-03-webapp
#  https://itnext.io/top-five-libraries-for-creating-gui-on-embedded-linux-5ce03903be32
#    https://www.qt.io/product/ui-design-tools
#    https://www.qt.io/download
#    https://www.qt.io/product
#    https://www.qt.io/product/ui-design-tools
#    search: install qt studio ubuntu
# https://stackoverflow.com/questions/48147356/install-qt-on-ubuntu
#  https://doc.qt.io/qt-6/linux.html
# https://www.linux-magazine.com/Issues/2018/211/Like-Qlockwork
# https://www.qt.io/blog/introduction-to-the-qml-cmake-api
# https://blog.felgo.com/develop-qt-quick-apps-with-visual-studio-code-qml-extension
#  https://doc.qt.io/qt-6/gettingstarted.html
#  https://doc.qt.io/qtdesignstudio/studio-installation.html
# }}}
sudo pacman -S haxe
# ((¤¤)) install haxe + neko ubuntu {{{
# ! sudo add-apt-repository ppa:haxe/releases -y
# ! sudo apt-get update
# ! sudo apt-get install haxe -y
# ! mkdir ~/haxelib && haxelib setup ~/haxelib
# ((+install neko))
# }}}
# install Urweb
# *(*) Greensock/GSAP {{{
#   https://greensock.com/docs/v3/Installation
# <script src="/[YOUR_DIRECTORY]/gsap.min.js"></script>
# <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.11.5/gsap.min.js"></script>
# }}}
# install nim ubuntu -- {{{
# sudo apt install build-essential
# curl https://nim-lang.org/choosenim/init.sh -sSf | sh
# (+add nim path to PATH)
# nim -v  #=applying the changes
# }}}
# ((¤)) *(*) install Julia ubuntu(!) {{{
# wget https://julialang-s3.julialang.org/bin/linux/x64/1.8/julia-1.8.5-linux-x86_64.tar.gz
# tar zxvf julia-1.8.5-linux-x86_64.tar.gz
# bashrc: export PATH="$PATH:/home/bluelegend/julia-1.8.5/

# julia   #=running the julia repl
# }}}
# (??) .(homebrew ubuntu) {{{
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
#   https://www.digitalocean.com/community/tutorials/how-to-install-and-use-homebrew-on-linux
#   https://github.com/Homebrew/brew
#   https://docs.brew.sh/Homebrew-on-Linux
#   https://www.makeuseof.com/install-homebrew-on-linux/
# }}}
# (??) install Unity, Unreal Engine, Godot, Phaser
# ¤ [*] install eclipse/netbeans ubuntu
# Install R Studio (etc) Ubuntu {{{
# r-base **
#   https://github.com/search?q=topic%3Ar+org%3Arstudio+fork%3Atrue&type=repositories

# https://linuxconfig.org/how-to-install-rstudio-on-ubuntu-22-04-jammy-jellyfish-linux [!!]
#  https://itslinuxfoss.com/install-r-rstudio-ubuntu-22-04/

# (+Installing rstudio from source(??))
# https://github.com/rstudio/rstudio
# }}}
# <¤> install Rust Ubuntu {{{
#       https://www.digitalocean.com/community/tutorials/install-rust-on-ubuntu-linux
#   curl --proto '=https' --tlsv1.3 https://sh.rustup.rs -sSf | sh
#   (+choose 'option 1')
#   + Add $HOME/.cargo/env to PATH
#   verify installation with 'rustc --version'
#   sudo apt update && sudo apt upgrade
#   sudo apt install build-essential
# .  +'hello world': {{{

# mkdir ~/projs/rust
# cd ~/projs/rust
# mkdir testdir
# cd testdir
# 
# gvim test.rs
# 
# fn main() {
#   println!("Congratulations! Your Rust program works.");
# }
# 
# rustc test.rs
# ./test

#}}}
#
#+good idea to update regularly:
#rustup update
#
#remove rust from your system:
#rustup self uninstall
#
# }}}
# ** install octave ubuntu
sudo pacman -S swi-prolog
# (¤¤) (??) install prolog ubuntu {{{
# sudo apt-add-repository ppa:swi-prolog/stable
# sudo apt-get update
# sudo apt-get install swi-prolog
# 
# https://www.swi-prolog.org/
# https://swish.swi-prolog.org/
# https://dev.swi-prolog.org/wasm/shell
#   https://us.swi-prolog.org/build/PPA.html
#   android =Termux: swi-prolog
# }}}
# *(???) install Mercury ubuntu {{{
# https://dl.mercurylang.org/deb/ ***** ___SEEMORE
# .m
# mmc


# sudo apt install wget ca-certificates
# cd /tmp
# wget https://paul.bone.id.au/paul.asc
# sudo cp paul.asc /etc/apt/trusted.gpg.d/paulbone.asc
#### [jammy =Ub. 22.04]
# sudo echo "deb http://dl.mercurylang.org/deb/ jammy main\ndeb-src http://dl.mercurylang.org/deb/ jammy main >> /etc/apt/sources.list.d/mercury.list
#### +Ubuntu (and derivatives) must have the universe repository enabled.
# sudo apt update
# sudo apt install mercury-recommended
#  sudo apt install mercury-examples

# sudo apt-get install flex bison
#  http://dl.mercurylang.org/release/mercury-srcdist-22.01.5.tar.gz
# sh configure
# make
# make install
# }}}

