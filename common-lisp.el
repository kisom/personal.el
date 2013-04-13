;;; tweaks for common lisp editing
(dolist (hook '(emacs-lisp-mode-hook
                 lisp-mode-hook
                 slime-repl-mode-hook))
  (add-hook hook #'(lambda nil (paredit-mode 1))))
