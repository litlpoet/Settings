;;; init-essentials-prog-cpp-rtags.el --- config for rtags  -*- lexical-binding: t; -*-

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

;; config for rtags and irony stack

;;; Code:

;; rtags
(use-package rtags
  :ensure t
  :after (cc-mode)
  :init
  (setq
   rtags-autostart-diagnostics               t
   rtags-other-window-window-size-percentage 50
   rtags-jump-to-first-match                 nil
   rtags-use-filename-completion             nil
   rtags-display-result-backend              'ivy)
  :config
  (rtags-enable-standard-keybindings c-mode-base-map)
  (set-face-attribute 'rtags-skippedline nil
                      :strike-through t
                      :foreground "gray3"
                      :background "gray12"))

(use-package ivy-rtags
  :ensure t
  :after  (rtags))

(use-package company-rtags
  :ensure t
  :if (not bk:use-irony)
  :after (rtags)
  :hook (c-mode-common . (lambda()
                           (progn
                             (setq-local company-idle-delay nil)
                             (setq-local company-dabbrev-code-everywhere t)
                             (setq-local company-backends ('company-rtags)))))
  :init
  (setq rtags-completions-enabled               t
        company-rtags-begin-after-member-access nil))

;; irony-mode
(use-package irony
  :ensure t
  :if     bk:use-irony
  :commands (irony-mode
             irony-cdb-autosetup-compile-options
             irony-install-server)
  :hook ((irony-mode . (lambda()
                         (progn
                           (define-key irony-mode-map
                             [remap completion-at-point] 'counsel-irony)
                           (define-key irony-mode-map
                             [remap comlete-symbol] 'counsel-irony)
                           (irony-cdb-autosetup-compile-options))))
         (c++-mode . irony-mode)
         (c-mode   . (lambda()
                       (unless (derived-mode-p 'glsl-mode)
                         (irony-mode))))))

(use-package company-irony
  :ensure t
  :after (irony)
  :commands (company-irony)
  :hook (irony-mode . (lambda() (progn
                              (setq-local company-idle-delay              0.3)
                              (setq-local company-dabbrev-code-everywhere t)
                              (setq-local company-backends
                                          '((company-irony company-yasnippet)
                                            company-capf company-files
                                            (company-dabbrev-code company-keywords)
                                            company-dabbrev))))))

(use-package flycheck-irony
  :ensure t
  :after (irony)
  :commands (flycheck-irony-setup
             flycheck-select-checker)
  :hook (irony-mode . (lambda() (flycheck-select-checker 'irony)))
  :init
  (flycheck-irony-setup))

(provide 'init-essentials-prog-cpp-rtags)
;;; init-essentials-prog-cpp-rtags.el ends here
