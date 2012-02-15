#|
  This file is a part of readerly project.
|#

(clack.util:namespace readerly.controller
  (:use :cl
        :caveman
        :clsql
        :readerly.app)
  (:import-from :readerly.view.emb
                :render)
  (:import-from :readerly.models
                :toread
                :get-all-toreads
                :hola)
  )

(cl-syntax:use-syntax :annot)

@url GET "/"
(defun index (params)
  (render
   "index.tmpl"
   params))

@url POST "/"
(defun index-post (params)
  @ignore params
  "Hello, Caveman!")

@url GET "/joan-saluda"
(defun joan-saluda (params)
  @ignore params
  (hola))

@url GET "/toreads"
(defun show-toreads (params)
  @ignore params
  (let ((a (readerly.models:get-all-toreads)))
   (render "toreads/index.emb" a)))

@url POST "/toreads"
(defun create-toreads (params)
  (let ((current-toread (make-instance 'toread
                                       :id (parse-integer (getf params :|id|))
                                       :title (getf params :|title|)
                                       :url (getf params :|url|)
                                       :owner (getf params :|owner|))))
    (clsql:update-records-from-instance current-toread)
    (redirect-to "/toreads")))

@url GET "/toreads/new"
(defun new-toreads (params)
  (render "toreads/new.emb" params))


@url GET "/create-db"
(defun create-db (params)
  @ignore params
  (truncate-database)
  (create-view-from-class 'toread))
