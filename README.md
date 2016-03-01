<h1>MantOS - Network Investigator’s Forensic Toolkit</h1>
<img class="wp-image-5704 size-medium alignleft" src="http://lifars.com/wp-content/uploads/2016/02/MantOS-Logo-300x200.jpg" alt="Network Investigator’s Forensic Toolkit | LIFARS" width="300" height="200" />

&nbsp;

&nbsp;

&nbsp;

&nbsp;

&nbsp;
<h2></h2>
<h2>Table of Contents</h2>
<div id="user-content-toc"></div>
<h2>What is MantOS</h2>
MantOS is a GNU/Linux network security focused distro based on <a href="https://github.com/mrgreen3/archbang">Archbang</a>.

We aim to provide the tools you need to analyze potential threats while being minimal.
<h3>Key features:</h3>
<ul>
	<li><span style="color: black;">Graphically analyze TCP dump files for time, size, segments, and throughput</span></li>
	<li><span style="color: black;">Create forensic images (bit by bit copies), complete disk wipe, data recovery (this might be ddrescue, which we already have), benchmarking harddrive performance</span></li>
	<li><span style="color: black;">Dump RAM contents to disk (cold boot attack)</span></li>
	<li><span style="color: black;">MITM-like functionality for intercepting network LAN data</span></li>
	<li><span style="color: black;"> </span><span style="color: black;">Analyze network protocols</span></li>
	<li><span style="color: black;"> </span><span style="color: black;">Wireless network detector, sniffer, instrusion detector</span></li>
	<li><span style="color: black;"> </span><span style="color: black;">Identify TCP connections and records traffic, can also decrypt the connection and identify the applications being used</span></li>
	<li><span style="color: black;"> </span><span style="color: black;">Track tcp streams across network users</span></li>
	<li><span style="color: black;"> </span><span style="color: black;">Track network performance through stack, protocol capture, spike tracking, and determine if there's been a compromise</span></li>
	<li><span style="color: black;"> </span><span style="color: black;">Snoop network traffic for telnet sessions</span></li>
	<li><span style="color: black;"> </span><span style="color: black;">Capture raw data and reconstruct the contents for web and email usage.</span></li>
	<li><span style="color: black;"> </span><span style="color: black;">Monitor wired and Wi-Fi sources for insecure requests</span></li>
	<li><span style="color: black;"> </span><span style="color: black;">Track VoIP calls and dump the conversations</span></li>
</ul>
<h3><span style="color: black;">Lightweight package</span></h3>
<span style="color: black;"> </span>

<span style="color: black;">MantOS is both tiny and undemanding. Our goal was to allow investigators to carry MantOS around with them everywhere they go. This meant being convenient enough to meet the needs of someone who works on many different machines. Total installation size is around 3 Gigabytes and takes a short amount of time to install. Since MantOS is easy on system resources you can even use it on older machines. MantOS can be deployed via live CD, flashdrive, or full OS installation.</span>

<span style="color: black;"> </span>
<h3><span style="color: black;">Gratis and F/OSS</span></h3>
<span style="color: black;"> </span>

<span style="color: black;">MantOS is free in both senses of the word. There is no charge for the distribution, just download it and go. Want to customize your MantOS installation? We provide the very code base we use to you, hassle free and also of no charge. Why do we do this? Because we believe in a forensic community that builds together. Help us make MantOS the best solution it could possibly be.</span>

<span style="color: black;"> </span>
<h3><span style="color: black;">High end and fast support </span></h3>
<span style="color: black;"> </span>

<span style="color: black;">The MantOS team here at LIFARS can provide full enterprise level support and response. Our team is here is listen to your needs and wants, including adding device or tool support or giving instructions on deployment or response. 24x7 support calling is possible in our Premier Support to ensure your team is able to respond any time of day.</span>

<span style="color: black;"> </span>
<h2>Prerequisites</h2>
<ul>
	<li>Must be on an Arch GNU/Linux system
<ul>
	<li>Note, this will not build correctly on Manjaro</li>
	<li>For best results build on either pure Arch, ArchBang, or MantOS</li>
