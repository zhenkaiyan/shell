ע��1��һ���ļ��������Ƿ�������ip���ű����Ǵӹ��������
���� ����
#for i in $(cat 1);do ssh $i "su - admin -c \"ssh-keygen -t rsa -P '' -f /home/admin/.ssh/id_rsa\"";done
��Դ��������Կ������Ŀ������
#for i in $(cat 1);do scp $i:/home/admin/.ssh/id_rsa.pub . && scp id_rsa.pub 10.128.240.47:/tmp ;ssh 10.128.240.47 "su - performance -c \"cat /tmp/id_rsa.pub>>/home/performance/.ssh/authorized_keys\"";done

�鿴�������Ƿ�����Կ
f=/tmp/1
for i in $(cat $f)
        do
                ssh $i "su - admin -c\"if [ ! -f .ssh/id_rsa.pub ]; then echo $i;fi;\""
        done
