;;; packages.el --- personal-misc Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defvar personal-misc-packages
  '(
    ;; package personal-miscs go here
    howdoi
    helm-google
    helm-spotify
    helm-j-cheatsheet
    helm-pydoc
    vimrc-mode
    julia-mode
    pcre2el
    visual-regexp
    visual-regexp-steroids
    macrostep
    prodigy
    rainbow-mode
    helm-dash
    zencoding-mode
    camcorder
    command-log-mode
    elisp-slime-nav
    yagist
    debbugs
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar personal-misc-excluded-packages '()
  "List of packages to exclude.")

(defun personal-misc/init-macrostep ()
  "Initialize macrostep"
  (use-package macrostep :config (evil-leader/set-key-for-mode 'emacs-lisp-mode
                                   (kbd "m m e") 'macrostep-expand
                                   (kbd "m m c") 'macrostep-collapse
                                   (kbd "m m C") 'macrostep-collapse-all
                                   ))
  )

(defun personal-misc/init-yagist ()
  (use-package yagist))

(defun personal-misc/init-debbugs ()
  (use-package debbugs))

(defun personal-misc/init-howdoi ()
  (use-package howdoi :config (evil-leader/set-key (kbd "h H") 'howdoi-query))
  )

(defun config-elisp-slime-nav ()
  (evil-leader/set-key (kbd "g g") 'elisp-slime-nav-find-elisp-thing-at-point)
  )

(defun personal-misc/init-elisp-slime-nav ()
  (use-package elisp-slime-nav :config
    (add-hook 'elisp-slime-nav-mode-hook #'config-elisp-slime-nav)
    (add-hook 'emacs-lisp-mode-hook #'elisp-slime-nav-mode)
    )
  )

(defun personal-misc/init-helm-dash ()
  (use-package helm-dash :config (evil-leader/set-key (kbd "h D") 'helm-dash))
  )

(defun personal-misc/init-rainbow-mode ()
  (use-package rainbow-mode :config (add-hook css-mode-hook #'rainbow-mode))
  )

(defun personal-misc/init-prodigy ()
  (use-package prodigy :config
    (progn
      (prodigy-define-service
        :name "Redis CommcareHQ"
        :command "redis-server"
        :args '("redis.conf/redis.conf")
        :cwd "/home/dancluna/code/commcare-hq"
        :path '("/home/dancluna/code/commcare-hq")
        :tags '(redis commcare-hq)
        :kill-signal 'sigkill
        :kill-process-buffer-on-stop t)
      (prodigy-define-service
        :name "Elasticsearch CommcareHQ"
        :command "service"
        :args '("elasticsearch" "start")
        :cwd "/home/dancluna/code/commcare-hq"
        :tags '(elasticsearch commcare-hq)
        :kill-signal 'sigkill
        :kill-process-buffer-on-stop t)
      (prodigy-define-service
        :name "Couchdb CommcareHQ"
        :command "service"
        :args '("couchdb" "start")
        :cwd "/home/dancluna/code/commcare-hq"
        :tags '(couchdb commcare-hq)
        :kill-signal 'sigkill
        :kill-process-buffer-on-stop t)
      (prodigy-define-service
        :name "Async task scheduler CommcareHQ"
        :command "./manage.py"
        :args '("celeryd" "--verbosity=2" "--beat" "--statedb=celery.db" "--events")
        :cwd "/home/dancluna/code/commcare-hq"
        :path '("/home/dancluna/code/commcare-hq")
        :tags '(sync commcare-hq)
        :kill-signal 'sigkill
        :kill-process-buffer-on-stop t)
      (prodigy-define-service
        :name "Sync elasticsearch CommcareHQ"
        :command "./manage.py"
        :args '("run_ptop" "--all")
        :cwd "/home/dancluna/code/commcare-hq"
        :path '("/home/dancluna/code/commcare-hq")
        :tags '(sync elasticsearch commcare-hq)
        :kill-signal 'sigkill
        :kill-process-buffer-on-stop t)
      (prodigy-define-service
        :name "CommcareHQ Django server"
        :command "./manage.py"
        :args '("runserver" "0.0.0.0:8000")
        :cwd "/home/dancluna/code/commcare-hq"
        :path '("/home/dancluna/code/commcare-hq")
        :tags '(django commcare-hq)
        :kill-signal 'sigkill
        :kill-process-buffer-on-stop t)))
    )

  ;; For each package, define a function personal-misc/init-<package-personal-misc>
;;
;; (defun personal-misc/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
