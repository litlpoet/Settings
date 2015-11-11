;;; custom.el --- emacs customization file
;;; Commentary:
;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(compilation-scroll-output t)
 '(custom-safe-themes t)
 '(delete-selection-mode t)
 '(fill-column 80)
 '(fringe-mode (quote (nil . 0)) nil (fringe))
 '(global-hl-line-mode t)
 '(global-hl-line-sticky-flag nil)
 '(global-mark-ring-max 5000)
 '(ibuffer-use-other-window t)
 '(indent-tabs-mode nil)
 '(initial-scratch-message "")
 '(ispell-dictionary "en")
 '(kill-ring-max 5000)
 '(kill-whole-line t)
 '(mark-ring-max 5000)
 '(package-selected-packages
   (quote
    (atom-one-dark-theme which-key malinka gitignore-mode markdown-mode helm-mode irony god-mode cmake-ide rtags use-package color-theme-sanityinc-tomorrow smart-mode-line smartparens macrostep org git-gutter-fringe paradox hungry-delete rainbow-delimiters company-auctex magit helm-ag glsl-mode company-math auctex company-c-headers company-irony-c-headers ace-window avy multiple-cursors clang-format cmake-mode cmake-font-lock helm-projectile google-c-style company-irony flycheck-irony flycheck flycheck-google-cpplint iedit recentf-ext epl pkg-info dired+ ibuffer-vc projectile expand-region yasnippet undo-tree clean-aindent-mode volatile-highlights duplicate-thing anaphora dash f s company async helm)))
 '(safe-local-variable-values
   (quote
    ((eval setq-local projectile-project-run-cmd
           (expand-file-name "~/VersionControl/Modules/QtPlotter/build/qtplot"))
     (projectile-project-compilation-cmd . "make -j 4 -C \"~/VersionControl/Modules/QtPlotter/build\"")
     (projectile-project-run-cmd . "make test -C \"~/VersionControl/Modules/libML/build\"")
     (projectile-project-compilation-cmd . "make -j 8 -C \"~/VersionControl/Modules/libML/build\""))))
 '(scroll-conservatively 100000)
 '(scroll-preserve-screen-position t)
 '(tab-width 2)
 '(visible-bell t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; custom.el ends here
