(require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
    (package-initialize)
;;; Code:
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(electric-pair-mode 1)
(require 'evil)
(evil-mode 1)
(require 'helm-config)
(helm-mode 1)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(global-set-key (kbd "C-x C-b") #'helm-mini)
(which-key-mode 1)
;;TypeScript
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled new-line))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "2a739405edf418b8581dcd176aaf695d319f99e3488224a3c495cb0f9fd814e3" default)))
 '(package-selected-packages
   (quote
    (magit highlight-symbol highlight-numbers spacemacs-theme zenburn-theme tide which-key helm flycheck evil company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; flycheck global
(add-hook 'after-init-hook #'global-flycheck-mode)
;; company global
(add-hook 'after-init-hook 'global-company-mode)
(load-theme 'spacemacs-dark t)
(set-face-attribute 'default nil :height 120)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE: highlight-numbers         ;;
;;                                    ;;
;; GROUP: Faces -> Number Font Lock   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'prog-mode-hook 'highlight-numbers-mode)
;;; magit:
(global-set-key (kbd "C-x g") 'magit-status)
