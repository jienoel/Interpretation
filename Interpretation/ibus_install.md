# ibus 安装说明[参考][1]

##参数说明

par：参数

$:  指令

* 第一步：安装 Ibus 框架 

        调出 terminal 终端，输入命令：（输入参数：用户密码）

        $sudo apt-get install ibus ibus-clutter ibus-gtk ibus-gtk3 ibus-qt4

        启动 Ibus 框架，在终端下输入命令：（输入参数：y）

        $im-switch -s ibus 

PS：安装完 Ibus 框架之后，记得重启或者注销系统，要保证更改生效才行哦

 
* 第二步：安装拼音引擎 （做可选参数设置）

        有很多拼音引擎可供选择，一般安装一种就够了

         Ibus 拼音：$sudo apt-get install ibus-pinyin

         Ibus 五笔：$sudo apt-get install ibus-table-wubi

         Google 拼音：$sudo apt-get install ibus-googlepinyin

         Sun 拼音： $sudo apt-get install ibus-sunpinyin

 
* 第三步：设置 Ibus 框架

         在 terminal 中输入命令：$ibus-setup

         执行之后，会自动调出一个 Ibus Preference 设置框,选择 “Input Method”，选择相应的中文输入方式，然后点击 “Add”

         注意：最好是安装什么输入法就 Add 什么输入法 

         这里还可以设置调出相应输入法到快捷键，默认的是 “Ctrl+Space”

* 第四步：找回消失的IBus图标（可选）

        通常情况下，IBus图标（一个小键盘）会出现在桌面右上角的任务栏中。有时候这个图标会自行消失，可使用以下命令，找回消失的IBus图标：

         $ibus-daemon -drx


  
