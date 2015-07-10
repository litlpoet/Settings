(provide 'setup-faces-and-ui)

;; for clean look
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; turn off cursor blinking
(blink-cursor-mode -1)

(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

(size-indication-mode t)

;; change window title in useful way
(setq frame-title-format
      '("" invocation-name " - "
	(:eval ( if (buffer-file-name)
		   (abbreviate-file-name (buffer-file-name))
		 "%b"))))

;; change font to Inconsolata
(setq default-frame-alist
      '((font . "Source Code Pro-14")))

;; set italic font for italic face
;; (set-face-attribute 'italic nil
		    ;; :family "Source Code Pro-Italic")

;; set korean font
(set-fontset-font t 'hangul
		  (font-spec :name "NanumGothicCoding"))
