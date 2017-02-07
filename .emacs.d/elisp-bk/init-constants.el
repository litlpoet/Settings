
(defconst bk:emacs-start-time (current-time)
  "Emacs start time.")

(defconst bk:temp-directory
  (concat user-emacs-directory
	  (convert-standard-filename "temp/"))
  "Directory for temporary files.")

(provide 'init-constants)
