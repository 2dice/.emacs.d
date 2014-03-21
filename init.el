;設定に必要なファイルのpathを追加する関数を作成
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
              (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))
;; ディレクトリとそのサブディレクトリをload-pathに追加
(add-to-load-path "elisp" "conf" "public_repos")

;パッケージ管理
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
;パッケージインストール
(require 'cl)
(defvar installing-package-list
  '(
    ;; ここに使っているパッケージを書く。
    evil
    evil-leader
    evil-numbers
    yasnippet
    auto-complete
    slime
    ac-slime
    popwin
    shell-pop
    helm
    color-theme
    point-undo
    smartparens
    recentf-ext
    smooth-scrolling
    expand-region
    ))
;上記パッケージがなければ自動インストール
(let ((not-installed (loop for x in installing-package-list
                            when (not (package-installed-p x))
                            collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
        (package-install pkg))))

;バックアップファイルをまとめる
(setq backup-directory-alist
    (cons (cons ".*" (expand-file-name "~/.emacs.d/backup"))
backup-directory-alist))

;共通の基本設定を読み込み
(load "base")

;モードの読み込み/設定
(load "mode")

;カラースキーマ設定
;(load "my-color")

;キーバインド
(load "key-bind")

;C言語設定
(load "c")
