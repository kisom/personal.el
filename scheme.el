;; Scheme config
;; Enable Quack mode
;; The binary of your interpreter
(setq scheme-program-name "racket")
;; This hook lets you use your theme colours instead of quack's ones.
(defun scheme-mode-quack-hook ()
(require 'quack)
(setq quack-fontify-style 'emacs))
(add-hook 'scheme-mode-hook 'scheme-mode-quack-hook)
