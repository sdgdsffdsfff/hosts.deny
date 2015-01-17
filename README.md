# 恶意IP黑名单: host.deny

> 出现以下情况，加入黑名单

0. 在不可能地区IP频繁尝试登陆服务器或有对服务器进行恶意扫描行为；
0. 对网站尝试恶意SQL注入或其他渗透；
0. 入侵网站或者服务器进行破坏行为；

> 使用

    # 下载，解压， 执行
    wget https://github.com/mruse/hosts.deny/archive/master.zip
    unzip master.zip
    cd hosts.deny-master
    bash -x hosts.deny
    
    # Nginx配置文件中 加入 deny.sh 中 WEB_DENY 配置路径，如：
    server
    {
        ...
        include vhosts/acces-deny.inc;
        ...
    }
    # 重启Nginx，或重载Nginx配置文件
    /etc/init.d/nginx {restart|reload}
