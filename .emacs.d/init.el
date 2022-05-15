(setq inhibit-startup-message t)
;; neccesary non-package related config
(setq auto-save-default nil)
(setq make-backup-files nil)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(set-face-attribute 'default nil :font "IBM Plex Mono" :height 120)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(set-fringe-mode 10)
(menu-bar-mode -1)

(setq org-edit-src-content-indentation 0
      org-src-tab-acts-natively t
      org-src-preserve-indentation t)

;; stupid hacks
(setenv "PATH"
	(concat "/usr/local/bin/go" "/home/gsimmer/projects/go/bin" (getenv "PATH")))

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
  :config (setq projectile-project-search-path '("~/projects"))
  :bind (:map projectile-mode-map
	      ("s-p" . projectile-command-map)
	      ("C-c p" . projectile-command-map)))
(use-package dired-sidebar :straight t :commands (dired-sidebar-toggle-sidebar))

;; lsp-mode stuff
(use-package eglot :straight t
	     :config (add-hook 'go-mode-hook 'eglot-ensure))
(use-package company :straight t
  :config (add-hook 'after-init-hook 'global-company-mode) (setq company-idle-delay 0) (setq company-minimum-prefix-length 1))
(use-package go-mode :straight t)
