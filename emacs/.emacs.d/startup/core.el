(use-package emacs
  :custom
  (global-display-line-numbers-mode 1)
  :config
  (add-hook 'text-mode 'blink-cursor-mode)
  (menu-bar--display-line-numbers-mode-relative)
  (column-number-mode))

(use-package emacs
  :config
  (set-face-attribute 'default nil :font "Overpass Mono" :height 240))

;; ("<leader>fi" . (indent-region (point-min) (point-max)))

(fset 'yes-or-no-p 'y-or-n-p)
(prefer-coding-system 'utf-8-unix)

;; White Space
(setq tab-width 2)
(setq-default indent-tabs-mode nil)

(require 'ls-lisp)
(setq ls-lisp-dirs-first t)
(setq ls-lisp-use-insert-directory-program nil)

(add-hook 'dired-mode-hook
          (lambda ()
            (dired-hide-details-mode)))

;; This disables bidirectional text to prevent "trojan source"
;; exploits, see https://www.trojansource.codes/
(setf (default-value 'bidi-display-reordering) nil)

;; ws-butler cleans up whitespace only on the lines you've edited,
;; keeping messy colleagues happy ;-) Important that it doesn't clean
;; the whitespace on currrent line, otherwise, eclim leaves messy
;; code behind.
(use-package ws-butler
  :init
  (setq ws-butler-keep-whitespace-before-point nil)
  :config
  (ws-butler-global-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Spell checking
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package ispell
  :init
  (setq ispell-program-name "aspell"
        ispell-list-command "list"
        ;; ispell-dictionary "british"
        flyspell-auto-correct-binding (kbd "<S-f12>")))

;; (use-package flycheck)
;; (add-hook 'text-mode-hook
          ;; '(lambda ()
          ;;    (flyspell-mode)))

(global-visual-line-mode 1)

;; Automatically reload files was modified by external program
(global-auto-revert-mode 1)
(setq revert-without-query (list "\\.png$" "\\.svg$")
      auto-revert-verbose nil)

(require 'recentf)
(recentf-mode 1)

;; Enable vertico
(use-package vertico
  :init
  (vertico-mode)

  ;; Different scroll margin
  ;; (setq vertico-scroll-margin 0)

  ;; Show more candidates
  ;; (setq vertico-count 20)

  ;; Grow and shrink the Vertico minibuffer
  ;; (setq vertico-resize t)

  ;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
  (setq vertico-cycle t)
  )

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))

;; Hide buffers starting with * on ibuffer
(require 'ibuf-ext)
(add-to-list 'ibuffer-never-show-predicates "^\\*")

(defadvice ibuffer-update-title-and-summary (after remove-column-titles)
   (with-current-buffer
      (set-buffer "*Ibuffer*")
      (read-only-mode 0)
      (goto-char 1)
      (search-forward "-\n" nil t)
      (delete-region 1 (point))
      (let ((window-min-height 1))
        ;; save a little screen estate
        (shrink-window-if-larger-than-buffer))
      (read-only-mode)))

(ad-activate 'ibuffer-update-title-and-summary)

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

;; Optionally use the `orderless' completion style.
;; (use-package orderless
;;   :ensure t
;;   :init
;;   ;; Configure a custom style dispatcher (see the Consult wiki)
;;   ;; (setq orderless-style-dispatchers '(+orderless-dispatch)
;;   ;;       orderless-component-separator #'orderless-escapable-split-on-space)
;;   (setq completion-styles '(orderless basic)
;;         completion-category-defaults nil
;;         completion-category-overrides '((file (styles partial-completion)))))

;; Modeline do Doom Emacs
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

;; Setup Theme
(use-package doom-themes
  :init
  (load-theme 'doom-oceanic-next t)
  :config
  (hl-line-mode)
  (blink-cursor-mode))

(use-package all-the-icons)

(use-package evil
  :demand t
  :init
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (evil-set-leader 'normal (kbd "SPC"))
  )

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (setq evil-want-integration t)
  (evil-collection-init))

(use-package evil-commentary
  :after evil
  :ensure t
  :config
  (evil-commentary-mode))

(use-package general
  :config
  (general-evil-setup t)
  (general-imap "j"
    (general-key-dispatch 'self-insert-command
      "k" 'evil-normal-state)))

(use-package emacs
  :after evil
  :bind (
         ("<leader>bb" . evil-switch-to-windows-last-buffer)
         ("<leader>bk" . kill-current-buffer)
         ("<leader>br" . revert-buffer)
         ("<leader>be" . eval-buffer)
         ("<leader>fs" . save-buffer)
         ("<leader>wh" . evil-window-left)
         ("<leader>wj" . evil-window-down)
         ("<leader>wk" . evil-window-up)
         ("<leader>wl" . evil-window-right)
         ("<leader>wq" . evil-quit)
         ("<leader>ss" . persp-switch)
         ("<leader>sr" . persp-rename)
         ("C-u" . evil-scroll-up)
         ))

(use-package perspective
  :bind
  ("C-x C-b" . persp-list-buffers)         ; or use a nicer switcher, see below
  :custom
  (persp-mode-prefix-key (kbd "C-c M-p"))  ; pick your own prefix key here
  :init
  (persp-mode))

;; Parens Settings
(show-paren-mode t)
;; (setq show-paren-style 'expression)

;; (use-package paren :ensure t)
;; (set-face-background 'show-paren-match (face-background 'default))
;; (set-face-attribute 'show-paren-match nil :weight 'extra-bold)

;; Highlight the current line
(use-package hl-line
  :after evil
  :init (progn
          (add-hook 'linum-mode 'hl-line-mode)
          (add-hook 'nlinum-mode 'hl-line-mode))
  :config (progn
            ;; only show hl-line in sleected window
            (setq hl-line-sticky-flag nil
                  global-hl-line-sticky-flag nil)

            ;; Initially enable hl-line
            (global-hl-line-mode 1)

            ;; Don't highlight the line in visual mode
            (add-hook 'evil-visual-state-entry-hook (lambda ()
                                                      (hl-line-mode -1)))
            (add-hook 'evil-visual-state-exit-hook 'hl-line-mode)))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

;; (dolist (mode '(eshell-mode-hook))
;;   (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; ;; Make ESC quit prompts
;; (global-set-key (kbd "<escape>") 'keyboard-escape-quit)
;; (global-set-key (kbd "<leader>fs") 'save-buffer)

;; ;; Salva uma lista de arquivos editados recentemente.
;; (recentf-mode 1)

;; ;; Configurações do histórico do Minibuffer.
;; (setq history-length 25)
;; (savehist-mode 1)

;; ;; Abre arquivos no ultimo lugar visitado.
;; (save-place-mode 1)

;; ;; Recarega arquivo caso tenha sido mudado por outro processo.
;; (global-auto-revert-mode 1)

;; ;; Mostra os comandos conforme você digita
;; (use-package command-log-mode)

;; ;;(use-package helpful
;; ;;  :custom
;; ;;  (counsel-describe-function-function #'helpful-callable)
;; ;;  (counsel-describe-variable-function #'helpful-variable)
;; ;;  :bind
;; ;;  ([remap describe-function] . counsel-describe-function)
;; ;;  ([remap describe-command] . helpful-command)
;; ;;  ([remap describe-variable] . counsel-describe-variable)
;; ;;  ([remap describe-key] . helpful-key))

;; ;; Org config

;; (setq org-directory "~/Documents/org/")

;; (setq scroll-preserve-screen-position t
;;       scroll-conservatively 0
;;       maximum-scroll-margin 0.5
;;       scroll-margin 99999)

(provide 'core)
