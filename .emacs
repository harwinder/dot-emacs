(add-to-list 'load-path "~/elisp")

(require 'smart-operator)

(set-default-font "Inconsolata-12")

(setq-default indent-tabs-mode nil)
(setq column-number-mode t)

(setq c-default-style "linux" 
      c-basic-offset 2)
;(add-hook 'c-mode-common-hook '(lambda () (smart-operator-mode 1)))
;(add-hook 'c-mode-common-hook '(lambda () (c-toggle-hungry-state 1)))
(c-set-offset 'substatement-open 0)

(defun my-c++-mode-hook ()
  (setq c-default-style "linux"
        c-basic-offset 2)
  (c-set-offset 'substatement-open 0))
(add-hook 'c++-mode-hook 'my-c++-mode-hook)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(prefer-coding-system 'utf-8) 

(global-set-key [f12]         'dabbrev-expand)
(define-key esc-map [f12]     'dabbrev-completion)

(global-set-key [f1]         'find-file)
(global-set-key [f2]         'save-buffer)
(global-set-key [f4]         'goto-line)
(global-set-key [f5]         'other-window)
(global-set-key [f6]         'compile)
(global-set-key [f7]         'next-error)
(global-set-key [f8]         'previous-error)

;(split-window-horizontally)   ;; want two windows at startup 
;(other-window 1)              ;; move to other window
;(shell)                       ;; start a shell
;(rename-buffer "shell-first") ;; rename it
;(other-window 1)              ;; move back to first window 

(defun goto-match-paren (arg)
  "Go to the matching parenthesis if on parenthesis, otherwise insert %.
vi style of % jumping to matching brace."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

(global-set-key [f12] 'goto-match-paren)

(setq tags-table-list
      '("/code/hss/new/utrade-engine/ccl"))


;(setq smart-operator-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(tool-bar-mode nil)
 '(menu-bar-mode nil)
 )

(load-theme 'tango-dark)

(setq jabber-account-list
      '(("harwinder@gmail.com" 
         (:network-server . "talk.google.com")
         (:port . 443)
         (:password . "XXXXXXXX")
         (:connection-type . ssl))))

