;;; setup-company.el --- company package setup
;;; Commentary:
;;; Code:

;; start company (complete anything) instead of auto-complete
(message "[bk:setup-company.el is loading...]")

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

(setq company-idle-delay nil)
(setq company-selection-wrap-around t)
(setq company-lighter-base "Cpny")

;; company irony
;; company yasnippet with irony
(eval-after-load 'company
  '(progn
     (require 'company-irony)
     ;; (require 'company-irony-c-headers) ;; not mature yet
     ;; (add-to-list 'company-backends
     ;;              '(company-irony :with company-yasnippet))
     (add-to-list 'company-backends 'company-irony)))
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)

;; company c headers
;; this backend should go before irony
(eval-after-load 'company
  '(progn
     (require 'company-c-headers)
     (add-to-list 'company-backends 'company-c-headers)
     (when (eq system-type 'windows-nt)
       (setq
        company-c-headers-path-system
        '("c:/Local/msys64/mingw64/x86_64-w64-mingw32/include/"
          "c:/Local/msys64/mingw64/include/"
          "c:/Local/msys64/mingw64/include/c++/5.2.0/"
          "c:/Local/include/eigen3/")))
     (when (eq system-type 'gnu/linux)
       (setq
        company-c-headers-path-system
        (append
         company-c-headers-path-system
         '("/usr/include/c++/4.9/"
           "/usr/local/include/eigen3/"
           "/opt/qt5/5.5/gcc_64/include/"
           "/home/bk/VersionControl/Modules/libML"))))
     (setq
      company-c-headers-path-user
      '("." ".."))))

;; company auctex
(company-auctex-init)

(global-set-key (kbd "M-RET") 'company-complete)

(provide 'setup-company)
;;; setup-company.el ends here
