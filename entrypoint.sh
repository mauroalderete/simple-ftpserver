#!/bin/sh

# 1. Read environment variables (with safe defaults)
USER_NAME=${FTP_USER:-guest}
USER_PASS=${FTP_PASS:-1234560}

echo "--> Configuring FTP for user: $USER_NAME"

# 2. Create user if it does not exist
if ! id "$USER_NAME" >/dev/null 2>&1; then
    # Create user (-D = no password, -h = home dir, -s = shell)
    adduser -D -h "/home/$USER_NAME" -s /bin/sh "$USER_NAME"
    
    # Set password
    echo "$USER_NAME:$USER_PASS" | chpasswd
    
    # Create necessary folders and set permissions
    mkdir -p "/home/$USER_NAME"
    chown -R "$USER_NAME:$USER_NAME" "/home/$USER_NAME"
    
    echo "--> User $USER_NAME created successfully."
else
    echo "--> User $USER_NAME already exists."
fi

# 3. Run vsftpd
# Use 'exec' so that vsftpd takes PID 1 (important for Docker signals)
echo "--> Starting vsftpd..."
exec /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
