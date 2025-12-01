#!/bin/bash
# ==Download installation scripts from GitHub [Credit to Angristan]==
curl -O https://raw.githubusercontent.com/realizer-vault/OVPN-WG-Installer/master/Etc/openvpn-install.sh
curl -O https://raw.githubusercontent.com/realizer-vault/OVPN-WG-Installer/master/Etc/wireguard-install.sh

# ==Make scripts executable==
chmod +x wireguard-install.sh
chmod +x openvpn-install.sh

# ==Create required directories in /root==
mkdir -p /root/ovpn.sh-for_menu
mkdir -p /root/wg.sh-for_menu
mkdir -p /root/move.sh-for_move_Client_file
mkdir -p /root/OVPN_Client
mkdir -p /root/WG_Client

# ==Copy scripts to /usr/local/bin /usr/==
cp openvpn-install.sh /usr/local/bin/
cp wireguard-install.sh /usr/local/bin/

# ==Rename scripts after copying==
mv /usr/local/bin/openvpn-install.sh /usr/local/bin/ovpn.sh
mv /usr/local/bin/wireguard-install.sh /usr/local/bin/wg.sh

# ==Create move.sh to organize client config files in /usr/local/bin==
cat << 'EOF' > /usr/local/bin/move.sh
#!/bin/bash
shopt -s nullglob   # avoid "nameless file"
mv /root/*.ovpn /root/OVPN_Client/ 2>/dev/null
mv /root/*.conf /root/WG_Client/ 2>/dev/null
EOF

# ==Cleaning & Backup==
mv /root/openvpn-install.sh /root/ovpn.sh-for_menu/
mv /root/wireguard-install.sh /root/wg.sh-for_menu/
rm /root/VPN-Installer.sh

# ==Make all scripts executable==
chmod +x /usr/local/bin/ovpn.sh
chmod +x /usr/local/bin/wg.sh
chmod +x /usr/local/bin/move.sh
echo "Setup completed. All scripts installed and executable."
echo "ovpn.sh for OpenVPN menu."
echo "wg.sh for WireGuard menu."
