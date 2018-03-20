;;; init-essentials-window.el --- window management  -*- lexical-binding: t; -*-

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

;; window management

;;; Code:

;; (window) ace-window
(use-package ace-window
  :ensure t
  :bind (("C-x o" . ace-window)
         ("C-x 1" . ace-delete-window)))

;; (window) purpose
(use-package window-purpose
  :ensure t
  :hook (after-init . purpose-mode))

;; (window) purpose
(use-package ivy-purpose
  :ensure t
  :after (ivy window-purpose)
  :commands (ivy-purpose-setup)
  :init
  (ivy-purpose-setup))



(provide 'init-essentials-window)
;;; init-essentials-window.el ends here
