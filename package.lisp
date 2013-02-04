
(defpackage #:com.helmutkian.cl-accumulators
  (:nicknames #:accumulators
	      #:acc)
  (:use #:common-lisp)
  (:export #:make-accumulator
	   #:accumulate
	   #:contents
	   #:with-accumulators
	   #:with-accumulator))
