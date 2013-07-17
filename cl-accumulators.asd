
(asdf:defsystem #:cl-accumulators
  :components ((:system "parse-declarations-1.0")
	       (:file "package")
	       (:file "define-make-accumulator"
		      :depends-on ("parse-declarations-1.0" "package"))
	       (:file "accumulator"
		      :depends-on ("package"))
	       (:file "with-accumulators"
		      :depends-on ("accumulator"))
	       (:file "with-accumulator"
		      :depends-on ("with-accumulators"))
	       (:file "list-accumulator"
		      :depends-on ("accumulator"
				   "define-make-accumulator"))
	       (:file "reverse-list-accumulator"
		      :depends-on ("accumulator"
				   "define-make-accumulator"))
	       (:file "vector-accumulator"
		      :depends-on ("accumulator"
				   "define-make-accumulator"))
	       (:file "reduce-accumulator"
		      :depends-on ("accumulator"
				   "define-make-accumulator"))
	       (:file "reduce-accumulator-subtypes"
		      :depends-on ("reduce-accumulator"
				   "define-make-accumulator"))
	       (:file "union-accumulator"
		      :depends-on ("accumulator"
				   "define-make-accumulator"))))
