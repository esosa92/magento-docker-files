adduser -u ${UID} --disabled-password --gecos "" appuser
mkdir /home/appuser/.ssh
echo "StrictHostKeyChecking no" >> /home/appuser/.ssh/config
echo "export COLUMNS=300" >> /home/appuser/.bashrc
chown -R appuser:appuser /home/appuser/
