#lang racket

(require csv-reading)


#|Each stability point reduces the Aim Assist cone degredation per shot from 1.0x at 0 stability to 0.47x at 100 stability, rapid and lightweight
 do have noticable benefits due fastest rpm|#

#|Damage fallof for each archetype:
Aggresive - 6.6m
Precision - 7.9m
Lightweight - 7.9m
Rapid - 6.5m
|#

#|OHK depends on archetype
Aggresive frame - 9 pellets to OHK (optimal range 6.5 - 7m)
             Range stat must be at least 60 (idealy 70)
             With full choke 42% <- p <- 62%
             Without full choke 42.6% <- p <- 63.7%
            -POOR-

Precision frame - With full choke  30% <- p <- 46.3%
                  Without full choke 28.9% <- p <- 44.9
                 -Full choke does NOT help that much-

Lightweight frame -  With full choke  66.42% <- p <- 83.97%
                     Without full choke 66.42% <- p <- 83.97%
                    -GOOD-

Full choke is not neccesary
|#


#|
God roll list:
Opening shot
treat detector
surplus
riffled barrel (high handling)
barrel shroud-excellent
cockscrew-excellent
smallbore-excellent
|#

#|Csv reader|#
(define shotgun_specs
  (csv->list
  (make-csv-reader
   (open-input-file "Data/input_example1.csv")
   '((separator-chars            #\,)
     (strip-leading-whitespace?  . #t)
     (strip-trailing-whitespace? . #t)))))


#|list size verification|#
(define (perks-number list)
  (cond
   [(empty? list) 0]
   [else (+ 1 (perks-number (rest list)))]))

#|Population Standard deviation|#
(define (population-standard-deviation trials success)
  
  (define dataset(list trials success))
  
  (define (average dataset)(/ (apply + dataset) (length dataset)))
   
      (define (summation dataset average)
      (cond
        [(null? dataset) 0]
        [else (+(* (- (first dataset) average)(- (first dataset) average))(summation (rest dataset) average))]
        )
        )
  
    (sqrt(/ (summation dataset (average dataset)) (length dataset)))
  
  )

 
#|Sample Standard deviation|#
(define (sample-standard-deviation trials success)
  (define dataset(list trials success))
  
    (define (average dataset)(/ (apply + dataset) (length dataset)))
  
      (define (summation dataset average)
      (cond
        [(null? dataset) 0]
        [else (+(* (- (first dataset) average)(- (first dataset) average))(summation (rest dataset) average))]
        )
        )

      (sqrt(/(summation dataset (average dataset)) (-(length dataset) 1)))


  )



#|F-distribution|#
(define (f-distribution trials success)
  (/ (expt (sample-standard-deviation trials success) 2) (expt(population-standard-deviation trials success) 2))
)  


#|binomial distribution|#
(define (binomial-distribution-floor trials success)
  (expt(+ 1 (/ (- trials (+ success 1))(* success (f-distribution trials success)))) -1)
  )

(define (binomial-distribution-ceiling trials success)
  (expt(+ 1 (/ (- trials (+ success 1))(* (+ 1 success) (f-distribution trials success)))) -1)
  )
  



#|Display of roles|#
(define (roles-display list tier)
   (display `("Shotgun analyzed: " , (first list),
              "\nDesired Roles: ", (rest(rest list)),
              "\nMasterwork: ", (second list),
              "\nShotgun Tier: ", tier ))
 
  )
  
  

(cond
   [( or (< (perks-number (first shotgun_specs)) 6) (> (perks-number (first shotgun_specs)) 6)) (printf "Weapon elements are not correct, kindly correct your csv")]
   
   [else 
    (cond
      #|Lightweight Frame|#
      [(member (first(first shotgun_specs))(list "Without Remorse" "Wastelander M5" "Seventh Seraph CQC-12" "Xenoclast IV" "Riiswalker" "Retrofuturist" "Reckless Endangerment"))
       (cond
         
         [(and (< (* (binomial-distribution-floor 200 160) 100) 90) (member "range" (first shotgun_specs))) (roles-display (first shotgun_specs) "A")]
         [(and (< (* (binomial-distribution-floor 200 160) 100) 90) (member "handling" (first shotgun_specs))) (roles-display (first shotgun_specs) "S")]
         [(and (< (* (binomial-distribution-floor 200 160) 100) 90) (member "surplus" (first shotgun_specs))) (roles-display (first shotgun_specs) "B")]
         [(and (< (* (binomial-distribution-floor 200 160) 100) 90) (member "rifled_barrel" (first shotgun_specs))) (roles-display (first shotgun_specs) "B")]
         [(and (< (* (binomial-distribution-floor 200 160) 100) 90) (member "barrel_shroud" (first shotgun_specs))) (roles-display (first shotgun_specs) "C")]
         [(and (< (* (binomial-distribution-floor 200 160) 100) 90) (member "smallbore" (first shotgun_#lang racket

(require csv-reading)


#|Each stability point reduces the Aim Assist cone degredation per shot from 1.0x at 0 stability to 0.47x at 100 stability, rapid and lightweight
 do have noticable benefits due fastest rpm|#

#|Damage fallof for each archetype:
Aggresive - 6.6m
Precision - 7.9m
Lightweight - 7.9m
Rapid - 6.5m
|#

#|OHK depends on archetype
Aggresive frame - 9 pellets to OHK (optimal range 6.5 - 7m)
             Range stat must be at least 60 (idealy 70)
             With full choke 42% <- p <- 62%
             Without full choke 42.6% <- p <- 63.7%
            -POOR-

Precision frame - With full choke  30% <- p <- 46.3%
                  Without full choke 28.9% <- p <- 44.9
                 -Full choke does NOT help that much-

Lightweight frame -  With full choke  66.42% <- p <- 83.97%
                     Without full choke 66.42% <- p <- 83.97%
                    -GOOD-

Full choke is not neccesary
|#


#|
God roll list:
Opening shot
treat detector
surplus
riffled barrel (high handling)
barrel shroud-excellent
cockscrew-excellent
smallbore-excellent
|#

#|Csv reader|#
(define shotgun_specs
  (csv->list
  (make-csv-reader
   (open-input-file "Data/input_example1.csv")
   '((separator-chars            #\,)
     (strip-leading-whitespace?  . #t)
     (strip-trailing-whitespace? . #t)))))


#|list size verification|#
(define (perks-number list)
  (cond
   [(empty? list) 0]
   [else (+ 1 (perks-number (rest list)))]))

#|Population Standard deviation|#
(define (population-standard-deviation trials success)
  
  (define dataset(list trials success))
  
  (define (average dataset)(/ (apply + dataset) (length dataset)))
   
      (define (summation dataset average)
      (cond
        [(null? dataset) 0]
        [else (+(* (- (first dataset) average)(- (first dataset) average))(summation (rest dataset) average))]
        )
        )
  
    (sqrt(/ (summation dataset (average dataset)) (length dataset)))
  
  )

 
#|Sample Standard deviation|#
(define (sample-standard-deviation trials success)
  (define dataset(list trials success))
  
    (define (average dataset)(/ (apply + dataset) (length dataset)))
  
      (define (summation dataset average)
      (cond
        [(null? dataset) 0]
        [else (+(* (- (first dataset) average)(- (first dataset) average))(summation (rest dataset) average))]
        )
        )

      (sqrt(/(summation dataset (average dataset)) (-(length dataset) 1)))


  )



#|F-distribution|#
(define (f-distribution trials success)
  (/ (expt (sample-standard-deviation trials success) 2) (expt(population-standard-deviation trials success) 2))
)  


#|binomial distribution|#
(define (binomial-distribution-floor trials success)
  (expt(+ 1 (/ (- trials (+ success 1))(* success (f-distribution trials success)))) -1)
  )

(define (binomial-distribution-ceiling trials success)
  (expt(+ 1 (/ (- trials (+ success 1))(* (+ 1 success) (f-distribution trials success)))) -1)
  )
  



#|Display of roles|#
(define (roles-display list tier)
   (display `("Shotgun analyzed: " , (first list),
              "\nDesired Roles: ", (rest(rest list)),
              "\nMasterwork: ", (second list),
              "\nShotgun Tier: ", tier ))
 
  )
  
  

(cond
   [( or (< (perks-number (first shotgun_specs)) 6) (> (perks-number (first shotgun_specs)) 6)) (printf "Weapon elements are not correct, kindly correct your csv")]
   
   [else 
    (cond
      #|Lightweight Frame|#
      [(member (first(first shotgun_specs))(list "Without Remorse" "Wastelander M5" "Seventh Seraph CQC-12" "Xenoclast IV" "Riiswalker" "Retrofuturist" "Reckless Endangerment"))
       (cond
         
         [(and (< (* (binomial-distribution-floor 200 160) 100) 90) (member "range" (first shotgun_specs))) (roles-display (first shotgun_specs) "A")]
         [(and (< (* (binomial-distribution-floor 200 160) 100) 90) (member "handling" (first shotgun_specs))) (roles-display (first shotgun_specs) "S")]
         [(and (< (* (binomial-distribution-floor 200 160) 100) 90) (member "surplus" (first shotgun_specs))) (roles-display (first shotgun_specs) "B")]
         [(and (< (* (binomial-distribution-floor 200 160) 100) 90) (member "rifled_barrel" (first shotgun_specs))) (roles-display (first shotgun_specs) "B")]
         [(and (< (* (binomial-distribution-floor 200 160) 100) 90) (member "barrel_shroud" (first shotgun_specs))) (roles-display (first shotgun_specs) "C")]
         [(and (< (* (binomial-distribution-floor 200 160) 100) 90) (member "smallbore" (first shotgun_specs))) (roles-display (first shotgun_specs) "A")]
         [(< (* (binomial-distribution-floor 200 160) 100) 90) (roles-display (first shotgun_specs) "D")]
        
         
       )
       ]
       
      
        
       
      #|Rapid fire Frame|#
      [(member (first(first shotgun_specs))(list "Dead Weight" "The Deicide" "One Small Step" "IKELOS_SG_v1.0.2" "Wishbringer"))
       (cond
         [(and (< (* (binomial-distribution-floor 200 140) 100) 90) (member "range" (first shotgun_specs))) (roles-display (first shotgun_specs) "A")]
         [(and (< (* (binomial-distribution-floor 200 140) 100) 90) (member "handling" (first shotgun_specs))) (roles-display (first shotgun_specs) "S")]
         [(and (< (* (binomial-distribution-floor 200 140) 100) 90) (member "surplus" (first shotgun_specs))) (roles-display (first shotgun_specs) "S")]
         [(and (< (* (binomial-distribution-floor 200 140) 100) 90) (member "rifled_barrel" (first shotgun_specs))) (roles-display (first shotgun_specs) "B")]
         [(and (< (* (binomial-distribution-floor 200 140) 100) 90) (member "barrel_shroud" (first shotgun_specs))) (roles-display (first shotgun_specs) "C")]
         [(and (< (* (binomial-distribution-floor 200 140) 100) 90) (member "smallbore" (first shotgun_specs))) (roles-display (first shotgun_specs) "A")]
         [(< (* (binomial-distribution-floor 200 160) 100) 90) (roles-display (first shotgun_specs) "D")]

         )
       ]
      
      #|Precision Frame|#
      [(member (first(first shotgun_specs))(list "Matador 64" "Fractethyst" "Sojourner's Tale" "Prophet of Doom" "Retold Tale" "Compass Rose"))
       (cond
         [(and (< (* (binomial-distribution-floor 200 140) 100) 90) (member "range" (first shotgun_specs))) (roles-display (first shotgun_specs) "A")]
         [(and (< (* (binomial-distribution-floor 200 140) 100) 90) (member "handling" (first shotgun_specs))) (roles-display (first shotgun_specs) "S")]
         [(and (< (* (binomial-distribution-floor 200 140) 100) 90) (member "harmony" (first shotgun_specs))) (roles-display (first shotgun_specs) "B")]
         [(and (< (* (binomial-distribution-floor 200 140) 100) 90) (member "Ensemble" (first shotgun_specs))) (roles-display (first shotgun_specs) "C")]
         [(and (< (* (binomial-distribution-floor 200 140) 100) 90) (member "rifled_barrel" (first shotgun_specs))) (roles-display (first shotgun_specs) "B")]
         [(and (< (* (binomial-distribution-floor 200 140) 100) 90) (member "barrel_shroud" (first shotgun_specs))) (roles-display (first shotgun_specs) "C")]
         [(and (< (* (binomial-distribution-floor 200 140) 100) 90) (member "smallbore" (first shotgun_specs))) (roles-display (first shotgun_specs) "A")]
         [(< (* (binomial-distribution-floor 200 160) 100) 90) (roles-display (first shotgun_specs) "D")]
         )
       ]
       
      #|Aggresive Frame|#
      [(member (first(first shotgun_specs))(list "Astral Horizon" "Found Verdict" "A Sudden Death" "Ragnhild-D" "Felwinter's Lie" "Toil and Trouble" "The Comedian"))
       (cond
         [(and (< (* (binomial-distribution-floor 200 10) 100) 90) (member "range" (first shotgun_specs))) (roles-display (first shotgun_specs) "A")]
         [(and (< (* (binomial-distribution-floor 200 140) 100) 90) (member "handling" (first shotgun_specs))) (roles-display (first shotgun_specs) "B")]
         [(and (< (* (binomial-distribution-floor 200 140) 100) 90) (member "opening_shot" (first shotgun_specs))) (roles-display (first shotgun_specs) "B")]
         [(and (< (* (binomial-distribution-floor 200 140) 100) 90) (member "rifled_barrel" (first shotgun_specs))) (roles-display (first shotgun_specs) "B")]
         [(and (< (* (binomial-distribution-floor 200 140) 100) 90) (member "barrel_shroud" (first shotgun_specs))) (roles-display (first shotgun_specs) "C")]
         [(and (< (* (binomial-distribution-floor 200 140) 100) 90) (member "smallbore" (first shotgun_specs))) (roles-display (first shotgun_specs) "A")]
         [(< (* (binomial-distribution-floor 200 160) 100) 90) (roles-display (first shotgun_specs) "D")]

         )
       ]
      
      [else "Incorrect information"]
)
    ]
   )
      
specs))) (roles-display (first shotgun_specs) "A")]
         [(< (* (binomial-distribution-floor 200 160) 100) 90) (roles-display (first shotgun_specs) "D")]
        
         
       )
       ]
       
      
        
       
      #|Rapid fire Frame|#
      [(member (first(first shotgun_specs))(list "Dead Weight" "The Deicide" "One Small Step" "IKELOS_SG_v1.0.2" "Wishbringer"))
       (cond
         [(and (< (* (binomial-distribution-floor 200 140) 100) 90) (member "range" (first shotgun_specs))) (roles-display (first shotgun_specs) "A")]
         [(and (< (* (binomial-distribution-floor 200 140) 100) 90) (member "handling" (first shotgun_specs))) (roles-display (first shotgun_specs) "S")]
         [(and (< (* (binomial-distribution-floor 200 140) 100) 90) (member "surplus" (first shotgun_specs))) (roles-display (first shotgun_specs) "S")]
         [(and (< (* (binomial-distribution-floor 200 140) 100) 90) (member "rifled_barrel" (first shotgun_specs))) (roles-display (first shotgun_specs) "B")]
         [(and (< (* (binomial-distribution-floor 200 140) 100) 90) (member "barrel_shroud" (first shotgun_specs))) (roles-display (first shotgun_specs) "C")]
         [(and (< (* (binomial-distribution-floor 200 140) 100) 90) (member "smallbore" (first shotgun_specs))) (roles-display (first shotgun_specs) "A")]
         [(< (* (binomial-distribution-floor 200 160) 100) 90) (roles-display (first shotgun_specs) "D")]

         )
       ]
      
      #|Precision Frame|#
      [(member (first(first shotgun_specs))(list "Matador 64" "Fractethyst" "Sojourner's Tale" "Prophet of Doom" "Retold Tale" "Compass Rose"))
       (cond
         [(and (< (* (binomial-distribution-floor 200 140) 100) 90) (member "range" (first shotgun_specs))) (roles-display (first shotgun_specs) "A")]
         [(and (< (* (binomial-distribution-floor 200 140) 100) 90) (member "handling" (first shotgun_specs))) (roles-display (first shotgun_specs) "S")]
         [(and (< (* (binomial-distribution-floor 200 140) 100) 90) (member "harmony" (first shotgun_specs))) (roles-display (first shotgun_specs) "B")]
         [(and (< (* (binomial-distribution-floor 200 140) 100) 90) (member "Ensemble" (first shotgun_specs))) (roles-display (first shotgun_specs) "C")]
         [(and (< (* (binomial-distribution-floor 200 140) 100) 90) (member "rifled_barrel" (first shotgun_specs))) (roles-display (first shotgun_specs) "B")]
         [(and (< (* (binomial-distribution-floor 200 140) 100) 90) (member "barrel_shroud" (first shotgun_specs))) (roles-display (first shotgun_specs) "C")]
         [(and (< (* (binomial-distribution-floor 200 140) 100) 90) (member "smallbore" (first shotgun_specs))) (roles-display (first shotgun_specs) "A")]
         [(< (* (binomial-distribution-floor 200 160) 100) 90) (roles-display (first shotgun_specs) "D")]
         )
       ]
       
      #|Aggresive Frame|#
      [(member (first(first shotgun_specs))(list "Astral Horizon" "Found Verdict" "A Sudden Death" "Ragnhild-D" "Felwinter's Lie" "Toil and Trouble" "The Comedian"))
       (cond
         [(and (< (* (binomial-distribution-floor 200 10) 100) 90) (member "range" (first shotgun_specs))) (roles-display (first shotgun_specs) "A")]
         [(and (< (* (binomial-distribution-floor 200 140) 100) 90) (member "handling" (first shotgun_specs))) (roles-display (first shotgun_specs) "B")]
         [(and (< (* (binomial-distribution-floor 200 140) 100) 90) (member "opening_shot" (first shotgun_specs))) (roles-display (first shotgun_specs) "B")]
         [(and (< (* (binomial-distribution-floor 200 140) 100) 90) (member "rifled_barrel" (first shotgun_specs))) (roles-display (first shotgun_specs) "B")]
         [(and (< (* (binomial-distribution-floor 200 140) 100) 90) (member "barrel_shroud" (first shotgun_specs))) (roles-display (first shotgun_specs) "C")]
         [(and (< (* (binomial-distribution-floor 200 140) 100) 90) (member "smallbore" (first shotgun_specs))) (roles-display (first shotgun_specs) "A")]
         [(< (* (binomial-distribution-floor 200 160) 100) 90) (roles-display (first shotgun_specs) "D")]

         )
       ]
      
      [else "Incorrect information"]
)
    ]
   )
      
