(defsystem lup-decomp
  :name "lup-decomp"
  :author "Thomas HOULLIER"
  :depends-on ("mat-ops" "alexandria")
  :components
  ((:module "src"
    :components ((:file "package")
                 (:file "lup-decomp" :depends-on ("package")))))
  :in-order-to ((test-op (test-op "lup-decomp/test"))))

(defsystem lup-decomp/test
  :name "lup-decomp/test"
  :depends-on ("rove" "lup-decomp")
  :components
  ((:module "test"
    :components ((:file "rove-suite"))))
  :perform (test-op (o c) (symbol-call :rove '#:run c)))
