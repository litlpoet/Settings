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

(provide 'init-keybindings)
;;; init-keybindings.el ends here
