(in-package :com.helmutkian.cl-accumulators)

;;; ************************************************************
;;; Product Accumulator
;;; ************************************************************

(define-make-accumulator :product ()
  (make-accumulator :reduce :function #'* :initial-value 1))

(define-make-accumulator #'* ()
  (make-accumulator :product))

;;; ************************************************************
;;; Sum Accumulator
;;; ************************************************************


(define-make-accumulator :sum ()
  (make-accumulator :reduce :function #'+ :initial-value 0))

(define-make-accumulator #'+ ()
  (make-accumulator :sum))

;;; ************************************************************
;;; Max Accumulator
;;; ************************************************************

(define-make-accumulator :max ()
  (make-accumulator :reduce :function #'max))

(define-make-accumulator #'make ()
  (make-accumulator :max))

;;; ************************************************************
;;; Min Accumulator
;;; ************************************************************


(define-make-accumulator :min ()
  (make-accumulator :reduce :function #'min))

(define-make-accumulator #'min ()
  (make-accumulator :min))

;;; ************************************************************
;;; Count Accumulator
;;; ************************************************************

(define-make-accumulator :count ()
  (make-accumulator :reduce 
		    :function 
		    (lambda (counter x) 
		      (declare (ignore x))
		      (1+ counter))
		    :initial-value 0))

(define-make-accumulator #'count ()
  (make-accumulator :count))
	   
