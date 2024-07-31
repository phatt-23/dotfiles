;;Emacs configuration
(setq inhibit-startup-message t)
;;gui
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)

(menu-bar-mode -1)
;;visible bell
(setq visible-bell t)

;;font
(set-face-attribute 'default nil :font "Fira Code Retina" :height 140)
;;theme
(load-theme 'catppuccin)


(global-set-key (kbd "<escape>") 'keyboard-escape-quit)


;;Packages
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("melpa-stable" . "https://stable.melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("gnu" . "https://elpa.gnu.org/packages/")))

 
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
	 :map ivy-switch-buffer-map
	 ("C-d" . ivy-switch-buffer-kill)
	 :map ivy-reverse-i-search-map
	 ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package counsel)

(use-package rustic)

(require 'terminal-here)
(setq terminal-herel-linux-terminal-command 'urxvt)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))












;;; init.el ends here


