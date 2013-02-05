(in-package :com.helmutkian.cl-accumulators)

(defclass list-accumulator ()
  ((contents 
    :accessor head-pointer 
    :reader contents
    :initform nil)
   (last-pointer :accessor last-pointer)))

(defmethod make-accumulator ((type (eql :list)) &rest initargs)
  (apply #'make-instance 'list-accumulator initargs))

(defmethod initialize-instance :after 
    ((acc list-accumulator) &key initial-contents)
    (when initial-contents
      (dolist (elem initial-contents)
	(accumulate acc elem))))

(defmethod accumulate ((acc list-accumulator) &rest args)
  (with-accessors ((head-pointer head-pointer)
		   (last-ptr last-pointer))
		  acc
    (let ((new-content (list (car args))))
      (cond 
       ((null head-pointer)
        (setf head-pointer new-content
	      last-ptr new-content))
       (t
	(setf (cdr last-ptr) new-content)
	(setf last-ptr new-content))))))
	      
      
    
