;;; setup-editing.el --- editing package setup
;;; Commentary:
;;; Code:

;; basic editing extensions
(message "[bk:setup-editing.el is loading...]")

;; encodings
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
;; (setq default-input-method "korean-hangul")

;; new line
(global-set-key (kbd "RET") 'newline-and-indent)

;; toggle input
(global-set-key (kbd "<kana>") 'toggle-input-method)

;; important white space in diff-mode
(add-hook
 'diff-mode-hook
 (lambda()
   (setq-local
    whitespace-style
    '(face tabs tab-mark trailing
      indentation::space indentation::tab
      spaces space-mark newline newline-mark))
   (whitespace-mode 1)))

;; duplicate-thing
(require 'duplicate-thing)
(global-set-key (kbd "M-c") 'duplicate-thing)

;; volatile-highlights
(require 'volatile-highlights)
(volatile-highlights-mode t)

;; clean-aindent-mode
(require 'clean-aindent-mode)
(add-hook 'prog-mode-hook 'clean-aindent-mode)

;; undo tree
(require 'undo-tree)
(global-undo-tree-mode)
(setq undo-tree-mode-lighter " UndoT")

;; iedit
(require 'iedit)
(global-set-key (kbd "C-;") 'iedit-mode)

;; multiple-cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-s-c") 'mc/edit-lines) ;
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(provide 'setup-editing)
;;; setup-editing.el ends here
