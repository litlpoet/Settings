;;; setup-editing.el --- editing package setup
;;; Commentary:
;;; Code:

;; basic editing extensions
(setq global-mark-ring-max 5000
      mark-ring-max 5000
      mode-require-final-newline t
      tab-width 2)

(setq-default indent-tabs-mode nil)
(delete-selection-mode)
(global-set-key (kbd "RET") 'newline-and-indent)

;; encodings
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; (set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)
;; (setq default-input-method "korean-hangul")

;; killing
(setq kill-ring-max 5000
      kill-whole-line t)

;; important white space in diff-mode
(add-hook 'diff-mode-hook
          (lambda()
            (setq-local whitespace-style
                        '(face
                          tabs
                          tab-mark
                          spaces
                          space-mark
                          trailing
                          indentation::space
                          indentation::tab
                          newline
                          newline-mark))
            (whitespace-mode 1)))

;; duplicate-thing
(require 'duplicate-thing)
(global-set-key (kbd "M-c") 'duplicate-thing)

;; volatile-highlights
(require 'volatile-highlights)
(volatile-highlights-mode t)

;; smartparen
(require 'smartparens-config)
;; (setq sp-base-key-bindings 'paredit)
;; (setq sp-autoskip-closing-pair 'always)
;; (setq sp-hybrid-kill-entire-symbol nil)
;; (sp-use-paredit-bindings)
(show-smartparens-global-mode +1)
(smartparens-global-mode 1)

(sp-with-modes '(c-mode c++-mode)
  (sp-local-pair "{" nil :post-handlers '(("||\n[i]" "RET")))
  (sp-local-pair "/*" "*/" :post-handlers '((" | " "SPC")
                                            ("* ||\n[i]" "RET")))
  )

;; clean-aindent-mode
(require 'clean-aindent-mode)
(add-hook 'prog-mode-hook ' clean-aindent-mode)

;; undo tree
(require 'undo-tree)
(global-undo-tree-mode)

;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; multiple-cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-s-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(provide 'setup-editing)
;;; setup-editing.el ends here
