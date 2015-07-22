;;; setup-faces-and-ui.el --- faces and ui packages setup
;;; commentary:
;;; code:

;; for clean look
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(column-number-mode 1)
(winner-mode 1)
(size-indication-mode t)

;; turn off cursor blinking
(blink-cursor-mode -1)

(setq inhibit-startup-screen t
      visible-bell 1
      scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position t)

;; change window title in useful way
(setq frame-title-format
      '("" invocation-name " - "
	(:eval ( if (buffer-file-name)
		   (abbreviate-file-name (buffer-file-name))
		 "%b"))))

;; change font to 'Source Code Pro'
(setq default-frame-alist
      '((font . "Source Code Pro-14")))

;; set italic font for italic face
;; (set-face-attribute 'italic nil
		    ;; :family "Source Code Pro-Italic")

;; set korean font
(set-fontset-font t 'hangul
		  (font-spec :name "NanumGothicCoding"))

;; golden-ratio
(require 'golden-ratio)

(setq
 golden-ratio-exclude-modes
 '("ediff-mode"
   "magit-log-mode"
   "magit-reflog-mode"
   "magit-status-mode"
   "IELM"
   "eshell-mode"
   "dired-mode")
 )

(setq
 golden-ratio-exclude-buffer-names
 '("*compilation*"
   "*Help*"
   "*Messages*"
   "*Warnings*"))

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
