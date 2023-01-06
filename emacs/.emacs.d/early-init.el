;;; early-init.el - things that need to run early in Emacs startup

;; Setting load files and paths
(setq custom-file (concat (expand-file-name (concat user-emacs-directory "/")) "custom.el"))
(push "~/.emacs.d/lisp" load-path)
(push (concat (expand-file-name (concat user-emacs-directory "/")) "/startup") load-path)

(if window-system
    (customize-set-variable 'tool-bar-mode nil))

(defvar old-file-name-handler file-name-handler-alist)
(defvar default-gc-cons-threshold gc-cons-threshold)
(setq file-name-handler-alist nil
      gc-cons-threshold most-positive-fixnum)
(add-hook 'after-init-hook
          (lambda nil
            (setq gc-cons-threshold default-gc-cons-threshold
                  gc-cons-percentage 0.1
                  file-name-handler-alist (delete-dups (append file-name-handler-alist old-file-name-handler)))))
