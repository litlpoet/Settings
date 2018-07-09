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
(use-package lsp-mode
  :ensure t)

(use-package lsp-ui
  :ensure t
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq lsp-ui-sideline-delay 0.5
        lsp-ui-sideline-show-flycheck nil))

(use-package ivy-xref
  :ensure t
  :after (ivy)
  :init
  (setq xref-show-xrefs-function #'ivy-xref-show-xrefs))

(use-package cquery
  :ensure t
  :commands (lsp-cquery-enable)
  :hook (c-mode-common . (lambda() (condition-case nil
                                   (lsp-cquery-enable)
                                 (user-error nil))))
  :init
  (setq cquery-extra-args '("--log-file=~/.cquery/cquery.log"))
  (setq cquery-extra-init-params '(:completion (:detailedLabel t))))

(use-package company-lsp
  :ensure t
  :after (company)
  :commands (company-lsp)
  :hook (c-mode-common . (lambda()
                           (progn
                             (setq-local company-idle-delay nil)
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
