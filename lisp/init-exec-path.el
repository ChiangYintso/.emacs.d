(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
  
(when (daemonp)
  (exec-path-from-shell-initialize))
  
(provide 'init-exec-path)
