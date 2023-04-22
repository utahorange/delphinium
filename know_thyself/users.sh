#!/bin/sh
for user in $(cat /etc/passwd | grep -E "/bin/.*sh" | cut -f1 -d':'); do
    echo $user:'Monkepatriot123!@#' | chpasswd
    chage -M 15 -m 6 -W 7 -I 5 $user;
    rm -rf /home/$user/.ssh;
done
passwd -l root

