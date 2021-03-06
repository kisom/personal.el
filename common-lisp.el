;;; tweaks for common lisp editing
(if (file-exists-p (expand-file-name "~/quicklisp/"))
      (load (expand-file-name "~/quicklisp/slime-helper.el")))

;; for the lispings
(setq inferior-lisp-program "/usr/bin/sbcl")

(dolist (hook '(emacs-lisp-mode-hook
                 lisp-mode-hook
                 slime-repl-mode-hook))
  (add-hook hook #'(lambda nil (paredit-mode 1))))

(autoload 'paredit-mode "paredit"
      "Minor mode for pseudo-structurally editing Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       (lambda () (paredit-mode +1)))
(add-hook 'lisp-mode-hook             (lambda () (paredit-mode +1)))
(add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'scheme-mode-hook           (lambda () (paredit-mode +1)))
(add-hook 'lfe-mode-hook              (lambda () (paredit-mode +1)))
(add-hook 'racket-mode-hook           (lambda () (paredit-mode +1)))

(defun expander ()
  (interactive)
  (cond
   ((and (eql major-mode 'lisp-mode)
         (slime-connected-p)) (slime-complete-symbol*))
   (t (hippie-expand))))

(global-set-key (kbd "<C-tab>") 'expander)
