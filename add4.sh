#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
clear
[[ ! -f /usr/bin/git ]] && apt install git -y &> /dev/null
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
BGWHITE='\e[0;47;30m'
BGBLUE='\e[1;44m'
Lred='\e[91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
GRAY='\033[0;37m'
BLACK='\033[0;30m'
GRBK='\033[0;40m'
BOLD='\e[1m'
END='\e[0m'

add-ip() {
    today=`date -d "0 days" +"%Y-%m-%d"`
    ran=$(date +%s)
    versi="3"
    git clone https://github.com/Kulanbagong1/izinn.git /root/ipvps/ &> /dev/null
    clear
    read -p "Input IP Address : " ip
    CLIENT_EXISTS=$(grep -w $ip /root/ipvps/ip | wc -l)
    if [[ ${CLIENT_EXISTS} == '1' ]]; then
    echo "IP Already Exist !"
    exit 0
    fi
    read -p "Input Username IP (Example : reyz) : " name
    echo "How Much Days Do You Want ?"
    echo "1) 30 Days"
    echo "2) 60 Days"
    echo "3) 90 Days"
    echo "4) Lifetime"
    echo "5) Set Custom Expiration Date"
    read -p "Input Menu Number : " exp
    
    if [[ ${exp} == '1' ]]; then
    exp2=`date -d "30 days" +"%Y-%m-%d"`
    echo "### ${name} ${exp2} ${ip}" >> /root/ipvps/ip
    elif [[ ${exp} == '2' ]]; then
    exp2=`date -d "60 days" +"%Y-%m-%d"`
    echo "### ${name} ${exp2} ${ip}" >> /root/ipvps/ip
    elif [[ ${exp} == '3' ]]; then
    exp2=`date -d "90 days" +"%Y-%m-%d"`
    echo "### ${name} ${exp2} ${ip}" >> /root/ipvps/ip
    elif [[ ${exp} == '4' ]]; then
    exp2="Lifetime"
    echo "### ${name} ${exp2} ${ip}" >> /root/ipvps/ip
    elif [[ ${exp} == '5' ]]; then
    read -p "Input Expired Days : " exp11
    exp2=`date -d "$exp11 days" +"%Y-%m-%d"`
    echo "asu ${name} ${exp2} ${ip} ${versi}" >> /root/ipvps/ip
    fi
    cd /root/ipvps
    git config --global user.email "jengkolonline323@gmail.com" &> /dev/null
    git config --global user.name "Kulanbagong1" &> /dev/null
    rm -rf .git &> /dev/null
    git init &> /dev/null
    git add . &> /dev/null
    git commit -m m &> /dev/null
    git branch -M main &> /dev/null
    git remote add origin https://github.com/Kulanbagong1/izinn
    git push -f https://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@github.com/Kulanbagong1/izinn.git &> /dev/null
    rm -rf /root/ipvps
    clear
    echo -e "${CYAN}Succesfully Add IP Address${NC}"
    echo -e ""
    echo -e "Username      : $name"
    echo -e "IP Address    : $ip"
    echo -e "Versi Izin      : $versi"
    echo -e "Registered On : $today"
    echo -e "Expired On    : $exp2"
    echo -e "===================================="
    echo -e "  >>>>> LINK INSTALL <<<<<"
    echo -e " Jalanin Ini Dulu :" 
    echo -e "===================================="
    echo -e " apt install -y wget screen && apt update -y && apt upgrade -y && apt install lolcat -y && gem install lolcat && wget -q https://raw.githubusercontent.com/Kulanbagong1/vps/main/main.sh && chmod +x main.sh && screen -S install ./main.sh "
    echo -e "====================================="
    echo -e " Baru Yg Ini : "
    echo -e "====================================="
    echo -e " wget https://raw.githubusercontent.com/Kulanbagong1/vps/main/update.sh && chmod +x update.sh && ./update.sh "
    echo -e "===================================="
    echo -e " TUNGGU 5 MENIT BARU INSTALL"
    echo -e "===================================="
    echo -e " INSTALL SECRIPT JENGKOLONLINE"
    echo -e "====================================="
    echo -e " wget --no-check-certificate https://raw.githubusercontent.com/Kulanbagong1/scvip/main/ub20.sh && chmod +x ub20.sh && ./ub20.sh "
    echo -e "====================================="
    echo ""
    read -n 1 -s -r -p "Press any key to back on menu"
    addip-menu
}

