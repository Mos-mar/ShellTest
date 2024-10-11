#!/bin/bash

echo "Menu de gestion des utilisateurs "
echo "1. Crée un utilisateur"
echo "2. Supprime un utilisateur"
echo "3. Quitter"

read -p "Entrez votre choix (1,2 ou 3) : " var

case $var in 
1)read -p "Entrez votre nom d'utilisateur : " userName
if [ -z "$(grep $userName /etc/passwd)" ]
then
sudo useradd $userName
echo $userName "a été crée"
sudo passwd $userName
else
echo "L'utilisateur existe déjà, choissisez un autre userName : "
./mcp_users.sh
fi
;;
2)cat /etc/passwd
read -p "Entrez le nom d'utilisateur à supprimer : " userName
if [ -n "$(grep $userName /etc/passwd)" ]
then
sudo userdel $userName
echo "$userName a été supprimé"
else
echo "L'utilisateur n'existe pas, recommencez : "
./mcp_users.sh
fi
;;
3)exit 0;;
*) echo "Choix invalide, recommencez : "
./mcp_users.sh;;
esac    