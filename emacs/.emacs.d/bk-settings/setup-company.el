;;; setup-company.el --- company package setup
;;; Commentary:
;;; Code:

;; start company (complete anything) instead of auto-complete
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0.2)

;; company irony
;; company yasnippet with irony
(eval-after-load 'company
  '(progn
     (require 'company-irony)
     (push '(company-irony :with company-yasnippet) company-backends)
     (add-hook 'irony-mode-hook 'company-irony-setup-begin-commands))
  )

;; company c headers
;; this backend should go before irony
(eval-after-load 'company
  '(progn
     (require 'company-c-headers)
     (add-to-list 'company-backends 'company-c-headers)
     (when (eq system-type 'windows-nt)
       (setq company-c-headers-path-system
             '("c:/Local/msys64/mingw64/x86_64-w64-mingw32/include/"
               "c:/Local/msys64/mingw64/include/"
               "c:/Local/msys64/mingw64/include/c++/4.9.2/"
               "c:/Local/msys64/mingw64/qt5-static/include/"
               "c:/Local/include/eigen3/"
               ))
       (setq company-c-headers-path-user
             '("." ".."))
       )
     (when (eq system-type 'gnu/linux)
       (add-to-list 'company-c-headers-path-system
                    "/usr/include/c++/4.9/")
       (setq company-c-headers-path-user
             '("/usr/local/include/eigen3/"
               "." ".."))
       )

     )
  )


(provide 'setup-company)
;;; setup-company.el ends here
