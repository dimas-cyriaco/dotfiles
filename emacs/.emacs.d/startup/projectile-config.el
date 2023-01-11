(use-package projectile
  ;; :after rg
  :custom
  (projectile-buffers-filter-function 'projectile-buffers-with-file-or-process)
  ;; (projectile-ignored-project-function #'my/projectile-ignored-project-function)
  :init
  (setq projectile-indexing-method 'alien)
  (setq projectile-sort-order 'recentf)
  (setq projectile-per-project-compilation-buffer t)
  :pin melpa-stable
  :init
  (projectile-mode +1)
  :bind (
         ("<leader>," . projectile-switch-to-buffer)
         ("<leader>SPC" . projectile-find-file)
         ("<leader>bK" . projectile-kill-buffers)
         ("<leader>bn" . projectile-next-project-buffer)
         ("<leader>bp" . projectile-previous-project-buffer)
         ("<leader>fS" . projectile-save-project-buffers)
         ("<leader>fr" . projectile-recentf)
         ("<leader>pa" . projectile-command-map)
         ("<leader>pd" . projectile-dired)
         ("<leader>pf" . projectile-ripgrep)
         ("<leader>pp" . projectile-switch-open-project)
         ("<leader>ps" . projectile-switch-project)
         ("<leader>to" . projectile-run-term)
         ))

(defun my/projectile-ignored-project-function(project-root)
  (member t (mapcar
             #'(lambda (dir)
                 (string-prefix-p dir project-root)
                 )
             find-project-ignore-dir
             )))

(defcustom find-project-ignore-dir
  '("/usr")
  ""
  :type 'list)

(provide 'projectile-config)
