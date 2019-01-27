;;; init-essentials-prog-cpp-ccls.el --- config for a ccls stack  -*- lexical-binding: t; -*-

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

;; config for a ccls stack

;;; Code:
(use-package ccls
  :straight t
  :commands (lsp-ccls-enable)
  :hook (c-mode-common . (lambda()
                           (progn
                             (condition-case nil
                                 (lsp-ccls-enable)
                               (user-error nil))
                             (setq-local company-idle-delay 0.3)
                             (setq-local company-dabbrev-code-everywhere t)
                             (setq-local company-backends
                                         '((company-lsp company-yasnippet)
                                           company-capf company-files)))))
  :init
  (setq ccls-extra-args '("--log-file=/home/bk/.cache/ccls/ccls.log")
        ccls-extra-init-params '(:index (:comments 2) :completion (:detailedLabel t))))

(provide 'init-essentials-prog-cpp-ccls)
;;; init-essentials-prog-cpp-ccls.el ends here
