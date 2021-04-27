# Linux笔记

## 一、简介

Linux命令帮助

```linux
man ls
ls --help
```

Linux系统的发行版本

```linux
cat /etc/issue  #查看当前发行版本
uname -a		#查看当前计算机及操作系统的相关信息
uptime 			#查看当前系统启动了多久
```

Liunx目录分类及说明

|   目录   |   内容   |
|---|---|
|/bin：|**指令目录**系统命令目录;|
|/sbin：|**指令目录**超级命令目录，只能超级管理员可以执行的命令;|
|/boot：|**系统启动**系统目录，类似于Windows中的C盘;|
|/dev ：|**设备 **文件目录，硬盘、光驱、U盘都属于设备文件，/dev/sr0代表光驱设备。注意，次目录下的文件没有办法直接使用，必须先挂载;|
|/etc ：|**系统启动**非常重要，代表系统的配置文件目录。大部分软件安装完成后，其配置文件都存放在此目录;|
|/home：|**账户相关**普通用户的家目录，用户登录后会自动切换到此目录;|
|/root：|**账户相关**超级管理员的家目录，超级管理员登录后会自动切换到此目录;|
|/media：|挂载目录，早期Linux挂载目录，用于挂载光盘以及软盘;|
|/mnt：|挂载目录，用来挂载额外的设备，如 U 盘、移动硬盘和其他操作系统的分区;|
|/opt ：|第三方软件目录，这个目录是放置和安装其他软件的位置，手工安装的源码包软件都可以安装到这个目录中。不过笔者还是习惯把软件放到 /usr/local/ 目录中，也就是说，/usr/local/ 目录也可以用来安装软件;|
|/usr ：|**账户相关**系统程序目录，类似Windows中的Program Files;|
|/proc：|**运行时**虚拟文件系统。该目录中的数据并不保存在硬盘上，而是保存到内存中。主要保存系统的内核、进程、外部设备状态和网络状态等;|
|/tmp ：|**临时文件**临时文件目录，在该目录下，所有用户都可以访问和写入。建议此目录中不能保存重要数据，最好每次开机都把该目录清理;|
|/var ：|经常变化的文件目录，网页文件、数据文件、日志文件;|

文件管理的常用命令

```
touch a.txt 			#创建一个名为a.txt的空文件
ls  					#查看文件是否创建成功
touch -d `date` a.txt 	#修改a.txt最后的修改时间
find *.txt /			#find查找文件
rm 	 *.txt				#删除文件
```

 用户和用户组

```
用户列表文件:/etc/passwd
用户密码对应文件:/etc/passwd
用户组对应文件:/etc/group
```

| 命令     | 说明             |
| -------- | ---------------- |
| useradd  | 添加用户。       |
| usermod  | 修改用户信息。   |
| userdel  | 删除用户。       |
| groupadd | 添加用户组。     |
| groupmod | 修改用户组信息。 |
| groupdel | 删除用户组。     |

切换用户命令: su
查看用户命令:users who w



#### ssh

> ssh -V   #查看SSH 客户端版本
>
> ssh name@remoteserver	#连接到远程主机
>
> ssh name@remoteserver  -p  222	# 连接到指定的端口
>
> ssh -t remoteserver1 ssh remoteserver2		#通过远程主机1跳到远程主机2

#### 进程

>1. echo $$ *#查看父进程的PID*
>2. bash *#启动一个新的进程*
>3. echo $$ *#查看新启动进程的PID（该进程即为子进程）*
>4. echo $PPID  *#查看该子进程的父进程的PID*
>5. pstree $PPID -p
>6. exit *#退出该子进程*
>7. echo $$ *#查看进程的PID，应与和第一行的相同*

##### `ps`

选项说明:
-a 显示所有用户的所有进程。
-x 显示无终端的进程。
-u 显示更多信息，类似于 -f 选项。
-e 显示所有进程。

> ps   -a
>
> pstree 1  # 进程树

#### 磁盘管理

>df 		#将系统内所有的文件系统列出来
>
>df  -h 	#将系统内所有的文件系统以人类易读的方式列出来
>
>df  -a	#将系统内的所有特殊文件格式及名称都列出来
>
>du 		#只列出当前目录下的所有文件夹容量（包括隐藏文件夹)
>
>du -a  	 #将文件的容量也列出来
>
>du -sh *	#列出当前路径下所有的目录和文件容量
>
>lsblk 	#将系统内所有的文件系统列出来
>
>![images20210426200152](https://github.com/Lichee-cpu/images/raw/master/images/images20210426200152.png)
>
>fdisk -l	#查看所有磁盘分区的信息
>
>fdisk /dev/vdb		#输入 m 后选择p为打印该磁盘分区的信息
>
>mkfs -t ext3 /dev/vdc6		#将指定分区和文件系统进行格式化
>
>umount /dev/vdc6		#磁盘挂载与卸除

#### 性能监控

##### `top`

Linux下常用的性能分析工具，能够实时显示系统中各个进程的资源占用状况及总体状况。实时显示系统中各个进程的资源占用状况及总体状况

##### `mpstat`

实时系统监控工具，它会报告与多核心CPU相关的统计信息。

>apt install sysstat -y
>mpstat 1 #每隔一秒输出CPU占用情况

##### 内存监控相关命令

###### `free`命令

![images20210426200819](https://github.com/Lichee-cpu/images/raw/master/images/images20210426200819.png)

>total：物理内存大小，就是机器实际的内存
>used：已使用的内存大小，这个值包括了 cached 和 应用程序实际使用的内存
>free：未被使用的内存大小
>shared：共享内存大小，是进程间通信的一种方式
>buffers：被缓冲区占用的内存大小
>cached：被缓存占用的内存大小

##### `vmstat`

是对系统的整体情况进行统计，包括内核进程、虚拟内存、磁盘、陷阱和 CPU 活动的统计信息。命令格式：vmstat 2 100，其中2表示刷新间隔，100表示输出次数。

![](https://github.com/Lichee-cpu/images/raw/master/images/images20210426201053.png)



> netstat -aup # 输出所有UDP连接状况
> netstat -atp # 输出所有TCP连接状况
> netstat -s # 显示各个协议的网络统计信息
> netstat -i # 显示网卡列表
> netstat -r # 显示路由表信息



