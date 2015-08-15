;;; setup-yasnippet.el --- setup yasnippet

;;; Commentary:
;; Copyright (C) 2015
;; Author:  <Byungkuk>

;;; Code:
(message "[bk:setup-yasnippet.el is loading...]")
(defconst bk:snippet-dir
  (file-name-as-directory
   (expand-file-name "bk-snippets" user-emacs-directory)))

(unless (file-exists-p bk:snippet-dir)
  (make-directory bk:snippet-dir))

(setq yas-snippet-dirs (list bk:snippet-dir))

(yas-global-mode 1)

(provide 'setup-yasnippet)
;;; setup-yasnippet.el ends here


