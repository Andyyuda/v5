#!/bin/bash

# Install Vnstat
print_install "Menginstall Vnstat"

# Instal paket dan dependensi
apt -y install vnstat > /dev/null 2>&1
apt -y install libsqlite3-dev > /dev/null 2>&1

# Restart layanan vnstat
/etc/init.d/vnstat restart

# Unduh dan ekstrak vnstat versi 2.6
wget -q https://humdi.net/vnstat/vnstat-2.6.tar.gz -O /root/vnstat-2.6.tar.gz
tar -xzf /root/vnstat-2.6.tar.gz -C /root

# Kompilasi dan instal vnstat
cd /root/vnstat-2.6
./configure --prefix=/usr --sysconfdir=/etc && make && make install
cd

# Perbarui database vnstat
vnstat -u -i $NET

# Konfigurasi vnstat
sed -i 's/Interface "eth0"/Interface "$NET"/g' /etc/vnstat.conf
chown -R vnstat:vnstat /var/lib/vnstat

# Enable dan restart layanan vnstat
systemctl enable vnstat
systemctl restart vnstat

# Tampilkan status vnstat
/etc/init.d/vnstat status

# Bersihkan file unduhan
rm -f /root/vnstat-2.6.tar.gz
rm -rf /root/vnstat-2.6
