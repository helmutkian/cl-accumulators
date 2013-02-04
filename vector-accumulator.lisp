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
    ((acc vector-accumulator) &key size)
  (setf (vec acc)
	(make-array (or size *vector-accumulator-default-size*)
		    :fill-pointer 0
		    :adjustable t)))

(defmethod accumulate ((acc vector-accumulator) &rest args)
  (vector-push-extend (car args) (vec acc)))