</ul>
</li>
	<li>Must be root or a sudoer</li>
	<li>archiso
<ul>
	<li><code>$ sudo pacman -S archiso</code></li>
</ul>
</li>
	<li>git
<ul>
	<li><code>$ sudo pacman -S git</code></li>
</ul>
</li>
</ul>
<h2>Requirements</h2>
<h3>Set up your system</h3>
<ul>
	<li>Update your pacman key rings.
<ul>
	<li><code>$ sudo pacman-key --init</code></li>
	<li><code>$ sudo pacman-key --populate</code></li>
</ul>
</li>
	<li>If you're running on a fresh install of Arch / Archbang, you must first sync your system with the online package repositories.
<ul>
	<li><code>$ sudo pacman -Syyu</code></li>
</ul>
</li>
</ul>
<h2>Installation</h2>
<h3><a id="user-content-initial-steps" class="anchor" href="https://github.com/Lifars/MantOS#initial-steps"></a>Initial Steps</h3>
<ul>
	<li>cd into your home directory
<ul>
	<li><code>$ cd ~</code></li>
</ul>
</li>
	<li>Clone the repository
<ul>
	<li><code>$ git clone https://github.com/mbStavola/MantOS.git</code></li>
</ul>
</li>
	<li>Change branches (if for some reason you cloned master)
<ul>
	<li><code>$ git checkout mantos-ab</code></li>
</ul>
</li>
	<li>Create a backup directory
<ul>
	<li><code>$ mkdir ~/MantOS/backup</code></li>
</ul>
</li>
</ul>
<h3><a id="user-content-build-steps" class="anchor" href="https://github.com/Lifars/MantOS#build-steps"></a>Build steps</h3>
<ul>
	<li>cd into the MantOS directory
<ul>
	<li><code>$ cd ~/MantOS/</code></li>
</ul>
</li>
	<li>Run the build script
<ul>
	<li><code>$ sudo ./build -v</code></li>
</ul>
</li>
	<li>Move your iso from out/ to backup/
