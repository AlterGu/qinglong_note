[安装青龙的一些依赖](https://github.com/AlterGu/qinglong_note/blob/main/install_dep_ql)


青龙白屏, 原因是cdn.jsdelivr.net无法访问.
解决办法:
> 1. 执行以下命令
```shell
docker exec -it ql /bin/bash -c "sed -i 's#cdn.jsdelivr.net#fastly.jsdelivr.net#g' /qldist/index.html"
```

或者

> 2. 替换文件
```shell
docker exec -it ql /bin/bash -c "curl -sL --connect-timeout 3 https://pd.zwc365.com/https://raw.githubusercontent.com/AlterGu/qinglong_note/main/index.html > /ql/dist/index.html"
```
