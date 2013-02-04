(in-package #:com.helmutkian.cl-accumulators)

(defclass hash-table-accumulator ()
  ((hash
    :accessor hash-table-of
    :reader contents)))

(defmethod make-accumulator ((type (eql :hash-table)) &rest initargs)
  (apply #'make-instance 'hash-table-accumulator initargs))

(defmethod initialize-instance ((acc hash-table-accumulator) &key (test #'eql))
  (setf (hash-table-of acc) (make-hash-table :test test)))

(defmethod accumulate ((acc hash-table-accumulator) &rest args)
  (setf (gethash (getf args :key) (hash-table-of acc))
	(getf args :value)))
