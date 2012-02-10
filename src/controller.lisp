#|
  This file is a part of readerly project.
|#

(clack.util:namespace readerly.controller
  (:use :cl
        :caveman
        :readerly.app)
  (:import-from :readerly.view.emb
                :render))

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
