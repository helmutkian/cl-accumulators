(asdf:defsystem test-cl-accumulators
  :components ((:system "helmutkian-utils")
	       (:system "cl-accumulators")
	       (:system "fiveam")
	       (:file "package"
		      :depends-on ("helmutkian-utils"
				   "cl-accumulators"
				   "fiveam"))
	       (:file "test-with-accumulators"
		      :depends-on ("package"))
	       (:file "test-with-accumulator"
		      :depends-on ("package"))
	       (:file "test-list-accumulator"
		      :depends-on ("package"))
	       (:file "test-vector-accumulator"
		      :depends-on ("package"))
	       (:file "test-hash-table-accumulator"
		      :depends-on ("package"))))
