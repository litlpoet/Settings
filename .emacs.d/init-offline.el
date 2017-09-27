;;; init-online.el -- bk's emacs starting point
;;; Commentary:
;; Emacs init.el online version (getting package from web)

;;; Code:

;; invoke packages
(defconst bk:emacs-start-time (current-time)
  "Emacs start time.")

(require 'package)
(setq package-archives '(("elpabk" . "~/.emacs.d/elpabk")))
(package-initialize)

(defconst bk:is-online nil
  "If Emacs have access on internet, set nil if not.")

(defconst bk:use-irony nil
  "Use irony for code linting and completion, if nil use r-tags.")

(defconst bk:temp-directory
  (concat user-emacs-directory
          (convert-standard-filename "temp/"))
  "Directory for temporary files.")

(defconst bk:rtags-lisp-directory
  "/usr/home/bchoi/cyop/share/emacs/site-lisp/rtags"
  "Directory for rtags Lisp files.")

(load
 (expand-file-name "init-common.el" user-emacs-directory))

;; report load time
(let ((elapsed (float-time
                (time-subtract
                 (current-time)
                 bk:emacs-start-time))))
  (message
   "Loading %s...done (%.3fs) [init.el]"
   load-file-name elapsed))
(add-hook
 'after-init-hook
 `(lambda ()
    (let ((elapsed (float-time
                    (time-subtract
                     (current-time)
                     bk:emacs-start-time))))
      (message
       "Loading %s...done (%.3fs) [after-init]"
       ,load-file-name elapsed)))
 t)

;;; (provide 'init-offline)
;;; init-online.el ends here

