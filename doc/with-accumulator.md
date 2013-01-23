
##*Macro* **WITH-ACCUMULATORS**

###Syntax:

**with-accumulators** (*accumulator-form**) &body *body* => *collections*

###Arguments and Values:

*accumulator-form*--Declaration of an **accumulator** bound to a name

*body*--Body of the lexical block

*values*--Contents of each **accumulator** returned as values as a result of the statements within *body*

###Description:

Each *accumulator-form* follows the syntax (*variable-name* *accumulator-type* *initarg**). *Variable-name* being the symbol bound to the **accumulator** within the lexical scope; *accumulator-type* designates the kind of **accumulator** to be created; *initarg** being an argument list required to initialize the **accumulator**. These bindings are excuted in sequence with the same semantics as **let***.

**With-accumulators** evaluates to **values** corresponding to the contents of each **accumulator** declared in the sequence they were declared.

###Example:

````lisp

(with-accumulators ((list-accumulator :list)
		    (vector-accumulator :vector :size 5))
  (dolist (elem '(1 2 3 4 5))
    (accumulate list-accumulator elem)
    (accumulate vector-accumulator (1- elem))))

=> '(1 2 3 4 5)
=> #(0 1 2 3 4)
````

