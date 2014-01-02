
[Ubuntu 安装Chrome步骤][1]


* 一、添加PPA

        从Google Linux Repository（http://www.google.com/linuxrepositories/）下载安装Key，或把下面的代码复制进终端，回车，需要管理员密码

        wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

        Key安装好后，在终端输入：

        sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

* 二、更新

        在终端输入：
        sudo apt-get update

* 三、安装

        安装稳定版Chrome，在终端输入：sudo apt-get install google-chrome-stable
        安装Beta版Chrome，在终端输入：sudo apt-get install google-chrome-beta
        安装不稳定版Chrome，在终端输入：sudo apt-get install google-chrome-unstable

[1]: http://www.douban.com/note/252982281/
