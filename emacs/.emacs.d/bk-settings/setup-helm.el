;;; setup-helm --- setting package helm
;;; commentary:
;;; code:

;; start 'helm'
(message "[bk:setup-helm.el is loading...]")
(require 'helm)
(require 'helm-config)

(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>")
  'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i")
  'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")
  'helm-select-action); list actions using C-z

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq
 helm-split-window-in-side-p t
 helm-move-to-line-cycle-in-source t
 helm-ff-search-library-in-sexp t
 helm-scroll-amount 8
 helm-ff-file-name-history-use-recentf t
 helm-M-x-fuzzy-match t
 helm-buffers-fuzzy-matching t)

(helm-autoresize-mode t)

(helm-mode 1)

(provide 'setup-helm)
;;; setup-helm.el ends here
