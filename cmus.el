;;;; define commands for controlling cmus from emacs

;;; utility (non-interactive) functions
(defun cmus-status ()
  "Return the current cmus status."
  (split-string
   (shell-command-to-string "cmus-remote -Q")
   "\n"))

(defun cmus-get-status-property (status property)
  "Search the status for the requested property."
  (replace-regexp-in-string property ""
			    (car
			     (delq nil
				   (mapcar (lambda (prop-line)
					     (if (string-match property prop-line)
						 prop-line
					       nil))
					   status)))))

(defun cmus-get-artist (status)
  "Return the currently playing track."
  (cmus-get-tag status "artist"))

(defun cmus-get-album (status)
  "Return the album for the current track."
  (cmus-get-tag status "album"))

(defun cmus-get-title (status)
  "Return the track title for the current track"
  (cmus-get-tag status "title"))

(defun cmus-get-tag (status tag)
  "Return the matching tag from the status."
  (let ((tag-match (concat "^tag " tag " ")))
    (cmus-get-status-property status tag-match)))

(defun cmus-playingp ()
  "Returns true if cmus is currently playing."
  (let ((status (cmus-get-status-property (cmus-status) "status ")))
    (if (equal status "playing")
	(progn
	  (message "playing")
	  t)
      (progn
	(message "paused")
	nil))))

;;; interactive functions

(defun cmus-next-track ()
  "Play the next track in cmus."
  (interactive)
  (shell-command-to-string "cmus-remote -n"))

(defun cmus-prev-track ()
  "Go back a track in cmus."
  (interactive)
  (shell-command-to-string "cmus-remote -r"))

(defun cmus-play-pause ()
  "If cmus is playing, pause it. If it is paused or stopped, start playing."
  (interactive)
  (if (cmus-playingp)
      (progn
	(message "Pausing..")
	(shell-command-to-string "cmus-remote --pause"))
    (progn
      (message "Playing.")
      (shell-command-to-string "cmus-remote --play"))))

(defun cmus-stop ()
  "Stop cmus."
  (interactive)
  (shell-command-to-string "cmus-remote --stop"))

(defun cmus-now-playing ()
  "Show the currently playing track."
  (interactive)
  (let ((status (cmus-status)))
    (let ((artist (cmus-get-artist status))
	  (album (cmus-get-album status))
	  (title (cmus-get-title status))
	  (status (cmus-get-status-property status "status ")))
      (message (concat artist " - " title " (" album ")")))))

(defun cmus-set-volume (volume)
  "Set the current volume in cmus"
  (interactive (let ((volume (read-string "Volume: ")))
		 (list volume)))
  (let ((volume (if (stringp volume) volume (car volume))))
    (shell-command-to-string (concat "cmus-remote -v " volume "%"))))

(defun cmus-toggle-shuffle ()
  "Toggle playing shuffle."
  (interactive)
  (shell-command-to-string "cmus-remote -S")
  (message
   (concat "shuffle is "
	   (if (equal "true" (cmus-get-status-property (cmus-status) "set shuffle "))
	       "on"
	     "off"))))

(defun cmus-toggle-repeat ()
  "Toggle playing repeat."
  (interactive)
  (shell-command-to-string "cmus-remote -R")
  (message
   (concat "repeat is "
	   (if (equal "true" (cmus-get-status-property (cmus-status) "set repeat "))
	       "on"
	     "off"))))

(defun cmus-toggle-mode ()
  "Toggle between artist, album and all modes."
  (interactive)
  (shell-command-to-string "cmus-remote -C \"toggle aaa_mode\"")
  (message
   (concat "current mode: "
	   (cmus-get-status-property (cmus-status) "set aaa_mode "))))

(global-set-key (kbd "C-c C-m x") 'cmus-play-pause)
(global-set-key (kbd "C-c C-m n") 'cmus-next-track)
(global-set-key (kbd "C-c C-m p") 'cmus-prev-track)
(global-set-key (kbd "C-c C-m k") 'cmus-play-stop)
(global-set-key (kbd "C-c C-m s") 'cmus-now-playing)
(global-set-key (kbd "C-c C-m v") 'cmus-set-volume)
(global-set-key (kbd "C-c C-m h") 'cmus-toggle-shuffle)
(global-set-key (kbd "C-c C-m r") 'cmus-toggle-repeat)
(global-set-key (kbd "C-c C-m m") 'cmus-toggle-mode)
