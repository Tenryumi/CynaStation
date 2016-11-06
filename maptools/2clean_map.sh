export MAPFILE_CYT=cynatest.dmm

java -jar MapPatcher.jar -clean ../maps/%MAPFILE_CYT%.backup ../maps/%MAPFILE_CYT% ../maps/%MAPFILE_CYT%

read -n1 -r -p "Press any key to continue..." key
