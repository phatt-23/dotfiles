;;emacs configuration
(setq inhibit-startup-message t)

;;gui
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
(menu-bar-mode -1)

;;visible bell (disable)
(setq visible-bell nil)

;;font
(set-face-attribute 'default nil :font "MesloLGM Nerd Font 14" :height 140)

;;keybinds
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;;line and column numbers
(column-number-mode)
(global-display-line-numbers-mode 1)

(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		vterm-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;;indent
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;;directory to dump emacs autosave bullsh*t
(setq backup-directory-alist '(("." . "~/.emacs_saves")))

;;packages
(require 'package)
(setq package-archives '(("melpa"        . "https://melpa.org/packages/")
			 ("melpa-stable" . "https://stable.melpa.org/packages/")
			 ("org"          . "https://orgmode.org/elpa/")
			 ("gnu"          . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package all-the-icons)

(use-package ivy 
  :diminish
  :bind (("C-s" . swiper)
	 :map ivy-switch-buffer-map
	 ("C-d" . ivy-switch-buffer-kill)
	 :map ivy-reverse-i-search-map
	 ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package ivy-rich
  :init (ivy-rich-mode 1))

(use-package counsel)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.0))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . 'counsel-minibuffer-history)))

(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(use-package evil)

(use-package general
  :config
  (general-create-definer phatt/leader-keys
    :keymaps 'override
    :prefix "C-,")
  (phatt/leader-keys
     "tt" '(counsel-load-theme :which-key "choose theme")))

(general-define-key
 "C-x b" 'counsel-switch-buffer
 "C-v" 'evil-scroll-down
 "M-v" 'evil-scroll-up)

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (when (file-directory-p "~/Programming")
    (setq projectile-project-search-path '("~/Programming")))
  (setq projectile-switch-project-action #'projectile-dired))

(use-package counsel-projectile
  :config (counsel-projectile-mode))

;; (use-package magit
;;   :custom (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

(use-package org)

(defun efs/lsp-mode-setup ()
  (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
  (lsp-headerline-breadcrumb-mode))

(use-package lsp-mode
  :commands (lsp lsp-deffered)
  :hook (lsp-mode . efs/lsp-mode-setup)
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (lsp-enable-which-key-integration t))


(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :commands lsp-ui-mode
  :bind (("C-c l h f" . lsp-ui-doc-focus-frame)
	 ("C-c l h d" . lsp-ui-doc-hide)))

(setq lsp-ui-doc-position 'bottom)

(use-package lsp-treemacs
  :after lsp)

(use-package company
  :after lsp-mode
  :hook (lsp-mode . company-mode)
  :bind
  (:map company-active-map
	("<tab>" . company-complete-selection))
  (:map lsp-mode-map
	("<tab>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))

(use-package company-box
  :hook (company-mode . company-box-mode))

(use-package drag-stuff
  :config (drag-stuff-mode t))

(global-set-key (kbd "M-n") 'drag-stuff-down)
(global-set-key (kbd "M-p") 'drag-stuff-up)

(use-package eterm-256color
  :hook (term-mode . eterm-256color-mode))

(use-package vterm
  :hook (vterm-mode . term-mode))

;; (use-package moody
;;   :config
;;   (moody-replace-mode-line-front-space)
;;   (moody-replace-mode-line-buffer-identification)
;;   (moody-replace-vc-mode))

;; (set-face-attribute 'mode-line nil :box nil)
;; (set-face-attribute 'mode-line-inactive nil :box nil)

(use-package minions
    :config (minions-mode t))

(use-package multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(use-package breadcrumb)

;;theme
;(use-package modus-themes
;  :config
;  (load-theme 'modus-vivendi))

;; (use-package gruvbox-theme
;;   :config
;;   (load-theme 'gruvbox-dark-medium t))

;; (use-package gruber-darker-theme
;;   :config
;;   (load-theme 'gruber-darker t))

(load-theme 'leuven t)

(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(setq highlight-indent-guides-method 'character)

;;lsp
(use-package rustic)
(use-package lua-mode)

;;; LaTeX mode
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(use-package auctex
  :ensure t
  :hook
  (LaTex-mode . turn-on-prettify-symbols-mode)
  (LaTex-mode . turn-on-flyspell))

(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

;;; init.el ends here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(math-preview latex-preview-pane latex-math-preview latex-pretty-symbols prettify-math imenu-list lua-mode rustic gruvbox-theme breadcrumb multiple-cursors minions vterm eterm-256color drag-stuff company-box company lsp-treemacs lsp-ui lsp-mode magit counsel-projectile projectile general evil helpful which-key rainbow-delimiters doom-modeline counsel ivy-rich ivy all-the-icons)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
