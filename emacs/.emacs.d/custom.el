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
 '(current-language-environment "UTF-8")
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes t)
 '(default-frame-alist
    (quote
     ((font . "Source Code Pro-14")
      (width . 150)
      (height . 45))))
 '(delete-selection-mode t)
 '(electric-pair-mode t)
 '(global-auto-revert-mode t)
 '(global-hl-line-mode t)
 '(global-hl-line-sticky-flag nil)
 '(global-mark-ring-max 5000)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-frame-alist
   (quote
    ((vertical-scroll-bars)
     (width . 150)
     (height . 45)
     (top . 10)
     (left . 10))))
 '(kill-ring-max 5000)
 '(kill-whole-line t)
 '(mark-ring-max 5000)
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (glsl-mode company-math auctex company-c-headers company-irony-c-headers ace-window avy multiple-cursors smart-mode-line magit clang-format cpputils-cmake cmake-mode cmake-font-lock stickyfunc-enhance helm-projectile google-c-style company-irony flycheck-irony irony flycheck flycheck-google-cpplint iedit sr-speedbar recentf-ext epl pkg-info dired+ ibuffer-vc projectile expand-region yasnippet undo-tree clean-aindent-mode smartparens volatile-highlights duplicate-thing anaphora dash f s company async helm color-theme-sanityinc-tomorrow)))
 '(safe-local-variable-values
   (quote
    ((eval setq-local projectile-project-run-cmd
           (expand-file-name "~/VersionControl/Research/interpolation/build/interpolation"))
     (projectile-project-compilation-cmd . "make -j 8 -C \"~/VersionControl/Research/interpolation/build\"")
     (eval setq-local projectile-project-run-cmd
           (expand-file-name "~/VersionControl/Modules/QtPlotter/build/qtplot"))
     (projectile-project-compilation-cmd . "make -j 4 -C \"~/VersionControl/Modules/QtPlotter/build\"")
     (projectile-project-run-cmd . "make test -C \"~/VersionControl/Modules/libML/build\"")
     (projectile-project-compilation-cmd . "make -j 8 -C \"~/VersionControl/Modules/libML/build\"")
     (eval setq-local projectile-project-run-cmd
           (expand-file-name "~/VersionControl/Research/sketchimo/build/sketchimo"))
     (projectile-project-compilation-cmd . "make -j 8 -C \"~/VersionControl/Research/sketchimo/build\""))))
 '(scroll-bar-mode nil)
 '(scroll-conservatively 100000)
 '(scroll-preserve-screen-position t)
 '(semantic-default-submodes
   (quote
    (global-semantic-decoration-mode global-semantic-stickyfunc-mode global-semantic-idle-scheduler-mode global-semanticdb-minor-mode)))
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(sml/mode-width (quote right))
 '(sml/theme (quote respectful))
 '(tab-width 2)
 '(tool-bar-mode nil)
 '(visible-bell t)
 '(winner-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(iedit-occurrence ((t (:inherit highlight :inverse-video t)))))

;;; custom.el ends here
