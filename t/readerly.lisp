#|
  This file is a part of readerly project.
|#

(in-package :cl-user)
(defpackage readerly-test
  (:use :cl
        :readerly
        :cl-test-more))
(in-package :readerly-test)

(plan nil)

;; make sure the app stopped
(readerly:stop)
(readerly:start)

;; blah blah blah.

(readerly:stop)

(finalize)
