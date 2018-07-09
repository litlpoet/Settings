;;; init-essentials.el -- common packages
;;; Commentary:

;;; Code:

;; (dired) direx
(use-package direx
  :ensure t
  ;; :after (popwin)
  :bind ("C-c C-j" . direx:jump-to-directory-other-window)
  ;; :init
  ;; (push '(direx:direx-mode :position left :dedicated t)
  ;;       popwin:special-display-config)
  :config
  (setq direx:closed-icon "▷"
        direx:open-icon   "▽"))

;; (edit) iedit
(use-package iedit
  :ensure t
  :bind (("C-;" . iedit-mode)
         ("C-:" . iedit-mode-toggle-on-function))
  :config (set-face-inverse-video 'iedit-occurrence t))

;; (edit) expand-region
(use-package expand-region
  :ensure t
  :bind   ("M-2" . er/expand-region))

;; (edit) duplicate-thing
(use-package duplicate-thing
  :ensure t
  :bind   ("M-c" . duplicate-thing))

;; (edit) multiple-cursors
(use-package multiple-cursors
  :ensure t
  :bind (("M-4" . mc/mark-next-like-this)
         ("M-3" . mc/mark-previous-like-this)
         ("M-$" . mc/skip-to-next-like-this)
         ("M-#" . mc/skip-to-previous-like-this)))

;; (edit) hungry-delete
(use-package hungry-delete
  :ensure   t
  :diminish hungry-delete-mode
  :hook ((emacs-lisp-mode lisp-interaction-mode) . hungry-delete-mode))

;; (edit) aggresive-indent
(use-package aggressive-indent
  :ensure   t
  :diminish aggressive-indent-mode
  :hook (emacs-lisp-mode . aggressive-indent-mode))

;; (edit) smartparens
(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :bind (:map
         smartparens-mode-map
         ("C-M-w"         . sp-copy-sexp)
         ("M-<delete>"    . sp-unwrap-sexp)
         ("M-<backspace>" . sp-backward-unwrap-sexp)
         ("M-D"           . sp-splice-sexp)
         ("M-F"           . sp-forward-symbol)
         ("M-B"           . sp-backward-symbol))
  :init
  (require 'smartparens-config)
  (sp-with-modes '(c-mode c++-mode)
    (sp-local-pair "{" nil
                   :post-handlers '(("||\n[i]" "RET"))))
  (sp-local-pair 'c++-mode "/*" "*/"
                 :post-handlers '((" | " "SPC")
                                  ("* ||\n[i]" "RET")))
  (smartparens-global-mode t)
  (show-smartparens-global-mode t)
  :config
  (set-face-attribute 'show-paren-match nil
                      :weight     'extra-bold
                      :underline  "yellow"
                      :foreground "gold"
                      :background nil))

;; (edit) undo-tree
(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :hook (after-init . global-undo-tree-mode)
  :bind ("C-?" . undo-tree-redo))

;; (viz) volatile-highlights
(use-package volatile-highlights
  :ensure t
  :diminish volatile-highlights-mode
  :hook (after-init . volatile-highlights-mode)
  :config
  (set-face-attribute 'vhl/default-face nil
                      :underline "light slate gray"))

;; ;; (viz) anzu
;; (use-package anzu
;;   :ensure t
;;   :commands (global-anzu-mode)
;;   :diminish anzu-mode
;;   :init
;;   (add-hook 'after-init-hook '(lambda() (global-anzu-mode +1))))

;; (viz) rainbow-delimiters
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

;; (viz) pretty page-break-lines
(use-package page-break-lines
  :ensure t
  :diminish page-break-lines-mode
  :hook (after-init . global-page-break-lines-mode)
  :init
  (add-to-list 'page-break-lines-modes 'text-mode))

;; ;; (viz) highlight-indent-guides
;; (use-package highlight-indent-guides
;;   :ensure t
;;   :commands (highlight-indent-guides-mode)
;;   :init
;;   (add-hook 'prog-mode-hook #'highlight-indent-guides-mode)
;;   :config
;;   (setq highlight-indent-guides-method 'column))

;; (navi) ivy / swiper / counsel
(use-package ivy
  :ensure t
  :diminish ivy-mode
  :hook (after-init . ivy-mode)
  :bind ("C-c C-r" . ivy-resume)
  :init
  (setq ivy-use-virtual-buffers t
        ivy-count-format        "(%d/%d) "))

(use-package ivy-hydra
  :ensure t
  :after (ivy hydra))

;; (navi) ivy / swiper / counsel
(use-package counsel
  :ensure t
  :diminish counsel-mode
  :bind (("C-r"     . counsel-grep-or-swiper)
         ("C-s"     . counsel-grep-or-swiper)
         ("C-c g"   . counsel-git)
         ("C-c j"   . counsel-git-grep)
         ("C-c k"   . counsel-ag)
         ("C-x l"   . counsel-locate)
         ;; ("M-x"     . counsel-M-x)
         ;; ("M-y"     . counsel-yank-pop)
         ;; ("C-x C-f" . counsel-find-file) ;; not working after loading purpose
         ;; ("C-h v"   . counsel-describe-variable)
         ;; ("C-h f"   . counsel-describe-function)
         )
  :hook (after-init . (lambda() (counsel-mode t)))
  ;; :init
  ;; (if bk:use-rg
  ;;     (setq
  ;;      counsel-grep-base-command
  ;;      "rg -i -M 120 --no-heading --line-number --color never '%s' %s"))
  )

;; (navi) which-key
(use-package which-key
  :ensure t
  :diminish which-key-mode
  :hook (after-init . which-key-mode))

;; (navi) sublimity
;; (use-package sublimity
;;   :ensure t
;;   :commands (sublimity-mode)
;;   :init
;;   (use-package sublimity-map
;;     :init
;;     (setq sublimity-map-size        20
;;           sublimity-map-fraction    0.3
;;           sublimity-map-text-scale -7))
;;   (add-hook 'prog-mode-hook
;;             '(lambda()
;;                (sublimity-mode 1))))

;; projectile
(use-package projectile
  :ensure t
  :hook (after-init . projectile-mode)
  :init
  (setq projectile-cache-file
        (expand-file-name "projectile.cache" bk:temp-directory))
  (setq projectile-known-projects-file
        (expand-file-name "projectile-bookmarks.eld" bk:temp-directory))
  :config
  (setq projectile-completion-system 'ivy)
  (setq projectile-find-dir-includes-top-level t)
  (setq projectile-mode-line
        '(:eval (format " Prj[%s]" (projectile-project-name))))
  (setq projectile-switch-project-action
        '(lambda() (progn (projectile-dired))))
  (setq projectile-project-root-files-top-down-recurring
        (append '("compile_commands.json"
                  ".cquery")
                projectile-project-root-files-top-down-recurring))
  (setq projectile-other-file-alist
        '(("cpp" "h" "hpp" "ipp")
          ("ipp" "h" "hpp" "cpp")
          ("hpp" "h" "ipp" "cpp")
          ("cxx" "h" "hxx" "ixx")
          ("ixx" "h" "hxx" "cxx")
          ("hxx" "h" "ixx" "cxx")
          ("c" "h")
          ("m" "h")
          ("mm" "h")
          ("h" "c" "cc" "cpp" "ipp" "hpp" "cxx" "ixx" "hxx" "m" "mm")
          ("cc" "h" "hh")
          ("hh" "cc" "cpp")
          ("vert" "frag")
          ("frag" "vert")
          (nil "lock" "gpg")
          ("lock" "")
          ("gpg" ""))))

(use-package counsel-projectile
  :ensure t
  :after  projectile
  :commands (counsel-projectile-mode)
  :init
  (counsel-projectile-mode)
  :config
  (counsel-projectile-modify-action
   'counsel-projectile-switch-project-action
   '((add ("r" counsel-projectile-switch-project-by-name "open project root dir") 1))))

;; ace-window
(use-package ace-window
  :ensure t
  :bind (("C-x o" . ace-window)
         ("C-x 1" . ace-delete-window))
  :config
  (set-face-attribute
   'aw-leading-char-face nil :foreground "deep sky blue" :weight 'bold :height 2.0)
  (setq aw-keys   '(?a ?s ?d ?f ?j ?k ?l)))

;; popwin
;; (use-package popwin
;;   :ensure t
;;   :hook (after-init . popwin-mode)
;;   :init
;;   (message "init popwin")
;;   :config
;;   (message "config popwin")
;;   (setq popwin:popup-window-height 25
;;         popwin:popup-window-width  60
;;         display-buffer-function 'popwin:display-buffer)
;;   (push "*system-packages*"             popwin:special-display-config)
;;   (push "*CMake Help*"                  popwin:special-display-config)
;;   (push '(messages-buffer-mode :tail t) popwin:special-display-config)
;;   (push '(compilation-mode :noselect t) popwin:special-display-config)
;;   (push "*RTags"                        popwin:special-display-config))

;; ;; (window) purpose
;; (use-package window-purpose
;;   :ensure t
;;   :hook (after-init . purpose-mode))

;; ;; (window) window-purpose-x
;; (use-package window-purpose-x
;;   :after (window-purpose)
;;   :bind ("C-c q" . purpose-x-popwin-close-windows)
;;   :commands (purpose-x-popwin-setup)
;;   :init
;;   (purpose-x-popwin-setup))

;; ;; (window) ivy-purpose
;; (use-package ivy-purpose
;;   :ensure t
;;   :after (ivy window-purpose)
;;   :commands (ivy-purpose-setup)
;;   :init
;;   (ivy-purpose-setup)
;;   :config
;;   (defalias 'counsel-find-file-without-purpose
;;     (without-purpose-command #'counsel-find-file))
;;   (bind-key "C-x C-f" #'counsel-find-file-without-purpose         purpose-mode-map)
;;   (bind-key "C-x b"   #'ivy-purpose-switch-buffer-without-purpose purpose-mode-map))

(provide 'init-essentials)
;;; init-essentials.el ends here
