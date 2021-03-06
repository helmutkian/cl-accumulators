# *Protocol* **Accumulator** 

##*Generic Function* **MAKE-ACCUMULATOR**

###Syntax:

**make-accumulator** *type* &rest *initargs* => *accumulator*

###Arguments and Values:

*type*--a **symbol** that names an accumulator type

*initargs*--an initialization argument list.

*accumulator*--a fresh instance of the accumulator type

###Description:

The generic function **make-accumulator** creates and 
returns a new instance of an accumulator type initilized with
any provided arguments.

Methods on **make-accumulator** are dispatched on the *type* parameter and must either explicitly ignore or parse the initialization argument list, *initargs*.

###Example:

````lisp

(make-accumulator 'list)

=> <LIST-ACCUMULATOR>

(make-accumulator 'vector :adjustable t)

=> <VECTOR-ACCUMULATOR>

````

##*Generic Function* **CONTENTS**

###Syntax:

**contents** *accumulator* => *object*

###Argument and Values:

*accumulator*--an instance of an accumulator type

*object*--the object being accumulated by the accumulator

###Description:

The generic function **contents** returns the object accumulated by
the accumulator. It has the semantics of a *reader function* and should not be *setf*-able.

Methods of **contents** do not guarantee to return a fresh object, and therefore destructive operations on its return value should be avoided.

###Example:

````lisp

(setq list-acc (make-accumulator 'list))

(dotimes (i 3)
  (accumulate list-acc i))

(contents list-acc)

=> '(0 1 2)
````


##*Generic Function* **ACCUMULATE**

###Syntax:

**accumulate** *accumulator* &rest *args* => *resultant-accumulator*

###Arguments and Values:

*accumulator*--Instance of an accumulator type

*args*--Objects to be accumulated

*resultant-accumulator*--An accumulator with the *args* collects within it.

###Description:

The generic function **accumulate** collects its arguments within according to the accumulator type then returns the provided accumulator with the resultant changes.

An *around method* on **accumulate**, guarantees that the accumulator provided is returned, therefore methods do not need to explicitly return the modified accumulator.

###Example:

````lisp

(setq vector-acc (make-accumulator 'vector))

(accumulate vector-acc 'a)

=> <VECTOR-ACCUMULATOR>

(contents vector-acc)

=> #('a)

(accumulate (accumulate vector-acc 'b) 'c)

=> <VECTOR-ACCUMULATOR>

(contents vector-acc)

=> #('a 'b 'c)
````
