(use-package esup
  :ensure t
  :pin melpa)

(use-package emacs
  :custom
  (display-line-numbers-width 4)
  ;; (global-display-line-numbers-mode 1)
  (indent-tabs-mode nil)
  (scroll-margin 10)
  (scroll-step 1)
  (tab-width 2)
  (visible-bell 1)
  :hook (
  (prog-mode . hs-minor-mode))
  (text-mode . blink-cursor-mode)
  (text-mode . turn-on-auto-fill)
  :config
  (column-number-mode +1)
  (electric-pair-mode +1)
  (global-auto-revert-mode +1)
  (if window-system (tool-bar-mode -1))
  (menu-bar--display-line-numbers-mode-relative)
  (save-place-mode +1))

(use-package emacs
  :config
  (set-face-attribute 'default nil :font "Overpass Mono" :height 200))

(use-package aweshell
  :quelpa (aweshell :fetcher github :repo "manateelazycat/aweshell"))

(dolist (mode '(eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(fset 'yes-or-no-p 'y-or-n-p)
(prefer-coding-system 'utf-8-unix)

;; Show directories first on dired
(require 'ls-lisp)
(setq ls-lisp-dirs-first t)
(setq ls-lisp-use-insert-directory-program nil)

(add-hook 'dired-mode-hook
          (lambda ()
            (dired-hide-details-mode)))

;; Next
;; (setq delete-by-moving-to-trash t)

;; (defun system-move-file-to-trash (file)
;;   "Use \"trash\" to move FILE to the system trash."
;;   (call-process (executable-find "trash")
;;     nil 0 nil
;;     file))

;; This disables bidirectional text to prevent "trojan source"
;; exploits, see https://www.trojansource.codes/
(setf (default-value 'bidi-display-reordering) nil)

;; (use-package origami :ensure t :hook prog-mode)

(use-package helpful
  :bind
  ([remap describe-function] . helpful-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . helpful-variable)
  ([remap describe-key] . helpful-key))

(use-package ripgrep)

(use-package magit
  ;; :ensure t
  :bind (("<leader>gg" . magit)))

;; ws-butler cleans up whitespace only on the lines you've edited,
;; keeping messy colleagues happy ;-) Important that it doesn't clean
;; the whitespace on currrent line, otherwise, eclim leaves messy
;; code behind.
(use-package ws-butler
  :init
  (setq ws-butler-keep-whitespace-before-point nil)
  :config
  (ws-butler-global-mode))

;; Spell checking
(use-package ispell
  :init
  (setq ispell-program-name "aspell"
        ispell-list-command "list"
        ;; ispell-dictionary "british"
        flyspell-auto-correct-binding (kbd "<S-f12>"))
  :hook flycheck)

;; (use-package wucuo
;;   :config
;;   (add-hook 'prog-mode-hook #'wucuo-start))

;; (use-package flycheck)
;; (add-hook 'text-mode-hook
;;           '(lambda ()
;;              (flyspell-mode)))

(global-visual-line-mode 1)

;; Automatically reload files was modified by external program
(setq revert-without-query (list "\\.png$" "\\.svg$")
      auto-revert-verbose nil)

(require 'recentf)
(recentf-mode 1)

;; Sun-setting
;; Hide buffers starting with * on ibuffer
;; (require 'ibuf-ext)
;; (add-to-list 'ibuffer-never-show-predicates "^\\*")

;; (defadvice ibuffer-update-title-and-summary (after remove-column-titles)
;;    (with-current-buffer
;;       (set-buffer "*Ibuffer*")
;;       (read-only-mode 0)
;;       (goto-char 1)
;;       (search-forward "-\n" nil t)
;;       (delete-region 1 (point))
;;       (let ((window-min-height 1))
;;         ;; save a little screen estate
;;         (shrink-window-if-larger-than-buffer))
;;       (read-only-mode)))

;; (ad-activate 'ibuffer-update-title-and-summary)

;; Modeline do Doom Emacs
(use-package doom-modeline
  ;; :ensure t
  :init (doom-modeline-mode 1))

(use-package color-theme-sanityinc-tomorrow)
(use-package doom-themes
  :config
  (load-theme 'doom-material t))

(use-package lambda-themes
  :quelpa
  (lambda-themes :fetcher github :repo "lambda-emacs/lambda-themes"))
  ;; :config
  ;; (load-theme 'lambda-dark t))

(use-package all-the-icons)

(use-package evil
  :custom
  (evil-shift-width 2)
  :init
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (evil-set-leader 'normal (kbd "SPC"))
  (evil-set-undo-system 'undo-redo))

(use-package evil-collection
  :after evil
  :config
  (setq evil-want-integration t)
  (evil-collection-init))

(use-package evil-commentary
  :after evil
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
  :bind (("C-;" . evil-switch-to-windows-last-buffer)
         ("<leader>bk" . kill-current-buffer)
         ("<leader>br" . revert-buffer)
         ("<leader>be" . eval-buffer)
         ("<leader>blr" . menu-bar--display-line-numbers-mode-relative)
         ("<leader>bla" . menu-bar--display-line-numbers-mode-absolute)
         ("<leader>fd" . dired-jump)
         ("<leader>fs" . save-buffer)
         ("<leader>wh" . evil-window-left)
         ("<leader>wj" . evil-window-down)
         ("<leader>wk" . evil-window-up)
         ("<leader>wl" . evil-window-right)
         ("<leader>wq" . evil-quit)
         ("<leader>ss" . persp-switch)
         ("<leader>sr" . persp-rename)
         ("<leader>hv" . describe-variable)
         ("<leader>hf" . describe-function)
         ("<leader>hk" . describe-key)
         ("<leader>to" . aweshell-next)
         ("<leader>tt" . aweshell-toggle)
         ("C-u" . evil-scroll-up)))

(use-package perspective
  :custom
  (persp-mode-prefix-key (kbd "C-c M-p"))  ; pick your own prefix key here
  :init
  (persp-mode))

;; Parens Settings
(use-package paren
  :init
  (show-paren-mode))
;; Sun-setting substituido pelo código acima.
;; (show-paren-mode t)

;; Highlight the current line
(use-package hl-line
  :after evil
  :init (progn
          (add-hook 'linum-mode 'hl-line-mode)
          (add-hook 'nlinum-mode 'hl-line-mode))
  :config (progn
            ;; only show hl-line in sleected window
            (setq hl-line-sticky-flag nil global-hl-line-sticky-flag nil)
            ;; Initially enable hl-line
            (global-hl-line-mode 1)
            ;; Don't highlight the line in visual mode
            (add-hook 'evil-visual-state-entry-hook (lambda () (hl-line-mode -1)))
            (add-hook 'evil-visual-state-exit-hook 'hl-line-mode)))

(use-package which-key
  :init (which-key-mode)
  :custom
  (which-key-idle-delay 0.3))

;; Bookmarks
(use-package emacs
  :bind (("<leader>mm" . consult-bookmark)
         ("<leader>ma" . bookmark-set)
         ("<leader>md" . bookmark-delete)
         ("<leader>mr" . bookmark-rename)))

(provide 'core)
