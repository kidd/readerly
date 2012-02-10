#|
  This file is a part of readerly project.
|#

(clack.util:namespace readerly
  (:use :cl
        :clack
        :clack.builder
        :clack.middleware.clsql)
  (:shadow :stop)
  (:import-from :caveman
                :config)
  (:import-from :caveman.project
                :<project>
                :build)
  (:import-from :readerly.app
                :*app*))

(cl-syntax:use-syntax :annot)

@export
(defclass <readerly> (<project>) ())

@export
(defvar *project* nil)

(defmethod build ((this <readerly>) &optional app)
  @ignore app
  (call-next-method
   this
   (builder
    (<clack-middleware-clsql>
     :database-type (config :database-type)
     :connection-spec (config :database-connection-spec)
     :connect-args '(:pool t :encoding :utf-8))
    readerly.app:*app*)))

@export
(defun start (&key (mode :dev) (debug t) lazy)
  (setf *project* (make-instance '<readerly>))
  (caveman.project:start *project* :mode mode :debug debug :lazy lazy))

@export
(defun stop ()
  (when *project*
    (caveman.project:stop *project*)
    (setf *project* nil)))
