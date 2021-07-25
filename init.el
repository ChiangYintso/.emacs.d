(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'package)

(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")))

; activate all the packages
(package-initialize)

; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package try :ensure t)
(use-package which-key :ensure t :config (which-key-mode))

(use-package evil :ensure t)
(evil-mode 1)
(fset 'evil-visual-update-x-selection 'ignore)

(use-package exec-path-from-shell :ensure t)
(use-package zenburn-theme :ensure t)
(load-theme 'zenburn t)

; use xclip to interact with system clipboard
(use-package xclip :ensure t)
(xclip-mode 1)

(require 'init-exec-path) ;; Set up $PATH

(set-face-attribute 'default nil :height 200)

(global-linum-mode 1) ; always show line numbers
(setq linum-format "%d| ") ; set format

(require 'init-general)
(require 'init-lsp)
(require 'init-gdb)
(require 'init-cpp)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-completion-style 'helm)
 '(package-selected-packages
   '(bazel cmake-mode lsp-mode yasnippet lsp-treemacs helm-lsp projectile hydra flycheck company avy which-key helm-xref dap-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
