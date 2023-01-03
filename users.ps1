#Création d'un groupe
New-LocalGroup -Name "Techniciens"
#Utilisation de variables
$CSV = Import-Csv "C:\users.csv"
foreach($LINE in $CSV)
{
$NewUser="$($LINE.USERNAME)"
$NewPass="$($LINE.PASSWORD)" 
$SecurePass=ConvertTo-SecureString –AsPlainText -Force -String "$NewPass"
#Creation d'utilisateurs
New-LocalUser -Name $NewUser -Password $SecurePass
#Ajout des utilisateurs au groupe
Add-LocalGroupMember -Group "Techniciens" -Member $NewUser
}
