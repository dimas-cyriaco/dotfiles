;; Configuração baseada em: https://vxlabs.com/2022/06/12/typescript-development-with-emacs-tree-sitter-and-lsp-in-2022/

;; Formatação com o Prettier
;; Requer que o Prettier esteja instalado globalmente
(use-package apheleia
  :ensure t
  :hook prog-mode)

;; LSP Client
;; Requer que o `typescript-language-server` esteja installdo globalmente.
(use-package eglot
  :ensure t
  :config
  (add-hook 'prog-mode 'eglot))

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
