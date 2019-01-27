;;; init-triedbutnotused.el --- collection of tried but not used packages  -*- lexical-binding: t; -*-

;; Copyright (C) 2019  Byungkuk Choi

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

;; tried but not used packages (just in case needed later)

;;; Code:

;; (viz) highlight-indent-guides
(use-package highlight-indent-guides
  :ensure t
  :commands (highlight-indent-guides-mode)
  :init
  (add-hook 'prog-mode-hook #'highlight-indent-guides-mode)
  :config
  (setq highlight-indent-guides-method 'column))

;; (viz) anzu
(use-package anzu
  :ensure t
  :commands (global-anzu-mode)
  :blackout t
  :init
  (add-hook 'after-init-hook '(lambda() (global-anzu-mode +1))))

;; (window) purpose
(use-package window-purpose
  :ensure t
  :hook (after-init . purpose-mode))

;; (window) window-purpose-x
(use-package window-purpose-x
  :after (window-purpose)
  :bind ("C-c q" . purpose-x-popwin-close-windows)
  :commands (purpose-x-popwin-setup)
  :init
  (purpose-x-popwin-setup))

;; (window) ivy-purpose
(use-package ivy-purpose
  :ensure t
  :after (ivy window-purpose)
  :commands (ivy-purpose-setup)
  :init
  (ivy-purpose-setup)
  :config
  (defalias 'counsel-find-file-without-purpose
    (without-purpose-command #'counsel-find-file))
  (bind-key "C-x C-f" #'counsel-find-file-without-purpose         purpose-mode-map)
  (bind-key "C-x b"   #'ivy-purpose-switch-buffer-without-purpose purpose-mode-map))

;; (navi) sublimity
(use-package sublimity
  :ensure t
  :commands (sublimity-mode)
  :init
  (use-package sublimity-map
    :init
    (setq sublimity-map-size        20
          sublimity-map-fraction    0.3
          sublimity-map-text-scale -7))
  (add-hook 'prog-mode-hook
            '(lambda()
               (sublimity-mode 1))))

(use-package function-args
  :ensure t
  :hook (after-init . fa-config-default))

(use-package flycheck-google-cpplint
  :ensure t
  :config
  (flycheck-add-next-checker
   'irony '(warning . c/c++-googlelint)))

(use-package cmake-ide :ensure t
  :commands (cmake-ide-setup)
  :init (cmake-ide-setup))

(use-package elpy
  :straight t
  :hook ((after-init . elpy-enable)
         (elpy-mode . flycheck-mode))
  :config
  (setq elpy-rpc-backend "jedi")
  (setq elpy-modules
        (delq 'elpy-module-flymake elpy-modules))
  ;; (pyvenv-activate "~/dev/pyvenv/py36")
  )

(use-package pyvenv
  :straight t
  :commands (pyvenv-activate))

;; writeroom mode
(use-package writeroom-mode
  :ensure t
  :hook (after-init . global-writeroom-mode)
  :init
  (setq writeroom-major-modes
        '(text-mode prog-mode cmake-mode dashboard-mode Man-mode))
  (setq writeroom-width                   100
        writeroom-maximize-window         nil
        writeroom-extra-line-spacing      5
        writeroom-bottom-divider-width    0
        writeroom-mode-line               t
        writeroom-fringes-outside-margins nil)
  :config
  (setq writeroom-global-effects
        (delq 'writeroom-set-fullscreen writeroom-global-effects)))


(provide 'init-triedbutnotused)
;;; init-triedbutnotused.el ends here
