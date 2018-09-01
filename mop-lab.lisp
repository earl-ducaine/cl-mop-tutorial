



(ql:quickload :closer-mop)

(defclass top-level ()
  (top-level-slot1 top-level-slot2 top-level-slot3))

(defclass second-level (top-level)
  (second-level-slot1 second-level-slot2 second-level-slot3))

;; (class-precedence-list
(make-instance 'second-level)

(let ((class-name 'second-level)
      (self (make-instance 'second-level)))
  `(with-slots ,(remove-duplicates
		  (mapcar
		   (lambda (slot)
		     (closer-mop:slot-definition-name slot))
		   (closer-mop:class-slots 
		    (find-class class-name)))) self))
  
