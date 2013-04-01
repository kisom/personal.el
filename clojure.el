(dolist (hook '(clojure-mode-hook nrepl-hook))
  (add-hook hook #'(lambda nil (paredit-mode 1))))
