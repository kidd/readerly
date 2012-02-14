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
  (render "toreads/index.emb" (readerly.models:get-all-toreads)))

@url GET "/create-db"
(defun create-db (params)
  @ignore params
  (truncate-database)
;  (create-view-from-class) 'toread
  )
