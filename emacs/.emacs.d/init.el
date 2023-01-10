;;;;; init.el - main emacs startup script

;; Package setup
(eval-when-compile
  (customize-set-variable
   'package-archives '(("melpa" . "https://melpa.org/packages/")
	  ("melpa-stable" . "https://stable.melpa.org/packages/")
      ("org" . "https://orgmode.org/elpa/")
      ("elpa" . "https://elpa.gnu.org/packages/")))
  (package-initialize)
  (unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))
  (require 'use-package)
  (setq use-package-always-ensure t
        use-package-verbose t))

(require 'core)
(require 'projectile-config)
(require 'org-config)

(use-package server
  :demand t
  :config
  (if (not (server-running-p))
      (server-start)))

(if (file-exists-p custom-file)
    (load custom-file))
