(in-package :com.helmutkian.cl-accumulators)

(defgeneric contents (accumulator)
  (:documentation 
   "Returns the accumulated content within the 
    accumalator object."))

(defgeneric accumulate (accumulator &rest args)
  (:documentation 
   "Accumulates its ARGS into the accumulator according to 
    the accumulator type. Returns the modified accumulator."))

(defmethod accumulate :around (acc &rest args)
  "This around method ensures that each call to 
   ACCUMULATOR-INTO returns the provided modified accumulator."
  (declare (ignore args))
  (call-next-method)
  acc)

(defgeneric make-accumulator (type &rest initargs)
  (:documentation 
   "Factory function for accumulators. Allows for their creation 
    according to a first-class definition."))
