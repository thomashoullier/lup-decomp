(defpackage :lup-decomp/test
  (:use :cl :rove))
(in-package :lup-decomp/test)

(deftest lup-decomp
  (testing "gauss-partial"
    (let ((a #2A((2 0 2 3/5) (3 3 4 -2) (5 5 4 2) (-1 -2 17/5 -1)))
          (valid-lu #2A((5 5 4 2) (2/5 -2 2/5 -1/5)
                        (-1/5 1/2 4 -1/2) (3/5 0 2/5 -3)))
          (valid-p #(2 0 3 1))
          (lu) (p))
      (multiple-value-setq (lu p) (lup-decomp:gauss-partial a))
      (ok (and (equalp valid-lu lu) (equalp valid-p p)) ""))))
