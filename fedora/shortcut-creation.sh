#!/bin/bash
echo "Enter the path of your executalbe file"
read execFilePath
if test -f "$execFilePath"; then
    echo "accepted"
else
    echo "There is no exec file found"
exit 0
fi

echo "Enter the path of icon you want"
read iconFilePath 
if test -f "$iconFilePath"; then
    echo "accepted"
else
    echo "There is no icon file found"
exit 0
fi

echo "Specify name of your application to display"
read name

#name of created files and links
plainName=$(basename -s .sh $execFilePath)

ln -sf $execFilePath /bin/$plainName
echo -e "[Desktop Entry]\nVersion=1.0\nType=Application\nName=$name\nIcon=$iconFilePath\nExec=\"$execFilePath\"\nTerminal=false" > /usr/share/applications/$plainName.desktop

echo "Shortcut created"
