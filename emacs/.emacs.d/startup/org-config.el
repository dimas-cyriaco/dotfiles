;; Sun-setting
;; (use-package mixed-pitch)
(use-package org-pomodoro)
(use-package org-roam
  init
  (setq org-roam-v2-ack t)
  (org-roam-completion-everywhere t)
  :custom
  (org-roam-directory "~/Documents/org/roam")
  :config
  (require 'org-roam-dailies)
  (org-roam-db-autosync-mode)
  :bind-keymap
  ("C-c n d" . org-roam-dailies-map))
(use-package org-roam-ui)

(use-package evil-org
  :after org
  :hook (org-mode . (lambda () evil-org-mode))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(use-package org-contacts
  :ensure nil
  :after org
  :custom (org-contacts-files '("~/Documents/org/contacts.org")))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode))

(defvar +org-capture-todo-file "todo.org"
  "Default target for todo entries.")

(defvar +org-agenda-files '("~/Documents/org/todo.org" "~/Documents/org/todo-work.org"))

(setq org-refile-targets
      '(("~/Documents/org/todo.org" :maxlevel . 1)
        ("~/Documents/org/todo-work.org" :maxlevel . 1)))

(use-package org
  :custom
  (org-todo-keywords-for-agenda '("CLOSED" "DONE" "CONT" "TEST" "CODE-REVIEW" "WIP" "TODO"))
  (org-agenda-dim-blocked-tasks t)
  (org-agenda-files +org-agenda-files)
  (org-clock-in-resume t)
  (org-directory "~/Documents/org/")
  (org-ellipsis "…")
  (org-enforce-todo-checkbox-dependencies t)
  (org-enforce-todo-dependencies t)
  (org-fold-catch-invisible-edits 'show-and-error)
  (org-habit-show-habits t)
  (org-hide-emphasis-markers t)
  (org-log-done 'time)
  (org-log-into-drawer t)
  (org-pretty-entities t)
  (org-track-ordered-property-with-tag t)
  :custom-face
  (org-level-1 ((t (:inherit outline-1 :height 1.4)))))

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
         (("p" "Private templates")
          ("r" "Reviews")
          ("b" "Adicionar Bookmark" entry
           (file+headline "~/Documents/org/bookmarks.org" "Inbox")
           (file "~/Documents/org/templates/bookmark.org"))
          ("pt" "TODO entry" entry
           (file+headline "~/Documents/org/todo.org" "Inbox")
           (file "~/Documents/org/templates/todo.txt"))
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
           "* %u %?\n%i\n%a" :prepend t))))

  ;; (add-hook 'org-mode-hook 'mixed-pitch-mode)
  (add-hook 'org-mode-hook 'org-indent-mode)
  (add-hook 'org-mode-hook (lambda () (setq line-spacing 0.1)))

  (add-hook
   'org-pomodoro-started-hook
   (lambda ()
     (load-theme 'sanityinc-tomorrow-night t)))

  (add-hook
   'org-pomodoro-killed-hook
   (lambda ()
     (load-theme 'sanityinc-tomorrow-day t)))

  (add-hook
   'org-pomodoro-finished-hook
   (lambda ()
     (load-theme 'sanityinc-tomorrow-day t)))

  (setq org-pomodoro-play-sounds nil))

(defun org-focus-personal ()
  "Set agenda focus on personal tasks."
  (interactive)
  (setq org-agenda-files '("~/Documents/org/todo.org"))
  (setq +org-capture-todo-file "todo.org"))

(defun org-focus-work ()
  "Set agenda focus on work tasks."
  (interactive)
  (setq org-agenda-files '("~/Documents/org/todo-work.org"))
  (setq +org-capture-todo-file "todo-work.org"))

(defun org-focus-all ()
  "Remove agenda focus and show all tasks."
  (interactive)
  (setq org-agenda-files '("~/Documents/org/todo.org" "~/Documents/org/todo-work.org"))
  (setq +org-capture-todo-file "todo.org"))

(use-package org-capture
  :ensure nil
  :after org
  :custom
  (org-capture-templates
        (quote
         (("p" "Private templates")
          ("r" "Reviews")
          ("b" "Adicionar Bookmark" entry
           (file+headline "~/Documents/org/bookmarks.org" "Inbox")
           (file "~/Documents/org/templates/bookmark.org"))
          ("pt" "TODO entry" entry
           (file+headline "~/Documents/org/todo.org" "Inbox")
           (file "~/Documents/org/templates/todo.txt"))
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

(provide 'org-config)
