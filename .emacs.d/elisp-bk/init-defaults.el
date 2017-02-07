;; c code engine variables
(setq visible-bell                    t
      auto-save-timeout               120
      scroll-preserve-screen-position t
      scroll-conservatively           100000
      scroll-step                     1
      scroll-margin                   5)
(setq-default cursor-type      'bar
              tab-width        2
              indent-tabs-mode nil
              fill-column      80)

;; start-up
(use-package startup :defer t
  :init
  (setq inhibit-startup-screen     t
        initial-scratch-message    nil
        auto-save-list-file-prefix bk:temp-directory))

;; frame
(use-package frame :defer t
  :init (blink-cursor-mode 0))
  
;; fringe
(use-package fringe :defer t
  :init (set-fringe-mode '(nil . 0)))  

;; hilight line
(use-package hl-line :defer t
  :init
  (setq global-hl-line-sticky-frag nil)
  (global-hl-line-mode t))

;; simple
(use-package simple :defer t
  :init
  (setq global-mark-ring-max 1000
        mark-ring-max        1000
        kill-ring-max        1000
        kill-whole-line      t)
  (column-number-mode t))

;; delsel
(use-package delsel :defer t
  :init (delete-selection-mode t))

;; mule-cmds
(use-package  mule-cmds :defer t
  :init
  (set-language-environment "Korean")
  (prefer-coding-system 'utf-8))
;; (set-selection-coding-system 'utf-8)

;; ;; fonts
;; ;; (if (bk/font-exists-p "Noto Sans Mono CJK KR-12")
;; ;;     (add-to-list 'default-frame-alist '(font . "Noto Sans Mono CJK KR-12")))
;; ;; (if (bk/font-exists-p "Noto Sans Mono CJK KR")
;; ;;     (set-fontset-font t 'hangul (font-spec :name "Noto Sans Mono CJK KR")))

;; files
(use-package files :defer t
  :init
  (unless (file-exists-p bk:temp-directory)
    (make-directory bk:temp-directory t))
  (setq backup-by-copying      t
        kept-new-versions      5
        kept-old-versions      3
        delete-old-versions    t
        backup-directory-alist `(("." . ,bk:temp-directory))))

;; dired
(use-package dired :defer t
  :init
  (if (eq system-type 'windows-nt)
      (setq dired-listing-switches "-lha")
    (setq dired-listing-switches
          "-lha --group-directories-first"))
  (setq dired-dwim-target       t
        dired-recursive-copies  'always
        dired-recursive-deletes 'always))

;; menu-bar
(use-package menu-bar :bind ("C-x k" . kill-this-buffer))

;; whitespace
(use-package whitespace :defer t
  :diminish whitespace-mode
  :init
  (add-hook
   'diff-mode-hook
   '(lambda()
      (setq-local
       whitespace-style
       '(face tabs tab-mark trailing spaces
              space-mark newline newline-mark              
              indentation::space indentation::tab))
      (whitespace-mode 1)))
  (add-hook
   'prog-mode-hook
   '(lambda()
      (setq-local show-trailing-whitespace 1)
      (setq-local whitespace-style
                  '(face tabs trailing lines-tail))
      (whitespace-mode 1)))
  :config
  (set-face-foreground 'whitespace-line nil))

(use-package abbrev :defer t :diminish abbrev-mode)

(use-package autorevert :defer t :diminish auto-revert-mode
  :init
  (setq auto-revert-verbose nil)
  (global-auto-revert-mode t))

(provide 'init-defaults)


