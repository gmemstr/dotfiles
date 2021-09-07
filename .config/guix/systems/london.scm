(define-module (london)
  #:use-module (base-system)
  #:use-module (gnu))

(operating-system
 (inherit base-operating-system)
 (host-name "london")

 (file-systems (cons*
		(file-system
		 (device "/dev/nvme0n1p1")
		 (mount-point "/boot/efi")
		 (type "vfat"))
		(file-system
		 (device "/dev/nvme0n1p2")
		 (mount-point "/")
		 (type "ext4"))
		%base-file-systems)))
