#!/bin/bash

# Define Colors
red='\e[1;31m'
green='\e[1;32m'
NC='\e[0m'  # No Color
CYAN='\033[0;36m'
BICyan='\033[1;96m'
BOLD='\e[1m'
YELLOW='\033[0;33m'

# Function to check service status
check_service_status() {
    service_name=$1
    service_status=$(service $service_name status | grep active | cut -d ' ' -f5)
    
    if [ "$service_status" = "active" ]; then
        echo -e "${green}ON${NC}"
    else
        echo -e "${red}OFF${NC}"
    fi
}

# Getting data
tram=$(free -h | awk 'NR==2 {print $2}')
uram=$(free -h | awk 'NR==2 {print $3}')
cpu_usage1=$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')
cpu_usage="$((${cpu_usage1/\.*} / 1))"
cpu_usage+=" %"
Name=$(curl -sS https://raw.githubusercontent.com/Andyyuda/v5/main/izin | grep $MYIP | awk '{print $2}')
Exp=$(curl -sS https://raw.githubusercontent.com/Andyyuda/v5/main/izin | grep $MYIP | awk '{print $3}')
MYIP=$(curl -sS ipv4.icanhazip.com)

# Service statuses
ssh_status=$(check_service_status "ssh")
stunnel_status=$(check_service_status "stunnel5")
ws_stunnel_status=$(check_service_status "ws-stunnel")
nginx_status=$(check_service_status "nginx")
dropbear_status=$(check_service_status "dropbear")
xray_status=$(check_service_status "xray")

# Display information
clear
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BICyan}                     ⇱ INFORMASI VPS ⇲                        ${NC}"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

# General Info
echo -e "${BICyan}□ Server Uptime       : ${green}$( uptime -p | cut -d " " -f 2-10000 )${NC}"
echo -e "${BICyan}□ Waktu Saat Ini      : ${green}$( date +"%d-%m-%Y | %X" )${NC}"
echo -e "${BICyan}□ Sistem Operasi      : ${green}$( cat /etc/os-release | grep -w PRETTY_NAME | sed 's/PRETTY_NAME=//g' | sed 's/\"//g' )${NC}"
echo -e "${BICyan}□ Domain Aktif        : ${green}$( cat /etc/xray/domain )${NC}"
echo -e "${BICyan}□ Ram Terpakai        : ${green}$uram / $tram${NC}"
echo -e "${BICyan}□ Penggunaan CPU      : ${green}$cpu_usage${NC}"
echo -e "${BICyan}□ Nama Client         : ${green}$Name${NC}"
echo -e "${BICyan}□ Expired VPS Script  : ${green}$Exp${NC}"

echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BICyan}                     ⇱ INFORMASI SERVICE ⇲                        ${NC}"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
# Service Statuses
echo -e "${BICyan}□ Status SSH         : $ssh_status"
echo -e "${BICyan}□ Status Stunnel5    : $stunnel_status"
echo -e "${BICyan}□ Status WS-Stunnel  : $ws_stunnel_status"
echo -e "${BICyan}□ Status Nginx       : $nginx_status"
echo -e "${BICyan}□ Status Dropbear    : $dropbear_status"
echo -e "${BICyan}□ Status Xray        : $xray_status"

echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

echo -e "${GREEN}┌──────────────────────────────────────────────────┐${NC}"
echo -e "${GREEN}│  ${BOLD}${YELLOW}Ketik >> Menu << Untuk ke menu Utama${NC}"
echo -e "${GREEN}└──────────────────────────────────────────────────┘${NC}"
