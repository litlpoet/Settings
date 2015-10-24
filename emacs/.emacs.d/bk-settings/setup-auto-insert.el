;;; setup-auto-insert.el --- auto insert setup
;;; Commentary:
;;; Code:
(message "[bk:setup-auto-insert.el is loading...]")

;; Auto-insert Stuff
(defconst bk:auto-insert-dir
  (file-name-as-directory
   (expand-file-name "bk-inserts" user-emacs-directory)))

;; List of associated file with extension
(defvar bk:auto-insert-alist
  '(;; file pattern . ["filename-to-insert" insertion-function] or
    ;; (file pattern . description) . action (see `auto-insert-alist').
    (("\\.[hH]\\(h\\|pp\\)?$" . "C/C++ header") . bk:generate-include-guard)))

(defun bk:format-include-guard-fallback ()
  "Generate an include guard string with file name."
  (let ((filename
         (file-name-nondirectory
          (file-name-sans-extension buffer-file-name)))
        (ext
         (file-name-extension buffer-file-name)))
    (replace-regexp-in-string
     "[^A-Z0-9_]" "_"
     (upcase (concat filename "_" ext "_")))))

(defun bk:format-include-guard ()
  "Format an include guard, using projectile-project-root.
If not in a projectile project use `bk:format-include-guard-fallback'."
  (if (projectile-project-p)
      (let ((filename
             (subseq
              (file-name-sans-extension buffer-file-name)
              (length (projectile-project-root))))
            (ext (file-name-extension buffer-file-name)))
        (replace-regexp-in-string
         "[^A-Z0-9_]" "_"
         (upcase (concat filename "_" ext "_"))))
    (bk:format-include-guard-fallback)))

(defun bk:generate-include-guard ()
  "Generate an include guard (should be in a C/C++ file),
 used by `auto-insert-mode'."
  (insert "guard")
  (yas/expand))

(setq auto-insert-directory bk:auto-insert-dir)
(dolist (elem bk:auto-insert-alist)
  (add-to-list 'auto-insert-alist elem))

(provide 'setup-auto-insert)
;;; setup-auto-insert.el ends here
