(use-package vertico
  :init
  (vertico-reverse-mode)
  (vertico-mode)

  ;; Different scroll margin
  ;; (setq vertico-scroll-margin 0)
  ;; Grow and shrink the Vertico minibuffer
  :custom
  (vertico-count 20)
  (vertico-cycle t)
  (vertico-resize t)
  :bind (:map vertico-map
            ("C-k" . vertico-next)
            ("C-j" . vertico-previous)))

(use-package savehist
  :init
  (savehist-mode)
  :custom
  history-length 25)

(use-package compat)

(use-package consult
  :bind (
         ("<leader>pf" . consult-ripgrep)
         ("<leader><" . consult-buffers)
         ("<leader>pb" . consult-project-buffer)
         ("<leader>hh" . consult-history))
  :hook (completion-list-mode . consult-preview-at-point-mode)
  :init
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref)
  :config
  (consult-customize
   consult-theme :preview-key '(:debounce 0.2 any)
   consult-ripgrep consult-git-grep consult-grep
   consult-bookmark consult-recent-file consult-xref
   consult--source-bookmark consult--source-file-register
   consult--source-recent-file consult--source-project-recent-file
   :preview-key '(:debounce 0.4 any))
  (setq consult-narrow-key "<")
)

(use-package consult-flycheck :after consult)

;; Enable rich annotations using the Marginalia package
(use-package marginalia
  ;; Either bind `marginalia-cycle' globally or only in the minibuffer
  :bind (("M-A" . marginalia-cycle)
         :map minibuffer-local-map
         ("M-A" . marginalia-cycle))

  ;; The :init configuration is always executed (Not lazy!)
  :init

  ;; Must be in the :init section of use-package such that the mode gets
  ;; enabled right away. Note that this forces loading the package.
  (marginalia-mode))

(use-package orderless
  :custom
  (orderless-matching-styles '(orderless-flex))
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

(provide 'minibuffer-completion)
