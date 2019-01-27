;;; init-builtins.el --- default setting
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
      scroll-conservatively           100000
      scroll-step                     1
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
                          face minibuffer-prompt))

;; alias
(defalias 'yes-or-no-p 'y-or-n-p)

;; font-faces
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

;; files
(use-builtin files
  :init
  (unless (file-exists-p bk:local-directory)
    (make-directory bk:local-directory t))
  (setq backup-by-copying      t
        kept-new-versions      5
        kept-old-versions      3
        delete-old-versions    t
        confirm-kill-emacs     'y-or-n-p)
  (setq-default backup-directory-alist (list (cons "." bk:local-directory))))

;; tramp
(use-builtin tramp
  :init
  (setq tramp-backup-directory-alist backup-directory-alist))

;; files recentf
(use-builtin recentf
  :hook (after-init . recentf-mode)
  :init
  ;; following two lines must be set prior to execute recentf-mode
  (setq-default recentf-save-file
                (expand-file-name "recentf" bk:local-directory)
                recentf-auto-cleanup 'never))

;; start-up
(use-builtin startup
  :init
  (setq inhibit-startup-screen     t
        initial-scratch-message    nil
        auto-save-list-file-prefix bk:local-directory))

;; frame
(use-builtin frame
  :hook (after-init . blink-cursor-mode))

;; fringe
(use-builtin fringe
  :commands (set-fringe-mode)
  :hook (after-init . (lambda() (set-fringe-mode '(20 . 6)))))

;; hilight line
(use-builtin hl-line
  :hook (after-init . global-hl-line-mode)
  :init
  (setq global-hl-line-sticky-frag nil))

;; delsel
(use-builtin delsel
  :hook (after-init . delete-selection-mode))

;; autorevert
(use-builtin autorevert
  :hook (after-init . global-auto-revert-mode)
  :init
  (setq auto-revert-verbose nil)
  :blackout t)

;; vc-hooks
(use-builtin vc-hooks
  :init
  (setq vc-follow-symlinks t))

;; compile
(use-builtin compile
  :init
  (setq compilation-always-kill              t
        compilation-scroll-output            t
        compilation-auto-jump-to-first-error t))

;; [built-in] prog-mode
(use-builtin prog-mode
  :hook (prog-mode . prettify-symbols-mode))

;; mule-cmds
(use-builtin mule-cmds
  :init
  (set-language-environment               "Korean")
  (prefer-coding-system                   'utf-8)
  (set-terminal-coding-system             'utf-8)
  (set-keyboard-coding-system             'utf-8)
  (set-selection-coding-system            'utf-8)
  (setq locale-coding-system              'utf-8)
  (setq-default buffer-file-coding-system 'utf-8))

;; simple
(use-builtin simple
  :hook ((org-mode   . auto-fill-mode)
         (after-init . column-number-mode))
  :init
  (setq global-mark-ring-max 1000
        mark-ring-max        1000
        kill-ring-max        1000
        kill-whole-line      t
        size-indication-mode t)
  (setq-default fill-column 100))

;; menu-bar
(use-builtin menu-bar
  :bind ("C-x k" . kill-this-buffer))

;; whitespace
(use-builtin whitespace
  :commands (whitespace-mode)
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
  (set-face-foreground 'whitespace-line nil)
  :blackout t)

;; abbrev
(use-builtin abbrev
  :blackout t)

;; windmove
(use-builtin windmove
  :bind (("S-<left>"  . windmove-left)
         ("S-<right>" . windmove-right)
         ("S-<down>"  . windmove-down)
         ("S-<up>"    . windmove-up)))

;; ibuffer
(use-builtin ibuffer
  :bind ("C-x C-b" . ibuffer)
  :init
  (setq-default ibuffer-default-sorting-mode 'major-mode))

;; auto-insert
(use-builtin autoinsert
  :hook (after-init . auto-insert-mode)
  :init
  (setq auto-insert-query nil))

(provide 'init-builtins)
;;; init-builtins.el ends here
