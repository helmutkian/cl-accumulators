(in-package #:com.helmutkian.cl-accumulators.test)

(defun alist->hash-table (alist)
  (let ((hash (make-hash-table)))
    (mapc (lambda (elem)
	    (setf (gethash (car elem) hash)
		  (cdr elem)))
	  alist)
    hash))

(defun hash-table->alist (hash)
  (let ((alist nil))
    (maphash (lambda (key val)
	       (push (key val) alist))
	     hash)
    alist))

(defun alist-sort-pred (x y)
  (< (cdr x) (cdr y)))

(test test-hash-table-accumulator
  (let ((alist '((a . 1) (b . 2) (c .3) (d . 4) (e . 5))))
    (is
     (apply #'equalp 
	    (mapcar (compose (rcurry #'stable-sort #'alist-sort-pred)
			     #'hash-table->alist)
		    (list (alist->hash-table alist)
			  (with-accumulator (:hash-table)
			    (dolist (pair alist)
			      (accumulate (car pair) (cdr pair))))))))))
