;;; .emacs.el --- initialize scripts
;;; Commentary:
;;; Code:

;; ;; add melpa to package-list
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

(defconst bk-setting-load-path
  (expand-file-name "bk-settings" user-emacs-directory)
  "The load path for bk's setting.")

(defconst bk-setting-directory
  (file-name-as-directory bk-setting-load-path)
  "The directory for bk's setting.")

;; add my setting modules path
(add-to-list 'load-path bk-setting-load-path)

;; load my module
(require 'setup-packages) ;; should be done first
(require 'setup-helm)
(require 'setup-projectile)
(require 'setup-irony)
(require 'setup-company)
(require 'setup-flycheck)
(require 'setup-org)
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

;;; .emacs ends here
