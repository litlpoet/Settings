;;; init-keybindings-hydras-dired.el --- hydra dired definitions       -*- lexical-binding: t; -*-

;; Copyright (C) 2018  Byungkuk Choi
;; Author: Byungkuk Choi <bk@i7-G6>
;; Keywords: lisp

;;; Commentary:
;; hydra dired definitions

;;; Code:
(defhydra bk:hydra-dired (:hint nil :color red)
  "
^Mark^            ^Actions^           ^Dir^               ^View^            ^wdired^           ^Navigation^
_m_: mark         _C_: copy           _+_: mkdir          _v_: view         ^C-x C-q: edit^    _p_:   ↑
_u_: unmark       _D_: delete         _i_: insert-subdir  _o_: open other   ^C-c C-c: commit^  _RET_: visit
_U_: unmark all   _R_: rename         _k_: kill-subdir    _(_: details      ^C-c ESC: abort^   _n_:   ↓
_t_: toggle       _S_: symlink        _$_: hide-subdir    _)_: omit
_F_: find marked  _Y_: rel symlink    _g_: revert         _s_: sort         ^ ^                _._: toggle hydra
^ ^               _M_: chmod          _l_: redisplay
^ ^               _Z_: compress
^ ^
"
  ("m" dired-mark)
  ("u" dired-unmark)
  ("U" dired-unmark-all-marks)
  ("t" dired-toggle-marks)
  ("F" dired-do-find-marked-files :color blue)

  ("C" dired-do-copy :color blue)
  ("D" dired-do-delete :color blue)
  ("R" dired-do-rename :color blue)
  ("S" dired-do-symlink :color blue)
  ("Y" dired-do-relsymlink :color blue)
  ("M" dired-do-chmod :color blue)
  ("Z" dired-do-compress :color blue)

  ("+" dired-create-directory :color blue)
  ("i" dired-maybe-insert-subdir)
  ("k" dired-kill-subdir)
  ("$" dired-hide-subdir)
  ("g" revert-buffer)        ;; read all directories again (refresh)
  ("l" dired-do-redisplay)   ;; relist the marked or single directory

  ("v" dired-view-file :color blue)      ;; q to exit, s to search, = gets line #
  ("o" dired-find-file-other-window :color blue)
  ("(" dired-hide-details-mode)
  (")" dired-omit-mode)
  ("s" dired-sort-toggle-or-edit)

  ("p" dired-previous-line)
  ("C-p" dired-previous-line)
  ("n" dired-next-line)
  ("C-n" dired-next-line)
  ("RET" dired-find-file :color blue)
  ("." nil :color blue))

(provide 'init-keybindings-hydras-dired)
;;; init-keybindings-hydras-dired.el ends here
