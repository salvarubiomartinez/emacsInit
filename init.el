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
(require 'evil-surround)
(global-evil-surround-mode 1)
;;(add-hook 'evil-mode-hook 'turn-on-surround-mode)
(require 'helm-config)
(helm-mode 1)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(global-set-key (kbd "C-x C-b") #'helm-mini)
(global-set-key (kbd "C-x p") #'project-find-file)
;;(which-key-mode 1)
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
    (web-mode omnisharp csharp-mode evil-surround magit highlight-symbol highlight-numbers spacemacs-theme zenburn-theme tide which-key helm flycheck evil company))))
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
(set-face-attribute 'default nil :height 100)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE: highlight-numbers         ;;
;;                                    ;;
;; GROUP: Faces -> Number Font Lock   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'prog-mode-hook 'highlight-numbers-mode)
;;; magit:
(global-set-key (kbd "C-x g") 'magit-status)
;; Source: http://www.emacswiki.org/emacs-en/download/misc-cmds.el
(defun revert-buffer-no-confirm ()
    "Revert buffer without confirmation."
    (interactive)
    (revert-buffer :ignore-auto :noconfirm))
;;CSharp
(add-hook 'csharp-mode-hook 'omnisharp-mode)
(eval-after-load
 'company
 '(add-to-list 'company-backends 'company-omnisharp))
(setq sql-ms-program "sqlcmd")
(setq omnisharp-server-executable-path "C:\\Users\\srubio.BETWEEN\\Downloads\\omnisharp-win-x86\\OmniSharp.exe")
(setq omnisharp-debug nil)

;;(require 'sgml-mode)
;; para formatear XML
(defun reformat-xml ()
  (interactive)
  (save-excursion
    (sgml-pretty-print (point-min) (point-max))
    (indent-region (point-min) (point-max))))
(provide 'init)
;;;; init.el ends here
