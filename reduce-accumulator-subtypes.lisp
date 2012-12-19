

(defmethod make-accumulator ((type (eql 'product)) &rest initargs)
  (declare (ignore initargs))
  (make-accumulator 'reduce :function #'* :initial-value 1))

(defmethod make-accumulator ((type (eql 'sum)) &rest initargs)
  (declare (ignore initargs))
  (make-accumulator 'reduce :function #'+ :initial-value 0))

(defmethod make-accumulator ((type (eql 'max)) &rest initargs)
  (declare (ignore initargs))
  (flet ((max* (x y)
	   (if (or (null x) (< x y)) 
	     y
	     x)))
	(make-accumulator 'reduce
			  :function #'max*
			  :intial-value nil)))

(defmethod make-accumulator ((type (eql 'min)) &rest initargs)
  (declare (ignore initargs))
  (flet ((min* (x y)
	   (if (or (null x) (> x y))
	     y
	     x)))
	(make-accumulator 'reduce
			  :function #'min*
			  :initial-value nil)))

(defmethod make-accumulator ((type (eql 'count)) &rest initargs)
  (declare (ignore initargs))
  (make-accumulator 'reduce :function #'1+ :initial-value 0))
	   
