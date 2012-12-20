
(asdf:defsystem #:cl-accumulators
  :components ((:file "package")
	       (:file "list-accumulator"
		      :depends-on ("package"))
	       (:file "vector-accumulator"
		      :depends-on ("package"))
	       (:file "reduce-accumulator"
		      :depends-on ("package"))
	       (:file "reduce-accumulator-subtypes"
		      :depends-on ("reduce-accumulator"))))
