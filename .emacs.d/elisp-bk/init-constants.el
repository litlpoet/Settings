;;; init-constants.el -- constant variables
;;; Commentary:

;;; Code:
(defconst bk:emacs-start-time (current-time)
  "Emacs start time.")

(defconst bk:temp-directory
  (concat user-emacs-directory
	  (convert-standard-filename "temp/"))
  "Directory for temporary files.")

(defconst bk:use-irony t
  "Use irony for code linting and completion, if nil use r-tags.")

(defconst bk:rtags-lisp-directory
  ;; "/usr/home/bchoi/cyop/share/emacs/site-lisp/rtags"
  "/usr/local/share/emacs/site-lisp/rtags/"
  "Directory for rtags Lisp files.")

(defun bk:report-emacs-boot-time ()
  "Report Emacs boot time."
  (let
      ((elapsed
        (float-time
         (time-subtract
          (current-time)
          bk:emacs-start-time))))
    (message
     "Loading %s...done (%.3fs) [init.el]" load-file-name elapsed))
  (add-hook
   'after-init-hook
   `(lambda ()
      (let ((elapsed
             (float-time
              (time-subtract
               (current-time)
               bk:emacs-start-time))))
        (message
         "Loading %s...done (%.3fs) [after-init]"
         ,load-file-name elapsed))) t))

(provide 'init-constants)
;;; init-constants.el ends here
