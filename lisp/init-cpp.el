(use-package modern-cpp-font-lock :ensure t)

; CMake
(use-package cmake-mode :ensure t)
(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
                ("\\.cmake\\'" . cmake-mode))
              auto-mode-alist))

; Bazel
(use-package bazel :ensure t)

(provide 'init-cpp)
