# Shotgun analyzer for Destiny 2
Alejandro Perez Gonzalez A01746643
## Purpose
The purpose of this project is to write a program to analyze the fundamentals of shotguns in the videogame Destiny 2, since there is a lot of factors that could change the playstyle in the game, like, pellet spread based on random generated numbers (RNG), in game modifiers, intrinsic traits, or weapon arquetype. This is meant to be used by the user given an input data with the specified shotgun, roles, modifiers so it can be compared with another to determine which one of the shotguns is statistically better.
The programming language for this activity will be Racket
<img src="https://i0.wp.com/hipertextual.com/wp-content/uploads/2017/07/destiny-2-art.jpg?fit=1900%2C1068&ssl=1" />

## Metodology 
Every time you fire a shot, the spread is random, so we have to determine a level of confidence in our conclusions. We have to follow some standard procedure in order to get the correct results; for instance, making different test sets with different shotguns at 7m will give us a pattern of results based on success or failure.
For this testing model, a **Binomial Probability Distribution** model will be implemented, with the **Clopper-Pearson Exact Method**.
To understand this better, lets say we made 10 shotgun tests trying to do a 1 hit kill with a Found Veredict (Timelost) at 7m, for that test we succesfully made 6 shots, but we are not sure if the next time we make the same test we will get the same results, this is why the larger the data, the better, but since there is no time to to 10,000 tests, the Clopper-Pearson statistic method will help us, for example, we are confident that the next time we do 10 test the probability of getting another successful shot is between 6/10 and 3/10. With a CLopper-Pearson , binomial probability distribution and 20 tests, we could guarantee to get a successful shot between 3 and 9 times, That's why it is important to do more than 20 tests, to narrow that interval, so a sweet spot for our data will be between 100-200 tests for every shotgun roll at every range (e.g. With 95% confidence, the next time we do a test, the result will be between 45% -65% of the time).
<img src="https://i.ytimg.com/vi/cndCctsgzRA/maxresdefault.jpg" />

## Scope
This project is intended to use the tools learned in class.
* Functional Programming: Since this programming paradigm is often used for mathematical procedures, this is the perfect language to implement statistical functions 
* Recursion: This will be used in order to compute statistic formulas and list verification (e.g. iterate in all the elements of the list in order to determine if the input data is corrrect), also it will be used in order to compute list summations since we have to calculate the Standard Deviation, [as mentioned in here ](https://www.calculator.net/standard-deviation-calculator.html?numberinputs=200%2C160&ctype=s&x=88&y=31)
* Lists: This will be used for data storage and also iteration of data sets
* File I/O: Format input is going to be implemented as a form with the desirable weapon so the code could read it and do the necessary calculations, this will be implemented via a csv file, similar to the images previously, indicating the shotgun name, the 4 desirable perks and  the selected masterwork, (for a better comprehension, please see the following and interactive example,https://d2gunsmith.com/w/631439337 )

## How to use it
To use this project you have to download the [Racket interpreter](https://download.racket-lang.org/) and install the csv-reading package listed below
## External sources
[F-distribution](https://stattrek.com/probability-distributions/f-distribution)
[CSV reader](https://docs.racket-lang.org/csv-reading/index.html)
Clopper, C. and Pearson, E.S. (1934). The use of confidence or fiducial limits illustrated in the case of the binomial. Biometrika, 26, pp. 404-413.
