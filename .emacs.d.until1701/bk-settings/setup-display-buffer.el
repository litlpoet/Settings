;;; setup-display-buffer --- display buffer setting
;;; Commentary:
;;; Code:

(require 'rx)
(setq
 display-buffer-alist
 `(;; Put REPLs and error lists into the bottom side window
   (,(rx bos (or "*Flycheck errors*" ; Flycheck error list
                 "*compilation"      ; Compilation buffers
                 "*Warnings*"        ; Emacs warnings
                 "*shell"            ; Shell window
                 ))
    (display-buffer-reuse-window
     display-buffer-in-side-window)
    (side            . bottom)
    (reusable-frames . visible)
    (window-height   . 0.25))
   ("." nil (reusable-frames . visible))))

(defun bk:quit-bottom-side-windows ()
  "Quit windows at the bottom of the current frame."
  (interactive)
  (dolist (window (window-at-side-list nil 'bottom))
    (quit-window nil window)))

;; see available keys at window.el.gz's bottom
(global-set-key (kbd "C-c q") 'bk:quit-bottom-side-windows)

(provide 'setup-display-buffer)
;;; setup-display-buffer ends here
