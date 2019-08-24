;To built the following implementation of the environment:
;I used set of lists. The procedure apply-env looks at the data structure env representing an environment,
;determines what kind of environment it represents, and does the
;right thing. If it represents the empty environment, then an error is reported.
;If it represents an environment built by extend-env, then it checks to see if
;the variable it is looking for is the same as the one bound in the environment.
;If it is, then the saved value is returned. Otherwise, the variable is looked up
;in the saved environment

; make empty environment
(define (make-empty-env)
  (lambda ()
    (list make-empty-env)
  )
)

;add elements to the empty elements
(define extend-env
  (lambda (v val env)
    (list extend-env v val env)
  )
)

; gives the value of the var of the environment
(define apply-env
  (lambda (env v)
    (cond 
       ((equal? (car env) make-empty-env) 
         (error 'Empty_Environment)
       )

       ((equal? (car env) extend-env)
          (let((store_var (cadr env))
               (store_val (caddr env))
               (store_env (cadddr env)))
            (if (equal? v store_var)
              store_val
              (apply-env store_env v)
            )
          )
       )

      (else 
        (error 'Empty_Environment)
      )
    )
  )
)





