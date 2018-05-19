
#!/usr/bin/env bash


bold=$(tput bold)
normal=$(tput sgr0)
files='*.mp4'
original_dir_size=$(du -sh | awk '{print $1}');
original_dir_size_int=${original_dir_size:0:${#original_dir_size}-1}
mkdir -p ./compressed

for file in $files
do
  if [ -f $file ]
  then
    echo "Comprimindo:${bold} $file ${normal}"
    ffmpeg -i ./$file -vcodec h264 -acodec mp2 ./compressed/$file
  else
    echo "Nenhum vídeo encontrado."
  fi
done

compressed_dir_size=$(du -sh ./compressed | awk '{print $1}');
compressed_dir_size_int=${compressed_dir_size:0:${#compressed_dir_size}-1}


echo ""
echo ""
echo    "██     ██   ██   ██████      ██████       ██████  "
echo    "██   ██     ██   ██    ██    ██    ██    ██    ██ "
echo    "█████       ██   ██     ██   ██     ██   ██    ██ "
echo    "██   ██     ██   ██    ██    ██    ██    ██    ██ "
echo    "██     ██   ██   ██████      ██████       ██████  "
echo ""
echo ""


echo "Todos vídeos foram comprímidos, na pasta $PWD/compressed"
echo "Vídeos passaram de ${bold}$original_dir_size${normal} para ${bold}$compressed_dir_size${normal}, uma economia de${bold} $(( original_dir_size_int - compressed_dir_size_int ))MB ${normal}"
echo "Desenvolvido por ${bold}Leonardo Cavalcante${normal}"
echo "Kiddo: ${bold}https://kiddolabs.com/${normal}"
