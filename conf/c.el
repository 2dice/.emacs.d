;;;;;;;;;;;;;;;;;;;;C言語設定;;;;;;;;;;;;;;;;;;;;
;; google-c-style
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; 改行設定
(add-hook 'c-mode-common-hook
  (lambda ()
     (c-toggle-auto-hungry-state 1)
     (setq c-hanging-braces-alist
	   '(
	     (brace-list-open after) ; char* arr={"hoge","huga"} の {
	     (brace-list-close before after) ; char* arr={"hoge","huga"} の }
	     (defun-open before after) ; 関数定義
	     (defun-close after)
	     (substatement-open after) ; {}
	     (block-open after)
	     (block-close before after)
	     (extern-lang-open before after)
	     (extern-lang-close before)
	     (statement-case-open after) ; switch 文の'{'の後
	     )
	   )
     ))
