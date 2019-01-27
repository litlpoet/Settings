;;; init-online.el -- bk's emacs starting point
;;; Commentary:
;; Emacs init.el online version (getting package from web)

;;; Code:
;; change default appearance as soon as possible

;; invoke packages
(defconst bk:emacs-start-time (current-time)
  "Emacs start time.")

(require 'package)
(setq package-archives '(("org"   . "http://orgmode.org/elpa/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("gnu"   . "http://elpa.gnu.org/packages/")))
(setq package-archive-priorities '(("org"   . 3)
                                   ("melpa" . 2)
                                   ("gnu"   . 1)))
;; (package-initialize)

(defconst bk:is-online t
  "If Emacs have access on internet, set nil if not.")

(defconst bk:use-irony t
  "Use irony for code linting and completion, if nil use r-tags.")

(defconst bk:use-rg (if (executable-find "rg") t nil)
  "If ripgrep is in the system, preper to use it rather than grep or ag.")

(load (expand-file-name "init-common.el" user-emacs-directory))

;; (load
;;  (expand-file-name "init-malinka-proj.el" user-emacs-directory))

;; report load time
(let ((elapsed (float-time
                (time-subtract (current-time) bk:emacs-start-time))))
  (message "Loading %s...done (%.3fs) [init.el]" load-file-name elapsed))

(add-hook 'after-init-hook
          `(lambda ()
             (let ((elapsed (float-time
                             (time-subtract
                              (current-time)
                              bk:emacs-start-time))))
               (message "Loading %s...done (%.3fs) [after-init]"
                        ,load-file-name elapsed))) t)

;;; (provide 'init-online)
;;; init-online.el ends here

