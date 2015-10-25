;;; custom.el --- emacs customization file
;;; Commentary:
;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-insert-mode t)
 '(auto-insert-query nil)
 '(auto-revert-verbose nil)
 '(auto-save-timeout 120)
 '(backup-by-copying t)
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(compilation-scroll-output t)
 '(current-language-environment "UTF-8")
 '(custom-safe-themes t)
 '(delete-old-versions t)
 '(delete-selection-mode t)
 '(dired-dwim-target t)
 '(dired-recursive-copies (quote always))
 '(dired-recursive-deletes (quote always))
 '(fill-column 80)
 '(fringe-mode (quote (8 . 3)) nil (fringe))
 '(global-auto-revert-mode t)
 '(global-hl-line-mode t)
 '(global-hl-line-sticky-flag nil)
 '(global-mark-ring-max 5000)
 '(ibuffer-use-other-window t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-echo-area-message "hi~ bk.")
 '(inhibit-startup-screen t)
 '(initial-scratch-message "")
 '(ispell-dictionary "en")
 '(kept-new-versions 5)
 '(kept-old-versions 3)
 '(kill-ring-max 5000)
 '(kill-whole-line t)
 '(mark-ring-max 5000)
 '(package-selected-packages
   (quote
    (smartparens macrostep org git-gutter-fringe paradox hungry-delete rainbow-delimiters company-auctex magit helm-ag glsl-mode company-math auctex company-c-headers company-irony-c-headers ace-window avy multiple-cursors clang-format cpputils-cmake cmake-mode cmake-font-lock helm-projectile google-c-style company-irony flycheck-irony irony flycheck flycheck-google-cpplint iedit recentf-ext epl pkg-info dired+ ibuffer-vc projectile expand-region yasnippet undo-tree clean-aindent-mode volatile-highlights duplicate-thing anaphora dash f s company async helm)))
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
 '(scroll-conservatively 100000)
 '(scroll-preserve-screen-position t)
 '(size-indication-mode t)
 '(tab-width 2)
 '(visible-bell t)
 '(wdired-allow-to-change-permissions t)
 '(winner-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(magit-diff-file-heading ((t (:inverse-video t :weight extra-bold)))))

;;; custom.el ends here
