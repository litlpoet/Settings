;;; init-builtins-base.el --- default setting
;;; Commentary:

;;; Code:
;;; early appearance
(when window-system
  (menu-bar-mode   -1)
  (tool-bar-mode   -1)
  (scroll-bar-mode -1)
  (tooltip-mode    -1))

;;; custome file
(setq custom-safe-themes t
      custom-file (expand-file-name "custom.el" user-emacs-directory))

;; defaults (c-based packages)
(setq visible-bell                    nil
      ring-bell-function              'ignore
      auto-save-timeout               120
      scroll-preserve-screen-position t
      scroll-conservatively           1001
      ;; scroll-step                     1
      scroll-margin                   5
      even-window-sizes               'width-only)

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
              minibuffer-prompt-properties
              '(read-only t
                          point-entered minibuffer-avoid-prompt
                          face minibuffer-prompt)
              window-resize-pixelwise t
              frame-resize-pixelwise  t)

;; alias
(defalias 'yes-or-no-p 'y-or-n-p)

(use-builtin abbrev)
(use-builtin delsel    :init (delete-selection-mode))
(use-builtin frame     :init (blink-cursor-mode))
(use-builtin ibuffer   :init (setq-default ibuffer-default-sorting-mode 'major-mode))
(use-builtin menu-bar  :commands (kill-this-buffer))         ; kill-this-buffer is not autoloaded
(use-builtin prog-mode :hook (prog-mode . prettify-symbols-mode))
(use-builtin tramp     :init (setq tramp-backup-directory-alist backup-directory-alist))
(use-builtin vc-hooks  :init (setq vc-follow-symlinks t))
(use-builtin windmove)

(use-builtin faces
  :init
  (when (display-graphic-p)
    (let ((preferred-font-families '("Noto Sans Mono"
                                     "DejaVu Sans Mono"
                                     "Hack")))
      (set-face-attribute 'default nil
                          :family (car preferred-font-families)
                          :weight 'regular
                          :width  'semi-condensed
                          :height '110)
      (add-to-list 'face-font-family-alternatives preferred-font-families))
    (set-fontset-font t 'hangul (font-spec :name "Noto Sans Mono CJK KR"))))

(use-builtin files
  :init
  (unless (file-exists-p bk:local-directory)
    (make-directory bk:local-directory t))
  (setq auto-save-default   nil
        make-backup-files   nil
        confirm-kill-emacs  'y-or-n-p)
  (setq-default backup-directory-alist (list (cons "." bk:local-directory))))

(use-builtin recentf
  :init
  ;; following two lines must be set prior to execute recentf-mode
  (setq-default recentf-save-file
                (expand-file-name "recentf" bk:local-directory)
                recentf-auto-cleanup 'never)
  (recentf-mode))

(use-builtin startup
  :init
  (setq-default
   initial-major-mode                'fundamental-mode
   initial-scratch-message           nil
   inhibit-startup-screen            t
   inhibit-startup-echo-area-message user-login-name
   auto-save-list-file-prefix        bk:local-directory)
  (fset #'display-startup-echo-area-message #'ignore))

(use-builtin fringe
  :commands fringe-mode                 ; fringe-mode is not autoloaded
  :init (fringe-mode '(18 . 6)))

(use-builtin hl-line
  :hook ((prog-mode text-mode dired-mode) . hl-line-mode)
  :init (setq hl-line-sticky-flag        nil
              global-hl-line-sticky-flag nil))

(use-builtin autorevert
  :init
  (setq auto-revert-verbose nil)
  (global-auto-revert-mode))

(use-builtin compile
  :init
  (setq compilation-always-kill              t
        compilation-scroll-output            t
        compilation-auto-jump-to-first-error t))

(use-builtin mule-cmds
  :init
  (set-language-environment               "Korean")
  (prefer-coding-system                   'utf-8)
  (set-terminal-coding-system             'utf-8)
  (set-keyboard-coding-system             'utf-8)
  (set-selection-coding-system            'utf-8)
  (setq locale-coding-system              'utf-8)
  (setq-default buffer-file-coding-system 'utf-8))

(use-builtin simple
  :hook ((org-mode  . auto-fill-mode)
         (prog-mode . column-number-mode))
  :init
  (setq global-mark-ring-max 1000
        mark-ring-max        1000
        kill-ring-max        1000
        kill-whole-line      t
        size-indication-mode t)
  (setq-default fill-column 120))

(use-builtin whitespace
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
      (setq-local whitespace-line-column   120)
      (setq-local whitespace-style
                  '(face tabs trailing lines-tail))
      (whitespace-mode 1)))
  :config
  (set-face-foreground 'whitespace-line nil))

(use-builtin visual-line-mode
  :hook ((prog-mode text-mode) . visual-line-mode))

(use-builtin autoinsert
  :init
  (setq auto-insert-query nil)
  (auto-insert-mode))

(use-builtin impl-autoinsert
  :after (autoinsert projectile)
  :demand t)

(provide 'init-builtins-base)
;;; init-builtins-base.el ends here
