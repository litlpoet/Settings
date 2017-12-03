;;; init-malinka-proj.el --- malinka projects        -*- lexical-binding: t; -*-

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

;;

;;; Code:

(use-package malinka
  :ensure t
  :init
  (add-hook 'c-mode-common-hook 'malinka-mode)
  :config
  (malinka-define-project
   :name            "libML"
   :root-directory  "/home/bk/vc/projects/libML"
   :build-directory "/home/bk/vc/projects/libML/build"
   :configure-cmd   "cmake ../source/"
   :compile-cmd     "make -j8")
  (malinka-define-project
   :name            "test_ceres"
   :root-directory  "/home/bk/vc/tutorials/test_ceres"
   :build-directory "/home/bk/vc/tutorials/test_ceres/build"
   :configure-cmd   "cmake ../src/"
   :compile-cmd     "make -j8"))

(provide 'init-malinka-proj)
;;; init-malinka-proj.el ends here
