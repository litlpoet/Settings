;;; init-default.el --- default setting
;;; Commentary:

;;; Code:
;; c code engine variables
(setq visible-bell                    nil
      ring-bell-function              'ignore
      auto-save-timeout               120
      scroll-preserve-screen-position t
      scroll-conservatively           100000
      scroll-step                     1
      scroll-margin                   5)

(when (fboundp 'set-charset-priority)
  (set-charset-priority 'unicode))

(setq-default cursor-type                     'bar
              tab-width                       2
              indent-tabs-mode                nil
              cursor-in-non-selected-windows  nil
              highlight-nonselected-windows   nil
              enable-recursive-minibuffers    nil
              max-mini-window-height          0.3
              use-dialog-box                  nil
              minibuffer-prompt-properties   '(read-only t point-entered
                                                         minibuffer-avoid-prompt
                                                         face
                                                         minibuffer-prompt))

;; alias
(defalias 'yes-or-no-p 'y-or-n-p)

;; files
(use-package files
  :defer t
  :init
  (unless (file-exists-p bk:temp-directory)
    (make-directory bk:temp-directory t))
  (setq backup-by-copying      t
        kept-new-versions      5
        kept-old-versions      3
        delete-old-versions    t
        confirm-kill-emacs     'y-or-n-p)
  (setq-default backup-directory-alist (list (cons "." bk:temp-directory))))

;; tramp
(use-package tramp
  :defer t
  :init
  (setq tramp-backup-directory-alist backup-directory-alist))


;; files recentf
(use-package recentf
  :commands (recentf-mode)
  :init
  ;; following two lines must be set prior to execute recentf-mode
  (setq-default recentf-save-file
                (expand-file-name "recentf" bk:temp-directory))
  (setq-default recentf-auto-cleanup 'never)
  (recentf-mode 1))

;; start-up
(use-package startup
  :defer t
  :init
  (setq inhibit-startup-screen     t
        initial-scratch-message    nil
        auto-save-list-file-prefix bk:temp-directory))

;; frame
(use-package frame
  :commands (blink-cursor-mode)
  :init
  (blink-cursor-mode 0))

;; fringe
(use-package fringe
  :commands (set-fringe-mode)
  :init
  (set-fringe-mode '(15 . 8)))

;; hilight line
(use-package hl-line
  :hook (after-init . global-hl-line-mode)
  :init
  (setq global-hl-line-sticky-frag nil))

;; simple
(use-package simple
  :hook ((org-mode   . auto-fill-mode)
         (after-init . column-number-mode))
  :init
  (setq global-mark-ring-max 1000
        mark-ring-max        1000
        kill-ring-max        1000
        kill-whole-line      t)
  (setq-default fill-column 100))

;; delsel
(use-package delsel
  :hook (after-init . delete-selection-mode))

;; mule-cmds
(use-package mule-cmds
  :defer t
  :init
  (set-language-environment               "Korean")
  (prefer-coding-system                   'utf-8)
  (set-terminal-coding-system             'utf-8)
  (set-keyboard-coding-system             'utf-8)
  (set-selection-coding-system            'utf-8)
  (setq locale-coding-system              'utf-8)
  (setq-default buffer-file-coding-system 'utf-8))

;; fonts
(set-fontset-font t 'hangul (font-spec :name "Noto Sans Mono CJK KR"))
;; ;; (if (bk/font-exists-p "Noto Sans Mono CJK KR-12")
;; ;;     (add-to-list 'default-frame-alist '(font . "Noto Sans Mono CJK KR-12")))
;; ;; (if (bk/font-exists-p "Noto Sans Mono CJK KR")
;; ;;     (set-fontset-font t 'hangul (font-spec :name "Noto Sans Mono CJK KR")))

;; menu-bar
(use-package menu-bar
  :bind ("C-x k" . kill-this-buffer))

;; whitespace
(use-package whitespace
  :commands (whitespace-mode)
  :diminish whitespace-mode
  :init
  (add-hook
   'diff-mode-hook
   '(lambda()
      (setq-local
       whitespace-style
       '(face tabs tab-mark trailing spaces space-mark newline newline-mark indentation))
      (whitespace-mode 1)))
  (add-hook
   'prog-mode-hook
   '(lambda()
      (setq-local show-trailing-whitespace 1)
      (setq-local whitespace-line-column   100)
      (setq-local whitespace-style
                  '(face tabs trailing lines-tail))
      (whitespace-mode 1)))
  :config
  (set-face-foreground 'whitespace-line nil))

;; abbrev
(use-package abbrev
  :defer t
  :diminish abbrev-mode)

;; autorevert
(use-package autorevert
  :diminish auto-revert-mode
  :hook (after-init . global-auto-revert-mode)
  :init
  (setq auto-revert-verbose nil))

;; windmove
(use-package windmove
  :bind (("S-<left>"  . windmove-left)
         ("S-<right>" . windmove-right)
         ("S-<down>"  . windmove-down)
         ("S-<up>"    . windmove-up)))

;; auto-insert
(use-package autoinsert
  :hook (after-init . auto-insert-mode)
  :init
  (setq auto-insert-query nil)
  :config
  (use-package impl-autoinsert)
  (dolist (elem bk:auto-insert-alist)
    (add-to-list 'auto-insert-alist elem)))

;; vc-hooks
(use-package vc-hooks
  :defer t
  :init
  (setq vc-follow-symlinks t))

;; compile
(use-package compile
  :defer t
  :init
  (setq compilation-always-kill              t
        compilation-scroll-output            t
        compilation-auto-jump-to-first-error t))

;; ibuffer
(use-package ibuffer
  :bind ("C-x C-b" . ibuffer)
  :init
  (setq-default ibuffer-default-sorting-mode 'major-mode))

;; dired
(use-package dired
  :bind (:map dired-mode-map
              ("k" . dired-kill-subdir)
              (")" . dired-omit-mode))
  :init
  (if (or (eq system-type 'darwin)
          (eq system-type 'windows-nt))
      (setq dired-listing-switches "-lha"
            dired-use-ls-dired     nil)
    (setq dired-listing-switches
          "-lha --group-directories-first"))
  (setq dired-dwim-target       t
        dired-recursive-copies  'always
        dired-recursive-deletes 'always)
  :config
  (setq-default
   dired-omit-mode  t
   dired-omit-files "^\\.?#\\|^\\.$\\|^\\.\[:alnum:\]"))

;; dired-x
(use-package dired-x                    ; must be required for a certain keymap (i.e. C-x C-j)
  :after (dired)
  :init
  (setq dired-hide-details-hide-symlink-targets   nil
        dired-hide-details-hide-information-lines t))

(provide 'init-defaults)
;;; init-defaults.el ends here
