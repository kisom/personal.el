(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#3f3f3f" "#cc9393" "#7f9f7f" "#f0dfaf" "#8cd0d3" "#dc8cc3" "#93e0e3" "#dcdccc"])
 '(custom-safe-themes (quote ("5e1d1564b6a2435a2054aa345e81c89539a72c4cad8536cfe02583e0b7d5e2fa" "27b53b2085c977a8919f25a3a76e013ef443362d887d52eaa7121e6f92434972" "967c58175840fcea30b56f2a5a326b232d4939393bed59339d21e46cf4798ecf" "6bc195f4f8f9cf1a4b1946a12e33de2b156ce44e384fbc54f1bae5b81e3f5496" "8281168b824a806489ca7d22e60bb15020bf6eecd64c25088c85b3fd806fc341" "f38dd27d6462c0dac285aa95ae28aeb7df7e545f8930688c18960aeaf4e807ed" "159bb8f86836ea30261ece64ac695dc490e871d57107016c09f286146f0dae64" "6b00751018da9a360ac8a7f7af8eb134921a489725735eba663700cebc12fa6f" "bf9d5728e674bde6a112979bd830cc90327850aaaf2e6f3cc4654f077146b406" default)))
 '(fci-rule-color "#383838")
 '(safe-local-variable-values (quote ((Package . DRAKMA) (package . puri) (Syntax . ANSI-Common-Lisp) (Package . CHUNGA) (Package . CL-PPCRE) (Base . 10) (Package . FLEXI-STREAMS) (Syntax . COMMON-LISP)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-library "mediawiki")

;;; get the proper path for shell commands
(setenv "PATH" (shell-command-to-string ". $HOME/.zshrc ; echo $PATH"))

;;; set up scpaste
(autoload 'scpaste "scpaste" "Paste the current buffer." t nil)
(setq scpaste-http-destination "http://p.kyleisom.net"
      scpaste-scp-destination "brokenlcd.net:sites/p")

(if (file-exists-p (expand-file-name "~/quicklisp/"))
      (load (expand-file-name "~/quicklisp/slime-helper.el")))
;;; add MW site at end in case network isn't up yet
;;; (mediawiki-site "dropsonde")
