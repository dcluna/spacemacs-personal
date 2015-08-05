;;; extensions.el --- personal-misc Layer extensions File for Spacemacs
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

(defvar personal-misc-pre-extensions
  '(
    ;; pre extension personal-miscs go here
    )
  "List of all extensions to load before the packages.")

(defvar personal-misc-post-extensions
  '(
    ;; post extension personal-miscs go here
    )
  "List of all extensions to load after the packages.")

;; For each extension, define a function personal-misc/init-<extension-personal-misc>
;;
;; (defun personal-misc/init-my-extension ()
;;   "Initialize my extension"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package

(defvar unused-resources-jar "~/bin/AndroidUnusedResources.jar" "Location for the unused resources jar")

(defun android/unused-resources-check (directory)
  (interactive "DAndroid app directory: ")
  (async-shell-command (format "cd %s && java -jar %s ; cd -" directory unused-resources-jar) "Android Resources Check"))
