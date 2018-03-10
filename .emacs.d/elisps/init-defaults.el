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
              fill-column                     100
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
  (set-fringe-mode '(12 . 8)))

;; hilight line
(use-package hl-line
  :commands (global-hl-line-mode)
  :init
  (setq global-hl-line-sticky-frag nil)
  (add-hook 'after-init-hook
            '(lambda() (global-hl-line-mode t))))

;; simple
(use-package simple
  :commands (column-number-mode)
  :init
  (setq global-mark-ring-max 1000
        mark-ring-max        1000
        kill-ring-max        1000
        kill-whole-line      t)
  (add-hook 'after-init-hook
            '(lambda() (column-number-mode t)))  )

;; delsel
(use-package delsel
  :commands (delete-selection-mode)
  :init
  (add-hook 'after-init-hook
            '(lambda() (delete-selection-mode t))))

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
       '(face
         tabs tab-mark
         trailing
         spaces space-mark
         newline newline-mark
         indentation))
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
  :commands (global-auto-revert-mode)
  :diminish auto-revert-mode
  :init
  (setq auto-revert-verbose nil)
  (add-hook 'after-init-hook
            '(lambda() (global-auto-revert-mode t))))

;; window
(use-package window
  :bind (("C-S-<left>"  . shrink-window-horizontally)
         ("C-S-<right>" . enlarge-window-horizontally)
         ("C-S-<down>"  . shrink-window)
         ("C-S-<up>"    . enlarge-window)))

;; auto-insert
(use-package autoinsert
  :commands (auto-insert-mode)
  :init
  (setq auto-insert-query nil)
  (add-hook 'after-init-hook
            '(lambda() (auto-insert-mode t)))
  :config
  (use-package impl-autoinsert)
  (dolist (elem bk:auto-insert-alist)
    (add-to-list 'auto-insert-alist elem)))

;; vc-hooks
(use-package vc-hooks
  :defer t
  :init
  (setq vc-follow-symlinks t))

(provide 'init-defaults)
;;; init-defaults.el ends here
