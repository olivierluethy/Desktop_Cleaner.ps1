# Aufgabe 1
# Dateien werden erst gelöscht, wenn sie im Papierkorb gelöscht werden. Das heisst, 
# dass wenn ich bei meinen Dokuementen ein Word-File lösche, geht es in den Papierkorb. 
# Wenn ich im Windows in den Papierkorb reingehe und dort das Word-File noch einmal lösche, 
# ist es komplett gelöscht und nicht mehr wiederherstellbar

# Aufgabe 2

[string] $i = ""                         # Name des Ordners (Archiv)
[string] $y = ".\Desktop\"               # Name des Ordners oder Files (muss verschoben werden)
[bool] $yn                               # Ob man weiterfahren will oder nicht
[string] $userprofile = $ENV:UserProfile # Der Systemname

cls

$i = Read-Host "Bitte geben sie den Namen des Ordners ein, in welchem Dateien oder Ordner archiviert werden"

while ($i -match "^\d+$") # Check's if a variable is a number or not
{
    # Variable is a number
    Write-Host "Please enter the name with letters and not with numbers"
    $i = Read-Host
}

# Ordner wird erstellt
New-Item -Path "$userprofile\Desktop" -Name $i -ItemType "directory" -Value "Archiv"    # Ordner als Archiv

do {

    Get-ChildItem -Path "$userprofile\Desktop"

    $y = Read-Host "Bitte geben sie den Namen der Datei oder des Ordners ein welcher sie archivieren wollen"

    if($y -eq $i)
    {
        do{
            
            $y += Read-Host "Bitte geben sie nicht den gleichen Namen ein den sie für das Archivieren benutzen!"

        }until($y -ne $i)
    }
    elseif(!(Test-Path $y -ErrorAction SilentlyContinue)) 
    {
        while(!(Test-Path "$userprofile\Desktop\$y" -ErrorAction SilentlyContinue))
        {
            Write-Host "`nDer Ordner existiert nicht. Bitte geben Sie einen existierenden Pfad ein"
            [string] $y = Read-Host
        }
    
    }

    Move-Item "$userprofile\Desktop\$y" -Destination "$userprofile\Desktop\$i"

    Write-Host "Move was successful!"

    $yn = Read-Host "Wollen Sie weiterfahren? Mit 1 ja, mit 0 nein"

}until($yn -eq 0)

cls

Write-Host "Das Programm wurde erfolgreich beendet"