#!/bin/bash

# Verificamos que el usuario haya proporcionado dos argumentos
if [ $# -ne 1 ]; then
  echo "Error: debe proporcionar dos argumentos"
  exit 1
fi

# Obtenemos los argumentos
argumento1=$1

# Determinamos la acción a realizar
case $argumento1 in
  "linux")
    # Build Linux
    echo "==========> Start Build Lunix <=========="
    echo "=> flutter build linux"
    flutter build linux
    echo "==========> Start Copy Lunix <=========="
    echo "=> mkdir -p deployment/linux"
    mkdir -p deployment/linux
    echo "=> cp -r build/linux/x64/release/bundle/* deployment/linux"
    cp -r build/linux/x64/release/bundle/* deployment/linux
    echo "==========> Successful Build to Linux <=========="
    ;;
  "web")
    # Build Web
    echo "==========> Start Build Web <=========="
    echo "=> flutter build web"
    flutter build web
    echo "==========> Start Copy Web <=========="
    echo "=> mkdir -p deployment/web"
    mkdir -p deployment/web
    echo "=> cp -r build/web/* deployment/web"
    cp -r build/web/* deployment/web 
    echo "==========> Successful Build to Web <=========="
    ;;
  "windows")
    # Build windows
    echo "==========> Start Build Windows <=========="
    flutter build windows
    ;;
  "macos")
    # Build windows
    echo "==========> Start Build MacOS <=========="
    flutter build macos
    ;;
  *)
    # Argumento desconocido
    echo "Error: argumento desconocido"
    exit 1
    ;;
esac