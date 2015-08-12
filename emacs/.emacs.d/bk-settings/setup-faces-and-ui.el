;;; setup-faces-and-ui.el --- faces and ui packages setup
;;; commentary:
;;; code:

(message "[bk:setup-faces-and-ui.el is loading...]")

;; change window title in useful way
(setq frame-title-format
      '("" invocation-name " - "
	(:eval ( if (buffer-file-name)
		   (abbreviate-file-name (buffer-file-name))
		 "%b"))))

;; set italic font for italic face
;; (set-face-attribute 'italic nil
		    ;; :family "Source Code Pro-Italic")

;; set korean font
(set-fontset-font t 'hangul
		  (font-spec :name "NanumGothicCoding"))

;; golden-ratio
(require 'golden-ratio)

(setq golden-ratio-auto-scale t)
;; (setq
;;  golden-ratio-exclude-modes
;;  '("ediff-mode"
;;    "magit-log-mode"
;;    "magit-reflog-mode"
;;    "magit-status-mode"
;;    "IELM"
;;    "eshell-mode"
;;    "dired-mode")
;;  )

;; (setq
;;  golden-ratio-exclude-buffer-names
;;  '("*compilation*"
;;    "*Help*"
;;    "*Messages*"
;;    "*Warnings*"))

(defun bk:helm-alive-p ()
  (if (boundp 'helm-alive-p)
      (symbol-value 'helm-alive-p)))

(add-to-list 'golden-ratio-inhibit-functions
             'bk:helm-alive-p)

(golden-ratio-mode 1)

;; smart mode line
(sml/setup)

(provide 'setup-faces-and-ui)
;;; setup-faces-and-ui.el ends here
