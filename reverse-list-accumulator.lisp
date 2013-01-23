(in-package :com.helmutkian.cl-accumulators)

(defclass reverse-list-accumulator ()
  ((contents
    :accessor list-of
    :reader contents
    :initform nil)))

(defmethod make-accumulator 
    ((type (eql 'reverse-list)) &rest initargs)
  (declare (ignore initargs))
  (make-instance 'reverse-list-accumulator))

(defmethod accumulate ((acc reverse-list-accumulator) &rest args)
  (push (car args) (list-of acc)))
