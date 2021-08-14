# LUP decomposition
`lup-decomp` implements LUP decomposition for (non-singular) square matrices.
This is, for example, useful in solving systems of linear equations or
inverting matrices.

## Usage
**gauss-partial** A => lu p

Compute matrices L and U, along with row permutations vector p.
L is unit lower triangular. U is upper triangular. L and U are
stored compactly in the same matrix lu, with the diagonal of unit
elements of L omitted.

The relationship between A, L, U and P is P.A = L.U

The method is Gaussian elimination with partial (row) pivoting,
as described in [1].

```common-lisp
(let ((a #2A((2 0 2 3/5) (3 3 4 -2) (5 5 4 2) (-1 -2 17/5 -1))))
(gauss-partial a))
;;=> #2A((5 5 4 2) (2/5 -2 2/5 -1/5)
;;       (-1/5 1/2 4 -1/2) (3/5 0 2/5 -3))
;;   #(2 0 3 1)
```

## Test
Launch tests with:
```common-lisp
(asdf:test-system "lup-decomp")
```

## Dependencies
* `lup-decomp`:
  * [mat-ops](https://github.com/thomashoullier/mat-ops)
  * [alexandria](https://gitlab.common-lisp.net/alexandria/alexandria)
* `lup-decomp/test`:
  * [rove](https://github.com/fukamachi/rove)

## See also
* [dgetrf](https://www.netlib.org/lapack/explore-html/dd/d9a/group__double_g_ecomputational_ga0019443faea08275ca60a734d0593e60.html#ga0019443faea08275ca60a734d0593e60)

## References
1. T. H. Cormen, C. E. Leiserson, R. L. Rivest, and C. Stein, Introduction to
   Algorithms (MIT press, 2009).
