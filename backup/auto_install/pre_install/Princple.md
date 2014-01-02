# 通过网络自动化安装操作系统

##1、原理
	参考[1][11] [2][12] [3][13]
   PXE Client通过PXE启动后，首先通过DHCP服务器获取IP地址、TFTP服务器的地址和启动文件的名称，然后通过TFTP协议下载启动文件、启动配置文件、安装用的内核与文件系统，最后通过NFS/WEB/FTP服务器获取自动应答和安装文件。


##2、安装环境与要求

##3、服务器端配置

###3.1[DHCP服务][311]
	*安装DHCP服务
		$sudo apt-get	install isc-dhcp-server
        *修改[DHCP配置文件][312]
		$sudo vim /etc/dhcp/dhcpd.conf
	ddns-update-style none;

	option domain-name “example.org”;
	option domain-name-servers ns.example.org;
	default-lease-time 600;
	max-lease-time 7200;

	log-facility local7;
	allow booting;
	allow bootp;

	#tips:网络配置可以根据实际环境进行修改
	subnet 172.20.100.0 netmask 255.255.255.0 {
		range 172.20.100.100 172.20.100.200;
		# option domain-name-servers ns1.internal.example.org;
		# option domain-name "sxkj.com";
		option routers 172.20.100.1;
		option broadcast-address 172.20.100.255;
		default-lease-time 86400;
		max-lease-time 172800;
		filename "pxelinux.0";  #放在TFTP服务的文件夹下启动映像文件。
	#       next-server 172.20.100.1; #TFTP服务器的地址，如果TFTP服务和DHCP服务部署在同一台机器时，可以省略。
	}

	* 指定[监听端口][313]
		sudo vim /etc/default/isc-dhcp-server
			INTERFACES="eth0"
        * 启动DHCP服务
		sudo /etc/init.d/isc-dhcp-server start

###[TFTP服务][321]

	* 安装[TFTP服务][322]
		sudo apt-get install tftpd-hpa

	* 修改TFTP配置文件
		sudo vim /etc/default/tftpd-hpa
		
		# /etc/default/tftpd-hpa
			TFTP_USERNAME=”tftp”
			TFTP_DIRECTORY=”/var/lib/tftpboot”
			TFTP_ADDRESS=”0.0.0.0:69″
			TFTP_OPTIONS=”–secure”

	* 修改tftpboot权限
		chmod 777 /var/lib/tftpboot

	* 启动tftp
		sudo /etc/init.d/tftpd-hpa restart

###[HTTP服务]
* 1.安装web服务，这里以apache为例
安装apache
# apt-get install apache2
启动httpd
# service apache2 start

* 2.在apache服务根目录下创建ubuntu文件夹，并将ubuntu镜像文件挂载到该目录
# mkdir -p /var/www/ubuntu
#mkdir -p /mnt/ubuntu/
# mount -o loop xxx.iso /mnt/ubuntu
#cp –r /mnt/Ubuntu/* /var/www/ubuntu
在浏览器中访问http://服务器ip/ubuntu
可以列出ubuntu目录，配置正常

* 将ubuntu/install目录下的netboot中的所有内容拷贝到tftpboot（下载的netboot，可跳过拷贝步骤）
# cp -r /var/www/ubuntu/install/netboot/* /var/lib/tftpboot/
###[参数脚本]

###[修改配置文件]

[11]:https://help.ubuntu.com/12.04/installation-guide/powerpc/install-methods.html
[12]:https://help.ubuntu.com/12.04/installation-guide/i386/automatic-install.html
[13]:https://help.ubuntu.com/12.04/installation-guide/powerpc/ch05s01.html
[311]:https://help.ubuntu.com/lts/serverguide/dhcp.html
[312]:http://manpages.ubuntu.com/manpages/precise/en/man5/dhcpd.conf.5.html
[313]:https://help.ubuntu.com/community/dhcp3-server
[321]:http://en.wikipedia.org/wiki/Trivial_File_Transfer_Protocol
[322]:http://www.mmweg.rwth-aachen.de/~philipp.michalschik/wordpress/running-tftp-server-on-ubuntu-12-04-lts-precise/
