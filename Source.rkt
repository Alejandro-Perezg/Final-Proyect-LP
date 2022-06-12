#|
Shotgun analyzer
Alejandro Perez Gonzalez
|#
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

(define make-example-csv-reader
  (make-csv-reader-maker
   '((separator-chars #\,))))

(define next-row
  (make-example-csv-reader (open-input-file "Data/input_example1.csv")))

(define (preview-csv filename [rows 6])
  (define next-row
    (make-example-csv-reader (open-input-file filename)))
  (define (iterate iter [result '()])
    (define nr (next-row))
    (if (or (< iter 1) (empty? nr))
        (reverse result)
        (iterate (- iter 1) (cons nr result))))
  (iterate rows))



cdr(first (list(next-row)))
(next-row)







  
#|

(cond
  #|Lightweight Frame|#
    [(member (first shotgun_specs)(list "Without Remorse" "Wastelander M5" "Seventh Seraph CQC-12" "Xenoclast IV" "Riiswalker" "Retrofuturist" "Reckless Endangerment"))

      ]
     #|Rapid fire Frame|#
    [(member (first shotgun_specs)(list "Dead Weight" "The Deicide" "One Small Step" "IKELOS_SG_v1.0.2" "Wishbringer"))


     
     ]
    #|Precision Frame|#
    [(member (first shotgun_specs)(list "Matador 64" "Fractethyst" "Sojourner's Tale" "Prophet of Doom" "Retold Tale" "Compass Rose"))


     ]
    #|Aggresive Frame|#
    [(member (first shotgun_specs)(list "Astral Horizon" "Found Verdict" "A Sudden Death" "Ragnhild-D" "Felwinter's Lie" "Toil and Trouble" "The Comedian"))



     ]
    [else "Incorrect information"]


  )

|#
