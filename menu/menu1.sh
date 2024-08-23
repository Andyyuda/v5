#!/bin/bash

# Warna & Format
BICyan='\033[1;96m'    # Cyan Tebal
BIWhite='\033[1;97m'   # Putih Tebal
UWhite='\033[4;37m'    # Putih Garis Bawah
NC='\e[0m'             # Reset Warna
BOLD="\e[1m"           # Teks Tebal
GREEN='\033[0;32m'     # Hijau
RED='\033[0;31m'       # Merah
YELLOW='\033[0;33m'    # Kuning
BLUE='\033[0;34m'      # Biru

# Info VPS
IPVPS=$(curl -s ipinfo.io/ip)
tram=$( free -h | awk 'NR==2 {print $2}' )
uram=$( free -h | awk 'NR==2 {print $3}' )
cpu_usage="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')%"
Name="AndyYuda"  # Contoh nama client
Exp="12-12-2024" # Contoh tanggal expired

# Tampilan Menu Awal
clear
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BICyan}                     ⇱ INFORMASI VPS ⇲                        ${NC}"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

echo -e "${BICyan}□ Server Uptime       : ${GREEN}$( uptime -p | cut -d " " -f 2-10000 ) ${NC}"
echo -e "${BICyan}□ Waktu Saat Ini      : ${GREEN}$( date +"%d-%m-%Y | %X" )${NC}"
echo -e "${BICyan}□ Sistem Operasi      : ${GREEN}$( cat /etc/os-release | grep -w PRETTY_NAME | sed 's/PRETTY_NAME=//g' | sed 's/"//g' )${NC}"
echo -e "${BICyan}□ Domain Aktif        : ${GREEN}$( cat /etc/xray/domain )${NC}"
echo -e "${BICyan}□ Ram Terpakai        : ${GREEN}$uram / $tram${NC}"
echo -e "${BICyan}□ Penggunaan CPU      : ${GREEN}$cpu_usage${NC}"
echo -e "${BICyan}□ Nama Client         : ${GREEN}$Name${NC}"
echo -e "${BICyan}□ Expired VPS Script  : ${GREEN}$Exp${NC}"

echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "░█████╗░███╗░░██╗██████╗░██╗░░░██╗██╗░░░██╗██████╗░░█████╗░"
echo -e "██╔══██╗████╗░██║██╔══██╗╚██╗░██╔╝╚██╗░██╔╝██║░░░██║██╔══██╗"
echo -e "███████║██╔██╗██║██║░░██║░╚████╔╝░░╚████╔╝░██║░░░██║██║░░██║"
echo -e "██╔══██║██║╚████║██║░░██║░░╚██╔╝░░░░╚██╔╝░░██║░░░██║██╔══██║"
echo -e "██║░░██║██║░╚███║██████╔╝░░░██║░░░░░░██║░░░╚██████╔╝██████╔╝"
echo -e "╚═╝░░╚═╝╚═╝░░╚══╝╚═════╝░░░░╚═╝░░░░░░╚═╝░░░░╚═════╝░╚═════╝░"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

# Menu
echo -e "${BICyan} ┌─────────────────────────────────────────────────────┐${NC}"
echo -e "     ${BICyan}[${BIWhite}01${BICyan}] SSH      ${BICyan}[${BIYellow}Menu${BICyan}]${NC}" "      ${BICyan}[${BIWhite}06${BICyan}] BACKUP    ${BICyan}[${BIYellow}Menu${BICyan}]${NC}" "${BICyan}   │"
echo -e "     ${BICyan}[${BIWhite}02${BICyan}] VMESS    ${BICyan}[${BIYellow}Menu${BICyan}]${NC}" "      ${BICyan}[${BIWhite}07${BICyan}] RESTORE   ${BICyan}[${BIYellow}Menu${BICyan}]${NC}" "${BICyan}   │"
echo -e "     ${BICyan}[${BIWhite}03${BICyan}] VLESS    ${BICyan}[${BIYellow}Menu${BICyan}]${NC}" "      ${BICyan}[${BIWhite}08${BICyan}] INFO VPS  ${NC}" "${BICyan}   │"
echo -e "     ${BICyan}[${BIWhite}04${BICyan}] TROJAN   ${BICyan}[${BIYellow}Menu${BICyan}]${NC}" "      ${BICyan}[${BIWhite}09${BICyan}] STATUS VPS${NC}" "${BICyan}   │"
echo -e "     ${BICyan}[${BIWhite}05${BICyan}] SETTING  ${BICyan}[${BIYellow}Menu${BICyan}]${NC}" "      ${BICyan}[${BIWhite}10${BICyan}] EXIT      ${NC}" "${BICyan}   │"
echo -e "${BICyan} └─────────────────────────────────────────────────────┘${NC}"

echo -e "${GREEN}┌──────────────────────────────────────────────────┐${NC}"
echo -e "${GREEN}│  ${BOLD}${YELLOW}Pilih opsi dari menu di atas untuk melanjutkan...${NC}"
echo -e "${GREEN}└──────────────────────────────────────────────────┘${NC}"
