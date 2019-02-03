;;; init-keybindings-base.el ---  all key bindings        -*- lexical-binding: t; -*-

;; Copyright (C) 2019  Byungkuk Choi
;; Author: Byungkuk Choi <bk@i7-G6>
;; Keywords: lisp

;;; Commentary:
;; All key bindings

;;; Code:
(use-package which-key :init (which-key-mode))

;; personal global key bindings (built-in)
(bind-keys*
 ("C-x k"     . kill-this-buffer)
 ("C-x C-b"   . ibuffer)
 ("S-<left>"  . windmove-left)
 ("S-<right>" . windmove-right)
 ("S-<down>"  . windmove-down)
 ("S-<up>"    . windmove-up))

;; personal global key bindings (modules)
(bind-keys
 ("C-;"     . iedit-mode)
 ("C-:"     . iedit-mode-toggle-on-function)
 ("M-c"     . duplicate-thing)
 ("M-2"     . er/expand-region)
 ("M-3"     . mc/mark-previous-like-this)
 ("M-4"     . mc/mark-next-like-this)
 ("M-#"     . mc/skip-to-previous-like-this)
 ("M-$"     . mc/skip-to-next-like-this)
 ("C-r"     . counsel-grep-or-swiper)
 ("C-s"     . counsel-grep-or-swiper)
 ("C-c C-r" . ivy-resume)
 ("C-c g"   . counsel-git)
 ("C-c j"   . counsel-git-grep)
 ("C-c k"   . counsel-ag)
 ("C-c l"   . counsel-locate)
 ("C-c s"   . magit-status)
 ("C-c z"   . zeal-at-point)
 ("C-c C-j" . direx-project:jump-to-project-root)
 ([remap other-window]         . ace-window)
 ([remap delete-other-windows] . ace-delete-window))

(with-eval-after-load 'undo-tree
  (bind-keys ("C-?" . undo-tree-redo))) ;; undo-tree-redo is not autoloaded

(with-eval-after-load 'projectile
  (bind-keys
   :map projectile-mode-map
   ("C-c p" . projectile-command-map)))

;; personal local key bindings (built-in)
(with-eval-after-load 'dired
  (bind-keys
   :map dired-mode-map
   ("k" . dired-kill-subdir)
   (")" . dired-omit-mode)
   ([remap quit-window] . (lambda() (interactive) (quit-window t)))))

;; personal local key bindings (modules)
(with-eval-after-load 'company
  (bind-keys
   :map prog-mode-map
   ("M-i" . company-complete)
   :map text-mode-map
   ("M-i" . company-complete)))

(with-eval-after-load 'smartparens
  (bind-keys
   :map smartparens-mode-map
   ("C-M-w"         . sp-copy-sexp)
   ("M-<delete>"    . sp-unwrap-sexp)
   ("M-<backspace>" . sp-backward-unwrap-sexp)
   ("M-D"           . sp-splice-sexp)
   ("M-F"           . sp-forward-symbol)
   ("M-B"           . sp-backward-symbol)))

(with-eval-after-load 'elisp-mode
  (bind-keys
   :map emacs-lisp-mode-map
   ("C-c e m" . macrostep-expand)))

(with-eval-after-load 'clang-format
  (bind-keys
   :map c-mode-base-map
   ("C-c C-f" . clang-format-buffer)))

(provide 'init-keybindings-base)
;;; init-keybindings-base.el ends here
