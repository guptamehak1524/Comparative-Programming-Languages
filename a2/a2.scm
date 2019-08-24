; CMPT 383
; NAME - MEHAK GUPTA  
; ID- 301311972
; SFU ID- MGA76@SFU.CA
; REFERENCES- Professor's class notes and posted notes

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define my-len  
 	(lambda (lst)
    ;length of the list
    	(cond 
    		((null? lst)
           		0)
        ;length =0 if list is empty
          (else
           		(+ 1 (my-len (cdr lst)))
              ;1+ length of the cdr of list
          )
      )
  )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define singleton? 
	(lambda (x)
		(cond
    ;returns true if length of list =1 
			((equal? (my-len x) 1)
				#t)
      ;false otherwise
			(else 
				#f)				
		)
	)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define my-append
	(lambda (A B)
  		(cond 
        ;if one of the lists is empty return the other one
  			((null? A)
         		B)
  			((null? B)
  				A)
        	(else
            ;joining each element of the first list one by one with the other list
         		(cons (car A)
               		(my-append (cdr A) B)
            )
         	)
      )
  )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define append-all
    (lambda (lol)
        (cond
          ;if list is empty return null list
            ((null? lol)
                lol)
            ;if not list return 
            ((not (list? lol))
                lol)
            ((list? (car lol))
                (my-append (append-all (car lol))
                        (append-all (cdr lol))))
            (else
                (cons (car lol)
                      (append-all (cdr lol)))
            )
        )
    )
)
  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (nth lst i)
    (cond
      ((null? lst)
        (error "nth: empty list"))
      ((< i 0)
        ;if index to find is negative
        (error "nth: bad index"))
      ((>= i (my-len lst))
        ;index to find is greater than or equal to length of list
      (error "nth: bad index"))
      (else 
        (if(= i 0)
          (car lst)
          ;if i= zero give the first element of the list
          (nth (cdr lst) (- i 1))
          ;recursion to find i -in the cdr of the list
        )
      ) 
    )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (my-make-list n x)
  ;copy elements of x list n times
  	(if (<= n 0)
      	'()
        ;if n= 0 return empty list 
        ;else copy list n times
      	(cons x (my-make-list (- n 1) x))

    )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (insert x s)
   (cond 
      ((null? s)
      ;if cdr of list is null 
          (list x))
      ((< x (car s)) 
        ;if car of the cdr of the list < car of list -swap it
          (cons x s))
      (else 
        (cons (car s) (insert x (cdr s)))
      )
    )
)

;; augmenting recursion
(define (my-sort lst)
   (if (null? lst) ()
    ;calling the insert function on first element and sorted cdr of the list
       (insert (car lst) (my-sort (cdr lst)))
    )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define my-iota
	(lambda (n)
    ;list containing the numbers 0 to n-1
		(let number ((a 0))
			(if (< a n)
        ;we start from 1 until a is less than n and cons the numbers up
      			(cons a (number(+ a 1)))
      			'()
      )
    )      	
	)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (my-last lst)
  	(cond
  		((equal? (my-len lst) 1)
        ; if there is only 1 element in the list =return the list
				  lst)
  		((null? lst)
        ; empty list
  			 (error "my-last: empty list"))
		  (else
        ;keep getting the cdr of the list until 1 element is left
			   (my-last (cdr lst))
      )
    )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (all-bits n)
  (if (= n 0)
    '(())
    ;take the function and append every combination of the function
    (my-append (helper '0 (all-bits (- n 1)))
            (helper '1 (all-bits (- n 1)))
    )
  )
)

; Yield copy of a with b added on to head of each list in a
(define (helper a b)
  (if (null? b)
      b
      (cons (cons a (car b)) (helper a (cdr b)))
  )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (my-filter pred lst)
  ; if list is empty
  (if (null? lst)
    ; return an empty list
    '()
    ; otherwise, if the predicate is true on the first element
    (if (pred (car lst))
      ; return the first element concatenated with the result of calling filter on the rest of list
      (cons (car lst) (my-filter pred (cdr lst)))
      ; otherwise (if the predicate was false) just return the result of filtering the rest of list
      (my-filter pred (cdr lst)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define double
  (lambda (l)
    (cond ((null? l) '())
          ((not (pair? (car l)))
           (cons (car l)
                 (cons (car l)
                       (double (cdr l)))))
          (else (cons (double (car l))
                      (double (cdr l)))))))



(define double2
  (lambda (l)
    (fold (lambda a rest)
      (if (not (pair? a)) (cons a a rest)
        (cons a rest))
      ()
      l
      )



  )
)    
