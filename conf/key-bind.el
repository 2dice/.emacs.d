;;evil-leaderのキーバインド
(evil-leader/set-leader ",")
(evil-leader/set-key
  "/" #'comment-region
  "=" #'align-regexp
  "b" #'helm-buffers-list
  "c" #'dired-create-file
  "d" #'dired
  "D" #'dired-other-frame
  "e" #'ediff-buffers
  "f" #'list-bookmarks
  "g" #'helm-do-grep
  "l" #'eval-current-buffer
  "m" #'ediff-merge-buffers
  "n" #'new-frame
  "o" #'other-frame
  "o" #'(lambda () "" (interactive) (other-frame -1))
  "p" #'helm-show-kill-ring
  "r" #'helm-recentf
  "s" #'shell-pop
  "u" #'undo-tree-visualize
  )


(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)

(define-key evil-normal-state-map (kbd "C-r") 'undo-tree-redo)

;(define-key evil-normal-state-map "<" 'point-undo)
;(define-key evil-normal-state-map ">" 'point-redo)

(define-key evil-motion-state-map (kbd "C-]") nil)
(define-key evil-motion-state-map (kbd "C-]") 'find-tag)

(define-key evil-normal-state-map "+" 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map "-" 'evil-numbers/dec-at-pt)

;slime
(define-key slime-mode-map (kbd "M-c") 'slime-compile-and-load-file)
(define-key slime-mode-map (kbd "M-C") 'slime-compile-defun)

;expand-region
(define-key evil-motion-state-map (kbd "<RET>") 'er/expand-region)
(define-key evil-motion-state-map [(shift return)] 'er/contract-region)

