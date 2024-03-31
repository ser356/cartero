#!/bin/bash

add(){
    cd src/
    mkdir -p /usr/local/bin/
    mv cartero /usr/local/bin/

    mkdir -p /usr/local/share/cartero
    mv cartero.gresource /usr/local/share/cartero

    mkdir -p /usr/share/applications/
    mv es.danirod.Cartero.desktop /usr/share/applications/

    mkdir -p /usr/share/icons/hicolor/scalable/apps/
    mv es.danirod.Cartero.svg /usr/share/icons/hicolor/scalable/apps/

}
del(){
    rm /usr/local/bin/cartero
    rm -r /usr/local/share/cartero
    rm /usr/share/applications/es.danirod.Cartero.desktop
    rm /usr/share/icons/hicolor/scalable/apps/es.danirod.Cartero.svg
}


echo "Cartero Setup Script"

echo "Pulsa 1 para instalar Cartero"
echo "Pulsa 2 para desinstalar Cartero"

read -p "Opción: " opcion


if [ $opcion -eq 1 ]; then
    echo "Instalando Cartero..."
    add
    echo "Cartero instalado correctamente"
elif [ $opcion -eq 2 ]; then
    echo "Desinstalando Cartero..."
    del
    echo "Cartero desinstalado correctamente"
else
    echo "Opción no válida"
    exit 1
fi

exit 0
