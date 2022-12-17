;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Dimas Cyriaco"
      user-mail-address "dimascyriaco@icloud.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "Overpass Mono" :size 20)
   doom-variable-pitch-font (font-spec :family "Overpass" :size 20))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-oceanic-next)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)
(setq menu-bar--display-line-numbers-mode-relative t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/org/")

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; lsp-modeline-code-actions-mode

(setq-default tab-width 2)

(setq efs/default-font-size 200)

;; Emacs doesn't play well with fish
;; (setq shell-file-name "/bin/bash")

;; Configura os bullets para o Org Mode.
(setq org-superstar-headline-bullets-list '("⁖" "◉" "○" "✸" "✿"))

(setq +treemacs-git-mode 'deferred)
(setq treemacs-filewatch-mode t)
(setq treemacs-follow-mode t)

(require 'treemacs-all-the-icons)
(treemacs-load-theme "all-the-icons")

;; (setq doom-themes-treemacs-theme `doom-colors)
(setq doom-themes-treemacs-theme "doom-colors")

(setq org-hide-emphasis-markers t)

;; (map! :leader :desc "Safe file" :n "C-c" #'dosomething)

(setq org-journal-date-format "%a, %d/%m/%y"
  org-journal-file-format "%Y-%m-%d.org")

(setq explicit-shell-file-name "/bin/zsh")
(setq shell-file-name "zsh")
(setq explicit-zsh-args '("--login" "--interactive"))
(defun zsh-shell-mode-setup ()
  (setq-local comint-process-echoes t))
(add-hook 'shell-mode-hook #'zsh-shell-mode-setup)
;; (use-package! eshell
;;   :config
;;   (setq eshell-history-size 10000
;;     eshell-buffer-maximum-lines 10000
;;     eshell-hist-ignoredups t
;;     eshell-scroll-to-bottom-on-input t))

;; (after! org
;;   (add-to-list 'org-capture-templates
;;              '(("d" "Dream" entry
;;                (file+headline +org-capture-todo-file "Dream")
;;                "* TODO %?\n :PROPERTIES:\n :CATEGORY: dream\n :END:\n %i\n"
;;                :prepend t :kill-buffer t))

(setq delete-by-moving-to-trash t)

(defun system-move-file-to-trash (file)
  "Use \"trash\" to move FILE to the system trash."
  (call-process (executable-find "trash")
    nil 0 nil
    file))

(add-hook! 'org-mode-hook 'mixed-pitch-mode)

(setq scroll-preserve-screen-position t
      scroll-conservatively 0
      maximum-scroll-margin 0.5
      scroll-margin 99999)

(setq org-mobile-directory "/Users/dimascyriaco/Library/Mobile Documents/iCloud~com~mobileorg~mobileorg/Documents")
(setq org-mobile-inbox-for-pull "~/Documents/org/sync.org")

(setq org-log-done 'time)

(setq org-todo-keywords
      '((sequence "TODO(t)" "WIP(w)" "NEXT(n)" "PROJ(p)" "LOOP(r)" "STRT(s)" "WAIT(a)" "HOLD(h)" "IDEA(i)" "|" "DONE(d) CANCELED(e)" "KILL(k)")
        (sequence "[ ](T)" "[-](S)" "[?](W)" "|" "[X](D)")
        (sequence "|" "OKAY(o)" "YES(y)" "NO(n)")))
