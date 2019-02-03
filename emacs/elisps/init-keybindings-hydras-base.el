;;; init-keybindings-hydras-base.el --- personal hydra keybindings  -*- lexical-binding: t; -*-

;; Copyright (C) 2019  Byungkuk Choi
;; Author: Byungkuk Choi <bk@i7-G6>
;; Keywords: lisp

;;; Commentary:
;; collection of personal hydra bindings

;;; Code:
(use-package hydra)

(defhydra bk:hydra-window (:color red :hint nil)
  "
^Resize^       ^Text Size^      ^Layout^            ^Move^
_b_: |→←|      _+_: increase    _s_: swap           ^   ^ _C-p_ ^   ^
_f_: |←→|      _-_: decrease    _F_: full screen    _C-b_ ^ + ^ _C-f_
_n_: o         _0_: reset       ^ ^                 ^   ^ _C-n_ ^   ^
_p_: O         ^ ^              ^ ^                 _q_: exit
_B_: balance
"
  ("b"   shrink-window-horizontally)
  ("f"   enlarge-window-horizontally)
  ("n"   shrink-window)
  ("p"   enlarge-window)
  ("B"   balance-windows)
  ("+"   text-scale-increase)
  ("-"   text-scale-decrease)
  ("0"   text-scale-adjust)
  ("s"   ace-swap-window)
  ("F"   toggle-frame-fullscreen)
  ("C-b" windmove-left)
  ("C-f" windmove-right)
  ("C-p" windmove-up)
  ("C-n" windmove-down)
  ("q"   nil))

(bind-keys
 :prefix-map bk:hydra-global-map
 :prefix "C-c h"
 ("w" . bk:hydra-window/body))

(use-builtin init-keybindings-hydras-dired
  :after dired
  :bind (:map dired-mode-map ("." . bk:hydra-dired/body)))

(use-builtin init-keybindings-hydras-ibuffer
  :after ibuffer
  :bind (:map ibuffer-mode-map ("." . bk:hydra-ibuffer/body)))

(provide 'init-keybindings-hydras-base)
;;; init-keybindings-hydras-base.el ends here
