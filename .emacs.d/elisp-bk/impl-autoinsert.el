;;; impl-autoinsert.el -- implementation for autoload  -*- lexical-binding: t; -*-

;; Copyright (C) 2015  Byungkuk

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
;; Author: Byungkuk <bk@Core2Quad>
;; Keywords: Lisp

;;; Code:
(defvar bk:auto-insert-alist
  '((("\\.[hH]\\(h\\|pp\\)?$" . "C/C++ header") . bk:generate-include-guard)))

;;;###autoload
(defun bk:format-include-guard-fallback ()
  "Generate an include guard string with file name."
  (let ((filename
         (file-name-nondirectory
          (file-name-sans-extension buffer-file-name)))
        (ext
         (file-name-extension buffer-file-name)))
    (replace-regexp-in-string
     "[^A-Z0-9_]" "_"
     (upcase (concat filename "_" ext "_")))))

;;;###autoload
(defun bk:format-include-guard ()
  "Format an include guard, using projectile-project-root.
If not in a projectile project use `bk:format-include-guard-fallback'."
  (if (projectile-project-p)
      (let ((filename
             (cl-subseq
              (file-name-sans-extension buffer-file-name)
              (length (projectile-project-root))))
            (ext (file-name-extension buffer-file-name)))
        (replace-regexp-in-string
         "[^A-Z0-9_]" "_"
         (upcase (concat filename "_" ext "_"))))
    (bk:format-include-guard-fallback)))

;;;###autoload
(defun bk:generate-include-guard ()
  "Generate an include guard (should be in a C/C++ file).
used by the symbol `auto-insert-mode'."
  (insert "guard")
  (yas/expand))

(provide 'impl-autoinsert)
;;; impl-autoinsert.el ends here
