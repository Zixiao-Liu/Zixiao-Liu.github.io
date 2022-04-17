(setq mac-option-modifier 'meta
      mac-command-modifier 'super)
(global-set-key (kbd "s-a") 'mark-whole-buffer) 
(global-set-key (kbd "s-c") 'kill-ring-save) 
(global-set-key (kbd "s-s") 'save-buffer) 
(global-set-key (kbd "s-v") 'yank) 
(global-set-key (kbd "s-z") 'undo) 
(global-set-key (kbd "s-x") 'kill-region) 

(setq auto-image-file-mode t)

(global-set-key (kbd "C-j") 'goto-line)

(fset 'yes-or-no-p 'y-or-n-p)

(setq scroll-step 1 scroll-margin 3 scroll-conservatively 10000)

(setq custom-tab-width 4)

(setq track-eol t)

(global-set-key (kbd "C-z") 'set-mark-command)

(setq org-src-fontify-natively t)



;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t))


 (require 'cl)

  (defvar zixiao/packages '(
			    company
			    monokai-theme
			    hungry-delete
			    swiper 
			    counsel
			    js2-mode
			    exec-path-from-shell
			    ) "Default packages")

(setq package-selected-packages zixiao/packages)

(defun zixiao/packages-installed-p ()
    (loop for pkg in zixiao/packages
	  when (not (package-installed-p pkg)) do (return nil)
	  finally (return t)))

(unless (zixiao/packages-installed-p)
  (message "%s" "Refreshing package detabase...")
  (package-refresh-contents)
  (dolist (pkg zixiao/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))






(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))



(ivy-mode)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))


(require 'hungry-delete)
(global-hungry-delete-mode)

(global-linum-mode t)
(setq-default cursor-type 'hollow)
(set-cursor-color "blue")

(setq make-backup-files nil)

(global-hl-line-mode t)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(tool-bar-mode -1)

;;(scroll-bar-mode -1)

(electric-indent-mode t)

(setq inhibit-splash-screen t)

(linum-mode t)

(global-company-mode t)

(load-theme 'monokai t)

(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)

(setq truncate-lines nil)

(setq org-use-fast-todo-selection t)
(setq org-todo-keywords '((sequesce "TODO(t)" "DOING(i)" "|" "DONE(d)" "ABORT(a)")))

(setq org-todo-keyword-faces '(("TODO" . "red")
			       ("DOING" . "yellow")
			       ("DONE" . "green")
                               ("ABORT" . "orange")))

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-my-init-file)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.1)
 '(company-minimum-prefix-length 3))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor ((t (:background "yellow" :foreground "#1B1E1C" :inverse-video t))))
 '(hl-line ((t (:background "color-240")))))
