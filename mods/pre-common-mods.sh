#!/bin/bash
mv -fv "$ROOT_DIR/sbin/secure_upgrade.sh" "$ROOT_DIR/sbin/secure_upgrade-original.sh"
# Remove urx800 mib files
rm -fv "$ROOT_DIR/etc/mibs/urx800_"*".ini"

if ls packages/remove/*.list &>/dev/null; then
	for LIST in packages/remove/*.list; do
		echo "Removing files from '$LIST'"
		while IFS= read -r FILE; do
			rm -fv "$ROOT_DIR/$FILE" || true
		done < <(grep -v '/$' "$LIST")

		while IFS= read -r DIR; do
			DIR="$ROOT_DIR/$DIR"
			CONTENTS=$(find "$DIR" -mindepth 1 -maxdepth 1 2>/dev/null)
			if [ -z "$CONTENTS" ]; then
				rmdir -v "$DIR" || true
			fi
		done < <(grep '/$' "$LIST" | sort -r -V)
	done
fi
