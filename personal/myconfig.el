;;; package --- Summary
;;; commentary:
;;; owner: Kevin Guan
;;; Code:

;;; color theme
(prelude-require-package 'color-theme)
(require 'color-theme)
(color-theme-initialize)
;;(color-theme-gnome2)

;;(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
;;(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on t)

;;; user config
(setq user-full-name "Kevin Guan")
(setq user-mail-address "keynovo@gmail.com")

(setenv "GOROOT"
        ;;(concat
         "/home/kevinguan/tools/go"
         ;;(getenv "GOROOT"))
         )

(setenv "GOPATH"
        ;;(concat
         "/home/kevinguan/work/kvdb/"
         ;;(getenv "GOPATH"))
         )

(setq exec-path
      '(
        "/home/kevinguan/tools/go/bin"
        "/home/kevinguan/work/kvdb/bin"
        "/usr/bin"
        "/usr/local/bin"
        "/bin"
        ))

;;; go mode
(prelude-require-package 'go-mode)
(require 'go-mode)
(require 'go-mode-autoloads)
;;(add-hook 'before-save-hook 'gofmt-before-save nil t)
(add-hook 'before-save-hook 'gofmt-before-save)

(setq go-mode-map
      (let ((m (make-sparse-keymap)))
        (define-key m "}" #'go-mode-insert-and-indent)
        (define-key m ")" #'go-mode-insert-and-indent)
        (define-key m "," #'go-mode-insert-and-indent)
        (define-key m ":" #'go-mode-insert-and-indent)
        (define-key m "=" #'go-mode-insert-and-indent)
        (define-key m (kbd "C-c C-a") #'go-import-add)
        (define-key m (kbd "C-c C-j") #'godef-jump)
        (define-key m (kbd "C-c C-p") #'pop-tag-mark)
        (define-key m (kbd "C-x 4 C-c C-j") #'godef-jump-other-window)
        (define-key m (kbd "C-c C-d") #'godef-describe)
        m))

;;(global-set-key (kbd "C-c C-p") 'pop-tag-mark)

;;;set mark command
(global-set-key (kbd "M-m") 'set-mark-command)

;;;youdao translate
(global-set-key (kbd "C-c C-v") 'youdao-dictionary-search-at-point+)

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
;;(show-paren-mode t)
(setq show-paren-style 'parentheses)

;;; auto move mouse
(mouse-avoidance-mode 'animate)

;;; font light
(global-font-lock-mode t)

;;; helm-swoop
;;(add-to-list 'load-path "~/.emacs.d/elpa/helm-swoop-20150605.2116")
(require 'helm-swoop)
(global-set-key (kbd "C-c w") 'helm-swoop)

;;; jump buffer
(require 'ace-jump-buffer)
(global-set-key (kbd "M-j") 'ace-jump-char-mode)

;;; jump window
(require 'ace-window)
(global-set-key (kbd "C-x o") 'ace-window)

;;; org config
(prelude-require-package 'org)

(defun todo ()
  (interactive)
  (find-file "~/todo.org")
  )
(setq org-todo-keywords
      '((sequence "TODO(t!)" "HANG(h!)" "DONE(d!)" "CANCEL(c!)")))
(setq org-agenda-files (list "~/todo.org"))
(global-set-key "\C-ca" 'org-agenda)

;;; some others
(setq prelude-whitespace nil)
;;(set-default cursor-type 'bar)
(setq-default ispell-program-name "aspell")

;;; helm
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)

;;; aspell
;; use apsell as ispell backend
(setq-default ispell-program-name "aspell")
;; use American English as ispell default dictionary
(ispell-change-dictionary "american" t)

;;;;; scroll display
;;(defun hode-line-scroll-up()
;;  "Scroll the page with the cursor in the same line"
;;  (interactive)
;;  ;; move the cursor also
;;  (let ((tmp (current-column)))
;;    (scroll-up 1)
;;    (line-move-to-column tmp)
;;    (forward-line 1)
;;    )  
;;  )
;;(defun hode-line-scroll-down()
;;  "Scroll the page with the cursor in the same line"
;;  (interactive)
;;  ;; move the cursor also
;;  (let ((tmp (current-column)))
;;    (scroll-down 1)
;;    (line-move-to-column tmp)
;;    (forward-line 1)
;;    )
;;  )
;;
;;(global-set-key (kbd "M-n") 'hode-line-scroll-up)
;;(global-set-key (kbd "M-p") 'hode-line-scroll-down)
(defun hode-line-scroll-up()
  "Scroll the page with the cursor in the same line"
  (interactive)
  (let ((next-screen-context-lines
         (count-lines
          (window-start)(window-end))))
    (scroll-up)))
(global-set-key (kbd "M-n") 'hode-line-scroll-up)

(defun hode-line-scroll-down()
  "Scroll the page with the cursor in the same line"
  (interactive)
  (let ((next-screen-context-lines
         (count-lines
          (window-start)(window-end))))
  (scroll-down)))
(global-set-key (kbd "M-p") 'hode-line-scroll-down)

(provide 'myconfig)
;;; myconfig.el ends here

