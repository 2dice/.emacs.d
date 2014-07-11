;;;;;;;;;;;;;;;;;;;;evil-mode;;;;;;;;;;;;;;;;;;;;
;evilの特殊キーバインド設定lisp
(require 'evil-leader)
(global-evil-leader-mode)
;evil起動
(evil-mode 1)
;evilのカスタマイズ設定
(load "evil-setting")
(require 'evil-numbers)

;;;;;;;;;;;;;;;;;;;;tabbar;;;;;;;;;;;;;;;;;;;;
;; (require 'tabbar)
;; (tabbar-mode 1)
;; (tabbar-mwheel-mode -1)
;; ;; グループ化しない
;; (setq tabbar-buffer-groups-function nil)
;; ;; 左に表示されるボタンを無効化
;; (dolist (btn '(tabbar-buffer-home-button
;;                tabbar-scroll-left-button
;;                tabbar-scroll-right-button))
;;   (set btn (cons (cons "" nil)
;;                  (cons "" nil))))
;; ;; タブセパレータの長さ
;; (setq tabbar-separator '(0.2))
;:background "#002c37"
;;                     :height 1.0)
;; (set-face-attribute 'tabbar-unselected nil
;;                     :foreground "#002c37"
;;                     :background "#c4c1b0"
;;                     :box nil)
;; (set-face-attribute 'tabbar-selected nil
;;                     :foreground "#e4007e"
;;                     :background "#c4c1b0"
;;                     ;; :background "#ffffff"
;;                     :box nil)
;; (set-face-attribute 'tabbar-button nil
;;                     :box nil)
;; (set-face-attribute 'tabbar-separator nil
;;                     :foreground "#002c37"
;;                     :background "#002c37"
;;                     :height 1.0)

;;;;;;;;;;;;;;;;;;;;yasnippet;;;;;;;;;;;;;;;;;;;;
(require 'yasnippet)
(yas/global-mode 1)

;;;;;;;;;;;;;;;;;;;;auto-complete;;;;;;;;;;;;;;;;;;;;
(require 'auto-complete)
(global-auto-complete-mode t)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(require 'auto-complete-config)
(ac-config-default)

;;;;;;;;;;;;;;;;;;;;helm;;;;;;;;;;;;;;;;;;;;
(require 'helm-config)
(setq helm-idle-delay             0.1
      helm-input-idle-delay       0.1
      helm-candidate-number-limit 200)

;;;;;;;;;;;;;;;;;;;;dired;;;;;;;;;;;;;;;;;;;;
;diredで削除したファイルをゴミ箱に入れる
(custom-set-variables
 '(delete-by-moving-to-trash t)
 '(trash-directory "~/.Trash"))
;よけいな情報を出さない
(setq dired-listing-switches "-alGgh")
;diredに新規ファイル作成コマンドを追加
(defun dired-create-file (file-name)
  (interactive "F Create file: ")
  (write-region "" nil file-name nil nil nil))

;;;;;;;;;;;;;;;;;;;;eshell;;;;;;;;;;;;;;;;;;;;
(add-hook 'eshell-mode-hook (evil-mode 0))
(add-hook 'eshell-mode-unload-hook (evil-mode 1))

;;;;;;;;;;;;;;;;;;;;shell-pop;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 '(shell-pop-default-directory "~/Documents")
 '(shell-pop-universal-key "M-s") )

;;;;;;;;;;;;;;;;;;;;ediff;;;;;;;;;;;;;;;;;;;;
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;;;;;;;;;;;;;;;;;;;;point-undo;;;;;;;;;;;;;;;;;;;;
(require 'point-undo)

;;;;;;;;;;;;;;;;;;;;smartparens;;;;;;;;;;;;;;;;;;;;
(require 'smartparens-config)
(smartparens-global-mode t)

;;;;;;;;;;;;;;;;;;;;flex-autopair;;;;;;;;;;;;;;;;;;;;
;(require 'flex-autopair)
;(flex-autopair-mode 1)
;(setq flex-autopair-disable-modes
;        '(c-mode))

;;;;;;;;;;;;;;;;;;;;recentf;;;;;;;;;;;;;;;;;;;;
(require 'recentf-ext)
(setq recentf-max-saved-items 100)

;;;;;;;;;;;;;;;;;;;;smooth-scrolling;;;;;;;;;;;;;;;;;;;;
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time

;;;;;;;;;;;;;;;;;;;;slime;;;;;;;;;;;;;;;;;;;;
(add-hook 'lisp-mode-hook (lambda ()
                            (slime-mode t)
                            (show-paren-mode)))
(setq inferior-lisp-program "/opt/local/bin/clisp")
(require 'slime)
;(slime-setup '(slime-repl slime-fancy slime-banner slime-indentation))
(setq slime-net-coding-system 'utf-8-unix)
(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))

;;;;;;;;;;;;;;;;;;;;popwin;;;;;;;;;;;;;;;;;;;;
(require 'popwin)
(setq special-display-function 'popwin:special-display-popup-window)
;; Apropos
(push '("*slime-apropos*") popwin:special-display-config)
;; Macroexpand
(push '("*slime-macroexpansion*") popwin:special-display-config)
;; Help
(push '("*slime-description*") popwin:special-display-config)
;; Compilation
(push '("*slime-compilation*" :noselect t) popwin:special-display-config)
;; Cross-reference
(push '("*slime-xref*") popwin:special-display-config)
;; Debugger
(push '(sldb-mode :stick t) popwin:special-display-config)
;; REPL
(push '(slime-repl-mode) popwin:special-display-config)
;; Connections
(push '(slime-connection-list-mode) popwin:special-display-config)

;;;;;;;;;;;;;;;;;;;;expand-region;;;;;;;;;;;;;;;;;;;;
(require 'expand-region)

;;;;;;;;;;;;;;;;;;;;smartchr;;;;;;;;;;;;;;;;;;;;
;(require 'smartchr)
;(global-set-key (kbd "=") (smartchr '("=" " = " " == ")))
;(global-set-key (kbd ",") (smartchr '("," ", ")))
;(global-set-key (kbd "+") (smartchr '("+" " + ")))
;(global-set-key (kbd "-") (smartchr '("-" " - ")))
;(global-set-key (kbd "*") (smartchr '("*" " * ")))
;(global-set-key (kbd "/") (smartchr '("/" " / ")))
;(global-set-key (kbd "<") (smartchr '("<" " < ")))
;(global-set-key (kbd ">") (smartchr '(">" " > ")))
;;         ("=>" . " => ")
;;         ("=~" . " =~ ")
;;         ("=*" . " =* ")
;;         ("-=" . " -= ")
;;         ("->" . " -> ")
;;         (">"  . (" > " " => " " >= " ">"))
;;         (">=" . " >= ")
;;         ("%"  . (" % " " %= " "%"))
;;         ("%="  . " %= ")
;;         ("!" . (" != " " !~ " "!"))
;;         ("!="  . " != " )
;;         ("!~" . " !~ ")
;;         ("~" . (" =~ " "~"))
;;         ("::" . " :: ")
;;         ("&"  . (" & " " && " "&"))
;;         ("&=" . " &= ")
;;         ("&&=" . " &&= ")
;;         ("*="  . " *= " )
;;         ("<" . (" < " " <= " "<"))
;;         ("<=" . " <= ")
;;         ("<<=" . " <<= ")
;;         ("<-" . " <- ")
;;         ("|=" . " |= ")
;;         ("||=" . " ||= ")
;;         ("/=" . " /= ")

;;;;;;;;;;;;;;;;;;;;Flycheck;;;;;;;;;;;;;;;;;;;;
(add-hook 'after-init-hook #'global-flycheck-mode)
(setq flycheck-display-errors-delay 0.3)
(require 'flycheck)

;;;;;;;;;;;;;;;;;;;;Flycheck-pos-tip;;;;;;;;;;;;;;;;;;;;
(eval-after-load 'flycheck
  '(custom-set-variables
   '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))

;;;;;;;;;;;;;;;;;;;;smart-compile;;;;;;;;;;;;;;;;;;;;
(require 'smart-compile)
(setq smart-compile-alist
      (append
       '(("\\.c$" . "gcc -g3 -Wall -O0 %f -o %n"))
       smart-compile-alist))

;;;;;;;;;;;;;;;;;;;;gdb;;;;;;;;;;;;;;;;;;;;
(require 'gdb-mi)

;;;;;;;;;;;;;;;;;;;sdic;;;;;;;;;;;;;;;;;;;;
(setq sdic-eiwa-dictionary-list '(
	(sdicf-client "~/.emacs.d/dict/gene.sdic")
	))
(setq sdic-waei-dictionary-list '(
	(sdicf-client "~/.emacs.d/dict/jedict.sdic")
	))
(autoload 'sdic-describe-word "sdic" "英単語の意味を調べる" t nil)
(autoload 'sdic-describe-word-at-point "sdic" "カーソルの位置の英単語の意味を調べる" t nil)
;;文字エンコード
(setq sdic-default-coding-system 'euc-jp)
;; 文字色
(setq sdic-face-color "pink")

;;;;;;;;;;;;;;;;;;;;sdic-inline;;;;;;;;;;;;;;;;;;;;
(require 'sdic-inline)
(sdic-inline-mode t)   ; sdic-inline モードの起動
;; 辞書ファイルの設定
(setq sdic-inline-eiwa-dictionary "~/.emacs.d/dict/gene.sdic")
(setq sdic-inline-waei-dictionary "~/.emacs.d/dict/jedict.sdic")
(setq sdic-inline-not-search-style 'point) ; デフォルト値。ポイント位置が前回と同じである限り、再度辞書ではひかない。
(setq sdic-inline-not-search-style 'word)  ; カーソル下の単語が前回辞書で引いた単語と同じである限り、再度辞書ではひかない。
(setq sdic-inline-not-search-style 't)     ; sdic-inline-delay に定められた秒数毎にポイント下の単語を辞書でひく。
(setq sdic-inline-search-func 'sdic-inline-search-word-with-stem)
