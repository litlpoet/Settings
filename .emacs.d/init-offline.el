;;; init-offline.el -- bk's emacs starting point
;;; Commentary:
;; Emacs init.el offline version (getting package from web)

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
;;; init-offline.el ends here

