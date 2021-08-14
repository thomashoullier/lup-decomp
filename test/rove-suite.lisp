(defpackage :lup-decomp/test
  (:use :cl :rove))
(in-package :lup-decomp/test)

(deftest lup-decomp
  (testing "gauss-partial"
    (let ((a #2A((2 0 2 3/5) (3 3 4 -2) (5 5 4 2) (-1 -2 17/5 -1)))
          (a2 #2A((1 2 0) (3 4 4) (5 6 3)))
          (valid-lu2 #2A((5 6 3) (1/5 4/5 -3/5) (3/5 1/2 5/2)))
          (valid-lu #2A((5 5 4 2) (2/5 -2 2/5 -1/5)
                        (-1/5 1/2 4 -1/2) (3/5 0 2/5 -3)))
          (valid-p #(2 0 3 1))
          (valid-p2 #(2 0 1))
          (lu) (p) (lu2) (p2))
      (multiple-value-setq (lu p) (lup-decomp:gauss-partial a))
      (multiple-value-setq (lu2 p2) (lup-decomp:gauss-partial a2))
      (ok (and (equalp valid-lu lu) (equalp valid-p p)) "Test #1")
      (ok (and (equalp valid-lu2 lu2) (equalp valid-p2 p2)) "Test #2"))))
