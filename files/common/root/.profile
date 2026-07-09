alias mtr='/usr/sbin/mtr -b -o "LSRD NBAWVJMX"'

PASSWD_NOTICE_FILE="/ptconf/8311/.password-change-advised"
if [ ! -f "$PASSWD_NOTICE_FILE" ]; then
	echo "SECURITY NOTICE: Change the default root password now with: passwd root"
	echo "SSH password authentication is enabled on port 22."
	if ! mkdir -p /ptconf/8311 2>/dev/null || ! touch "$PASSWD_NOTICE_FILE" 2>/dev/null; then
		echo "WARNING: Could not persist password-change reminder state in /ptconf/8311 (filesystem may be read-only; this notice will repeat on login). Verify mount options and write permissions."
	fi
fi
