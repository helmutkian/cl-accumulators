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

###Example

````lisp

(make-accumulator 'list)

=> <LIST-ACCUMULATOR>

(make-accumulator 'vector :adjustable t)

=> <VECTOR-ACCUMULATOR>

````

##*Generic Function* **CONTENTS**

###Syntax

**contents** *accumulator* => *object*

###Argument and Values

*accumulator*--an instance of an accumulator type

*object*--the object being accumulated by the accumulator

###Description

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
