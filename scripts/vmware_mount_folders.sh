#!/bin/bash
for folder in $(vmware-hgfsclient); do
    echo "[i] Mounting $folder   (/mnt/hgfs/$folder)"
    mkdir -p "/mnt/hgfs/$folder"
    umount -f "/mnt/hgfs/$folder" 2>/dev/null
    vmhgfs-fuse -o allow_other -o auto_unmount ".host:/$folder" "/mnt/hgfs/$folder"
done
