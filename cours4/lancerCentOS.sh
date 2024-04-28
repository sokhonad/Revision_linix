docker pull centos

docker run -it centos
 
cd /etc/yum.repos.d/

sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
yum update -y
 
yum install postgresql-server postgresql-contrib

su - postgres
 
initdb -D /var/lib/pgsql/data
 
pg_ctl start
 
psql
