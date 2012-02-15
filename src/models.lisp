(clack.util:namespace readerly.models
  (:use :cl
        :caveman
        :anaphora)
  (:import-from :clack.response
                :headers)
  (:export :hola :toread :quote
           :get-all-toreads
           ))

;(cl-annot:enable-annot-syntax)

@export
(defun get-all-toreads ()
  (clsql:select 'toread))

@export
(defun hola ()
  "<h1>SIP!</h1>")

@export
(clsql:def-view-class toread ()
  ((id
    :db-kind :key
    :db-constraints :not-null
    :type integer
    :initarg :id)
   (title
    :accessor title
    :type (string 50)
    :initarg :title)
   (url
    :accessor url
    :type (string 250)
    :initarg :url)
   (owner
    :accessor owner
    :type (string 30)
    :initarg :owner)
   (finished
    :accessor finished
    :type boolean
    :initarg :finished)))
