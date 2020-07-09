;;; init-30-doc-org.el --- Code for initializing org-mode

;;; Commentary:
;; Runs org-mode along with some custom config.

;;; Code:

;; Basic setup
(setq org-directory "~/org/")
(setq org-default-notes-file "~/org/refile.org")

;; Let org handle indentation, please
(setq org-startup-indented t)

;; Ingest all org files, however deep, into the agenda
(setq org-agenda-files (directory-files-recursively "~/org/" "\\.org$"))

;; Set keys for Org
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

;; Capture templates for: TODO tasks, Notes, appointments, phone calls, meetings, and org-protocol
(setq org-capture-templates
      (quote (("t" "todo" entry (file "~/org/refile.org")
               "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
              ("r" "respond" entry (file "~/org/refile.org")
               "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n" :clock-in t :clock-resume t :immediate-finish t)
              ("n" "note" entry (file "~/org/refile.org")
               "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
	      ("j" "Journal entry" entry (function org-journal-find-location)
               "* %(format-time-string org-journal-time-format)%^{Title}\n%i%?")
              ("m" "Meeting" entry (file "~/org/refile.org")
               "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
              ("p" "Phone call" entry (file "~/org/refile.org")
               "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
              ("h" "Habit" entry (file "~/org/refile.org")
               "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n"))))

;; Set up journal
(use-package org-journal
  :ensure t
  :defer t
  :config
  (setq org-journal-dir "~/Documents/journal/"
        org-journal-date-format "%A, %d %B %Y"))

(defun org-journal-find-location ()
  ;; Open today's journal, but specify a non-nil prefix argument in order to
  ;; inhibit inserting the heading; org-capture will insert the heading.
  (org-journal-new-entry t)
  ;; Position point on the journal's top-level heading so that org-capture
  ;; will add the new entry as a child entry.
  (goto-char (point-min)))

;;; init-31-doc-org.el ends here
