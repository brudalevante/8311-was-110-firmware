alias mtr='/usr/sbin/mtr -b -o "LSRD NBAWVJMX"'

PASSWD_NOTICE="/ptconf/8311/.password-change-advised"
if [ ! -f "$PASSWD_NOTICE" ]; then
	echo "SECURITY NOTICE: Change the default/root password now with: passwd root"
	echo "SSH password authentication is enabled on port 22."
	mkdir -p /ptconf/8311 2>/dev/null || true
	touch "$PASSWD_NOTICE" 2>/dev/null || true
fi
