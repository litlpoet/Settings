;;; setup-gitgutter.el --- gitgutter setup
;;; Commentary:
;; Copyright (C) 2015  bk
;; Author: bk <bk@T530>
;; Keywords: lisp

;;; Code:
(require 'git-gutter-fringe)
(global-git-gutter-mode t)
(set-default 'git-gutter:lighter " GG")

(provide 'setup-gitgutter)
;;; setup-gitgutter.el ends here
