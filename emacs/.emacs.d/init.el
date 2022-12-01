;; Desabilita a barra de ferramenta.
(tool-bar-mode -1)

;; Mostra número das linhas.
(global-display-line-numbers-mode 1)

(setq modus-themes-italic-constructs t
      modus-themes-bold-constructs t
      modus-themes-region '(bg-only)
      modus-themes-mode-line '(accented borderless padded)
      modus-themes-subtle-line-numbers t
      modus-themes-mixed-fonts t
      modus-themes-intense-mouseovers t
      modus-themes-syntax t
      modus-themes-hl-line '(accented))

;;(set-fringe-mode -1)
;;(setq menu-bar--display-line-numbers-mode-relative t)

;; Configura o tema.
;;(load-theme 'modus-vivendi t)
(load-theme 'tango-dark t)

;; Configuração de tamanho de fonte.
(set-face-attribute 'default nil :font "FiraCode Nerd Font" :height 240)

;; Faz highlight na linha atual.
(hl-line-mode 1)

;; Pisca o cursor.
(blink-cursor-mode 1)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Salva uma lista de arquivos editados recentemente.
(recentf-mode 1)

;; Configurações do histórico do Minibuffer.
(setq history-length 25) 
(savehist-mode 1)

;; Abre arquivos no ultimo lugar visitado.
(save-place-mode 1)

;; Recarega arquivo caso tenha sido mudado por outro processo.
(global-auto-revert-mode 1)

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

(use-package command-log-mode)

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)	
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(use-package counsel
  :bind (("C-M-j" . 'counsel-switch-buffer)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history))
  :custom
  (counsel-linux-app-format-function #'counsel-linux-app-format-function-name-only)
  :config
  (counsel-mode 1))
