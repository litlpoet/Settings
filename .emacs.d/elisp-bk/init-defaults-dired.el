;;; init-defaults-dired.el --- dired extensions      -*- lexical-binding: t; -*-

;; Copyright (C) 2017  Byungkuk Choi

;; Author: Byungkuk Choi <bk@i7-G6>
;; Keywords: lisp, abbrev

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

;; dired extensions

;;; Code:

;; dired
(use-package dired
  :defer t
  :config
  (if (eq system-type 'windows-nt)
      (setq dired-listing-switches "-lha")
    (setq dired-listing-switches
          "-lha --group-directories-first"))
  (setq dired-dwim-target       t
        dired-recursive-copies  'always
        dired-recursive-deletes 'always)
  (use-package dired-hacks-utils
    :ensure t))

(provide 'init-defaults-dired)
;;; init-defaults-dired.el ends here
