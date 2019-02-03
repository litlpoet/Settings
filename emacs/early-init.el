;; Defer garbage collection further back in the startup process
(setq gc-cons-threshold 268435456)      ; 256mb

;; Package initialize occurs automatically, before `user-init-file' is
;; loaded, but after `early-init-file'.
(setq package-enable-at-startup nil)

;; Prevent the glimpse of un-styled Emacs by setting these early.
;; (add-to-list 'default-frame-alist '(tool-bar-lines . 0))
;; (add-to-list 'default-frame-alist '(menu-bar-lines . 0))
;; (add-to-list 'default-frame-alist '(vertical-scroll-bars))

(setq default-frame-alist
      '(;; (width . 120) (height . 55)
        (tool-bar-lines . 0) (menu-bar-lines . 0)
        ;; (vertical-scroll-bars)
        ))
