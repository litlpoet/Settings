;;; setup-files.el --- files packages setup
;;; commentary:
;;; code:

(message "[bk:setup-files.el is loading...]")

;; back up files
(defconst bk:backup-directory
  (expand-file-name "tmp" user-emacs-directory)
  "The tmp directory")
(if (not (file-exists-p bk:backup-directory))
    (make-directory bk:backup-directory t))
(setq backup-directory-alist `(("." . ,bk:backup-directory)))

;; dired
(if (eq system-type 'windows-nt)
    (setq dired-listing-switches "-lha")
  (setq dired-listing-switches "-lha --group-directories-first"))
(add-hook 'dired-mode-hook 'auto-revert-mode)

;; extra dired commands
;; (require 'dired-x)

;; dired+
;; (require 'dired+)

;; recentf setq
(require 'recentf)
(recentf-mode)
(setq recentf-max-menu-items 10
      recentf-max-saved-items 1000)

(provide 'setup-files)
;;; setup-files.el ends here
