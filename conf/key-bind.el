;;evil-leaderのキーバインド
(evil-leader/set-leader "SPC")
(evil-leader/set-key
  "/" #'comment-dwim
  "=" #'align-regexp
  "b" #'helm-buffers-list
  "d" #'dired
  "D" #'dired-other-frame
  "e" #'ediff-buffers
  "f" #'list-bookmarks
  "g" #'helm-do-grep
  "l" #'eval-current-buffer
  "m" #'ediff-merge-buffers
  "n" #'new-frame
  "o" #'other-frame
  "O" #'(lambda () "" (interactive) (other-frame -1))
  "p" #'helm-show-kill-ring
  "r" #'helm-recentf
  "s" #'shell-pop
  "u" #'undo-tree-visualize
  )

(add-hook 'dired-load-hook (lambda ()
  (define-key dired-mode-map "c" 'dired-create-file)))

(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)

(define-key evil-normal-state-map (kbd "C-r") 'undo-tree-redo)

;; (global-set-key [(C-tab)]   'tabbar-forward-tab)
;; (global-set-key [(C-S-tab)] 'tabbar-backward-tab)


(define-key evil-motion-state-map (kbd "C-]") nil)
(define-key evil-motion-state-map (kbd "C-]") 'find-tag-other-frame)

(define-key evil-normal-state-map "+" 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map "-" 'evil-numbers/dec-at-pt)

;slime
(define-key slime-mode-map (kbd "M-c") 'slime-compile-and-load-file)
(define-key slime-mode-map (kbd "M-C") 'slime-compile-defun)

;expand-region
(define-key evil-motion-state-map (kbd "<RET>") 'er/expand-region)
(define-key evil-motion-state-map [(shift return)] 'er/contract-region)

;smart-compile
(add-hook 'c-mode-hook
          '(lambda()
             (progn
               (define-key c-mode-map (kbd "M-c") 'smart-compile)
               )))

;gdb
(add-hook 'c-mode-hook
          '(lambda()
             (progn
               (define-key c-mode-map (kbd "M-g") 'gud-gdb)
               )))
