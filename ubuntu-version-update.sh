#!/bin/bash

echo "Zacyznamy aktualizacje systemu"

# Aktualizacja obecnej wersji systemu
echo "Aktualizacja obecnej wersji systemu... oby sie udało xD"
sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y


echo "Instalacja narzędzia update-manager-core..."
sudo apt install update-manager-core -y

# Przejście do procesu aktualizacji
echo "Rozpoczynanie procesu aktualizacji do Ubuntu 22.04..."
sudo do-release-upgrade -d

echo "Aktualizacja zakończona. Proszę zrestartować system. XD "
