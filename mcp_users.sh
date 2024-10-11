#!/bin/bash

echo "Menu de gestion des utilisateurs "
echo "1. Crée un utilisateur"
echo "2. Supprime un utilisateur"
echo "3. Quitter"

read -p "Entrez votre choix (1,2 ou 3) : " var

case $var in 
1) read -p "Entrez votre nom d'utilisateur : " userName
sudo useradd $userName
echo $userName "a été crée"
sudo passwd $userName;;
2)read -p "Entrez le nom d'utilisateur à supprimer : " userName
sudo userdel $userName
echo "$userName a été supprimé"
;;
3)exit 0;;
*) echo "Choix invalide";;
esac