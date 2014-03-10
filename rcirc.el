;;;; rcirc settings

(eval-after-load 'rcirc
  '(require 'rcirc-notify))

(setq rcirc-freenode
      '("irc.freenode.net" :port 6697 :encryption tls
        :channels ("#rcirc" "#emacs" "#emacswiki")))
(setq rcirc-tyrfingr
      '("irc.tyrfingr.is" :port 6697 :encryption tls
        :channels ("#hacknet")))
(setq rcirc-server-alist
      '())

(push rcirc-tyrfingr rcirc-server-alist)
(setq rcirc-nick "kyle-emacs")

