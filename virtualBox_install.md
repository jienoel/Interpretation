#Ubuntu12.04安装VirtualBox


* 1、终端命令 编辑sources.list
	
        $ sudo gedit /etc/apt/sources.list

* 2、添加 软件源

     将下面的地址加入sources.list 的末尾，保存并退出

	deb http://download.virtualbox.org/virtualbox/debian precise contrib

【说明：上面这段要添加的代码中倒数第二个单词要根据情况而变：在本文例子中，由于我的系统是 Ubuntu 12.04 LTS 版，其版本代号为“Precise Pangolin”，故下载的软件包为“virtualbox-4.3_4.3.4-81684~Ubuntu~precise_i386.deb”，所以上面的代码中的倒数第二个单词为“precise”。如果是 Ubunttu 12.10 系统，那么应该下载的软件包名为  virtualbox-4.3_4.3.4-81684~Ubuntu~quantal_i386.deb，那么上面那个单词应该改为“quantal”。】    


* 3、终端命令 导入公钥，并更新源(一定要更新，不然即使安装了VirtualBox也无法使用)

	$ wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -

	$ sudo apt-get update

* 4、正式安装(提供三种方法进行安装)

      -方法一：终端命令安装（4.3是当前最新版本）
	
          $ sudo apt-get install virtualbox-4.3

      -方法二：直接安装

           a. 先去官网(http://www.virtualbox.org)下载对应的 VitrualBox ，本文以virtualbox-4.3_4.3.4-81684~Ubuntu~precise_i386.deb 为例。

           b. 直接在 VirtualBox 安装包上右击鼠标，选择“使用 Ubuntu 软件中心打开”，然后在弹出的 Ubuntu 软件中心界面点击“安装”按钮，等待安装结束。

      -方法三：命令行直接安装
        
             打开终端，进入 VirtualBox 安装包所在的路径，如我的安装包放在桌面上，就输入

                 & cd 桌面

             回车，就进入“桌面”这个路径了。然后输入以下代码进行安装：

                 $ sudo dpkg -i virtualbox-4.2_4.2.4-81684~Ubuntu~precise_i386.deb

             或

                  $ sudo dpkg --install virtualbox-4.2_4.2.4-81684~Ubuntu~precise_i386.deb

                回车，输入密码后，等待安装结束

* 5、将当前用户添加到 用户组vboxusers，以支持usb. 注：添加完成后要注销后重新登录才会生效

	$ sudo usermod -a -G vboxusers 当前用户名

* 6、安装 VirtualBox扩展包，以支持USB2.0等 ,版本要与VirtualBox一致。

      去[官网][3]下载 VirtualBox 4.1.20 Oracle VM VirtualBox Extension Pack  （4.1.20是当前最新版本号）. 双击安装即可。

* [virtualBox用户手册][4]


####[参考网站一][1]、[参考网站二][2]


[1]: http://my.oschina.net/scorpius/blog/68289
[2]: http://wuyongzhiyi.blog.51cto.com/4461300/1049644
[3]: https://www.virtualbox.org/wiki/Downloads
[4]: http://dlc.sun.com.edgesuite.net/virtualbox/4.3.4/UserManual.pdf
