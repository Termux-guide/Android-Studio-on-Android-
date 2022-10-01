DISTRO_NAME="Debian with Android Studio" 
TARBALL_URL['aarch64']="https://github.com/termux/proot-distro/releases/download/v1.10.1/debian-aarch64-pd-v1.10.1.tar.xz"
TARBALL_SHA256['aarch64']="f34802fbb300b4d088a638c638683fd2bfc1c03f4b40fa4cb7d2113231401a21"
distro_setup() {
	run_proot_cmd apt update -y
	run_proot_cmd apt install sudo nano default-jdk wget xfce4 xfce4-goodies tigervnc-standalone-server -y 
run_proot_cmd wget https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2021.3.1.16/android-studio-2021.3.1.16-linux.tar.gz
run_proot_cmd mv android-studio-2021.3.1.16-linux.tar.gz /opt
run_proot_cmd cd /opt 
run_proot_cmd tar -xf android-studio-2021.3.1.16-linux.tar.gz
run_proot_cmd cd android-studio
run_proot_cmd cd bin
run_proot_cmd echo "bash /opt/android-studio/bin/studio.sh" >> /bin/android-studio
run_proot_cmd chmod +x /bin/android-studio 
run_proot_cmd echo "vncserver -geometry 1280x720 -xstartup startxfce4" >> /bin/vncstart 
run_proot_cmd chmod +x /bin/vncstart
run_proot_cmd echo "vncserver -kill :1" >> /bin/vncstop
run_proot_cmd chmod +x /bin/vncstop
run_proot_cmd echo ${red} "You can start desktop by using command vncstart"
run_proot_cmd echo ${green} "Starting desktop"
run_proot_cmd vncstart
run_proot_cmd echo ${red} "You can start Android Studio with command android-studio"

}
