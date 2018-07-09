;;; hydra-window.el --- hydra window definitions     -*- lexical-binding: t; -*-

;; Copyright (C) 2018  Byungkuk Choi

;; Author: Byungkuk Choi <bk@i7-G6>
;; Keywords: lisp

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; hydra window definitions

;;; Code:

(defhydra hydra-window (:color red :hint nil)
  "
^Resize^       ^Text Size^      ^Layout^            ^Move^
_b_: |→←|      _+_: increase    _s_: swap           ^ ^ _k_ ^ ^
_f_: |←→|      _-_: decrease    _F_: full screen    _h_ ^+^ _l_
_n_: o         _0_: reset       ^ ^                 ^ ^ _j_ ^ ^
_p_: O         ^ ^              ^ ^                 _e_: exit
_B_: balance
"
  ("b" shrink-window-horizontally)
  ("f" enlarge-window-horizontally)
  ("n" shrink-window)
  ("p" enlarge-window)
  ("B" balance-windows)
  ("+" text-scale-increase)
  ("-" text-scale-decrease)
  ("0" text-scale-adjust)
  ("s" ace-swap-window)
  ("F" toggle-frame-fullscreen)
  ("h" windmove-left)
  ("l" windmove-right)
  ("k" windmove-up)
  ("j" windmove-down)
  ("e" nil))

(provide 'hydra-window)
;;; hydra-window.el ends here
