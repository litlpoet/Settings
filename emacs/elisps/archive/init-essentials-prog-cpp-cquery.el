;;; init-essentials-prog-cpp-cquery.el --- config for a cquery stack  -*- lexical-binding: t; -*-

;; Copyright (C) 2018  Byungkuk Choi

;; Author: Byungkuk Choi <bk@i7-G6>
;; Keywords: lisp

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; config for a cquery stack

;;; Code:
(use-package lsp-ui
  :straight t
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq lsp-ui-sideline-delay 1
        lsp-ui-sideline-show-flycheck nil
        lsp-ui-sideline-show-symbol nil
        lsp-ui-flycheck-live-reporting nil))

(use-package cquery
  :straight t
  :commands (lsp-cquery-enable)
  :hook (c-mode-common . (lambda() (condition-case nil
                                   (lsp-cquery-enable)
                                 (user-error nil))))
  :init
  (setq cquery-extra-args '("--log-file=~/.cache/cquery/cquery.log")
        cquery-extra-init-params '(:completion (:detailedLabel t))))

(use-package company-lsp
  :straight t
  :after (company)
  :commands (company-lsp)
  :hook (c-mode-common . (lambda()
                           (progn
                             (setq-local company-idle-delay 0.3)
                             (setq-local company-dabbrev-code-everywhere t)
                             (setq-local company-backends
                                         '((company-lsp company-yasnippet)
                                           company-capf company-files
                                           (company-dabbrev-code company-keywords)
                                           company-dabbrev)))))
  :config
  (setq company-lsp-cache-candidates nil))

(provide 'init-essentials-prog-cpp-cquery)
;;; init-essentials-prog-cpp-cquery.el ends here
