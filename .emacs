(add-to-list 'load-path "~/elisp")

(require 'smart-operator)

(setq-default indent-tabs-mode nil)

(setq c-default-style "linux" 
      c-basic-offset 2)
(add-hook 'c-mode-common-hook '(lambda () (smart-operator-mode 1)))
;(add-hook 'c-mode-common-hook '(lambda () (c-toggle-hungry-state 1)))
(c-set-offset 'substatement-open 0)

(defun my-c++-mode-hook ()
  (setq c-basic-offset 2)
  (c-set-offset 'substatement-open 0))
(add-hook 'c++-mode-hook 'my-c++-mode-hook)

(prefer-coding-system 'utf-8) 

(global-set-key [f12]         'dabbrev-expand)
(define-key esc-map [f12]     'dabbrev-completion)

(global-set-key [f1]         'find-file)
(global-set-key [f2]         'save-buffer)
(global-set-key [f4]         'split-window-horizontally)
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


(setq smart-operator-mode 1)