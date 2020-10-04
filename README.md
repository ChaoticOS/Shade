# chaOS Presents
### Shade: An Operating System Customisation Project
[Licensed under **chaOS © 2020**](https://github.com/ChaoticOS/Shade/blob/main/LICENSE)

## Net Installer
 -  It's been a long time since **Aqua Development Started**
 -  Almost after 25 builds, We are able to give you a Stable version
 -  If you found any Bug then create an **[Issue](https://github.com/ChaoticOS/Shade/issues)** and tell us

### Installation Procedure:
 -  Download **Ubuntu Minimal<sup>1</sup>** iso or **Ubuntu Server<sup>2</sup>** iso (Downloads Provided Below)
 -  Don't install any Desktop Environment or Tools while ubuntu installation
 -  Now, After installation completes run your system
 -  Clone Repository using commands

        git clone https://github.com/ChaoticOS/Shade
 -  Open folder

        cd Shade
 -  Run the script

        chmod +x shade.sh
        sudo ./shade.sh
 -  Follow the Procedure at last you will found your os customised as per your choice

<sub><sup>1</sup> Ubuntu 20.04 Minimal Doesn't Support [UEFI](https://help.ubuntu.com/community/Installation/MinimalCD#mini_system_in_UEFI_mode)</sub>

<sub><sup>2</sup> Ubuntu 20.04 Server have some issues with Tasksel and apt repository</sub>

### Compatibility
 -  Ubuntu 20.04 will work completely fine and Tested Completely
 -  Ubuntu Desktop Iso also work fine
 -  Ubuntu 20.04 Server will work fine but have some issues Tasksel and apt
 -  Testing needed to test on different distributions

### Downloads

 -  [Ubuntu 20.04 Minimal Iso](http://archive.ubuntu.com/ubuntu/dists/focal/main/installer-amd64/current/legacy-images/netboot/mini.iso)
 -  [Ubuntu 20.04 Server Iso](https://releases.ubuntu.com/20.04/ubuntu-20.04.1-live-server-amd64.iso)

### Issues
 - Ubuntu 20.04 Minimal Doesn't Support UEFI
 - Ubuntu 20.04 Server work fine sometimes but have some issues with Tasksel and apt repository