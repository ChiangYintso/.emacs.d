(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'package)

(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")))

; list the packages you want
(setq package-list 
    '(evil exec-path-from-shell rust-mode zenburn-theme))

; activate all the packages
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(use-package try :ensure t)
(use-package which-key :ensure t :config (which-key-mode))

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
 '(package-selected-packages
   '(company-lsp lsp-ui ccls modern-cpp-font-lock flycheck auto-complete zenburn-theme evil)))
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

(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))

; syntax checking
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

(use-package modern-cpp-font-lock
:ensure t)

(require 'init-lsp)
(require 'init-gdb)

