#!/bin/bash
#Cristian Villegas

if [[ $EUID -ne 0 ]]; then
   echo "You must be root" 
   exit 1
fi
function mostra_serveis(){
	clear
	echo "--MENU--"
	PS3='Escoje un servicio: '
options=("cups" "ssh" "apache2" "Sortir")
select opt in "${options[@]}"
do
    case $opt in
        "cups")
            ctrl_servei_cups
            ;;
        "ssh")
            ctrl_servei_ssh
            ;;
        "apache2")
           ctrl_servei_apache2
            ;;
        "Sortir")
            break
            ;;
        *) echo "No valida $REPLY";;
    esac
done
}
ctrl_servei_cups() {
	STATUS="$(systemctl is-active cups.service)"
if [ "${STATUS}" = "active" ]; then
    echo "El servicio CUPS ya esta en funcionamineto"
else 
    echo "Arrancando el servicio CUPS"  
    sudo systemctl start cups
     echo "Servicio arrancado"  
    exit 0 
fi
}
ctrl_servei_ssh() {
	STATUS="$(systemctl is-active ssh.service)"
if [ "${STATUS}" = "active" ]; then
    echo "El servicio SSH ya esta en funcionamineto"
else 
    echo "Arrancando el servicio SSH"  
    sudo systemctl start ssh
     echo "Servicio arrancado"  
    exit 0
fi
}
ctrl_servei_apache2() {
	STATUS="$(systemctl is-active apache2.service)"
if [ "${STATUS}" = "active" ]; then
    echo "El servicio APACHE2 ya esta en funcionamineto"
else 
    echo "Arrancando el servicio APACHE2"  
    sudo systemctl start apache2
     echo "Servicio arrancado"  
    exit 0 
fi
}

mostra_serveis


