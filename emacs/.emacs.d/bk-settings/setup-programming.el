;;; package --- Summary
;;; Commentary:
;;; Code:

;; company clang backend
(setq company-backends
      (delete 'company-semantic company-backends))

;; company c headers
(require 'company-c-headers)
(add-to-list 'company-backends 'company-c-headers)

(when (eq system-type 'windows-nt)
  (setq company-c-headers-path-system
        '("c:/Local/msys64/mingw64/x86_64-w64-mingw32/include/"
          "c:/Local/msys64/mingw64/include/"
          "c:/Local/msys64/mingw64/include/c++/4.9.2/"
          "c:/Local/include/eigen3/"))
  )

(require 'cc-mode)
(define-key c-mode-map [(tab)] 'company-complete)
(define-key c++-mode-map [(tab)] 'company-complete)

;; flycheck
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

;; flycheck-google-cpplint
(eval-after-load 'flycheck
  '(progn
     (require 'flycheck-google-cpplint)
     (flycheck-add-next-checker 'c/c++-clang
                                '(warning . c/c++-googlelint)))
  )

(executable-find "cpplint.py") ; => "python.exe c:/Local/python27/Scripts/cpplint.py"
;; (custom-set-variables
;;  '(flycheck-c/c++-googlelint-executable
;;    "c:/Local/python27/Scripts/cpplint.py"))

;; ;; flymake-google-cpplint
;; (defun bk:flymake-google-init()
;;   (require 'flymake-google-cpplint)
;;   (custom-set-variables
;;    '(flymake-google-cpplint-command
;;      "c:/Local/python27/Scripts/cpplint.py"))
;;   (flymake-google-cpplint-load)
;;   )

;; (add-hook 'c-mode-hook 'bk:flymake-google-init)
;; (add-hook 'c++-mode-hook 'bk:flymake-google-init)

;; speed bar option
(setq speedbar-show-unknown-files t)

(provide 'setup-programming)
;;; setup-programming.el ends here
