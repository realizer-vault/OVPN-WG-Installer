#!/bin/bash
# openvpn-install.sh file
curl -O https://raw.githubusercontent.com/realizer-vault/OVPN-WG-Installer/master/openvpn-install.sh
chmod +x openvpn-install.sh
# wireguard-install.sh file
curl -O https://raw.githubusercontent.com/realizer-vault/OVPN-WG-Installer/master/wireguard-install.sh
chmod +x wireguard-install.sh
# Create required folders in /root
mkdir -p /root/ovpn.sh-for_menu
mkdir -p /root/wg.sh-for_menu
mkdir -p /root/OVPN_Client
mkdir -p /root/WG_Client
# Copy install scripts to /usr/local/bin
cp openvpn-install.sh /usr/local/bin/
cp wireguard-install.sh /usr/local/bin/
# Rename after copying
mv /usr/local/bin/openvpn-install.sh /usr/local/bin/ovpn.sh
mv /usr/local/bin/wireguard-install.sh /usr/local/bin/wg.sh
# Move renamed scripts to /root/for_menu
mv /usr/local/bin/ovpn.sh /root/ovpn.sh-for_menu/
mv /usr/local/bin/wg.sh /root/wg.sh-for_menu/
# Create move.sh in /usr/local/bin
cat << 'EOF' > /usr/local/bin/move.sh
#!/bin/bash
shopt -s nullglob   # avoid "nameless file"
mv /root/*.ovpn /root/OVPN_Client/ 2>/dev/null
mv /root/*.conf /root/WG_Client/ 2>/dev/null
EOF
# Make all 3 executable
chmod +x /root/for_menu/ovpn.sh
chmod +x /root/for_menu/wg.sh
chmod +x /usr/local/bin/move.sh
echo "Setup completed. All scripts installed and executable."
echo "ovpn.sh for OpenVPN menu."
echo "wg.sh for WireGuard menu."
