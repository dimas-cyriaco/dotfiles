(use-package projectile
  :ensure t
  :pin melpa-stable
  :init
  (projectile-mode +1)
  :bind (("<leader>pc" . projectile-switch-project)
         ("<leader>pp" . projectile-switch-open-project)
         ("<leader>pa" . projectile-command-map)
         ("<leader>ff" . projectile--find-file)
         ("<leader>bl" . projectile-ibuffer)
         ("<leader>bn" . projectile-next-project-buffer)
         ("<leader>bp" . projectile-previous-project-buffer)
         ("<leader>fS" . projectile-save-project-buffers)
         ("<leader>bK" . projectile-kill-buffers)
         ("<leader>fr" . projectile-recentf)
         ("<leader>ps" . projectile-grep)))

(provide 'projectile-config)
