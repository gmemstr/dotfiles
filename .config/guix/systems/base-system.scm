;; This file is geneated from ~/dotfiles/guix/system-config/base.org
(define-module (base-system)
  #:use-module (gnu)
  #:use-module (srfi srfi-1)
  #:use-module (gnu system nss)
  #:use-module (gnu services pm)
  #:use-module (gnu services cups)
  #:use-module (gnu services desktop)
  #:use-module (gnu services docker)
  #:use-module (gnu services networking)
  #:use-module (gnu services virtualization)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages cups)
  #:use-module (gnu packages vim)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages file-systems)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages mtools)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages gnuzilla)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages web-browsers)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages package-management)
  #:use-module (nongnu packages linux)
  #:use-module (nongnu system linux-initrd))

(use-service-modules nix)
(use-service-modules desktop xorg)
(use-package-modules certs)
(use-package-modules shells)

(define %xorg-libinput-config
  "Section \"InputClass\"
  Identifier \"Touchpads\"
  Driver \"libinput\"
  MatchDevicePath \"/dev/input/event*\"
  MatchIsTouchpad \"on\"

  Option \"Tapping\" \"on\"
  Option \"TappingDrag\" \"on\"
  Option \"DisableWhileTyping\" \"on\"
  Option \"MiddleEmulation\" \"on\"
  Option \"ScrollMethod\" \"twofinger\"
EndSection
Section \"InputClass\"
  Identifier \"Keyboards\"
  Driver \"libinput\"
  MatchDevicePath \"/dev/input/event*\"
  MatchIsKeyboard \"on\"
EndSection
")

(define-public base-operating-system
  (operating-system
   (host-name "london")
   (timezone "Europe/London")
   (locale "en_US.utf8")

   ;; Nonfree stuff
   (kernel linux)
   (firmware (list linux-firmware))
   (initrd microcode-initrd)

   (keyboard-layout (keyboard-layout "us" "intl"))

   (bootloader (bootloader-configuration
		(bootloader grub-efi-bootloader)
		(target "/boot/efi")
		(keyboard-layout keyboard-layout)))

   (file-systems (cons*
		  (file-system
		   (device "/dev/sda1")
		   (mount-point "/boot")
		   (type "vfat"))
		  (file-system
		   (device "/dev/sda2")
		   (mount-point "/")
		   (type "ext4")) %base-file-systems))

   (users (cons (user-account
		 (name "gsimmer")
		 (comment "Gabriel Simmer")
		 (password (crypt "pass" "$6$abc"))
		 (group "users")
		 (supplementary-groups '("wheel" "netdev"
					"audio" "video"
					"docker" "kvm"
					"tty" "input"
					"realtime" "audio"
					"video")))
		%base-user-accounts))
   (groups (cons (user-group (system? #t) (name "realtime"))
		 %base-groups))

   (packages (append (list
		      git
		      exfat-utils
		      fuse-exfat
		      stow
		      vim
		      emacs
		      xterm
		      pulseaudio
		      xf86-input-libinput
		      nss-certs
		      gvfs) %base-packages))
   (services (append (list (service gnome-desktop-service-type)
			   (set-xorg-configuration
			    (xorg-configuration
			     (keyboard-layout keyboard-layout)))
			   (service docker-service-type))
		     %desktop-services))
   (name-service-switch %mdns-host-lookup-nss)))
