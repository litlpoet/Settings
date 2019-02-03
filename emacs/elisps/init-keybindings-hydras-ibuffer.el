;;; init-keybindings-hydras-ibuffer.el --- hydra ibuffer description   -*- lexical-binding: t; -*-

;; Copyright (C) 2018  Byungkuk Choi
;; Author: Byungkuk Choi <bk@i7-G6>
;; Keywords: lisp

;;; Commentary:
;; hydra ibuffer description

;;; Code:
(defhydra bk:hydra-ibuffer (:color red :hint nil)
  "
^Mark^         ^Actions^          ^View^        ^Select^         ^Navigation^
_m_: mark      _D_: delete        _g_: refresh  _q_: quit        _p_:   ↑    _b_
_u_: unmark    _S_: save marked   _s_: sort     _TAB_: toggle    _RET_: visit
_t_: toggle    _a_: all actions   _/_: filter   _o_: open other  _n_:   ↓    _f_
_*_: specific  _._: toggle hydra  _H_: help     C-o: view other
"
  ("m"   ibuffer-mark-forward)
  ("u"   ibuffer-unmark-forward)
  ("*"   bk:hydra-ibuffer-mark/body :color blue)
  ("t"   ibuffer-toggle-marks)
  ("D"   ibuffer-do-delete)
  ("S"   ibuffer-do-save)
  ("a"   bk:hydra-ibuffer-action/body :color blue)
  ("g"   ibuffer-update)
  ("s"   bk:hydra-ibuffer-sort/body :color blue)
  ("/"   bk:hydra-ibuffer-filter/body :color blue)
  ("H"   describe-mode :color blue)
  ("b"   ibuffer-backward-filter-group)
  ("p"   ibuffer-backward-line)
  ("f"   ibuffer-forward-filter-group)
  ("n"   ibuffer-forward-line)
  ("RET" ibuffer-visit-buffer :color blue)
  ("TAB" ibuffer-toggle-filter-group)
  ("o"   ibuffer-visit-buffer-other-window :color blue)
  ("q"   quit-window :color blue)
  ("."   nil :color blue))

(defhydra bk:hydra-ibuffer-mark
  (:color teal :columns 5 :after-exit (bk:hydra-ibuffer/body))
  "Mark"
  ("*" ibuffer-unmark-all "unmark all")
  ("M" ibuffer-mark-by-mode "mode")
  ("m" ibuffer-mark-modified-buffers "modified")
  ("u" ibuffer-mark-unsaved-buffers "unsaved")
  ("s" ibuffer-mark-special-buffers "special")
  ("r" ibuffer-mark-read-only-buffers "read-only")
  ("/" ibuffer-mark-dired-buffers "dired")
  ("e" ibuffer-mark-dissociated-buffers "dissociated")
  ("h" ibuffer-mark-help-buffers "help")
  ("z" ibuffer-mark-compressed-file-buffers "compressed")
  ("b" bk:hydra-ibuffer/body "back" :color blue))

(defhydra bk:hydra-ibuffer-action
  (:color teal :columns 4 :after-exit (if (eq major-mode 'ibuffer-mode)
                                          (bk:hydra-ibuffer/body)))
  "Action"
  ("A" ibuffer-do-view "view")
  ("E" ibuffer-do-eval "eval")
  ("F" ibuffer-do-shell-command-file "shell-command-file")
  ("I" ibuffer-do-query-replace-regexp "query-replace-regexp")
  ("H" ibuffer-do-view-other-frame "view-other-frame")
  ("N" ibuffer-do-shell-command-pipe-replace "shell-cmd-pipe-replace")
  ("M" ibuffer-do-toggle-modified "toggle-modified")
  ("O" ibuffer-do-occur "occur")
  ("P" ibuffer-do-print "print")
  ("Q" ibuffer-do-query-replace "query-replace")
  ("R" ibuffer-do-rename-uniquely "rename-uniquely")
  ("T" ibuffer-do-toggle-read-only "toggle-read-only")
  ("U" ibuffer-do-replace-regexp "replace-regexp")
  ("V" ibuffer-do-revert "revert")
  ("W" ibuffer-do-view-and-eval "view-and-eval")
  ("X" ibuffer-do-shell-command-pipe "shell-command-pipe")
  ("b" nil "back"))

(defhydra bk:hydra-ibuffer-sort (:color amaranth :columns 3)
  "Sort"
  ("i" ibuffer-invert-sorting "invert")
  ("a" ibuffer-do-sort-by-alphabetic "alphabetic")
  ("v" ibuffer-do-sort-by-recency "recently used")
  ("s" ibuffer-do-sort-by-size "size")
  ("f" ibuffer-do-sort-by-filename/process "filename")
  ("m" ibuffer-do-sort-by-major-mode "mode")
  ("b" bk:hydra-ibuffer/body "back" :color blue))

(defhydra bk:hydra-ibuffer-filter (:color amaranth :columns 4)
  "Filter"
  ("m" ibuffer-filter-by-used-mode "mode")
  ("M" ibuffer-filter-by-derived-mode "derived mode")
  ("n" ibuffer-filter-by-name "name")
  ("c" ibuffer-filter-by-content "content")
  ("e" ibuffer-filter-by-predicate "predicate")
  ("f" ibuffer-filter-by-filename "filename")
  (">" ibuffer-filter-by-size-gt "size")
  ("<" ibuffer-filter-by-size-lt "size")
  ("/" ibuffer-filter-disable "disable")
  ("b" bk:hydra-ibuffer/body "back" :color blue))

(provide 'init-keybindings-hydras-ibuffer)
;;; init-keybindings-hydras-ibuffer.el ends here
