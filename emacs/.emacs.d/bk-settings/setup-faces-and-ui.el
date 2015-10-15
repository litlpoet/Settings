;;; setup-faces-and-ui.el --- faces and ui packages setup
;;; commentary:
;;; code:

(message "[bk:setup-faces-and-ui.el is loading...]")

;; change window title in useful way
(setq
 frame-title-format
 '("" invocation-name ": "
   (:eval ( if (buffer-file-name)
              (abbreviate-file-name (buffer-file-name))
            "%b"))))

;; set italic font for italic face
;; (set-face-attribute 'italic nil
;; :family "Source Code Pro-Italic")

;; set korean font
(set-fontset-font
 t 'hangul (font-spec :name "NanumGothicCoding"))

;; smart mode line
(sml/setup)

(provide 'setup-faces-and-ui)
;;; setup-faces-and-ui.el ends here
