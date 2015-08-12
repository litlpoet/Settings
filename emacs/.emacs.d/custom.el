;;; custom.el --- emacs customization file

;;; Commentary:

;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(compilation-scroll-output t)
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes
   (quote
    ("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default)))
 '(package-selected-packages
   (quote
    (multiple-cursors smart-mode-line-powerline-theme smart-mode-line golden-ratio magit evil clang-format cpputils-cmake cmake-mode cmake-font-lock stickyfunc-enhance helm-projectile google-c-style company-irony flycheck-irony irony flycheck flycheck-google-cpplint iedit company-c-headers sr-speedbar recentf-ext epl pkg-info dired+ ibuffer-vc projectile expand-region yasnippet undo-tree clean-aindent-mode smartparens volatile-highlights duplicate-thing anaphora dash f s company async helm color-theme-sanityinc-tomorrow)))
 '(safe-local-variable-values
   (quote
    ((projectile-project-run-cmd . "s:/VersionControl/Research/sketchimo/build/sketchimo.exe")
     (projectile-project-compilation-cmd . "make -j 4 -C \"s:/VersionControl/Research/sketchimo/vmcr/build\"")
     (projectile-project-run-cmd . "make test -C \"s:/VersionControl/Research/libML/build\"")
     (projectile-project-compilation-cmd . "make -j 4 -C \"s:/VersionControl/Research/libML/build\"")
     (projectile-project-run-cmd . "s:/VersionControl/Research/QtPlotter/build/Plotter.exe")
     (projectile-project-compilation-cmd . "make -j 4 -C \"s:/VersionControl/Research/QtPlotter/build\""))))
 '(sml/mode-width (quote right))
 '(sml/theme (quote respectful)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; custom.el ends here
