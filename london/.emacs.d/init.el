;; Mostly following along with System Crafter's videos.
;; So this will look pretty familiar.
(setq inhibit-startup-message  t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)

(menu-bar-mode -1)

(set-face-attribute 'default nil :font "IBM Plex Mono" :height 120)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Packages stuff.
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; I like Monokai Pro, sue me ;)
(use-package monokai-pro-theme
  :ensure t
  :config
  (load-theme 'monokai-pro-spectrum t))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom
   (doom-mode-line-height  15))
(use-package all-the-icons :ensure t)

(use-package treemacs
  :ensure t
  :defer t
  :init
  :bind (:map global-map
	      ("M-0" . treemacs-select-window)
	      ("C-x t t" . treemacs)))
(use-package treemacs-projectile
  :ensure t)
;; LSP config.
(use-package spinner :ensure t)
(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook ((rust-mode . lsp)
	 (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package lsp-ui :commands lsp-ui-mode)
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

(use-package rust-mode)

;; Can't have lisps without paredit!
(use-package paredit
  :ensure t
  :config
  (add-hook 'emacs-lisp-mode-hook #'paredit-mode)
  ;; enable in the *scratch* buffer
  (add-hook 'lisp-interaction-mode-hook #'paredit-mode)
  (add-hook 'ielm-mode-hook #'paredit-mode)
  (add-hook 'lisp-mode-hook #'paredit-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook #'paredit-mode))

(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
	      ("s-p" . projectile-command-map)
	      ("C-c p" . projectile-command-map))
  :config
  (setq projectile-project-search-path '("~/Projects")))

;; Ivy/Swiper/Counsel config.
(use-package swiper)
(use-package counsel)
(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)
	 ("C-l" . ivy-alt-done)
	 ("C-j" . ivy-next-line)
	 ("C-k" . ivy-previous-line)
	 :map ivy-switch-buffer-map
	 ("C-k" . ivy-previous-line)
	 ("C-l" . ivy-done)
	 ("C-d" . ivy-switch-buffer-kill)
	 :map ivy-reverse-i-search-map
	 ("C-k" . ivy-previous-line)
	 ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(treemacs-projectile projectile paredit all-the-fonts doom-modeline rust-mode swipe spinner lsp-treemacs lsp-ivy lsp-ui lsp-mode counsel swiper ivy treemacs use-package monokai-pro-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
