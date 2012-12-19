

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
