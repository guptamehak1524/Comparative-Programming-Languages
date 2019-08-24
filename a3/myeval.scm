
; using one of the implemented environments to use in myeval
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


;MYEVAL

(define myeval
    (lambda (expr env) 
        (cond 
          ((number? expr)
                expr
          )
          ((symbol? expr)
                (apply-env env expr)
          )

          ((list? expr)
              (let ((left (car expr))
                    (op (car (cdr expr)))
                   )

                (cond
                  ((equal? op '+) (+ (myeval left env) (myeval (caddr expr) env)))
                  ((equal? op '-) (- (myeval left env) (myeval (caddr expr) env)))
                  ((equal? op '*) (* (myeval left env) (myeval (caddr expr) env)))
                  ((equal? op '**) (expt (myeval left env) (myeval (caddr expr) env)))
                  ((equal? left 'inc) (+ (myeval op env) 1))
                  ((equal? left 'dec) (- (myeval op env) 1))
                  ((equal? op '/) 
                    (if (equal? (caddr expr) 0) 
                            (error ("Divison by 0 not allowed"))
                         (/ (myeval left env) (myeval (caddr expr) env))))
                  (error "apply-env: Unknown Variable")
                )
             )
          )
          
          (else
            (error "apply-env: Unknown Variable")
          )
        )
    )
)

; (define test
;     (extend-env 'a -1
;         (extend-env 'b -1
;             (extend-env 'c 3
;                 (extend-env 'd 7
;                     (extend-env 'e 8
;                         (extend-env 'f 9
;                             (make-empty-env))))))))




