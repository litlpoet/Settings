;;; package --- Summary
;;; Commentary:
;;; Code:

;; makde .h file to cpp mode
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; irony-mode
(require 'irony)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
;; (setq irony-additional-clang-options '("-std=c++11"))

(defun bk:irony-mode-hook()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async)
  ;; (when (eq system-type 'windows-nt)
  ;;   (setq w32-pipe-read-delay 0))
  )

(add-hook 'irony-mode-hook 'bk:irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; google-c-style-guide
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; clang-format
(require 'clang-format)
(defun bk:clang-format-setting()
  (define-key c-mode-base-map (kbd "C-S-f") 'clang-format-buffer)
  (setq-local clang-format-style "Google"))

(add-hook 'c-mode-hook 'bk:clang-format-setting)
(add-hook 'c++-mode-hook 'bk:clang-format-setting)

;; company irony
(require 'company-irony)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)

;; company c headers
;; this backend should go befoer irony
(require 'company-c-headers)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-c-headers))

(when (eq system-type 'windows-nt)
  (setq company-c-headers-path-system
        '("c:/Local/msys64/mingw64/x86_64-w64-mingw32/include/"
          "c:/Local/msys64/mingw64/include/"
          "c:/Local/msys64/mingw64/include/c++/4.9.2/"
          "c:/Local/include/eigen3/"))
  )

(when (eq system-type 'gnu/linux)
  (add-to-list 'company-c-headers-path-system
               "/usr/include/c++/4.9/"))

;; flycheck
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

(require 'flycheck-irony)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup)
  )

;; flycheck-google-cpplint
(eval-after-load 'flycheck
  '(progn
     (require 'flycheck-google-cpplint)
     (flycheck-add-next-checker 'irony
                                '(t . c/c++-googlelint)))
  )

;; semantic related
;; (semantic-mode 1)
;; (add-to-list 'semantic-default-submodes
;;              'global-semantic-stickyfunc-mode)
;; (require 'stickyfunc-enhance)

;; speed bar option
(require 'speedbar)
(setq speedbar-show-unknown-files t)

;; cmake
(autoload 'cmake-font-lock-activate "cmake-font-lock" nil t)
(add-hook 'cmake-mode-hook 'cmake-font-lock-activate)

;; cpputils-cmake
(require 'cpputils-cmake)
(add-hook 'c-mode-common-hook
          (lambda()
            (if (derived-mode-p 'c-mode 'c++-mode)
                (cppcm-reload-all))))

(provide 'setup-programming)
;;; setup-programming.el ends here
