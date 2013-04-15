(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; get the proper path for shell commands
(setenv "PATH" (shell-command-to-string ". $HOME/.zshrc ; echo $PATH"))

;;; set up scpaste
(autoload 'scpaste "scpaste" "Paste the current buffer." t nil)
(setq scpaste-http-destination "http://p.kyleisom.net"
      scpaste-scp-destination "brokenlcd.net:sites/p")

(load-theme 'solarized-dark t)