del-ip() {
    rm -rf /root/ipvps
    git clone https://github.com/Kulanbagong1/izinn.git /root/ipvps/ &> /dev/null
    clear
    echo "List IP Address Have Been Registered"
    echo ""
    grep -E "^###" "/root/ipvps/ip" | cut -d ' ' -f 2-6 | column -t | sort | uniq
    grep -E "^#&" "/root/ipvps/ip" | cut -d ' ' -f 2-6 | column -t | sort | uniq
    echo ""
    read -p "Input IP Address To Delete : " ipdel
    name=$(cat /root/ipvps/ip | grep $ipdel | awk '{print $2}')
    exp=$(cat /root/ipvps/ip | grep $ipdel | awk '{print $4}')
    if [[ ${exp} == 'Lifetime' ]]; then
    sed -i "/^#& $name $exp $ipdel/,/^},{/d" /root/ipvps/ip
    else
    sed -i "/^### $name $exp $ipdel/,/^},{/d" /root/ipvps/ip
    fi
    cd /root/ipvps
    git config --global user.email "jengkolonline323@gmail.com" &> /dev/null
    git config --global user.name "Kulanbagong1" &> /dev/null
    rm -rf .git &> /dev/null
    git init &> /dev/null
    git add . &> /dev/null
    git commit -m m &> /dev/null
    git branch -M main &> /dev/null
    git remote add origin https://github.com/Kulanbagong1/izinn
    git push -f https://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@github.com/Kulanbagong1/izinn.git &> /dev/null
    rm -rf /root/ipvps
    clear
    echo "Succesfully Deleted The IP Address"
    read -n 1 -s -r -p "Press any key to back on menu"
    addip-menu
}

renew-ip() {
    rm -rf /root/ipvps
    git clone https://github.com/Kulanbagong1/izinn.git /root/ipvps/ &> /dev/null
    clear
    echo "List IP Address Have Been Registered"
    echo ""
    grep -E "^###" "/root/ipvps/ip" | cut -d ' ' -f 2-6 | column -t | sort | uniq
    echo ""
    read -p "Input IP Address To Renew : " ipdel
    read -p "Input Days  : " days
    name=$(cat /root/ipvps/ip | grep $ipdel | awk '{print $2}')
    exp=$(cat /root/ipvps/ip | grep $ipdel | awk '{print $4}')
    now=$(date +%Y-%m-%d)
    d1=$(date -d "$exp" +%s)
    d2=$(date -d "$now" +%s)
    exp2=$(( (d1 - d2) / 86400 ))
    exp3=$(($exp2 + $days))
    exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
    sed -i "s/### $name $exp $ipdel/### $name $exp4 $ipdel/g" /root/ipvps/ip
    cd /root/ipvps
    git config --global user.email "jengkolonline323@gmail.com" &> /dev/null
    git config --global user.name "Kulanbagong1" &> /dev/null
    rm -rf .git &> /dev/null
    git init &> /dev/null
    git add . &> /dev/null
    git commit -m m &> /dev/null
    git branch -M main &> /dev/null
    git remote add origin https://github.com/Kulanbagong1/izinn
    git push -f https://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@github.com/Kulanbagong1/izinn.git &> /dev/null
    rm -rf /root/ipvps
    clear
    echo "Succesfully Renew The IP Address"
    echo ""
    echo "Username   : $name"
    echo "IP Address : $ipdel"
    echo "Expired On : $exp4"
    echo ""
    read -n 1 -s -r -p "Press any key to back on menu"
    addip-menu
}

clear

echo -e "${Lred} ══════════════════════════════════════════${NC}"
echo -e " ${BGWHITE}         [ REGISTER IP V4 MENU ]          ${NC}"
echo -e "${Lred} ══════════════════════════════════════════${NC}"
echo -e " $PURPLE (01) $NC $Lyellow Add IP VPS"$NC     
echo -e " $PURPLE (02) $NC $Lyellow Delete IP VPS"$NC
echo -e " $PURPLE (03) $NC $Lyellow Renew IP VPS"$NC
echo -e ""
echo -e " $PURPLE Created By $NC $Lyellow @tau_samawa"
echo -e "${Lred} ══════════════════════════════════════════${NC}"
echo ""
read -p "Please Input Menu Number : " menu
case $menu in
1 | 01)
clear
add-ip
;;
2 | 02)
clear
del-ip
;;
3 | 03)
clear
renew-ip
;;
*)
echo "Please Input An Correct Menu !"
sleep 1
addip-menu
;;
esac