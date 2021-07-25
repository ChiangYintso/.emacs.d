;; company
(use-package company
  :ensure t
  :init
  (global-company-mode 1))

(use-package projectile
  :ensure t
  :init
  (projectile-global-mode)
  (setq projectile-enable-caching t))

(setq company-idle-delay 0.0
      company-minimum-prefix-length 1)

(use-package yasnippet
  :ensure t
  :defer t
  :init)
(yas-global-mode 1)

(provide 'init-general)
