# Atualiza mirrorlist
sudo reflector -c Brazil -c Chile -a 6 --sort rate --save /etc/pacman.d/mirrorlist

# Checa servicos com problema
# systemctl --failed
# sudo journalctl -p 3 -xb

# Atualiza os pacotes
# sudo pacman -Syu
yay -Syu

# Remove o cache do pacman
# sudo pacman -Sc
yay -Sc

# Remove dependencias
yay -Yc

# Remove pacotes orfaos
sudo pacman -Rns $(pacman -Qdtq)

# Usa Bleachbit para limpar o cache
bleachbit --clean system.cache

# Apaga todo o cache do usuário
rm -rf ~/.cache/*

# Apaga os logs, deixando apenas os da última semana.
sudo journalctl --vacuum-time=1week
