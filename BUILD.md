# MantOS GNU/Linux

## Summary

MantOS is a GNU/Linux network security focused distro based on
 [Arch Linux](https://www.archlinux.org/) and [BlackArch](https://blackarch.org/).

We aim to provide the tools you need to analyze potential threats while being
 minimal.

## Building From Source

### Prerequisites

 * Must be on an x86_64 Arch GNU/Linux system
   * Note, this will not build correctly on Manjaro
   * For best results build on either pure Arch, BlackArch or MantOS
 * Must be root
 * archiso
   * ```# pacman -S archiso```
 * git
   * ```# pacman -S git```
 * If using Arch Linux, you should have BlackArch repository configured

### Building

#### Set up your system
 * Update your pacman key rings.
   * ```# pacman-key --init```
   * ```# pacman-key --populate```
 * If you're running on a fresh install of Arch, you must first sync your system
    with the online package repositories. 
   * ```# pacman -Syyu```

#### Initial Steps
 * cd into your home directory
   * ```$ cd ~```
 * Clone the repository
   * ```$ git clone https://github.com/Lifars/MantOS.git```
 * Create a backup directory
   * ```$ mkdir ~/MantOS/backup```

#### Build steps
 * cd into the MantOS directory
   * ```$ cd ~/MantOS/```
 * Run the build script
   * ```# ./build.sh -v```

## Adding packages
Adding packages to MantOS is pretty simple.

First we must find out **what** we want to add. This part is pure research and
 rests on your shoulders. Exercise your Google-fu and leverage your personal
 experience, but don't be afraid to create an issue if you are questioning the
 usefulness of a particular package to the OS.

Next we look to see **where** we can find the package. Currently, MantOS
 supports these repos out of the box:

  * Official Arch repositories
  * Official BlackArch repositories

After that we can consults this incredibly simple chart on **how** to add your
 package to the repo:

| Repo          			   | File       	    |
|:----------------------------:|:------------------:|
| Arch, BlackArch              | packages.x86_64	|

For Arch, BlackArch, simply add the name of that package (as it is lised in that
 particular repo) to the appopriate flat file in the root directory of MantOS.
 Packages are sorted by alphabetical order.

For packages **not** found in these repositories, unfortunately you will have to
 build from source. Here are some directions on how to do so:

 * Look at the official documentation and browse user forums for how to go about
   doing so for each package
 * BEFORE adding it to the repo, try to build it on your own machine first!
   * While there are occasions you can build on your machine but not the iso,
      it's actually still more helpful than trying to add it to the iso directly.
     This way you have a clear idea of the steps that you need to take and that
      actually work.
     Usually it's a few simple modifications to get it running on the iso.
 * There are two ways to build from source:
   * Make a PKGBUILD
     * PKGBUILD's are simply metadata about a package and how to actually set
        it up on a machine
       * Basically, you are setting BASH variables and defining the body of two
          functions
     * Most of this information is self explanatory, and you can get everything
        from the developer's site or the package's wiki
     * Example PKGBUILD: http://ix.io/66p
   * Build it in the customize script
      * This requires you to download the package (and/or it's required files)
         and store it in the temporary directory
      * This directory is MantOS/airootfs/etc/skel
      * When the customize script is run, skel actually becomes the root user's
         home directory, keep this in mind when working in relation to other
         directories
      * In the customize script, follow the developer (or your own) build
         instructions and work out of /root/
		* ```chmod 755 /root/xampp-linux-*-installer.run```
        * ```echo "Y" | /root/xampp-linux-*-installer.run --mode text```
        * ```rm /root/xampp-linux-*-installer.run```

## Configuring Packages
After a package is put into the iso, there is a good chance you might want to
 configure it. This is done by working through skel/ and the customize script:

 * ```# Provide dshell with GeoIP data```
 * ```mv /root/*.dat ./share/GeoIP/```

## Additional Reading

 * https://wiki.archlinux.org/index.php/Archiso
 * https://wiki.archlinux.org/index.php/Creating_packages
 * https://wiki.archlinux.org/index.php/PKGBUILD
