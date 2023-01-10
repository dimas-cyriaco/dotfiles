(use-package projectile
  :ensure t
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

(provide 'projectile-config)
