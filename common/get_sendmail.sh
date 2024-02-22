#!/bin/bash

if ${IS_ARM}; then
    wget https://github.com/mailhog/mhsendmail/releases/download/v0.2.0/mhsendmail_linux_arm
    chmod +x mhsendmail_linux_arm
    mv mhsendmail_linux_arm /usr/local/bin/mhsendmail
else
    wget https://github.com/mailhog/mhsendmail/releases/download/v0.2.0/mhsendmail_linux_amd64 #amd64 = x86_64
    chmod +x mhsendmail_linux_amd64
    mv mhsendmail_linux_amd64 /usr/local/bin/mhsendmail
fi
