#! /bin/bash
#This bash script installs rog-core and relative programs

#download version 5.12 of kernel
cd ~ && mkdir LinuxKernel && cd ./LinuxKernel
wget https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.12/amd64/linux-headers-5.12.0-051200-generic_5.12.0-051200.202104252130_amd64.deb
wget https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.12/amd64/linux-headers-5.12.0-051200-lowlatency_5.12.0-051200.202104252130_amd64.deb
wget https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.12/amd64/linux-headers-5.12.0-051200_5.12.0-051200.202104252130_all.deb
wget https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.12/amd64/linux-image-unsigned-5.12.0-051200-generic_5.12.0-051200.202104252130_amd64.deb
wget https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.12/amd64/linux-image-unsigned-5.12.0-051200-lowlatency_5.12.0-051200.202104252130_amd64.deb
wget https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.12/amd64/linux-modules-5.12.0-051200-generic_5.12.0-051200.202104252130_amd64.deb
wget https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.12/amd64/linux-modules-5.12.0-051200-lowlatency_5.12.0-051200.202104252130_amd64.deb
sudo dpkg -i *.deb			#install
sudo apt-get --fix-broken install	#repair

#delete installation package
rm -rf *.deb
cd .. && rmdir ./LinuxKernel

#Reboot and press F2 to enter the BIOS interface while booting
#Deactivate Secure Boot and press F10 to save and reset
#Select linux 5.12 -051200-generic in boot manager while booting
echo "Reboot and press F2 to enter the BIOS interface while booting"
echo "Deactivate Secure Boot and press F10 to save and reset"
echo "Select linux 5.12 -051200-generic in boot manager while booting"
echo "If you've taken it in mind or take a picture of it"
echo "[Press anything to continue]"
read nouse
sudo reboot

#upgrade and install dependency package
sudo apt update
sudo apt upgrade
sudo apt install rustc cargo make
sudo apt install libusb-1.0-0-dev
sudo apt install libdbus-1-dev
sudo apt install llvm libclang-dev

#install rog-core
sudo add-apt-repository ppa:lukedjones/rog-core
sudo apt update
sudo apt install rog-core

#set to boot start and start
systemctl enable rog-core
systemctl start rog-core
echo "use \"rog-core --help\" to find help documentation"
echo "use \"rog-core -f silent\" to slow down the fan"

#install system76-power to select integrated GPU or NVIDIA
sudo apt-add-repository ppa:system76-dev/stable
sudo apt update
sudo apt install system76-power
echo "use \"sudo system76-power graphics integrated\" to use integrated GPU only"

