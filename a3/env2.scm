;Procedural Representation
;This approach of the environment implementation makes use of 
;lambda functions or closures which is a functions plus an environment 
;that stores the value of x.

;creates new environement
(define empty-env
  (lambda ()
    (lambda (search-var)
      (error 'Empty_Environment)
    )
  )
)

;add new variables to the environment 
(define extend-env
  (lambda (v val env)
    (lambda (search-var)
      (if (equal? search-var v)
        val
        (apply-env env search-var)
      )
    )
  )
)

;returns the value of the desired variable
(define apply-env
  (lambda (env v)
    (env v)
  )
)

; (define test-env
;     (extend-env 'a 1
;         (extend-env 'b 2
;             (extend-env 'c 3
;                 (extend-env 'b 4
;                     (make-empty-env)))))
; )






