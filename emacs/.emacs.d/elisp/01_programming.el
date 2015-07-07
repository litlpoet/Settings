;; start auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

;; auto-complete c/c++ headers
(defun bk:ac-c-header-init()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories
	       '"c:/Local/msys64/mingw64/include/c++/4.9.2")
  )
(add-hook 'c-mode-hook 'bk:ac-c-header-init)
(add-hook 'c++-mode-hook 'bk:ac-c-header-init)

;; start yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; cmake settings
(require 'cmake-mode)
(setq auto-mode-alist
      (append '(("CMakeList\\.txt\\'" . cmake-mode))
	      '(("\\.cmake\\'" . cmake-mode))
	      auto-mode-alist)
      )
