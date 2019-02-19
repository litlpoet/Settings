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
  (with-eval-after-load 'org
    (doom-themes-org-config)))

(use-package doom-modeline
  :init
  (setq doom-modeline-bar-width 3
        doom-modeline-height    25)
  (doom-modeline-mode))

(use-package volatile-highlights
  :hook ((text-mode prog-mode) . volatile-highlights-mode)
  :config
  (set-face-attribute 'vhl/default-face nil
                      :underline "light slate gray"))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package page-break-lines
  :hook ((text-mode
          emacs-lisp-mode lisp-mode compilation-mode
          outline-mode help-mode) . page-break-lines-mode))

(use-package beacon :init (beacon-mode))

(use-package diff-hl
  :hook (((prog-mode text-mode) . diff-hl-mode)
         (dired-mode            . diff-hl-dired-mode)
         (magit-post-refresh    . diff-hl-magit-post-refresh))
  :init
  (defun bk:vc-gutter-setup-fringe-bitmaps ()
    "Define thin fringe bitmaps for maximum sexiness."
    (define-fringe-bitmap 'diff-hl-bmp-top [224] nil nil '(center repeated))
    (define-fringe-bitmap 'diff-hl-bmp-middle [224] nil nil '(center repeated))
    (define-fringe-bitmap 'diff-hl-bmp-bottom [224] nil nil '(center repeated))
    (define-fringe-bitmap 'diff-hl-bmp-insert [224] nil nil '(center repeated))
    (define-fringe-bitmap 'diff-hl-bmp-single [224] nil nil '(center repeated))
    (define-fringe-bitmap 'diff-hl-bmp-delete [240 224 192 128] nil nil 'top))
  (defun bk:vc-gutter-type-at-pos (type _pos)
    "Return the bitmap for `diff-hl' to use for change at point."
    (pcase type
      (`unknown 'question-mark)
      (`delete  'diff-hl-bmp-delete)
      (`change  'diff-hl-bmp-middle)
      (`ignored 'diff-hl-bmp-i)
      (x (intern (format "diff-hl-bmp-%s" x)))))
  (setq diff-hl-fringe-bmp-function #'bk:vc-gutter-type-at-pos
        diff-hl-draw-borders        nil)
  (add-hook 'diff-hl-mode-hook #'bk:vc-gutter-setup-fringe-bitmaps))

(use-package highlight-numbers
  :hook (prog-mode . highlight-numbers-mode))

;; (use-package visual-fill-column
;;   :hook (visual-line-mode . visual-fill-column-mode)
;;   :init
;;   (setq visual-fill-column-center-text t
;;         visual-fill-column-width (+ 6 fill-column)))

(use-package ace-window
  :config
  ;; (set-face-attribute
  ;;  'aw-leading-char-face nil :foreground "deep sky blue" :weight 'bold :height 2.0)
  (setq aw-keys       '(?a ?s ?d ?f ?g ?h ?j ?k ?l)
        aw-scope      'frame
        aw-background t))

(use-package shackle
  :init
  (setq
   shackle-rules
   '((direx:direx-mode
      :other t :align left  :size 0.25 :select t :inhibit-window-quit nil)
     (compilation-mode
      :other t :align below :size 0.30 :select t :inhibit-window-quit nil)
     ("*system-packages*"
      :other t :align below :size 0.30 :select t :inhibit-window-quit nil)
     ("*Help*"
      :other t :align below :size 0.30 :select t :inhibit-window-quit nil)))
  (shackle-mode))

;; (use-package all-the-icons-dired
;;   :hook (dired-mode . all-the-icons-dired-mode))

(provide 'init-essentials-ui)
;;; init-essentials-ui.el ends here
