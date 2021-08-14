;;;; LUP decomposition
(in-package :lup-decomp)

(defun gauss-partial* (A)
  "LUP decomposition via gaussian elimination with partial (row) pivoting.
   A is a square matrix. Function is in-place on A and returns a pivoting
   vector representing matrix P. See LUP-DECOMPOSITION in Introduction
   to Algorithms.
   Return A storing L and U, and p the permutation vector.
   Return nil if A was singular (A can also be destroyed as a side-effect)."
  (let* ((n (mat-ops:nrows A))
         (p (make-array n))
         (piv) ; pivot value
         (kp))
    ;; Initialize permutations to identity
    (loop for i from 0 below n do (setf (aref p i) i))
    ;; Main loop
    (loop for k from 0 below n do
      (setf piv 0)
      (loop for i from k below n do
        (when (> (abs (aref A i k)) piv)
          (psetf piv (abs (aref A i k))
                 kp i)))
      (when (zerop piv) (return-from gauss-partial* nil))
      (rotatef (aref p k) (aref p kp))
      (loop for i from 0 below n do (rotatef (aref A k i) (aref A kp i)))
      (loop for i from (1+ k) below n do
        (setf (aref A i k) (/ (aref A i k) (aref A k k)))
        (loop for j from (1+ k) below n do
          (decf (aref A i j) (* (aref A i k) (aref A k j))))))
    (values A p)))

(defun gauss-partial (A)
  "Functional version of gauss-partial*."
  (gauss-partial* (alexandria:copy-array A)))
