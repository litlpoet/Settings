;;; init.el --- emacs initialization script          -*- lexical-binding: t; -*-

;; Copyright (C) 2015  bk

;; Author: bk <bk@T530>
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

;;; Code:

;; add melpa to package-list
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; make customize setting sperated from this .emacs file
;; note: try to use customize for built-in packages
;;       except 'theme' related packages
(setq custom-file
      (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)
;; (package-user-selected-packages-install) ;; no such a funcion yet

(defconst root-dir (file-name-directory load-file-name)
  "The root directory of the .emacs.")

(defconst bk:setting-load-path
  (expand-file-name "bk-settings" user-emacs-directory)
  "The load path for bk's setting.")

(defconst bk-setting-directory
  (file-name-as-directory bk:setting-load-path)
  "The directory for bk's setting.")

;; only y-or-n prompt
(defalias 'yes-or-no-p 'y-or-n-p)

;; add my setting modules path
(add-to-list 'load-path bk:setting-load-path)

;; load my module
(require 'setup-packages) ;; should be done first

;; setup packages
(require 'setup-helm)
(require 'setup-projectile)
(require 'setup-irony)
(require 'setup-company)
(require 'setup-cmake)
(require 'setup-flycheck)
(require 'setup-yasnippet)
(require 'setup-org)
(require 'setup-auctex)
(require 'setup-smartparens)
(require 'setup-paradox)
(require 'setup-gitgutter)

;; setup global and modes
(require 'setup-display-buffer)
(require 'setup-convenience)
(require 'setup-editing)
(require 'setup-faces-and-ui)
(require 'setup-files)
(require 'setup-programming)
(require 'setup-auto-insert)

;; environmental variables
(when (eq system-type 'windows-nt)
  (setenv "GIT_ASKPASS" "git-gui--askpass"))

(provide 'init)
;;; init.el ends here
