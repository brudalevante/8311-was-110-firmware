alias mtr='/usr/sbin/mtr -b -o "LSRD NBAWVJMX"'

PASSWD_NOTICE_FILE="/ptconf/8311/.password-change-advised"
if [ ! -f "$PASSWD_NOTICE_FILE" ]; then
	echo "SECURITY NOTICE: Change the default root password now with: passwd"
	echo "SSH password authentication is enabled on port 22."
	command -v logger >/dev/null 2>&1 && logger -t 8311-security "Password change advisory shown to root at login"
	if ! mkdir -p /ptconf/8311 2>/dev/null || ! touch "$PASSWD_NOTICE_FILE" 2>/dev/null; then
		echo "WARNING: Cannot persist password notice to /ptconf/8311. This notice will appear on each login. Common causes: read-only filesystem or insufficient permissions."
	fi
fi
