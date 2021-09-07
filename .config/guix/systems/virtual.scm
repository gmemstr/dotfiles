(define-module (virtual)
  #:use-module (base-system)
  #:use-module (gnu))

(operating-system
 (inherit base-operating-system)
 (host-name "virtual"))
