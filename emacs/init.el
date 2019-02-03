;;; init.el --- emacs initialization                 -*- lexical-binding: t; -*-

;; Copyright (C) 2018  Byungkuk Choi
;; Author: Byungkuk Choi <bk@i7-G6>
;; Keywords: lisp

;;; Commentary:
;; Emacs initialization (using straight.el)

;;; Code:
;;; Check 'early-init.el'
(defconst bk:local-directory
  (concat user-emacs-directory
          (convert-standard-filename ".local/"))
  "Directory for temporary files.")

(defconst bk:elisps-directory
  (concat user-emacs-directory
          (convert-standard-filename "elisps/"))
  "Directory for custom elisps.")

(defvar bk:file-namehandler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)
(defun bk:finalize-init ()
  "Finalize Emacs initialization."
  (setq file-name-handler-alist bk:file-namehandler-alist)
  (run-with-idle-timer
   3 nil (lambda() (setq-default gc-cons-threshold 16777216))) ; 16 mb
  (let ((elapsed (float-time
                  (time-subtract (current-time) before-init-time))))
    (message "BK Emacs, start-up time: %.3fs" elapsed)))
(add-hook 'after-init-hook #'bk:finalize-init)

;; default packages and their extensions
(eval-and-compile (add-to-list 'load-path bk:elisps-directory))
(require 'init-package-management)
(require 'init-builtins-base)
(require 'init-builtins-dired)
(require 'init-essentials-base)
(require 'init-essentials-project)
(require 'init-essentials-ui)
(require 'init-languages-base)
(require 'init-languages-lisp)
(require 'init-languages-cpp)
(require 'init-languages-python)
(require 'init-keybindings-base)
(require 'init-keybindings-hydras-base)

;;; init.el ends here
