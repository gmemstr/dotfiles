(setq inhibit-startup-message t)
;; neccesary non-package related config
(setq auto-save-default nil)
(setq make-backup-files nil)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(set-face-attribute 'default nil :font "Jetbrains Mono" :height 120)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(set-fringe-mode 10)
(menu-bar-mode -1)

(setq org-edit-src-content-indentation 0
      org-src-tab-acts-natively t
      org-src-preserve-indentation t)

(setq-default tab-width 4)

;; stupid hacks
(global-set-key (kbd "C-c y") 'clipboard-yank)
(global-set-key (kbd "C-c x") 'kill-ring-save)

;; straight.el bootstrapping
(defvar bootstrap-version)
(let ((bootstrap-file
      (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
       (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; package list we want installed
;; first grab use-package :3
(straight-use-package 'use-package)
(use-package el-patch :straight t)
(use-package monokai-pro-theme
  :straight t
  :config (load-theme 'monokai-pro-spectrum t))
(use-package nano-theme
  :straight t)
(use-package doom-modeline
  :straight t
  :init (doom-modeline-mode 1)
  :custom (doom-mode-line-height 14))
(use-package all-the-icons :straight t)
(use-package paredit
  :straight t
  :config
  (add-hook 'emacs-lisp-mode-hook #'paredit-mode)
  (add-hook 'lisp-interaction-mode-hook #'paredit-mode)
  (add-hook 'ielm-mode-hook #'paredit-mode)
  (add-hook 'lisp-mode-hook #'paredit-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook #'paredit-mode))
(use-package which-key
  :straight t
  :config (which-key-mode))
(use-package projectile
  :straight t
  :init (projectile-mode +1)
  :config (setq projectile-project-search-path '("~/Projects"))
  :bind (:map projectile-mode-map
	      ("s-p" . projectile-command-map)
	      ("C-c p" . projectile-command-map)))

(use-package magit :straight t)

(use-package treemacs
  :straight t
  :init (with-eval-after-load 'winum
	  (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :bind
  (:map global-map
	("M-0" . treemacs-select-window)
	("C-x t t" . treemacs)
	("C-x t C-t" . treemacs-find-file)))
(use-package treemacs-projectile
  :straight t
  :after (treemacs projectile))

;; I hate that I need this, but WSL is /special/.
(when (and (eq system-type 'gnu/linux)
           (getenv "WSLENV"))
  (use-package exec-path-from-shell :straight t)
  (exec-path-from-shell-initialize))

;; Direnv integration
(use-package direnv :straight t)
(direnv-mode)

;; Fancy tabs
(use-package centaur-tabs :straight t
  :config
     (setq centaur-tabs-style "bar"
	  centaur-tabs-height 32
	  centaur-tabs-set-icons t
	  centaur-tabs-set-modified-marker t
	  centaur-tabs-show-navigation-buttons t
	  centaur-tabs-set-bar 'under
	  x-underline-at-descent-line t)
     (centaur-tabs-headline-match)
     (setq uniquify-separator "/")
     (setq uniquify-buffer-name-style 'forward)
  :bind ("C-<prior>" . centaur-tabs-backward)
  ("C-<next>" . centaur-tabs-forward))

;; lsp-mode stuff
(use-package eglot :straight t
	     :config (add-hook 'go-mode-hook 'eglot-ensure))
(use-package company :straight t
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1))
(use-package go-mode :straight t)
(use-package nix-mode :straight t
  :mode "\\.nix\\'")
(use-package yaml-mode :straight t)
(use-package terraform-mode :straight t)
(use-package yasnippet :straight t)
(yas-global-mode 1)
(use-package k8s-mode
  :straight t
  :config
  (setq k8s-search-documentation-browser-function 'browse-url-firefox)
  :hook (k8s-mode . yas-minor-mode))
(use-package kubernetes :straight t)
(use-package rust-mode :straight t)

(use-package olivetti :straight t)
(defun me/org-mode ()
  "My custom configuration for 'org-mode'."
  (olivetti-mode)
  (olivetti-set-width 80)
  )
(add-hook 'org-mode-hook 'me/org-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(nano))
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
