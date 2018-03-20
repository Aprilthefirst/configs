(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode t)
(electric-pair-mode t)

(setq inhibit-splash-screen t)
(setq org-file "~/orgfiles")


(defun open-my-init-file()
    (interactive)
    (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f3>") 'open-my-init-file)

(setq package-archives '(("gnu"   . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(defun pkgs-install ()
  (let ((pkgs '(
		find-file-in-project
		expand-region
		ivy
		swiper
		counsel
		ace-jump-mode
		company)))
    (dolist (pkg pkgs)
      (if (not (package-installed-p pkg))
	  (progn
	    (package-refresh-contents)
	    (package-install pkg)
	    (message "%s new install complete." pkg))
	(message "package %s installed!" pkg)))))

(pkgs-install)

(ivy-mode t)
(setq ivy-use-virtual-buffers t) (setq ivy-count-format "(%d/%d) ")
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)

(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)

(global-set-key (kbd "C-c C-r") 'ivy-resume)

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

;;; (elpy-enable)
