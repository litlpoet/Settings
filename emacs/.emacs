;;; .emacs.el --- initialize scripts
;;; Commentary:
;;; Code:

;; add melpa to package-list
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; make customize setting sperated from this .emacs file
(setq custom-file
      (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; auto install packages
(defvar auto-package-install-file
  (expand-file-name "auto-package-install.el" user-emacs-directory))
(load auto-package-install-file)

(defvar root-dir (file-name-directory load-file-name)
  "The root directory of the .emacs.")

(defvar bk-setting-dir
  (expand-file-name "bk-settings" user-emacs-directory)
  "The directory for bk's setting.")

;; add my setting modules path
(add-to-list 'load-path bk-setting-dir)

;; load my module
(require 'setup-helm)
(require 'setup-projectile)
(require 'setup-irony)
(require 'setup-company)
(require 'setup-flycheck)
(require 'setup-org)
(require 'setup-convenience)
(require 'setup-editing)
(require 'setup-faces-and-ui)
(require 'setup-files)
(require 'setup-programming)

;; environmental variables
(when (eq system-type 'windows-nt)
  (setenv "GIT_ASKPASS" "git-gui--askpass"))

;;; .emacs ends here
