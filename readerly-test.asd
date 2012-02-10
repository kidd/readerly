#|
  This file is a part of readerly project.
|#

(in-package :cl-user)
(defpackage readerly-test-asd
  (:use :cl :asdf))
(in-package :readerly-test-asd)

(defsystem readerly-test
  :author ""
  :license ""
  :depends-on (:readerly
               :cl-test-more)
  :components ((:module "t"
                :components
                ((:file "readerly"))))
  :perform (load-op :after (op c) (asdf:clear-system c)))
