#|
  This file is a part of readerly project.
|#

(clack.util:namespace readerly.view.emb
  (:use :cl)
  (:import-from :caveman
                :config))

(cl-syntax:use-syntax :annot)

@export
(defun render (file params)
  (caveman.view.emb:render
   (merge-pathnames file
    (merge-pathnames
     (config :template-path)
     (config :application-root)))
   params))
