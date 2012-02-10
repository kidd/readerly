`(:static-path #p"static/"
  :log-path #p"log/"
  :template-path #p"tmpl/"
  :application-root ,(asdf:component-pathname
                      (asdf:find-system :readerly))
  :server :hunchentoot
  :port 5000
  :database-type :sqlite3
  :database-connection-spec (,(namestring
                               (asdf:system-relative-pathname
                                :readerly
                                "sqlite3.db"))))
