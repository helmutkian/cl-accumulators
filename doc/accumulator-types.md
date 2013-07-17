# Accumulator Types

## :LIST

### Initial Arguments

*:initial-contents*

A *sequence* providing the initial contents of the list to be 
accumulated. All objects accumulated will be inserted *after*
the last element of the *:initial-contents sequence*.

### Description

Accumulates a list in-order of successive calls to ACCUMULATE.

### Example

(with-accumulators ((list-acc :list))
  (accumulate list-acc 1)
  (accumulate list-acc 2)
  (accumulate list-acc 3))

=> '(1 2 3)

## :REVERSE-LIST

### Initial Arguments


*:initial-contents*

A *sequence* providing the initial contents of the list to be 
accumulated. All objects accumulated will be inserted *before*
the first element of the *:initial-contents sequence*. The
sequence provided will *not* be reversed.

### Description

Accumulates a list in reverse order of successive calls to
ACCUMULATE.

### Example


(with-accumulators ((rev-list-acc :reverse-list))
  (accumulate rev-list-acc 1)
  (accumulate rev-list-acc 2)
  (accumulate rev-list-acc 3))

=> '(3 2 1)

## :VECTOR

## :HASH-TABLE

## :REDUCE

