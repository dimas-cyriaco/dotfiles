
;;; To save the clock history across Emacs sessions, use
;; (if (file-exists-p org-clock-persist-file)
;;     ;; (setq org-clock-persist 'history)
;;     (org-clock-persistence-insinuate)
;;   (shell-command (concat "touch " org-clock-persist-file)))
;; (require 'org-clock)
;; (require 'org-timer)
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

(use-package mixed-pitch)
(use-package org-pomodoro)

(use-package org
  :after
  mixed-pitch
  :init
  (setq org-directory "~/Documents/org/")
  (setq org-superstar-headline-bullets-list '("⁖" "◉" "○" "✸" "✿"))
  (setq org-hide-emphasis-markers t)
  :config
  (add-to-list 'org-modules 'org-habit t)
  (setq org-habit-show-habits t)
  (setq org-agenda-files
        '("/Users/dimascyriaco/Documents/org/todo.org" "/Users/dimascyriaco/Documents/org/todo-work.org"))

  (setq org-todo-keywords
        '((sequence "TODO(t!)" "WIP(w!)" "NEXT(n!)" "PROJ(p!)" "LOOP(r!)" "WAIT(a@/!)" "HOLD(h@/!)" "IDEA(i@/!)" "|" "DONE(d@) CANCELED(e@)" "KILL(k@/!)")))

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
          ("t" "Personal todo" entry
           (file+headline +org-capture-todo-file "Inbox")
           "* TODO %?\n%i\n%a" :prepend t)
          ("n" "Personal notes" entry
           (file+headline +org-capture-notes-file "Inbox")
           "* %u %?\n%i\n%a" :prepend t))))

  (add-hook 'org-mode-hook 'mixed-pitch-mode)

  :bind (
         ("<leader>oa" . org-agenda)
         ("<leader>oc" . org-capture)
         ("<leader>ofw" . org-focus-work)
         ("<leader>ofp" . org-focus-personal)
         ("<leader>off" . org-focus-all)
         ("<leader>op" . org-pomodoro)
         )
  )

(defun org-focus-personal ()
  "Set agenda focus on personal tasks."
  (interactive)
  (setq org-agenda-files '("~/Documents/org/todo.org")))

(defun org-focus-work ()
  "Set agenda focus on work tasks."
  (interactive)
  (setq org-agenda-files '("~/Documents/org/todo-work.org")))

(defun org-focus-all ()
  "Remove agenda focus and show all tasks."
  (interactive)
  (setq org-agenda-files '("~/Documents/org/todo.org" "~/Documents/org/todo-work.org")))

(setq org-pomodoro-play-sounds nil)

(add-hook
 'org-pomodoro-started-hook
 (lambda ()
   (load-theme 'doom-oceanic-next t)))

(add-hook
  'org-pomodoro-killed-hook
  (lambda ()
    (load-theme 'almost-mono-gray t)))

(add-hook
  'org-pomodoro-finished-hook
  (lambda ()
    (load-theme 'almost-mono-gray t)))

(provide 'org-config)
