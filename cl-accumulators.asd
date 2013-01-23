
(asdf:defsystem #:cl-accumulators
  :components ((:file "package")
	       (:file "accumulator"
		      :depends-on ("package"))
	       (:file "with-accumulators"
		      :depends-on ("accumulator"))
	       (:file "list-accumulator"
		      :depends-on ("accumulator"))
	       (:file "reverse-list-accumulator"
		      :depends-on ("accumulator"))
	       (:file "vector-accumulator"
		      :depends-on ("accumulator"))
	       (:file "reduce-accumulator"
		      :depends-on ("accumulator"))
	       (:file "reduce-accumulator-subtypes"
		      :depends-on ("reduce-accumulator"))))
