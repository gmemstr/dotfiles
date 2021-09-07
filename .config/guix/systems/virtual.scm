(define-module (virtual)
  #:use-module (base-system)
  #:use-module (gnu))

(operating-system
 (inherit base-operating-system)
 (host-name "virtual")
 (bootloader (bootloader-configuration
	      (bootloader grub-bootloader)
	      (target "/boot")
	      (keyboard-layout keyboard-layout))))
