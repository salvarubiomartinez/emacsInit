;;; pacakage:
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;;; packages:
(use-package evil
  :ensure t
  :config
  (evil-mode 1))
(use-package evil-surround
  :ensure t
  :config
  (evil-surround-mode 1))
(use-package helm
;;  :disabled
  :ensure t
  :bind (("M-x" . helm-M-x)
	 ("C-x r b" . helm-filtered-bookmarks)
	 ("C-x C-f" . helm-find-files)
	 ("C-x C-b" . helm-mini))
  :config
  (require 'helm-config)
  (helm-mode 1))
(use-package ivy
  :disabled
  :ensure nil
  :bind (("C-s" . swiper)
	 ("C-c k" . counsel-ag)
	 ("C-c j" . counsel-git-grep)
	 ("C-x l" . counsel-locate))
  :hook (after-init . ivy-mode)
  :config
;;  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (setq ivy-count-format "(%d/%d) ")
  (counsel-mode 1)
  (setq ivy-display-style 'fancy))
(use-package counsel
  :disabled
  :ensure nil
  :after ivy)
(use-package company
  :ensure t
  :hook (prog-mode . company-mode)
  :config
  (setq company-tooltip-align-annotations t))
(use-package flycheck
  :ensure t
  :hook (prog-mode . flycheck-mode))
(use-package exwm
  :disabled
  :ensure nil
  :config
  (require 'exwm-config)
  (exwm-config-default))
(use-package highlight-numbers
  :ensure t
  :hook (prog-mode . highlight-numbers-mode))
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))
(use-package highlight-parentheses
  :ensure t
  :hook (prog-mode . highlight-parentheses-mode))
(use-package slime
  :disabled
  :ensure nil
  :config
  (setq inferior-lisp-program "/usr/local/bin/sbcl"))
(use-package tide
  :ensure t
  :after (flycheck company)
  :hook ((before-save . tide-format-before-save)
	 (typescript-mode . setup-tide-mode))
  :config
  (defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled new-line))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))
  (setq tide-completion-ignore-case t))
(use-package web-mode
  :ensure t
  :config (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode)))
(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))
(use-package which-key
  :ensure t
  :config
  (which-key-mode 1))
(use-package pdf-tools
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.pdf?\\'" . pdf-view-mode))
  (add-hook 'pdf-view-mode-hook 'pdf-isearch-minor-mode))
(use-package omnisharp
;;  :disabled
  :ensure t
  :hook (csharp-mode . omnisharp-mode)
  :config
  (eval-after-load
  'company
  '(add-to-list 'company-backends 'company-omnisharp))
;;  (setq omnisharp-server-executable-path "C:\\Users\\srubio.BETWEEN\\Downloads\\omnisharp-win-x86\\OmniSharp.exe")
  (setq omnisharp-debug t))
(use-package powerline
  :ensure t
  :config
  (powerline-default-theme))
;;; Config:
(setq inhibit-startup-screen t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(electric-pair-mode 1)
(global-auto-revert-mode t)
;;epa enable ask for passphrase
(setq epa-pinentry-mode 'loopback)
(load-theme 'spacemacs-dark t)
;;(require 'powerline)
;;(powerline-default-theme)
;;(load-theme 'deeper-blue t)
;;(load-theme 'cyberpunk t)
;;et-face-attribute 'default nil :height 100;;
(setq dired-dwim-target t)
;;;(setq ido-enable-flex-matching t)
;;;(setq ido-everywhere t)
;;;(ido-mode 1)
;;;;; ido m-x
;;;    (global-set-key
;;;     "\M-x"
;;;     (lambda ()
;;;       (interactive)
;;;       (call-interactively
;;;        (intern
;;;         (ido-completing-read
;;;          "M-x "
;;;          (all-completions "" obarray 'commandp))))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "28ec8ccf6190f6a73812df9bc91df54ce1d6132f18b4c8fcc85d45298569eb53" "d6922c974e8a78378eacb01414183ce32bc8dbf2de78aabcc6ad8172547cb074" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "2a739405edf418b8581dcd176aaf695d319f99e3488224a3c495cb0f9fd814e3" default)))
 '(helm-locate-project-list (quote ("~/Projects")))
 '(org-agenda-files (quote ("~/Dropbox/agenda.org")))
 '(package-selected-packages
   (quote
    (pdf-tools powerline counsel rainbow-delimiters-mode flycheck-clojure clojure-mode 4clojure flycheck-elixir elixir-mode transpose-frame exwm highlight-parentheses rainbow-delimiters elm-mode afternoon-theme cyberpunk-theme solarized-theme web-mode omnisharp csharp-mode evil-surround magit highlight-symbol highlight-numbers spacemacs-theme zenburn-theme tide which-key helm flycheck evil company)))
 '(send-mail-function (quote smtpmail-send-it))
 )
(setq helm-locate-project-list '("~/drakkart/"))
;; functions:
(defun revert-buffer-no-confirm ()
    "Revert buffer without confirmation."
    (interactive)
    (revert-buffer :ignore-auto :noconfirm))
;; para formatear XML
(defun reformat-xml ()
  "Format xml document."
  (interactive)
  (save-excursion
    (sgml-pretty-print (point-min) (point-max))
    (indent-region (point-min) (point-max))))

;;(defun connect-remote ()
;;  (interactive)
;;  (dired "/user@server:/home/user"))
(provide 'init)
;;; init.el ends here
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
