(in-package :com.helmutkian.cl-accumulators)

(defvar *vector-accumulator-default-size* 10)

(defclass vector-accumulator ()
  ((vec 
    :accessor vec 
    :reader contents
    :documentation 
    "Vector being accumulated. Its reader is a method 
    on the generic function CONTENTS in the
    ACCUMULATOR protocol.")
   (push-function 
    :accessor push-function
    :documentation
    "Function that pushes a new element onto the vector: 
     VECTOR-PUSH-EXTEND for adjustable vectors or VECTOR-PUSH
     for simple vectors.")))

(defmethod make-accumulator ((type (eql 'vector)) &rest initargs)
  "Creates a VECTOR-ACCUMULATOR"
  (apply #'make-instance 'vector-accumulator initargs)) 
		   

(defmethod initialize-instance :after 
  ((acc vector-accumulator) &key size (element-type t) adjustable)
  (let ((adjustable (if size adjustable t)))
    (setf (vec acc)
	  (make-array (or size *vector-accumulator-default-size*)
		      :element-type element-type
		      :fill-pointer 0
		      :adjustable adjustable)
	  (push-function acc)
	  (if adjustable #'vector-push-extend #'vector-push))))

(defmethod accumulate ((acc vector-accumulator) &rest args)
  (funcall (push-function acc)
	   (car args)
	   (vec acc)))
