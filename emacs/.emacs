;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (monokai)))
 '(custom-safe-themes
   (quote
    ("05c3bc4eb1219953a4f182e10de1f7466d28987f48d647c01f1f0037ff35ab9a" default)))
 '(font-use-system-font t)
 '(inhibit-startup-screen t)
 '(initial-frame-alist
   (quote
    ((vertical-scroll-bars)
     (width . 120)
     (height . 70))))
 '(menu-bar-mode nil)
 '(next-line-add-newlines t)
 '(org-log-done (quote time))
 '(package-selected-packages
   (quote
    (undo-tree volatile-highlights dash epl pkg-info helm-projectile projectile async helm monokai-theme company popup yasnippet company-c-headers cmake-mode)))
 '(scroll-bar-mode nil)
 '(scroll-step 1)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; add MELPA to repository list
(add-to-list
 'package-archives '("melpa" . "http://melpa.org/packages/")
 )

;; add '~/.emacs.d/elisp/' folder as my custom script folder
(add-to-list
 'load-path "~/.emacs.d/elisp/")
(load "common_config")
(load "org_config")
(load "programming_config")
