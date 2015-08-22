注：1是一个文件，里面是服务器的ip，脚本都是从管理机操作
生成 密码
#for i in $(cat 1);do ssh $i "su - admin -c \"ssh-keygen -t rsa -P '' -f /home/admin/.ssh/id_rsa\"";done
从源主机将公钥拷贝到目标主机
#for i in $(cat 1);do scp $i:/home/admin/.ssh/id_rsa.pub . && scp id_rsa.pub 10.128.240.47:/tmp ;ssh 10.128.240.47 "su - performance -c \"cat /tmp/id_rsa.pub>>/home/performance/.ssh/authorized_keys\"";done

查看服务器是否有秘钥
f=/tmp/1
for i in $(cat $f)
        do
                ssh $i "su - admin -c\"if [ ! -f .ssh/id_rsa.pub ]; then echo $i;fi;\""
        done
