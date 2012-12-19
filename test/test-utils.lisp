
(defun accumulate* (acc args)
  "Accumulates each object in the list ARGS into 
   the accumulator, ACC"
  (dolist (arg args)
    (accumulate acc arg))
  acc)
