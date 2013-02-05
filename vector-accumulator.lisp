(in-package :com.helmutkian.cl-accumulators)

(defvar *vector-accumulator-default-size* 10)

(defclass vector-accumulator ()
  ((vec 
    :accessor vec 
    :reader contents
    :documentation 
    "Vector being accumulated. Its reader is a method 
    on the generic function CONTENTS in the
    ACCUMULATOR protocol.")))

(defmethod make-accumulator ((type (eql :vector)) &rest initargs)
  "Creates a VECTOR-ACCUMULATOR"
  (apply #'make-instance 'vector-accumulator initargs)) 
		   

(defmethod initialize-instance :after 
    ((acc vector-accumulator) &key initial-contents)
  (let ((init-len (length initial-contents)))
    (setf (vec acc)
	  (multiple-value-call #'make-array
	    (if initial-contents
		(values init-len
			:initial-contents initial-contents
			:adjustable t
			:fill-pointer init-len)
		(values *vector-accumulator-default-size*
			:adjustable t
			:fill-pointer 0))))))

(defmethod accumulate ((acc vector-accumulator) &rest args)
  (vector-push-extend (car args) (vec acc)))
