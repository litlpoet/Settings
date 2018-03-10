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
  :hook (c-mode-common . malinka-mode)
  :config
  ;; (setq malinka-print-debug? 1)
  (malinka-define-project
   :name            "libmotion"
   :root-directory  "/home/bk/dev/vc/projects/libmotion"
   :build-directory "/home/bk/dev/vc/projects/libmotion/build"
   :configure-cmd   "cmake .."
   :compile-db-cmd  "conan install .. -s build_type=Release && cmake .."
   :compile-cmd     "cmake --build . --config Release -- -j8"
   :test-directory  "/home/bk/dev/vc/projects/libmotion/build"
   :test-cmd        "ctest -V"
   )
  (malinka-define-project
   :name            "PositionBasedDynamics"
   :root-directory  "/home/bk/dev/vc/thirdparties/PositionBasedDynamics"
   :build-directory "/home/bk/dev/vc/thirdparties/PositionBasedDynamics/build"
   :configure-cmd   "cmake .."
   :compile-cmd     "cmake --build . --config Release -- -j8"
   )
  (malinka-define-project
   :name            "libML"
   :root-directory  "/home/bk/dev/vc/projects/libML"
   :build-directory "/home/bk/dev/vc/projects/libML/build"
   :configure-cmd   "cmake ../source/"
   :compile-cmd     "make -j8"
   )
  (malinka-define-project
   :name            "sketchimo"
   :root-directory  "/home/bk/dev/vc/projects/sketchimo"
   :build-directory "/home/bk/dev/vc/projects/sketchimo/build"
   :configure-cmd   "cmake .."
   :compile-cmd     "make -j8"
   :run-cmd         "./build/sketchimo"
   )
  (malinka-define-project
   :name            "test_ceres"
   :root-directory  "/home/bk/dev/vc/tutorials/test_ceres"
   :build-directory "/home/bk/dev/vc/tutorials/test_ceres/build"
   :configure-cmd   "cmake ../src/"
   :compile-cmd     "make -j8"
   ))

(provide 'init-malinka-proj)
;;; init-malinka-proj.el ends here
