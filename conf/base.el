;;yes-or-no
(fset 'yes-or-no-p 'y-or-n-p)

; 言語を日本語にする
;(set-language-environment 'Japanese)

; 極力UTF-8とする
;(prefer-coding-system 'utf-8)

;対応する括弧を強調表示
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'expression)
(set-face-attribute 'show-paren-match-face nil
                    :background nil :foreground nil
                    :underline "#ffff00" :weight 'extra-bold)

;現在行をハイライト
(global-hl-line-mode t)

;行番号表示
(global-linum-mode t)

;モードラインに列番号表示
(column-number-mode t)

;タイトルバーにフルパスを表示
(setq frame-title-format "%f")

;ツールパー非表示
(tool-bar-mode -1)

;ファイルの先頭に#!がついていれば保存時に実行権をつける
(add-hook 'after-save-hook
	  'executable-make-buffer-file-executable-if-script-p)
