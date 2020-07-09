;;; init-20-nav-interface.el --- Customize emacs interface

;;; Commentary:

;;; Code:
(require 'use-package)

(use-package counsel
  :ensure t
  :after ivy
  :config (counsel-mode))

(use-package ivy
  :ensure t
  :defer 0.1
  :diminish
  :bind (("C-c C-r" . ivy-resume)
         ("C-x B" . ivy-switch-buffer-other-window))
  :custom
  (ivy-count-format "(%d/%d) ")
  (ivy-use-virtual-buffers t)
  :config (ivy-mode))

(use-package swiper
  :ensure t
  :after ivy
  :bind (("C-s" . swiper)
         ("C-r" . swiper)))

(use-package neotree
  :ensure t
  :config (global-set-key [f8] 'neotree-toggle))

;; vim-like keybindings
(use-package evil
	     :ensure t
	     :config (evil-mode 1))

;; Add support for surround tools in evil
(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

;; Add some nice git support
(use-package magit
	     :ensure t
	     :config (global-set-key (kbd "C-x g") 'magit-status))

;; Evil keybindings for magit
(use-package evil-magit
  :ensure t)

;;; init-20-nav-interface.el ends here
