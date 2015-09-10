;;; setup-cmake.el --- cmake-mode and cpptutils-cmake setup
;;; Copyright (C) 2015  bk
;;; Commentary:
;; Author: bk <bk@T530>
;; Keywords: c, cpp
;;; Code:

;; cmake-mode
(autoload 'cmake-font-lock-activate "cmake-font-lock" nil t)
(add-hook 'cmake-mode-hook 'cmake-font-lock-activate)

;; cpputils-cmake
;; (require 'cpputils-cmake)
;; (add-hook 'c-mode-common-hook
;;           (lambda()
;;             (if (derived-mode-p 'c-mode 'c++-mode)
;;                 (cppcm-reload-all))))

(provide 'setup-cmake)
;;; setup-cmake.el ends here
