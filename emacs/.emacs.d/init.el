;;; init.el --- emacs initialization script          -*- lexical-binding: t; -*-

;;; Commentary:
;; Copyright (C) 2015  bk
;; Author: bk <bk@T530>
;; Keywords: lisp

;;; Code:
(defconst bk:emacs-start-time (current-time))

;; Turn off mouse interface early in startup to avoid momentary display
(when window-system
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (tooltip-mode -1))

;; Package archives
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

;; Custom
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))
(require 'diminish)
(require 'bind-key)
;; (setq use-package-verbose t)

(defvar bk:init.org-message-depth 2
  "What depth of init.org headers to message at startup.")

(with-temp-buffer
  (insert-file-contents
   (expand-file-name "init.org" user-emacs-directory))
  (goto-char (point-min))
  (search-forward "\n* init.el")
  (while (not (eobp))
    (forward-line 1)
    (cond
     ;; Report Headers
     ((looking-at
       (format "\\*\\{2,%s\\} +.*$"
               bk:init.org-message-depth))
      (message "%s" (match-string 0)))
     ;; Evaluate Code Blocks
     ((looking-at "^#\\+BEGIN_SRC +emacs-lisp *$")
      (let ((l (match-end 0)))
        (search-forward "\n#+END_SRC")
        (eval-region l (match-beginning 0))))
     ;; Finish on the next level-1 header
     ((looking-at "^\\* ")
      (goto-char (point-max))))))

(when window-system
  (let
      ((elapsed
        (float-time (time-subtract (current-time) bk:emacs-start-time))))
    (message "Loading %s...done (%.3fs)" load-file-name elapsed))
  (add-hook 'after-init-hook
            `(lambda ()
               (let ((elapsed
                      (float-time (time-subtract (current-time)
                                                 bk:emacs-start-time))))
                 (message "Loading %s...done (%.3fs) [after-init]"
                          ,load-file-name elapsed))) t))

;; (provide 'init)
;;; init.el ends here
