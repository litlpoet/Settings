;;; init-essentials-ui.el ---  ui configurations     -*- lexical-binding: t; -*-

;; Copyright (C) 2019  Byungkuk Choi
;; Author: Byungkuk Choi <bk@i7-G6>
;; Keywords: lisp

;;; Commentary:
;; all UI related configurations

;;; Code:
;;; theme
(use-package doom-themes
  :init
  (setq doom-themes-enable-bold   t
        doom-themes-enable-italic t)
  (load-theme 'doom-tomorrow-night t)
  :config
  (doom-themes-org-config))

(use-package doom-modeline
  :hook (after-init . doom-modeline-mode)
  :init
  (setq doom-modeline-bar-width 3
        doom-modeline-height    25))

(use-package volatile-highlights
  :hook ((text-mode prog-mode) . volatile-highlights-mode)
  :config
  (set-face-attribute 'vhl/default-face nil
                      :underline "light slate gray")
  :blackout t)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package page-break-lines
  :hook ((text-mode
          emacs-lisp-mode lisp-mode compilation-mode
          outline-mode help-mode) . page-break-lines-mode)
  :blackout t)

(use-package beacon
  :hook (after-init . beacon-mode)
  :blackout t)

(use-package diff-hl
  :hook (((prog-mode text-mode) . diff-hl-mode)
         (dired-mode            . diff-hl-dired-mode)
         (magit-post-refresh    . diff-hl-magit-post-refresh)))

(provide 'init-essentials-ui)
;;; init-essentials-ui.el ends here
