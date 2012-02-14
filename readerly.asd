#|
  This file is a part of readerly project.
|#

(in-package :cl-user)
(defpackage readerly-asd
  (:use :cl :asdf))
(in-package :readerly-asd)

(defsystem readerly
  :version "0.1-SNAPSHOT"
  :author ""
  :license ""
  :depends-on (:clack
               :clack-middleware-clsql
               :caveman
               :cl-syntax
               :cl-syntax-annot)
  :components ((:module "lib"
                :components
                ((:module "view"
                  :components
                  ((:file "emb")))))
               (:module "src"
                :depends-on ("lib")
                :components
                ((:file "app")
                 (:file "models")
                 (:file "readerly" :depends-on ("app"))
                 (:file "controller" :depends-on ("app" "models")))))
  :description ""
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.markdown"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (load-op readerly-test))))
