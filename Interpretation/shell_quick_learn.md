#shell快速学习指南

* 两种执行Shell脚本的方法

   - 1、用shell程序执行脚本：根据你的shell脚本的类型，选择shell程序，常用的有sh，bash，tcsh等（一般来说第一行#!/bin/bash里面指明了shell类型的，比如#!/bin/bash指明是bash，#!/bin/sh则是sh）；然后输入命令(其中bash为shell的名称，myshell.sh则为你要执行的代码)：

                $ bash myshell.sh

   - 2、直接执行脚本：

        不过首先的加上可执行权限（也许要root权限，4情况而定），执行：

                 $ chmod +x myshell.sh

        然后执行：（前面一定要加上 "./"，否则会出现Command not found 的错误）

                 $ ./myshell.sh     

        就可以执行了。

* shell 变量自增/自减
  
        如果是bash：((i++))或((i--))

                     let COUNTER+=1 或  let COUNTER-=1

                     COUNTER=$[$COUNTER+1] 或 COUNTER=$[$COUNTER-1]

                     COUNTER=$(($COUNTER+1)) 或 COUNTER=$(($COUNTER-1))

        通用sh用let或expr

* [shell自动交互][1]
   
        使用参数进行自动安装与卸载软件

        vim1.sh文件
  
	#！/bin/bash
	#vim1.sh
	#to install or remove software automatically

	#parameters
	ins_rm=$1	#input 2 to install this software otherwise input 2
	pwd=$2          #password for sudo

	case $ins_rm in
	1)echo "install vim"
	#install vim
	echo "$pwd"| sudo -S apt-get -y install vim
	;;
	2)echo "remove vim"
	#remove vim
	echo "$pwd"| sudo -S apt-get -y --purge remove vim
	;;
	esac

	#erase the passwork in the cache
	sudo -k
	
	

* ubuntu用不了root用户:~$ su - root Password: su: Authentication failure怎么办？

        ubuntu的root用户默认是禁止的，需要手动打开才行 

        事实上ubuntu下的所有操作都用不到root用户，由于sudo的合理使用，避免了root用户下误操作而产生的毁灭性问题 

        root账号启用方法：

		执行下面的操作：
		1.先解除root锁定，为root用户设置密码
                  
                  打开终端输入：$sudo passwd

                  Password: <--- 输入你当前用户的密码

                  Enter new UNIX password: <--- 新的Root用户密码

                  Retype new UNIX password: <--- 重复新的Root用户密码

                  passwd：已成功更新密码

                2、更改登陆，允许root登录
                   打开 系统＞系统管理＞登录窗口）

                   点“安全”选项页，选择“允许本地管理员登录”。

                3、注销当前用户，以root登陆

                如果要再次禁用 root 帐号，那么可以执行 sudo passwd -l root。

          从root帐号退出: ctrl + d 或者su [UserName]直接转到那个用户，无须密码

* Visudo命令
	 
            先su 到root用户下通过visudo 来改/etc/sudoers ；（比如我们是以beinan用户登录系统的）

             [beinan@localhost ~] $ su

               Password: 注：在这里输入root密码

           下面运行visudo；

            [root@localhost beinan]# visudo 注：运行visudo 来改 /etc/sudoers（更改都在文件的最后进行）

           加入如下一行，退出保存；退出保存，在这里要会用vi，visudo也是用的vi编辑器；至于vi的用法不多说了；

            visudo后得到的格式为（比如root账户）

               账户名    主机名称=(可切换的身份)    可用的指令                  

                root        ALL=(ALL)                 ALL 

           对于新增的账户就在文件的最下面加上

               beinan   ALL=(root)  ALL

           允许test用sudo命令执行root的所有命令 

           同理对于组使用者也是一个,但是要加上%

              %beinangroup   ALL=(root)  ALL 

           需要注意的是 每次切换 你都需要密码才可以,使用如下命令可以避免输入密码

              beinan   ALL=(root) NOPASSWD: ALL 

          退回到beinan用户下，用exit命令；

             [root@localhost beinan]# exit

              exit

             [beinan@localhost ~] $




[1]: http://www.233.com/linux/fudao/20100902/135818538.html




