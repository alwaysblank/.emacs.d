;;; init-60-elfeed.el --- Code for feed reader

;;; Commentary:
;; Just some stuff to keep track of feeds!

;;; Code:
(require 'use-package)

(use-package elfeed
  :ensure t
  :bind ("C-x w" . elfeed))

;; Manage feeds with an org file
(use-package elfeed-org
  :ensure t
  :init (setq rmh-elfeed-org-files (list "~/.emacs.d/feed.org"))
  :config (elfeed-org))

;;; init-60
