;; Desabilita a barra de ferramenta.
(tool-bar-mode -1)

;; Mostra número das linhas.
(global-display-line-numbers-mode 1)
(setq menu-bar--display-line-numbers-mode-relative t)

(column-number-mode)

(dolist (mode '(eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))


;; Configuração de tamanho de fonte.
(set-face-attribute 'default nil :font "Overpass Mono" :height 240)

;; Faz highlight na linha atual.
(hl-line-mode 1)

;; Pisca o cursor.
(blink-cursor-mode 1)


;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "<leader>fs") 'save-buffer)

;; Salva uma lista de arquivos editados recentemente.
(recentf-mode 1)

;; Configurações do histórico do Minibuffer.
(setq history-length 25) 
(savehist-mode 1)

;; Abre arquivos no ultimo lugar visitado.
(save-place-mode 1)

;; Recarega arquivo caso tenha sido mudado por outro processo.
(global-auto-revert-mode 1)

;; Configura use-package
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("melpa-stable" . "https://stable.melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents (package-refresh-contents))

(unless (package-installed-p 'use-package) (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; Mostra os comandos conforme você digita
(use-package command-log-mode)

;; Modeline do Doom Emacs
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

(which-key-setup-side-window-right)

;;(use-package helpful
;;  :custom
;;  (counsel-describe-function-function #'helpful-callable)
;;  (counsel-describe-variable-function #'helpful-variable)
;;  :bind
;;  ([remap describe-function] . counsel-describe-function)
;;  ([remap describe-command] . helpful-command)
;;  ([remap describe-variable] . counsel-describe-variable)
;;  ([remap describe-key] . helpful-key))

(use-package doom-themes
  :init (load-theme 'doom-oceanic-next t))

(use-package all-the-icons)

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-leader
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader "<SPC>"))

(evil-leader/set-key "fs" 'save-buffer)

;; Org config

(setq org-directory "~/Documents/org/")

(setq scroll-preserve-screen-position t
      scroll-conservatively 0
      maximum-scroll-margin 0.5
      scroll-margin 99999)
