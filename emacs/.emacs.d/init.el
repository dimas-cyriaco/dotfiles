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

;; Configura o tema.
(load-theme 'modus-vivendi t)

;; Configuração de tamanho de fonte.
(set-face-attribute 'default nil :height 240)

;; Faz highlight na linha atual.
(hl-line-mode 1)

;; Pisca o cursor.
(blink-cursor-mode 1)

;; Salva uma lista de arquivos editados recentemente.
(recentf-mode 1)

;; Configurações do histórico do Minibuffer.
(setq history-length 25) 
(savehist-mode 1)

;; Abre arquivos no ultimo lugar visitado.
(save-place-mode 1)

;; Recarega arquivo caso tenha sido mudado por outro processo.
(global-auto-revert-mode 1)
