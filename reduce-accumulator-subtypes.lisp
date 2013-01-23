(in-package :com.helmutkian.cl-accumulators)

(defmethod make-accumulator ((type (eql :product)) &rest initargs)
  (declare (ignore initargs))
  (make-accumulator 'reduce :function #'* :initial-value 1))

(defmethod make-accumulator ((type (eql :sum)) &rest initargs)
  (declare (ignore initargs))
  (make-accumulator 'reduce :function #'+ :initial-value 0))

(defmethod make-accumulator ((type (eql :max)) &rest initargs)
  (declare (ignore initargs))
  (make-accumulator 'reduce :function #'max))

(defmethod make-accumulator ((type (eql :min)) &rest initargs)
  (declare (ignore initargs))
  (make-accumulator 'reduce :function #'min))

(defmethod make-accumulator ((type (eql :count)) &rest initargs)
  (declare (ignore initargs))
  (make-accumulator 'reduce 
		    :function 
		    (lambda (counter x) 
		      (declare (ignore x))
		      (1+ counter))
		    :initial-value 0))
	   
