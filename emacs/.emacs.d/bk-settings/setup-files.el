;;; setup-files.el --- files packages setup
;;; commentary:
;;; code:

;; large size file warning
(message "[bk:setup-files.el is loading...]")
(setq large-file-warning-threshold 100000000) ;; size in bytes

;; back up files
(defvar backup-directory "~/.emacs.d/tmp")
(if (not (file-exists-p backup-directory))
    (make-directory backup-directory t))

(setq
 make-backup-files t
 backup-directory-alist '(("." . "~/.emacs.d/.tmp"))
 backup-by-copying t
 version-control t
 delete-old-versions t
 kept-old-versions 3
 kept-new-versions 5
 auto-save-default t
 auto-save-timeout 60
 auto-save-interval 300
 )

;; dired mode
(require 'dired)
(setq
 dired-dwim-target t
 dired-recursive-copies 'always
 dired-recursive-deletes 'top
 )

(if (eq system-type 'windows-nt)
    (setq dired-listing-switches "-lha")
  (setq dired-listing-switches "-lha --group-directories-first"))

;; automatic refresh of dired
(add-hook 'dired-mode-hook 'auto-revert-mode)

;; extra dired commands
(require 'dired-x)

;; wdired
(require 'wdired)
(setq wdired-allow-to-change-permissions t
      wdired-allow-to-redirect-links )

;; recentf setq
(require 'recentf)
(recentf-mode)
(setq recentf-max-menu-items 10
      recentf-max-saved-items 1000)

;; dired+
;; (require 'dired+)

(provide 'setup-files)
;;; setup-files.el ends here
