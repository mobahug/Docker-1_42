FROM archlinux

RUN pacman -Sy --noconfirm base-devel git

ARG AUR_PACKAGE=taskcore

RUN useradd builduser -m \
  && passwd -d builduser \
  && cd /home/builduser \
  && git clone "https://aur.archlinux.org/$AUR_PACKAGE.git" target \
  && chown builduser -R target \
  && (printf 'builduser ALL=(ALL) ALL\n' | tee -a /etc/sudoers) \
  && sudo -u builduser bash -c 'cd ~/target && makepkg -si --noconfirm' \
  && pacman -Rns $(pacman -Qtdq)

WORKDIR /home/builduser/target

CMD ["bash"]