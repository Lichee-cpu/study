[TOC]

# 总结

>1. 新建本地仓库
>     git  init
>2. 添加文件到新建的仓库
>    git  add  *
> 3. 添加备注
>     git   commit   -m   "备注内容"
> 4. 切换分支
>    git branch -M 分支名
> 5. 添加远程连接
>    git   remote add 本地仓库名   远程仓库地址
> 6. 提交数据至远程仓库
>    git push -u  本地仓库名   分支名
> 7. 从远程仓库获取数据
>    git  pull  本地仓库名  <分支名>
> 8. 查看本地仓库信息
>    git  status
> 9. 查看本地分支
>     git branch







# Git使用

![推送](https://backlog.com/git-tutorial/cn/img/post/intro/capture_intro3_1_1.png)![Pull](https://backlog.com/git-tutorial/cn/img/post/intro/capture_intro3_3_1.png)



建立一个空数据库,这里我们创建一个名为tutorial的目录。

>```
>$ mkdir tutorial
>$ cd tutorial
>$ git init
>Initialized empty Git repository in /Users/eguchi/Desktop/tutorial/.git/
>```

在tutorial目录创建一个名为myfile.txt的档案

>```
>$ git add myfile.txt
>$ git commit -m "first commit"
>[master (root-commit) a73ae49] first commit
> 1 files changed, 1 insertions(+), 0 deletions(-)
> create mode 100644 myfile.txt
>```

## 1. 建立分支

您可以通过branch命令来创建分支。

```
$ git branch <branchname>
```

创建名为issue1的分支。

```
$ git branch issue1
```

不指定参数直接执行branch命令的话，可以显示分支列表。 前面有*的就是现在的分支。

```
$ git branch
  issue1
* master
```

目前的历史记录是这样的。

## 2. 切换分支

若要在新建的issue1分支进行提交，需要切换到issue1分支。

要执行checkout命令以退出分支。

```
$ git checkout <branch>
```

切换到issue1分支。

```
$ git checkout issue1
Switched to branch 'issue1'
```

## 3. 合并分支

向master分支合并issue1分支的修改。

![目前的历史记录](https://backlog.com/git-tutorial/cn/img/post/stepup/capture_stepup2_3_2.png)

执行merge命令以合并分支。

```
$ git merge <commit>
```

该命令将指定分支导入到HEAD指定的分支。先切换master分支，然后把issue1分支导入到master分支。

```
$ git checkout master
Switched to branch 'master'
```

## 4. 删除分支

既然issue1分支的内容已经顺利地合并到master分支了，现在可以将其删除了。

在branch命令指定-d选项执行，以删除分支。

```
$ git branch -d <branchname>
```

执行以下的命令以删除issue1分支。

```
$ git branch -d issue1
Deleted branch issue1 (was b2b23c4).
```

issue1分支被删除了。您可以用branch命令来确认分支是否已被删除。

```
$ git branch
* master
```