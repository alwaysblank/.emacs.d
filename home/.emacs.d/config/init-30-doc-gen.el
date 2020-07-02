;;; init-30-doc-gen.el --- Code for general document editing

;;; Commentary:
;; Set up come general document editing things.

;; Keep autosaves in one location
(setq backup-directory-alist
          `(("." . ,(concat user-emacs-directory "backups"))))

;;; init-30-doc-gen.el ends here
