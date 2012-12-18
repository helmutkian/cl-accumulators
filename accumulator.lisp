


(defgeneric accumulator-contents (accumulator)
  (:documentation 
   "Returns the accumulated content within the 
    accumalator object."))

(defgeneric accumulator-into (accumulator &rest args)
  (:documentation 
   "Accumulates its ARGS into the accumulator according to 
    the accumulator type. Returns the modified accumulator."))

(defmethod accumulator-into :around ((acc accumulator) &rest args)
  "This around method ensures that each call to 
   ACCUMULATOR-INTO returns the provided modified accumulator."
  (call-next-method)
  acc)

(defgeneric make-accumulator (type &key)
  (:documentation 
   "Factory function for accumulators. Allows for their creation 
    according to a first-class definition."))
