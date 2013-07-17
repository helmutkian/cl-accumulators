(in-package #:com.helmutkian.cl-accumulators)

;;; ************************************************************
;;; ************************************************************

(defclass generic-union-accumulator ()
  ((%function :reader %function)
   (%contents :initform nil
	      :reader contents
	      :accessor %contents)
   (%key :initarg :key
	 :reader key
	 :initform nil)
   (%test :initarg :test
	  :reader test
	  :initform #'eql)
   (%test-not :initarg :test-not
	      :reader test-not
	      :initform nil)))

(defclass union-accumulator (generic-union-accumulator)
  ((%function :initform #'union)))

(defclass nunion-accumulator (generic-union-accumulator)
  ((%function :initform #'nunion)))

;;; ************************************************************
;;; ************************************************************

(define-make-accumulator :union (initargs)
  (apply #'make-instance
	 'union-accumulator
	 initargs))

(define-make-accumulator #'union (initargs)
  (apply #'make-accumulator :union initargs))

;;; ************************************************************
;;; ************************************************************

(define-make-accumulator :nunion (initargs)
  (apply #'make-instance
	 'nunion-accumulator
	 initargs))

(define-make-accumulator #'nunion (initargs)
  (apply #'make-accumulator :nunion initargs))

;;; ************************************************************
;;; ************************************************************

(defmethod accumulate ((acc generic-union-accumulator) &rest args)
  (setf (%contents acc)
	(funcall (%function acc)
		 args
		 (%contents acc))))


	 
