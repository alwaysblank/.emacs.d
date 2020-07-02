;;; init.el --- Initialization code for emacs

;; Author: Ben Martinez-Bateman <ben@alwaysblank.org>
;; Maintainer: Ben Martinz-Bateman <ben@alwaysblank.org>
;; Created 27 June 2020

;;; Commentary:
;; Calls emacs config files to set everything up!
;;
;; Organization and some code borrowed from/inspired by:
;;     https://github.com/gjstein/emacs.d/

;;; Code

;; User Info
(setq user-full-name "Ben Martinez-Bateman")
(setq user-mail-address "ben@alwaysblank.org")

;; Install use-packge if necessary.
;; We need to it for...using packages (and also installing them).
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives (append package-archives
			       '(("org" . "https://orgmode.org/elpa/")
				 ("gnu" . "https://elpa.gnu.org/packages/"))))

;; This is more complicated so that we'll support https when available
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
  ;; and `package-pinned-packages`. Most users will not need or want to do this.
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  )
(package-initialize)

;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package diminish :ensure t)

;; Enable use-package
(eval-when-compile
  (require 'use-package))
(require 'diminish)       ;; if you use :diminish

;; Set the path variable
(use-package exec-path-from-shell
  :ensure t
  :config (exec-path-from-shell-initialize))

;; === Face Customization ===
(load-file "~/.emacs.d/config/init-10-face.el")

;; === Interface ===
(load-file "~/.emacs.d/config/init-20-nav-interface.el")

;; === Document Editing ===
;;; init-30 reserved for "general document settings"
(load-file "~/.emacs.d/config/init-30-doc-gen.el")
(load-file "~/.emacs.d/config/init-31-doc-org.el")

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(doom-modeline-buffer-state-icon t)
 '(doom-modeline-enable-word-count t)
 '(doom-modeline-mode t)
 '(package-selected-packages
   (quote
    (doom-modeline dracula-theme which-key use-package swiper-helm org-plus-contrib org-journal monokai-theme markdown-mode helm-org-rifle general exec-path-from-shell evil-surround evil-snipe diminish color-theme adoc-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Hack Nerd Font" :foundry "SRC" :slant normal :weight normal :height 120 :width normal)))))
