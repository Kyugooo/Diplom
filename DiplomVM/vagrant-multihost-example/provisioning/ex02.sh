#!/bin/bash

useradd -m limited
echo "limited:letmein" | chpasswd

chmod -s /usr/bin/sudo

usermod -aG sudo limited

# Копируем SSH-ключ в root
mkdir -p /root/.ssh
cp /vagrant/provisioning/keys/id_rsa_user4 /root/.ssh/id_rsa
chmod 600 /root/.ssh/id_rsa
chown root:root /root/.ssh/id_rsa

# Подсказка в директориях: "получирут"
cd /home/limited
mkdir -p projects old_logs library userspace changelog include reports utils tempdata

# README с намёком
cat <<EOF > /home/limited/README.txt
Ты находишься под ограниченной учёткой.

📂 Чтобы просмотреть содержимое:
    ls

🔠 А если ты читаешь первые буквы директорий... может, они образуют команду?
EOF

chown -R limited:limited /home/limited
chmod 644 /home/limited/README.txt
