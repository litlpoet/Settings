;;; init-keybindings.el ---  all key bindings        -*- lexical-binding: t; -*-

;; Copyright (C) 2019  Byungkuk Choi
;; Author: Byungkuk Choi <bk@i7-G6>
;; Keywords: lisp

;;; Commentary:
;; All key bindings

;;; Code:
;; (navi) which-key
(use-package which-key
  :hook (after-init . which-key-mode)
  :blackout t)

;; (navi) hydra
(use-package hydra
  :init
  (defhydra hydra-zoom (global-map "<f2>")
    "zoom"
    ("+" text-scale-increase "in")
    ("-" text-scale-decrease "out")
    ("0" text-scale-adjust   "reset")))

(use-builtin hydra-dired
  :after (hydra dired)
  :bind (:map dired-mode-map
              ("." . hydra-dired/body)))

(use-builtin hydra-ibuffer
  :after (hydra ibuffer)
  :bind (:map ibuffer-mode-map
              ("." . hydra-ibuffer/body)))

(use-builtin hydra-window
  :after (hydra)
  :bind ("C-c w" . hydra-window/body))

;; personal global key bindings
(bind-keys* ("C-x k" . kill-this-buffer)
            ("C-x C-b" . ibuffer))
(bind-key "C-c C-j" #'direx-project:jump-to-project-root)
(bind-keys* ("S-<left>"  . windmove-left)
            ("S-<right>" . windmove-right)
            ("S-<down>"  . windmove-down)
            ("S-<up>"    . windmove-up))
(bind-keys ("C-;" . iedit-mode)
           ("C-:" . iedit-mode-toggle-on-function))
(bind-keys ("M-c" . duplicate-thing)
           ("M-2" . er/expand-region)
           ("M-3" . mc/mark-previous-like-this)
           ("M-4" . mc/mark-next-like-this)
           ("M-#" . mc/skip-to-previous-like-this)
           ("M-$" . mc/skip-to-next-like-this))

;; personal local key bindings
(with-eval-after-load 'dired
  (bind-keys :map dired-mode-map
             ("k" . dired-kill-subdir)
             (")" . dired-omit-mode)))
(with-eval-after-load 'smartparens
  (bind-keys :map smartparens-mode-map
             ("C-M-w"         . sp-copy-sexp)
             ("M-<delete>"    . sp-unwrap-sexp)
             ("M-<backspace>" . sp-backward-unwrap-sexp)
             ("M-D"           . sp-splice-sexp)
             ("M-F"           . sp-forward-symbol)
             ("M-B"           . sp-backward-symbol)))
(bind-key "C-c e m" #'macrostep-expand )

(provide 'init-keybindings)
;;; init-keybindings.el ends here