<ul>
	<li><code>$ mv ./out/*.iso ./backup</code></li>
</ul>
</li>
	<li>Run the clean script
<ul>
	<li><code>$ sudo ./clean</code></li>
</ul>
</li>
</ul>
<h2>Using MantOS</h2>
<ul>
	<li><code>decode -l</code>
<ul>
	<li>This will list all available decoders alongside basic information about them</li>
</ul>
</li>
	<li><code>decode -h</code>
<ul>
	<li>Show generic command-line flags available to most decoders</li>
</ul>
</li>
	<li><code>decode -d &lt;decoder&gt;</code>
<ul>
	<li>Display information about a decoder, including available command-line flags</li>
</ul>
</li>
	<li><code>decode -d &lt;decoder&gt; &lt;pcap&gt;</code></li>
</ul>
<h2>Using MantOS</h2>
<h3>Adding packages</h3>
Adding packages to MantOS is pretty simple.

First we must find out <strong>what</strong> we want to add. This part is pure research and rests on your shoulders. Exercise your Google-fu and leverage your personal experience, but don't be afraid to create an issue if you are questioning the usefulness of a particular package to the OS.

Next we look to see <strong>where</strong> we can find the package. Currently, MantOS supports these repos out of the box:
<ul>
	<li>Official Arch repositories</li>
	<li>Official BlackArch repositories</li>
	<li>Arch User repositories</li>
</ul>
After that we can consults this incredibly simple chart on <strong>how</strong> to add your package to the repo:
<table>
<thead>
<tr>
<th align="center">Repo</th>
<th align="center">File</th>
</tr>
</thead>
<tbody>
<tr>
<td align="center">Arch, BlackArch</td>
<td align="center">packages</td>
</tr>
<tr>
<td align="center">AUR</td>
<td align="center">aur_packages</td>
</tr>
<tr>
<td align="center">Other</td>
<td align="center">customize_airootfs</td>
</tr>
</tbody>
</table>
For Arch, BlackArch, and AUR packages, simply add the name of that package (as it is lised in that particular repo) to the appopriate flat file in the root directory of MantOS. Packages are organized by type, so please try to abide by the categories.

For packages <strong>not</strong> found in these repositories, unfortunately you will have to build from source. Here are some directions on how to do so:
<ul>
	<li>Look at the official documentation and browse user forums for how to go about doing so for each package</li>
	<li>BEFORE adding it to the repo, try to build it on your own machine first!
<ul>
	<li>While there are occasions you can build on your machine but not the iso, it's actually still more helpful than trying to add it to the iso directly. This way you have a clear idea of the steps that you need to take and that actually work. Usually it's a few simple modifications to get it running on the iso.</li>
</ul>
</li>
	<li>There are two ways to build from source:
<ul>
	<li>Make a PKGBUILD
<ul>
	<li>PKGBUILD's are simply metadata about a package and how to actually set it up on a machine
<ul>
	<li>Basically, you are setting BASH variables and defining the body of two functions</li>
</ul>
</li>
	<li>Most of this information is self explanatory, and you can get everything from the developer's site or the package's wiki</li>
	<li>Example PKGBUILD: <a href="http://ix.io/66p">http://ix.io/66p</a></li>
</ul>
</li>
	<li>Build it in the customize script
<ul>
	<li>This requires you to download the package (and/or it's required files) and store it in the temporary directory</li>
	<li>This directory is MantOS/airootfs/etc/skel</li>
	<li>When the customize script is run, skel actually becomes the root user's home directory, keep this in mind when working in relation to other directories</li>
	<li>In the customize script, follow the developer (or your own) build instructions and work out of /root/
<ul>
	<li><code>chmod 755 /root/xampp-linux-*-installer.run</code></li>
	<li><code>echo "Y" | /root/xampp-linux-*-installer.run --mode text</code></li>
	<li><code>rm /root/xampp-linux-*-installer.run</code></li>
</ul>
</li>
</ul>
</li>
</ul>
</li>
</ul>
<h3>Configuring Packages</h3>
After a package is put into the iso, there is a good chance you might want to configure it.This is done by working through skel/ and the customize script:
<ul>
	<li><code># Provide dshell with GeoIP data</code></li>
	<li><code>mv /root/*.dat ./share/GeoIP/</code></li>
</ul>
<h2>Bugs and Support</h2>
<h2>MantOS Galery</h2>
&nbsp;
<h2><a id="user-content-additional-reading" class="anchor" href="https://github.com/Lifars/MantOS#additional-reading"></a>Additional Reading</h2>
<ul>
	<li><a href="https://wiki.archlinux.org/index.php/Archiso">https://wiki.archlinux.org/index.php/Archiso</a></li>
	<li><a href="https://wiki.archlinux.org/index.php/Creating_packages">https://wiki.archlinux.org/index.php/Creating_packages</a></li>
	<li><a href="https://wiki.archlinux.org/index.php/PKGBUILD">https://wiki.archlinux.org/index.php/PKGBUILD</a></li>
</ul>
<h2><a id="user-content-licensing-and-copyright" class="anchor" href="https://github.com/google/rekall#licensing-and-copyright"></a>Licensing and Copyright</h2>
<h2><a id="user-content-frequently-asked-questions" class="anchor" href="https://github.com/offensive-security/kali-nethunter#frequently-asked-questions"></a>Frequently Asked Questions [FAQ]</h2>
<strong>Q</strong> - How can I contribute to MantOS?

<strong>A</strong> -

<hr />

<strong>Q</strong> - Where I can find rest of the documentation?

<strong>A</strong> - If you need more detailed information regarding MantOS, contact us at the email address listed below.

<hr />

<strong>Q</strong> - Where can I download MantOS?

<strong>A</strong> - You can download MantOS <a href="https://github.com/Lifars/MantOS/releases" target="_blank">here</a>.

<hr />

<strong>Q</strong> - How can I contact you for more details?

<strong>A</strong> - You can contact us at

<hr />

<strong>Q</strong> - Where can I subscribe to your mailing list to receive more information from Cybersecurity field?

<strong>A</strong> - Feel free to join our mailing list at <a href="https://lifars.com/" target="_blank">LIFARS</a>.
