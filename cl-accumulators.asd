
(asdf:defsystem #:cl-accumulators
  :components ((:file "package")
	       (:file "accumulator"
		      :depends-on ("package"))
	       (:file "with-accumulators"
		      :depends-on ("accumulator" "package"))
	       (:file "list-accumulator"
		      :depends-on ("accumulator" "package"))
	       (:file "vector-accumulator"
		      :depends-on ("accumulator" "package"))
	       (:file "reduce-accumulator"
		      :depends-on ("accumulator" "package"))
	       (:file "reduce-accumulator-subtypes"
		      :depends-on ("reduce-accumulator" "package"))))
