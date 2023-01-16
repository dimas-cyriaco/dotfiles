;;; org-config --- Esse arquivo configura o Org Mode

;;; Commentary:
;;; Code:

;; Variables
(defvar dc/org-directory (concat (getenv "HOME") "/Documents/org/"))
(defvar dc/personal-todo-file "~/Documents/org/todo.org")
(defvar work-todo-file "~/Documents/org/todo-work.org")
(defvar dc/contacts-file (concat dc/org-directory "contacts.org"))
(defvar dc/default-capture-todo-file "~/Documents/org/todo.org")
(defvar dc/agenda-files '("~/Documents/org/todo.org" "~/Documents/org/todo-work.org"))

;; Sun-setting
;; (use-package mixed-pitch)
(use-package org-pomodoro)
(use-package org-roam-ui)

(use-package evil-org
  :after org
  :hook (org-mode . (lambda () evil-org-mode))
  :config
  (require 'evil-org-agenda))
  ;; Sun-setting
  ;; (evil-org-agenda-set-keys))

(use-package org-contacts
  :ensure nil
  :after org
  :custom (org-contacts-files "~/Documents/org/contacts.org"))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode))

(use-package org
  :custom
  (org-agenda-dim-blocked-tasks t)
  (org-agenda-files dc/agenda-files)
  (org-clock-in-resume t)
  (org-directory dc/org-directory)
  (org-ellipsis "…")
  (org-enforce-todo-checkbox-dependencies t)
  (org-enforce-todo-dependencies t)
  (org-fold-catch-invisible-edits 'show-and-error)
  (org-habit-show-habits t)
  (org-hide-emphasis-markers t)
  (org-log-done 'time)
  (org-log-into-drawer t)
  (org-pretty-entities t)
  (org-refile-targets
   '(("~/Documents/org/todo.org" :maxlevel . 1)
     ("~/Documents/org/todo-work.org" :maxlevel . 1)))
  (org-todo-keywords-for-agenda '("CLOSED" "DONE" "CONT" "TEST" "CODE-REVIEW" "WIP" "TODO"))
  (org-track-ordered-property-with-tag t))

;; Sun-setting org custom:
;; (org-auto-align-tags nil)
;; (org-clock-persist t)
;; (org-insert-heading-respect-content t)
;; (org-tags-column 0)

;; Org Agenda config
(use-package org
  :bind (("<leader>oa" . org-agenda)
         ("<leader>oc" . org-capture)
         ("<leader>ofw" . org-focus-work)
         ("<leader>ofp" . org-focus-personal)
         ("<leader>off" . org-focus-all)
         ("<leader>op" . org-pomodoro)
         ("<leader>os" . org-schedule)
         ("<leader>ot" . org-todo))

  :config
  (require 'org-clock)
  (org-clock-persistence-insinuate)
  (add-to-list 'org-modules 'org-habit t)

  (setq org-todo-keywords
        '((sequence "TODO(t!)" "WIP(w!)" "NEXT(n!)" "PROJ(p!)" "LOOP(r!)" "WAIT(a@/!)" "HOLD(h@/!)" "IDEA(i@/!)" "|" "DONE(d@)" "CANCELED(e@)" "KILL(k@/!)")))

  (setq org-track-ordered-property-with-tag t)
  (setq org-enforce-todo-dependencies t)
  (setq org-agenda-dim-blocked-tasks t)
  (setq org-enforce-todo-checkbox-dependencies t)

  (setq org-capture-templates
        (quote
         (("b" "Bookmark" entry
           (file+headline "~/Documents/org/bookmarks.org" "Inbox")
           (file "~/Documents/org/templates/bookmark.org"))
          ("l" "Livro" entry
           (file+headline "~/Documents/org/todo.org" "Reading List")
           (file "~/Documents/org/templates/book-to-read.org"))
          ("n" "Note" entry
           (file+headline "todo.org" "Inbox")
           "* %u %?\n%i\n%a" :prepend t)
          ("t" "TODO" entry
           (file+headline "todo.org" "Inbox")
           "* TODO %?\n%i\n%a" :prepend t)
          ("r" "Reviews")
          ("rs" "Review Semanal" entry
           (file get-weekly-filename)
           (file "~/Documents/org/templates/weekly-review.org")))))

  ;; Sun-setting mixed-pitch-mode
  ;; (add-hook 'org-mode-hook 'mixed-pitch-mode)
  (add-hook 'org-mode-hook 'org-indent-mode)
  ;; (add-hook 'org-mode-hook (lambda () (setq line-spacing 0.1)))

  (add-hook
   'org-pomodoro-started-hook
   (lambda ()
     (load-theme 'doom-material t)))

  (add-hook
   'org-pomodoro-killed-hook
   (lambda ()
     (load-theme 'lambda-dark t)))

  (add-hook
   'org-pomodoro-finished-hook
   (lambda ()
     (load-theme 'lambda-dark t)))

  (setq org-pomodoro-play-sounds nil))

(defun get-weekly-filename ()
  "Get the file name for the weekly file."
  (concat org-directory (format-time-string "weekly/%Y-%W.org")))

(defun org-focus-personal ()
  "Set agenda focus on personal tasks."
  (interactive)
  (setq org-agenda-files '("~/Documents/org/todo.org"))
  (setq +org-capture-todo-file "todo.org"))

(defun org-focus-work ()
  "Set agenda focus on work tasks."
  (interactive)
  (setq org-agenda-files '(dc/work-todo-file))
  (setq dc/default-capture-todo-file "todo-work.org"))

(defun org-focus-all ()
  "Remove agenda focus and show all tasks."
  (interactive)
  (setq org-agenda-files '("~/Documents/org/todo.org" dc/work-todo-file))
  (setq dc/default-capture-todo-file "todo.org"))

(use-package org-capture
  :ensure nil
  :after org
  :custom
  (org-capture-templates
        (quote
         (("b" "Adicionar Bookmark" entry
           (file+headline "~/Documents/org/bookmarks.org" "Inbox")
           (file "~/Documents/org/templates/bookmark.org"))
          ("r" "Reviews")
          ("rs" "Review Semanal" entry
           (file get-weekly-filename)
           (file "~/Documents/org/templates/weekly-review.org"))
          ("l" "Adicionar livro na lista de leitura" entry
           (file+headline "~/Documents/org/todo.org" "Reading List")
           (file "~/Documents/org/templates/book-to-read.org"))
          ("t" "Todo" entry
           (file+headline "todo.org" "Inbox")
           "* TODO %?\n%i\n%a" :prepend t)
          ("n" "Personal notes" entry
           (file+headline "todo.org" "Inbox")
           "* %u %?\n%i\n%a" :prepend t)
          ("c" "Contact" entry
           (file+headline "~/Documents/org/contacts.org" "Friends")
           (file "~/Documents/org/templates/contact.org"))))))

(use-package org-roam
  :after org
  ;; :init
  ;; (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory dc/org-directory)
  (org-roam-completion-everywhere t)
  (org-roam-capture-templates
   '(("n" "note" plain "%?"
      :target (file+head "${slug}.org"
                         "#+title: ${title}\n#+date: %u\n#+lastmod: \n\n")
      :immediate-finish t))
   time-stamp-start "#\\+lastmod: [\t]*")
  (org-roam-dailies-capture-templates
    '(("d" "daily" entry "* %<%I:%M %p>: %?"
       :if-new (file+head "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n"))))
  :config
  (require 'org-roam-dailies)
  (org-roam-db-autosync-mode))
  ;; Sun-setting bind-keymap to leader
  ;; :bind-keymap
  ;; ((kbd ("<space>or")) . org-roam-dailies-map))

(provide 'org-config)

;;; org-config.el ends here
