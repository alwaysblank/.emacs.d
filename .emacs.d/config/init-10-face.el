;;; init-10-face.el --- Customize the look of emacs

;;; Commentary:

;;; Code:
(require 'use-package)

;; == Load Custom Theme ==

;;(use-package dracula-theme
;;  :ensure t
;;  :defer t)
;;(load-theme 'dracula t)

;; Use "Hack" font
(custom-set-faces
 '(default ((t (:family "Hack Nerd Font" :foundry "SRC" :slant normal :weight normal :height 120 :width normal)))))

;; Set default fill column
(setq-default fill-column 80)

;; quiet, please! No dinging!
(setq visible-bell nil)

;; Disable menu bars, etc.
(if window-system (scroll-bar-mode -1))
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Save more 'recent files'
(setq recentf-max-menu-items 127)
(setq recentf-max-saved-items 127)

;; Add some icons!
(use-package all-the-icons
  :ensure t)

;; Set up Ivy to use those icons
(use-package all-the-icons-ivy
	     :ensure t
  :init (add-hook 'after-init-hook 'all-the-icons-ivy-setup))

;; User Doom modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))
(setq doom-modeline-icon t)

(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-dracula t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

;;; init-10-face.el ends here
