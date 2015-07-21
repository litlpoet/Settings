;;; .emacs.el --- initialize scripts
;;; Commentary:
;;; Code:

;; add melpa to package-list
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes
   (quote
    ("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default)))
 '(package-selected-packages
   (quote
    (smart-mode-line-powerline-theme smart-mode-line golden-ratio magit evil clang-format cpputils-cmake cmake-mode cmake-font-lock stickyfunc-enhance helm-projectile google-c-style company-irony flycheck-irony irony flycheck flycheck-google-cpplint iedit company-c-headers sr-speedbar recentf-ext epl pkg-info dired+ ibuffer-vc projectile expand-region yasnippet undo-tree clean-aindent-mode smartparens volatile-highlights duplicate-thing anaphora dash f s company async helm color-theme-sanityinc-tomorrow)))
 '(sml/mode-width (quote right))
 '(sml/theme (quote respectful)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; add my setting modules path
(add-to-list 'load-path
	     "~/.emacs.d/bk-settings/")

;; evil mode
;; (require 'evil)
;; (evil-mode 1)

;; environmental variables
(when (eq system-type 'windows-nt)
  (setenv "GIT_ASKPASS" "git-gui--askpass")
  )

;; load my module
(require 'setup-helm)
(require 'setup-projectile)
(require 'setup-irony)
(require 'setup-company)
(require 'setup-flycheck)
(require 'setup-convenience)
(require 'setup-editing)
(require 'setup-faces-and-ui)
(require 'setup-files)
(require 'setup-programming)

;;; .emacs ends here
