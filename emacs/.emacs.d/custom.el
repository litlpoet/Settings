;;; custom.el --- emacs customization file
;;; Commentary:
;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(compilation-scroll-output t)
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes
   (quote
    ("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default)))
 '(default-frame-alist
    (quote
     ((font . "Source Code Pro-14")
      (width . 150)
      (height . 45))))
 '(global-auto-revert-mode t)
 '(global-hl-line-mode t)
 '(global-hl-line-sticky-flag nil)
 '(inhibit-startup-screen t)
 '(initial-frame-alist
   (quote
    ((vertical-scroll-bars)
     (width . 150)
     (height . 45)
     (top . 10)
     (left . 10))))
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (multiple-cursors smart-mode-line golden-ratio magit clang-format cpputils-cmake cmake-mode cmake-font-lock stickyfunc-enhance helm-projectile google-c-style company-irony flycheck-irony irony flycheck flycheck-google-cpplint iedit company-c-headers sr-speedbar recentf-ext epl pkg-info dired+ ibuffer-vc projectile expand-region yasnippet undo-tree clean-aindent-mode smartparens volatile-highlights duplicate-thing anaphora dash f s company async helm color-theme-sanityinc-tomorrow)))
 '(safe-local-variable-values nil)
 '(scroll-bar-mode nil)
 '(scroll-conservatively 100000)
 '(scroll-preserve-screen-position t)
 '(size-indication-mode t)
 '(sml/mode-width (quote right))
 '(sml/theme (quote respectful))
 '(tool-bar-mode nil)
 '(visible-bell t)
 '(winner-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(iedit-occurrence ((t (:inherit highlight :box (:line-width 1 :color "grey75"))))))

;;; custom.el ends here
