;;; setup-paradox.el --- paradox package setup
;;; Commentary:
;; Copyright (C) 2015  bk
;; Author: bk <bk@T530>
;; Keywords: lisp

;;; Code:
(require 'paradox)
(setq paradox-github-token
      (with-temp-buffer
        (insert-file-contents
         (expand-file-name ".github_token" user-emacs-directory))
        (buffer-string)))
(setq paradox-execute-asynchronously t)
(setq paradox-display-download-count t)
(setq paradox-column-width-version 12)

(provide 'setup-paradox)
;;; setup-paradox.el ends here
