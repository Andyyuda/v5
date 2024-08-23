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

# Function to check if a service is running
check_service_status() {
    service_name=$1
    service_status=$(systemctl is-active $service_name)

    if [[ $service_status == "active" ]]; then
        echo "running"
    else
        echo "not running"
    fi
}

# Get the status of each service
ssh_service=$(check_service_status "ssh")
stunnel_service=$(check_service_status "stunnel5")
ws_stunnel_service=$(check_service_status "ws-stunnel")
nginx_service=$(check_service_status "nginx")
dropbear_service=$(check_service_status "dropbear")
xray_service=$(check_service_status "xray")

# STATUS SERVICE SSH
if [[ $ssh_service == "running" ]]; then
    status_ssh="${green}Running${NC} ( No Error )"
else
    status_ssh="${red}Not Running${NC} ( Error )"
fi

# STATUS SERVICE STUNNEL5
if [[ $stunnel_service == "running" ]]; then
    status_stunnel="${green}Running${NC} ( No Error )"
else
    status_stunnel="${red}Not Running${NC} ( Error )"
fi

# STATUS SERVICE WS-STUNNEL
if [[ $ws_stunnel_service == "running" ]]; then
    status_ws_stunnel="${green}Running${NC} ( No Error )"
else
    status_ws_stunnel="${red}Not Running${NC} ( Error )"
fi

# STATUS SERVICE NGINX
if [[ $nginx_service == "running" ]]; then
    status_nginx="${green}Running${NC} ( No Error )"
else
    status_nginx="${red}Not Running${NC} ( Error )"
fi

# STATUS SERVICE DROPBEAR
if [[ $dropbear_service == "running" ]]; then
    status_dropbear="${green}Running${NC} ( No Error )"
else
    status_dropbear="${red}Not Running${NC} ( Error )"
fi

# STATUS SERVICE XRAY
if [[ $xray_service == "running" ]]; then
    status_xray="${green}Running${NC} ( No Error )"
else
    status_xray="${red}Not Running${NC} ( Error )"
fi

# Getting data
tram=$(free -h | awk 'NR==2 {print $2}')
uram=$(free -h | awk 'NR==2 {print $3}')
cpu_usage1=$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')
cpu_usage="$((${cpu_usage1/\.*} / 1))"
cpu_usage+=" %"
MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/Andyyuda/v5/main/izin | grep $MYIP | awk '{print $2}')
Exp=$(curl -sS https://raw.githubusercontent.com/Andyyuda/v5/main/izin | grep $MYIP | awk '{print $3}')

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
echo -e "${yellow}□ Status SSH         : $status_ssh"
echo -e "${yellow}□ Status Stunnel5    : $status_stunnel"
echo -e "${yellow}□ Status WS-Stunnel  : $status_ws_stunnel"
echo -e "${yellow}□ Status Nginx       : $status_nginx"
echo -e "${yellow}□ Status Dropbear    : $status_dropbear"
echo -e "${yellow}□ Status Xray        : $status_xray"

echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

echo -e "${green}┌──────────────────────────────────────────────────┐${NC}"
echo -e "${green}│  ${BOLD}${yellow}Ketik >> Menu << Untuk ke menu Utama${NC}"
echo -e "${green}└──────────────────────────────────────────────────┘${NC}"
