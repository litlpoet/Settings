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

(use-package volatile-highlights
  :hook (after-init . volatile-highlights-mode)
  :config
  (set-face-attribute 'vhl/default-face nil
                      :underline "light slate gray")
  :blackout t)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package page-break-lines
  :hook (after-init . global-page-break-lines-mode)
  :config
  (add-to-list 'page-break-lines-modes 'text-mode)
  :blackout t)

(use-package beacon
  :hook (after-init . beacon-mode)
  :blackout t)

(provide 'init-essentials-ui)
;;; init-essentials-ui.el ends here
