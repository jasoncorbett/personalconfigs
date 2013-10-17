#!/bin/bash

cd /usr/share/unity/icons
if [ ! -e transparent54.png ]
then
	sudo wget -O transparent54.png "https://drive.google.com/uc?export=download&confirm=no_antivirus&id=0B7yJf19YNEeLV0Z6dGRXS2dMQ28"
fi

if [ ! -e transparent62.png ]
then
	sudo wget -O transparent62.png "https://drive.google.com/uc?export=download&confirm=no_antivirus&id=0B7yJf19YNEeLLVZPZmZPOVV5STA"
fi

for name in squircle_shine squircle_edge squircle_base squircle_base_selected launcher_icon_back launcher_icon_edge launcher_icon_shine; 
do
	if [ -L "${name}_54.png" -a -e "${name}_54.ori.png" ]
	then
		echo "reverting ${name}_54.png"
		sudo rm ${name}_54.png
		sudo mv ${name}_54.ori.png ${name}_54.png
	fi
done

for name in squircle_shadow launcher_icon_glow launcher_icon_shadow;
do 
	if [ -L "${name}_62.png" -a -e "${name}_62.ori.png" ]
	then
		echo "reverting ${name}_62.png"
		sudo rm ${name}_62.png
		sudo mv ${name}_62.ori.png ${name}_62.png
	fi
done

for name in squircle_edge squircle_base launcher_icon_back launcher_icon_edge; 
do 
	echo "replacing ${name}_54.png with a transparent version"
	sudo mv ${name}_54.png ${name}_54.ori.png
	sudo ln -s transparent54.png ${name}_54.png
done

#for name in squircle_shadow;
#do 
#	echo "replacing ${name}_62.png with a transparent version"
#	sudo mv ${name}_62.png ${name}_62.ori.png 
#	sudo ln -s transparent62.png ${name}_62.png
#done

echo "All done.  Do Alt-F2 and run setsid unity"
