;;; setup-convenience.el --- covenience package setup
;;; Commentary:
;;; Code:

;; update any changes made on file to the current buffer
(message "[bk:setup-convenience.el is loading...]")

;; expand (selection) region
(require 'expand-region)
(global-set-key (kbd "M-m") 'er/expand-region)

;; window dedication
(defun bk:toggle-current-window-dedication ()
  "Window dedication."
  (interactive)
  (let* ((window (selected-window))
         (dedicated (window-dedicated-p window)))
    (set-window-dedicated-p window (not dedicated))
    (message "Window %sdedicated to %s"
             (if dedicated "no longer " "")
             (buffer-name))))

(global-set-key [pause] 'bk:toggle-current-window-dedication)

;; useful meta bind1
(global-set-key "\M-9" 'backward-sexp)
(global-set-key "\M-0" 'forward-sexp)
(global-set-key "\M-1" 'delete-other-windows)

;; kill buffer directly
(global-set-key (kbd "C-x k") 'kill-this-buffer)

;; avy and ace-window
(global-set-key (kbd "C-c j") 'avy-goto-word-or-subword-1)
(global-set-key (kbd "C-x o") 'ace-window)

(provide 'setup-convenience)
;;; setup-convenience.el ends here
