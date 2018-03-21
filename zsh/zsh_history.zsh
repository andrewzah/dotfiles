: 1516917622:1;fzf
: 1516917625:0;pwd
: 1516917854:0;rsync
: 1516917859:13;sudo pacman -S rsync
: 1516917874:0;rsync
: 1516918206:6;sudo systemctl enable rsync.service
: 1516918221:0;sudo pacman -S sshd
: 1516918224:0;sudo pacman -S ssh
: 1516918226:0;ssh
: 1516918240:3;sudo pacman -S openssh
: 1516918397:0;sudo systemctl enable sshd.socket
: 1516918428:0;sudo systemctl enable sshd@.service
: 1516918462:0;sudo systemctl disable sshd.socket
: 1516918475:0;sudo systemctl enable sshd.service
: 1516918504:14;nvim /etc/ssh/sshd_config
: 1516918520:5;sudo nvim /etc/ssh/sshd_config
: 1516918535:0;sudo systemctl restart sshd.service
: 1516918571:0;ls ~/Desktop
: 1516918583:0;tree ~
: 1516918596:78;fg
: 1516918677:8;ssh-keygen
: 1516918687:1;ssh-keygen -h
: 1516918692:27;man ssh-keygen
: 1516918734:19;ssh-keygen -t rsa -b 4096 -C "zah@andrewzah.com"
: 1516918770:0;eval "$(ssh-agent -s)"
: 1516918779:3;ssh-add ~/.ssh/id_rsa
: 1516918784:0;git
: 1516918822:7;mpw -t max github.com
: 1516918831:7;mpw -t max github.com
: 1516918845:5;mpw -t max github.com
: 1516918859:23;nvim ~/.mpw.d/Andrew\ Zah.mpsites.json
: 1516918910:0;rm ~/.mpw.d/=pYPxZk2w=cp2b987vgE.mpsites.json
: 1516918913:1;fg
: 1516918916:9;mpw -t max github.com
: 1516918968:4;git clone git@github.com:azah/cowapi.git
: 1516918999:0;git config --global user.name "Andrew Zah"
: 1516919009:0;git config --global user.email "zah@andrewzah.com"
: 1516919041:0;ls ~/.gitconfig
: 1516919045:0;cat ~/.gitconfig
: 1516919082:0;cat ~/.ssh/id_rsa.pub
: 1516919113:1;git clone git@github.com:azah/cowapi.git
: 1516919116:0;ls
: 1516919120:0;rm -rf cowapi
: 1516919121:0;l
: 1516919125:1;rm 10-monitor.conf
: 1516919128:0;ls
: 1516919473:0;lsblk -f
: 1516919485:0;lsblk -f
: 1516919493:0;lsblk -f
: 1516919496:0;lsblk -f
: 1516919500:0;lsblk -f
: 1516919514:0;mkdir /mnt/usb1
: 1516919517:4;sudo mkdir /mnt/usb1
: 1516919529:0;mount /dev/sde1 /mnt/usb1
: 1516919540:0;arch-chroot /mnt /bin/bash
: 1516919547:10;su root
: 1516919560:14;sudo su root
: 1516919579:0;cd /mnt/usb1
: 1516919579:0;l
: 1516919580:0;ls
: 1516919591:0;mv *.asc ~/Desktop
: 1516919593:0;sudo mv *.asc ~/Desktop
: 1516919595:0;ls
: 1516919600:0;cd ~/Desktop
: 1516919616:1;sudo pacman -S gnupg
: 1516919624:1;gpg
: 1516919629:0;gpg --import public.asc
: 1516919640:6;gpg --import secrets.asc
: 1516919658:3;fg
: 1516919678:0;gpg -K
: 1516919760:0;git config --global commit.gpgsign true
: 1516919779:0;git config --global user.signingkey A3AE4504
: 1516919798:0;pwd
: 1516919799:0;cd ..
: 1516919801:0;mkdir Sync
: 1516919803:0;cd Sync
: 1516919923:0;pwd
: 1516919926:0;tree .
: 1516919930:0;l
: 1516919932:0;ls
: 1516919941:0;cd ..
: 1516919945:0;cd Sync
: 1516919946:3;rm -rf *
: 1516919950:0;ls
: 1516919951:0;cd ..
: 1516919952:0;ls
: 1516920002:0;ls
: 1516920004:0;tree Sync
: 1516920026:1;tree Sync
: 1516920078:0;cd ~
: 1516920107:1;git clone git@github.com:azah/dotfiles.git
: 1516920111:0;l
: 1516920112:0;ls
: 1516920140:0;ls
: 1516920163:0;cd dotfiles
: 1516920169:0;ln .ctags ~/.ctags
: 1516920173:0;cat .ctags
: 1516920176:0;cd ..
: 1516920182:0;echo "a" >> .ctags
: 1516920188:0;cat dotfiles/.ctags
: 1516920193:2;nvim .ctags
: 1516920257:0;mkdir .zsh
: 1516920261:0;cd dotfiles
: 1516920265:0;cd zsh
: 1516920265:0;l
: 1516920266:0;ls
: 1516920270:0;cat aliases.zsh
: 1516920304:0;ls
: 1516920308:0;cat colors.zsh
: 1516920331:0;ln colors.zsh ~/.zsh/colors.zsh
: 1516920336:0;cat exports.zsh
: 1516920386:62;nvim ~/.zsh/exports.sh
: 1516920450:0;l
: 1516920450:0;ls
: 1516920453:0;cat functions.zsh
: 1516920486:0;ln functions.zsh ~/.zsh/functions.sh
: 1516920490:0;ls
: 1516920492:0;cat history.zsh
: 1516920507:0;ln history.zsh ~/.zsh/history.zsh
: 1516920510:0;cat setopt.zsh
: 1516920534:0;ln setopt.zsh ~/.zsh/setopt.zsh
: 1516920538:0;cat zsh-path.zsh
: 1516920570:0;mv ~/.zshrc ~/.zshrc.bak
: 1516920581:0;\
\

: 1516920582:0;cd ..
: 1516920588:0;ln .zshrc ~/.zshrc
: 1516920593:0;. ~/.zshrc
: 1516920598:0;cd ..
: 1516920604:0;cd .zsh
: 1516920605:0;l
: 1516920606:0;ls
: 1516920611:0;mv exports.sh exports.zsh
: 1516920620:0;mv functions.sh functions.zsh
: 1516920626:0;mv zsh_history zsh_history.zsh
