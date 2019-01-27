;;; init-package-management.el --- package management  -*- lexical-binding: t; -*-

;; Copyright (C) 2019  Byungkuk Choi
;; Author: Byungkuk Choi <bk@i7-G6>
;; Keywords: lisp

;;; Commentary:
;; Package management (using straight.el and use-package.el)

;;; Code:
;;; straight bootstrap
(setq straight-check-for-modifications '(find-when-checking))
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;;; use-package
(straight-use-package 'use-package)
(setq use-package-verbose             nil
      use-package-always-defer        t
      straight-use-package-by-default t)

(use-package blackout
  :straight (:host github :repo "raxod502/blackout")
  :demand t)

(defmacro use-builtin (name &rest args)
  "Use-package for built-in NAME package with ARGS."
  (declare (indent defun))
  `(use-package ,name
     :straight nil
     ,@args))

(provide 'init-package-management)
;;; init-package-management.el ends here
