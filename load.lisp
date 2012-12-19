
(defun with-path (path &rest files)
  (mapcar (lambda (file)
	    (concatenate 'string path file))
	  files))

(defun load-accumulators ()
  (map nil
       #'load
       (with-path "~/Development/lisp/cl-accumulators/"
	 "accumulator.lisp"
	 "list-accumulator.lisp"
	 "vector-accumulator.lisp"
	 "reduce-accumulator.lisp")))
