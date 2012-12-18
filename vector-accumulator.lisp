(defvar *vector-accumulator-default-size* 10)

(defclass vector-accumulator (accumulator)
  ((contents 
    :accessor contents 
    :reader accumulator-contents
    :documentation 
    "Vector being accumulated. Its reader is a method 
    on the generic function ACCUMULATOR-CONTENTS in the
    ACCUMULATOR protocol.")
   (push-function 
    :accessor push-function
    :documentation
    "Function that pushes a new element onto the vector: 
     VECTOR-PUSH-EXTEND for adjustable vectors or VECTOR-PUSH
     for simple vectors.")))

(defmethod make-accumulator 
  ((type (eql 'vector)) &key size (element-type t) adjustable)
  "Creates a VECTOR-ACCUMULATOR"
  (make-accumulator 'vector-accumulator 
		    :size size 
		    :element-type element-type
		    :adjustable adjustable))

(defmethod initialize-instance :after 
  ((acc vector-accumulator) &key size (element-type t) adjustable)
  (let ((adjustable (if size adjustable t)))
    (setf (accumulator-content acc)
	  (make-array (or size *vector-accumulator-default-size*)
		      :element-type element-type
		      :fill-pointer 0
		      :adjustable adjustable)
	  (push-function acc)
	  (if adjustable #'vector-push-extend #'vector-push))))

(defmethod accumulator-into ((acc vector-accumulator) &rest args)
  (funcall (push-function acc)
	   (car args)
	   (accumulator-contents acc)))
