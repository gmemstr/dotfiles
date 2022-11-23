(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(monokai-pro-spectrum))
 '(custom-safe-themes
   '("fb83a50c80de36f23aea5919e50e1bccd565ca5bb646af95729dc8c5f926cbf3" "e7820b899036ae7e966dcaaec29fd6b87aef253748b7de09e74fdc54407a7a02" "1781e8bccbd8869472c09b744899ff4174d23e4f7517b8a6c721100288311fa5" default))
 '(safe-local-variable-values
   '((eval modify-syntax-entry 43 "'")
	 (eval modify-syntax-entry 36 "'")
	 (eval modify-syntax-entry 126 "'")
	 (eval let
		   ((root-dir-unexpanded
			 (locate-dominating-file default-directory ".dir-locals.el")))
		   (when root-dir-unexpanded
			 (let*
				 ((root-dir
				   (expand-file-name root-dir-unexpanded))
				  (root-dir*
				   (directory-file-name root-dir)))
			   (unless
				   (boundp 'geiser-guile-load-path)
				 (defvar geiser-guile-load-path 'nil))
			   (make-local-variable 'geiser-guile-load-path)
			   (require 'cl-lib)
			   (cl-pushnew root-dir* geiser-guile-load-path :test #'string-equal))))
	 (eval setq-local guix-directory
		   (locate-dominating-file default-directory ".dir-locals.el"))))
 '(warning-suppress-log-types '((comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
