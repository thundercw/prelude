;;; package --- Summary
;;; commentary:
;;; owner: Kevin Guan
;;; Code:

;;; user config
(setq user-full-name "Kevin Guan")
(setq user-mail-address "keynovo@gmail.com")

;;;set mark command
(global-set-key (kbd "M-m") 'set-mark-command)

;;; shutup
(setq visible-bell t)

;;; set kill ring buffer
(setq kill-ring-max 200)

;;; set scroll margin to 3
(setq scroll-margin 3
      scroll-conservatively 10000)

;;; default major mode
(setq major-mode 'text-mode)

;;; paren style
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;;; auto move mouse
(mouse-avoidance-mode 'animate)

;;; font light
(global-font-lock-mode t)

;;; helm-swoop
(add-to-list 'load-path "~/.emacs.d/elpa/helm-swoop-20150605.2116")
(require 'helm-swoop)
(global-set-key (kbd "C-c w") 'helm-swoop)



(provide 'myconfig)
;;; myconfig.el ends here
