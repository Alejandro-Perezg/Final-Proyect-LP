#|
Shotgun analyzer
Alejandro Perez Gonzalez
|#
(require csv-reading)


(define make-shotgun-reader
  (make-csv-reader-maker
   '((strip-leading-whitespace?  . #t)
     (strip-trailing-whitespace? . #t))))
     
(define next-row
  (make-food-csv-reader (open-input-file "shotgun.csv")))

#lang racket/base
(lightweigt "Without Remorse" "Wastelander M5" "Seventh Seraph CQC-12" "Xenoclast IV" "Riiswalker" " Retrofuturist" "Reckless Endangerment")
(rapid "Without Remorse" " Dead Weight" " The Deicide" " One Small Step" " IKELOS_SG_v1.0.2" "Wishbringer")
(precisions "Matador 64" "Fractethyst" "Sojourner's Tale" "Prophet of Doom" "Retold Tale" " Compass Rose")
(aggresives  "Astral Horizon" "Found Verdict" "A Sudden Death" "Ragnhild-D" "Felwinter's Lie" "Toil and Trouble" "The Comedian")

(define (binomialProbability frame)
  (cond
  [(= lightweigt frame )  '(+ 1 (/ (- n (+ x 1)) ())  ]
  [(= rapid frame )  '(+ 1 (/ (- n (+ x 1)) ())  ]
  [(= precisions frame )  '(+ 1 (/ (- n (+ x 1)) ())  ]
  [(= aggresives frame )  '(+ 1 (/ (- n (+ x 1)) ())  ]
  )
  
)
