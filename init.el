(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'package)

(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")))

; list the packages you want
(setq package-list 
    '(evil exec-path-from-shell rust-mode zenburn-theme))

; activate all the packages
(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))
  
; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(load-theme 'zenburn t)

(require 'init-exec-path) ;; Set up $PATH

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(zenburn-theme evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
 
(require 'evil)
(evil-mode 1)

(require 'rust-mode)
(setq rust-format-on-save t)

(set-face-attribute 'default nil :height 200)
(global-linum-mode 1) ; always show line numbers                              
(setq linum-format "%d| ") ; set format
