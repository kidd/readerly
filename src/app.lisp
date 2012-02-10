#|
  This file is a part of readerly project.
|#

(clack.util:namespace readerly.app
  (:use :cl)
  (:import-from :caveman.app
                :<app>))

(cl-syntax:use-syntax :annot)

@export
(defclass <readerly-app> (<app>) ())

@export
(defvar *app* (make-instance '<readerly-app>))
