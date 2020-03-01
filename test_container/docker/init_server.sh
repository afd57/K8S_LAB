cd /mongodb-linux-x86_64-ubuntu1604-4.2.3/bin
nohup ./mongod 2>/dev/null &

cd ./../../redis-5.0.7
nohup src/redis-server 2>/dev/null &

cd /

python3.8 create_data.py

