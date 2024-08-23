#!/bin/bash

# Define Colors
red='\e[1;31m'
green='\e[1;32m'
yellow='\e[1;33m'
blue='\e[1;34m'
purple='\e[1;35m'
cyan='\e[1;36m'
NC='\e[0m'  # No Color
BICyan='\033[1;96m'
BOLD='\e[1m'

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
MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/Andyyuda/v5/main/izin | grep $MYIP | awk '{print $2}')
Exp=$(curl -sS https://raw.githubusercontent.com/Andyyuda/v5/main/izin | grep $MYIP | awk '{print $3}')

# Service statuses
ssh_status=$(check_service_status "ssh")
stunnel_status=$(check_service_status "stunnel5")
ws_stunnel_status=$(check_service_status "ws-stunnel")
nginx_status=$(check_service_status "nginx")
dropbear_status=$(check_service_status "dropbear")
xray_status=$(check_service_status "xray")

# Display information
clear
echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${blue}                     ⇱ ${BOLD}INFORMASI VPS${NC}${blue} ⇲                     ${NC}"
echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

# General Info
echo -e "${purple}□ Server Uptime       : ${green}$( uptime -p | cut -d " " -f 2-10000 )${NC}"
echo -e "${purple}□ Waktu Saat Ini      : ${green}$( date +"%d-%m-%Y | %X" )${NC}"
echo -e "${purple}□ Sistem Operasi      : ${green}$( cat /etc/os-release | grep -w PRETTY_NAME | sed 's/PRETTY_NAME=//g' | sed 's/\"//g' )${NC}"
echo -e "${purple}□ Domain Aktif        : ${green}$( cat /etc/xray/domain )${NC}"
echo -e "${purple}□ Ram Terpakai        : ${green}$uram / $tram${NC}"
echo -e "${purple}□ Penggunaan CPU      : ${green}$cpu_usage${NC}"
echo -e "${purple}□ Nama Client         : ${green}$Name${NC}"
echo -e "${purple}□ Expired VPS Script  : ${green}$Exp${NC}"

echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${yellow}                     ⇱ ${BOLD}INFORMASI SERVICE${NC}${yellow} ⇲                     ${NC}"
echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

# Service Statuses
echo -e "${yellow}□ Status SSH         : $ssh_status"
echo -e "${yellow}□ Status Stunnel5    : $stunnel_status"
echo -e "${yellow}□ Status WS-Stunnel  : $ws_stunnel_status"
echo -e "${yellow}□ Status Nginx       : $nginx_status"
echo -e "${yellow}□ Status Dropbear    : $dropbear_status"
echo -e "${yellow}□ Status Xray        : $xray_status"

echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

echo -e "${green}┌──────────────────────────────────────────────────┐${NC}"
echo -e "${green}│  ${BOLD}${yellow}Ketik >> Menu << Untuk ke menu Utama${NC}"
echo -e "${green}└──────────────────────────────────────────────────┘${NC}"
