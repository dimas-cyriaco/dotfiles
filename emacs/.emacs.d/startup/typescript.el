;; Configuração baseada em: https://vxlabs.com/2022/06/12/typescript-development-with-emacs-tree-sitter-and-lsp-in-2022/

;; Formatação com o Prettier
;; Requer que o Prettier esteja instalado globalmente
;; TODO Não está ativando automaticamente
(use-package apheleia
  :ensure t
  ;; :hook (prog-mode . apheleia-mode)
  :config
  (add-hook 'prog-mode-hook 'apheleia-global-mode))

;; LSP Client
;; Requer que o `typescript-language-server` esteja installdo globalmente.
;; (use-package eglot
;;   :ensure t
;;   :config
;;   (add-hook 'prog-mode 'eglot))

;; TODO Não está ativando automaticamente
(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook (;;(prog-mode . lsp-mode)
         (prog-mode . lsp-dired-mode))
  :commands lsp
  ;; :hook
  ;; (lsp-mode . lsp-headerline-breadcrumb-mode)
  ;; :config
  ;; (add-hook 'lsp-mode-hook #'lsp-headerline-breadcrumb-mode))
  :config
  (setq lsp-headerline-breadcrumb-enable nil)
  (lsp-enable-which-key-integration t)
  :bind (
         ("<leader>ca" . lsp-execute-code-action)
         )
  )
  ;; (lsp-headerline-breadcrumb-mode nil))

;; flycheck-select-checker
(use-package flycheck
  :bind (
         ("<leader>cdn" . flycheck-next-error)
         ("<leader>cdp" . flycheck-previous-error)
         )
  )

;; (use-package lsp-ui
;;   :custom
;;   (lsp-ui-sideline-show-diagnostics t)
;;   (lsp-ui-doc-enable t)
;;   :hook (lsp-mode . lsp-ui-mode)
;;   :commands lsp-ui-mode)

(setq lsp-ui-doc-enable t
      lsp-ui-peek-enable t
      lsp-ui-sideline-enable t
      lsp-ui-imenu-enable t
      lsp-ui-flycheck-enable t)

(use-package typescript-mode
  :mode "\\.ts\\'"
  :hook (typescript-mode . lsp)
  :config
  (setq typescript-indent-level 2))

;; Code Completion
(use-package company
  :ensure t
  :hook text-mode
  :config
  (setq-local company-backends '((:separate company-yasnippet company-capf company-keywords))))

;; Snippets
(use-package yasnippet
  :ensure t
  :config
  (add-to-list 'yas-snippet-dirs "~/dotfiles/emacs/.emacs.d/snippets")
  (yas-global-mode 1))

(provide 'typescript)
