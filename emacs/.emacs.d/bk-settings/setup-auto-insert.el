;;; setup-auto-insert.el --- auto insert setup
;;; Commentary:
;;; Code:
(auto-insert-mode 1)

;; Auto-insert Stuff
(setq
 auto-insert-directory
 (concat bk-setting-directory
         (file-name-as-directory "auto-insert")))

;; If you don't want to be prompted before insertion
;; (setq-default auto-insert-query nil)

;; List of associated file with extension
(setq
 bk:auto-insert-alist
 '(
   ;; file pattern . ["filename-to-insert" insertion-function]
   ;; or
   ;; (file pattern . description) . action (see `auto-insert-alist').
   (("\\.[hH]\\(h\\|pp\\)?$" . "C / C++ header") . bk:generate-include-guard)
   ;;TODO: a function who ask for the kind of project, C/C++ library...
   (("\\.eproject" . "project configuration file") . "dot.eproject")
   (("Makefile" . "Makefile") . "config.mk")))

;; Add `bk:auto-insert-alist alist' in `auto-insert-alist'.
(dolist (elem bk:auto-insert-alist)
  (add-to-list 'auto-insert-alist elem))

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
  "If not in a projectile project use `bk:format-include-guard-fallback'.
Format an include guard, using projectile-project-root
"
  (if (projectile-project-p)
      (let
          ((filename
            (subseq
             (file-name-sans-extension buffer-file-name)
             (length (projectile-project-root))))
           (ext
            (file-name-extension buffer-file-name)))
        (replace-regexp-in-string
         "[^A-Z0-9_]" "_"
         (upcase (concat filename "_" ext "_")))
        (bk:format-include-guard-fallback))))

(defun bk:generate-include-guard ()
  "Generate an include guard (should be in a C/C++ file), used by
`auto-insert-mode'."
  (insert "guard")
  (yas/expand))

(provide 'setup-auto-insert)
;;; setup-auto-insert.el ends here
