For loops and Monte Carlo simulations: using data from 'Teaching & Learning About Displacement in a Chicago Neighborhood High School'
================

Teaching for loops using gentrification as a context
----------------------------------------------------

I had the good fortune to attend Dr. Eric Gutstein's presentation titled, "Teaching & Learning About Displacement in a Chicago Neighborhood High School", at the "Creating Balance" conference in San Francisco, CA. The premise seemed simple enough, to model the total amount paid on a 30 year fixed rate mortgage. While he had students use graphing calculators, I saw this as a good opportunity to teach students about the utility of loops in R. This will make way more sense if you read this first: <https://www.rethinkingschools.org/articles/whose-community-is-this-mathematics-of-neighborhood-displacement>

30 year fixed rate mortgage
---------------------------

Dr. Gutstein first had students conside a specific case, that of a $150,000 home. With a thirty year fixed mortgage and a 6% annual rate, the monthly payment is $899.93. So let's define some variables. Note that the monthly rate is 6% /12 months, or 0.5% / month. I defined the principal as 'loanamt', for reasons that will hopefully make sense later.

``` r
# 6 percent annual is %.05 monthly!

InterestRate = 0.005  # 5% interest
loanamt = 150000
```

Model over 1 year
-----------------

Now let's see how the loan amount increases over 1 year:

``` r
loanamt = 150000
for(month in 1:12) {
  print(month)
  print("Old loanamt:")
  print(loanamt)
  loanamt = loanamt * (1 + InterestRate)  # Same command as above.  
  print("New loanamt:")
  print(loanamt)
}
```

    ## [1] 1
    ## [1] "Old loanamt:"
    ## [1] 150000
    ## [1] "New loanamt:"
    ## [1] 150750
    ## [1] 2
    ## [1] "Old loanamt:"
    ## [1] 150750
    ## [1] "New loanamt:"
    ## [1] 151503.7
    ## [1] 3
    ## [1] "Old loanamt:"
    ## [1] 151503.7
    ## [1] "New loanamt:"
    ## [1] 152261.3
    ## [1] 4
    ## [1] "Old loanamt:"
    ## [1] 152261.3
    ## [1] "New loanamt:"
    ## [1] 153022.6
    ## [1] 5
    ## [1] "Old loanamt:"
    ## [1] 153022.6
    ## [1] "New loanamt:"
    ## [1] 153787.7
    ## [1] 6
    ## [1] "Old loanamt:"
    ## [1] 153787.7
    ## [1] "New loanamt:"
    ## [1] 154556.6
    ## [1] 7
    ## [1] "Old loanamt:"
    ## [1] 154556.6
    ## [1] "New loanamt:"
    ## [1] 155329.4
    ## [1] 8
    ## [1] "Old loanamt:"
    ## [1] 155329.4
    ## [1] "New loanamt:"
    ## [1] 156106.1
    ## [1] 9
    ## [1] "Old loanamt:"
    ## [1] 156106.1
    ## [1] "New loanamt:"
    ## [1] 156886.6
    ## [1] 10
    ## [1] "Old loanamt:"
    ## [1] 156886.6
    ## [1] "New loanamt:"
    ## [1] 157671
    ## [1] 11
    ## [1] "Old loanamt:"
    ## [1] 157671
    ## [1] "New loanamt:"
    ## [1] 158459.4
    ## [1] 12
    ## [1] "Old loanamt:"
    ## [1] 158459.4
    ## [1] "New loanamt:"
    ## [1] 159251.7

What about the payments?!
-------------------------

I don't own a home but apparently mortgage payments are a thing. Gutstein had his students use the HUD "hardship" guidelines (30 percent of income) to determine a mortgage payment to deduct. The median income in Lawndale was $32,317 a year, resulting in a $807.92 allotment for housing. This gets reflected in the formula below:

``` r
loanamt = 150000
for(month in 1:12) {
  print(month)
  print("Old loanamt:")
  print(loanamt)
  loanamt = (loanamt-807.92) * (1 + InterestRate)  # Same command as above.  
  print("New loanamt:")
  print(loanamt)
}
```

    ## [1] 1
    ## [1] "Old loanamt:"
    ## [1] 150000
    ## [1] "New loanamt:"
    ## [1] 149938
    ## [1] 2
    ## [1] "Old loanamt:"
    ## [1] 149938
    ## [1] "New loanamt:"
    ## [1] 149875.8
    ## [1] 3
    ## [1] "Old loanamt:"
    ## [1] 149875.8
    ## [1] "New loanamt:"
    ## [1] 149813.2
    ## [1] 4
    ## [1] "Old loanamt:"
    ## [1] 149813.2
    ## [1] "New loanamt:"
    ## [1] 149750.3
    ## [1] 5
    ## [1] "Old loanamt:"
    ## [1] 149750.3
    ## [1] "New loanamt:"
    ## [1] 149687.1
    ## [1] 6
    ## [1] "Old loanamt:"
    ## [1] 149687.1
    ## [1] "New loanamt:"
    ## [1] 149623.6
    ## [1] 7
    ## [1] "Old loanamt:"
    ## [1] 149623.6
    ## [1] "New loanamt:"
    ## [1] 149559.7
    ## [1] 8
    ## [1] "Old loanamt:"
    ## [1] 149559.7
    ## [1] "New loanamt:"
    ## [1] 149495.6
    ## [1] 9
    ## [1] "Old loanamt:"
    ## [1] 149495.6
    ## [1] "New loanamt:"
    ## [1] 149431.1
    ## [1] 10
    ## [1] "Old loanamt:"
    ## [1] 149431.1
    ## [1] "New loanamt:"
    ## [1] 149366.3
    ## [1] 11
    ## [1] "Old loanamt:"
    ## [1] 149366.3
    ## [1] "New loanamt:"
    ## [1] 149301.1
    ## [1] 12
    ## [1] "Old loanamt:"
    ## [1] 149301.1
    ## [1] "New loanamt:"
    ## [1] 149235.7

Now we can see what happens after 30 years...
---------------------------------------------

30 years times 12 months= 360 months:

``` r
loanamt = 150000
for(month in 1:360) {
  print(month)
  print("Old loanamt:")
  print(loanamt)
  loanamt = (loanamt-807.92) * (1 + InterestRate)  # Same command as above.  
  print("New loanamt:")
  print(loanamt)
}
```

    ## [1] 1
    ## [1] "Old loanamt:"
    ## [1] 150000
    ## [1] "New loanamt:"
    ## [1] 149938
    ## [1] 2
    ## [1] "Old loanamt:"
    ## [1] 149938
    ## [1] "New loanamt:"
    ## [1] 149875.8
    ## [1] 3
    ## [1] "Old loanamt:"
    ## [1] 149875.8
    ## [1] "New loanamt:"
    ## [1] 149813.2
    ## [1] 4
    ## [1] "Old loanamt:"
    ## [1] 149813.2
    ## [1] "New loanamt:"
    ## [1] 149750.3
    ## [1] 5
    ## [1] "Old loanamt:"
    ## [1] 149750.3
    ## [1] "New loanamt:"
    ## [1] 149687.1
    ## [1] 6
    ## [1] "Old loanamt:"
    ## [1] 149687.1
    ## [1] "New loanamt:"
    ## [1] 149623.6
    ## [1] 7
    ## [1] "Old loanamt:"
    ## [1] 149623.6
    ## [1] "New loanamt:"
    ## [1] 149559.7
    ## [1] 8
    ## [1] "Old loanamt:"
    ## [1] 149559.7
    ## [1] "New loanamt:"
    ## [1] 149495.6
    ## [1] 9
    ## [1] "Old loanamt:"
    ## [1] 149495.6
    ## [1] "New loanamt:"
    ## [1] 149431.1
    ## [1] 10
    ## [1] "Old loanamt:"
    ## [1] 149431.1
    ## [1] "New loanamt:"
    ## [1] 149366.3
    ## [1] 11
    ## [1] "Old loanamt:"
    ## [1] 149366.3
    ## [1] "New loanamt:"
    ## [1] 149301.1
    ## [1] 12
    ## [1] "Old loanamt:"
    ## [1] 149301.1
    ## [1] "New loanamt:"
    ## [1] 149235.7
    ## [1] 13
    ## [1] "Old loanamt:"
    ## [1] 149235.7
    ## [1] "New loanamt:"
    ## [1] 149169.9
    ## [1] 14
    ## [1] "Old loanamt:"
    ## [1] 149169.9
    ## [1] "New loanamt:"
    ## [1] 149103.8
    ## [1] 15
    ## [1] "Old loanamt:"
    ## [1] 149103.8
    ## [1] "New loanamt:"
    ## [1] 149037.4
    ## [1] 16
    ## [1] "Old loanamt:"
    ## [1] 149037.4
    ## [1] "New loanamt:"
    ## [1] 148970.6
    ## [1] 17
    ## [1] "Old loanamt:"
    ## [1] 148970.6
    ## [1] "New loanamt:"
    ## [1] 148903.5
    ## [1] 18
    ## [1] "Old loanamt:"
    ## [1] 148903.5
    ## [1] "New loanamt:"
    ## [1] 148836
    ## [1] 19
    ## [1] "Old loanamt:"
    ## [1] 148836
    ## [1] "New loanamt:"
    ## [1] 148768.3
    ## [1] 20
    ## [1] "Old loanamt:"
    ## [1] 148768.3
    ## [1] "New loanamt:"
    ## [1] 148700.1
    ## [1] 21
    ## [1] "Old loanamt:"
    ## [1] 148700.1
    ## [1] "New loanamt:"
    ## [1] 148631.7
    ## [1] 22
    ## [1] "Old loanamt:"
    ## [1] 148631.7
    ## [1] "New loanamt:"
    ## [1] 148562.9
    ## [1] 23
    ## [1] "Old loanamt:"
    ## [1] 148562.9
    ## [1] "New loanamt:"
    ## [1] 148493.7
    ## [1] 24
    ## [1] "Old loanamt:"
    ## [1] 148493.7
    ## [1] "New loanamt:"
    ## [1] 148424.2
    ## [1] 25
    ## [1] "Old loanamt:"
    ## [1] 148424.2
    ## [1] "New loanamt:"
    ## [1] 148354.4
    ## [1] 26
    ## [1] "Old loanamt:"
    ## [1] 148354.4
    ## [1] "New loanamt:"
    ## [1] 148284.2
    ## [1] 27
    ## [1] "Old loanamt:"
    ## [1] 148284.2
    ## [1] "New loanamt:"
    ## [1] 148213.7
    ## [1] 28
    ## [1] "Old loanamt:"
    ## [1] 148213.7
    ## [1] "New loanamt:"
    ## [1] 148142.8
    ## [1] 29
    ## [1] "Old loanamt:"
    ## [1] 148142.8
    ## [1] "New loanamt:"
    ## [1] 148071.5
    ## [1] 30
    ## [1] "Old loanamt:"
    ## [1] 148071.5
    ## [1] "New loanamt:"
    ## [1] 147999.9
    ## [1] 31
    ## [1] "Old loanamt:"
    ## [1] 147999.9
    ## [1] "New loanamt:"
    ## [1] 147928
    ## [1] 32
    ## [1] "Old loanamt:"
    ## [1] 147928
    ## [1] "New loanamt:"
    ## [1] 147855.7
    ## [1] 33
    ## [1] "Old loanamt:"
    ## [1] 147855.7
    ## [1] "New loanamt:"
    ## [1] 147783
    ## [1] 34
    ## [1] "Old loanamt:"
    ## [1] 147783
    ## [1] "New loanamt:"
    ## [1] 147709.9
    ## [1] 35
    ## [1] "Old loanamt:"
    ## [1] 147709.9
    ## [1] "New loanamt:"
    ## [1] 147636.5
    ## [1] 36
    ## [1] "Old loanamt:"
    ## [1] 147636.5
    ## [1] "New loanamt:"
    ## [1] 147562.8
    ## [1] 37
    ## [1] "Old loanamt:"
    ## [1] 147562.8
    ## [1] "New loanamt:"
    ## [1] 147488.6
    ## [1] 38
    ## [1] "Old loanamt:"
    ## [1] 147488.6
    ## [1] "New loanamt:"
    ## [1] 147414.1
    ## [1] 39
    ## [1] "Old loanamt:"
    ## [1] 147414.1
    ## [1] "New loanamt:"
    ## [1] 147339.2
    ## [1] 40
    ## [1] "Old loanamt:"
    ## [1] 147339.2
    ## [1] "New loanamt:"
    ## [1] 147263.9
    ## [1] 41
    ## [1] "Old loanamt:"
    ## [1] 147263.9
    ## [1] "New loanamt:"
    ## [1] 147188.3
    ## [1] 42
    ## [1] "Old loanamt:"
    ## [1] 147188.3
    ## [1] "New loanamt:"
    ## [1] 147112.3
    ## [1] 43
    ## [1] "Old loanamt:"
    ## [1] 147112.3
    ## [1] "New loanamt:"
    ## [1] 147035.9
    ## [1] 44
    ## [1] "Old loanamt:"
    ## [1] 147035.9
    ## [1] "New loanamt:"
    ## [1] 146959.1
    ## [1] 45
    ## [1] "Old loanamt:"
    ## [1] 146959.1
    ## [1] "New loanamt:"
    ## [1] 146881.9
    ## [1] 46
    ## [1] "Old loanamt:"
    ## [1] 146881.9
    ## [1] "New loanamt:"
    ## [1] 146804.4
    ## [1] 47
    ## [1] "Old loanamt:"
    ## [1] 146804.4
    ## [1] "New loanamt:"
    ## [1] 146726.4
    ## [1] 48
    ## [1] "Old loanamt:"
    ## [1] 146726.4
    ## [1] "New loanamt:"
    ## [1] 146648.1
    ## [1] 49
    ## [1] "Old loanamt:"
    ## [1] 146648.1
    ## [1] "New loanamt:"
    ## [1] 146569.4
    ## [1] 50
    ## [1] "Old loanamt:"
    ## [1] 146569.4
    ## [1] "New loanamt:"
    ## [1] 146490.3
    ## [1] 51
    ## [1] "Old loanamt:"
    ## [1] 146490.3
    ## [1] "New loanamt:"
    ## [1] 146410.8
    ## [1] 52
    ## [1] "Old loanamt:"
    ## [1] 146410.8
    ## [1] "New loanamt:"
    ## [1] 146330.9
    ## [1] 53
    ## [1] "Old loanamt:"
    ## [1] 146330.9
    ## [1] "New loanamt:"
    ## [1] 146250.6
    ## [1] 54
    ## [1] "Old loanamt:"
    ## [1] 146250.6
    ## [1] "New loanamt:"
    ## [1] 146169.9
    ## [1] 55
    ## [1] "Old loanamt:"
    ## [1] 146169.9
    ## [1] "New loanamt:"
    ## [1] 146088.8
    ## [1] 56
    ## [1] "Old loanamt:"
    ## [1] 146088.8
    ## [1] "New loanamt:"
    ## [1] 146007.2
    ## [1] 57
    ## [1] "Old loanamt:"
    ## [1] 146007.2
    ## [1] "New loanamt:"
    ## [1] 145925.3
    ## [1] 58
    ## [1] "Old loanamt:"
    ## [1] 145925.3
    ## [1] "New loanamt:"
    ## [1] 145843
    ## [1] 59
    ## [1] "Old loanamt:"
    ## [1] 145843
    ## [1] "New loanamt:"
    ## [1] 145760.2
    ## [1] 60
    ## [1] "Old loanamt:"
    ## [1] 145760.2
    ## [1] "New loanamt:"
    ## [1] 145677.1
    ## [1] 61
    ## [1] "Old loanamt:"
    ## [1] 145677.1
    ## [1] "New loanamt:"
    ## [1] 145593.5
    ## [1] 62
    ## [1] "Old loanamt:"
    ## [1] 145593.5
    ## [1] "New loanamt:"
    ## [1] 145509.5
    ## [1] 63
    ## [1] "Old loanamt:"
    ## [1] 145509.5
    ## [1] "New loanamt:"
    ## [1] 145425.1
    ## [1] 64
    ## [1] "Old loanamt:"
    ## [1] 145425.1
    ## [1] "New loanamt:"
    ## [1] 145340.3
    ## [1] 65
    ## [1] "Old loanamt:"
    ## [1] 145340.3
    ## [1] "New loanamt:"
    ## [1] 145255
    ## [1] 66
    ## [1] "Old loanamt:"
    ## [1] 145255
    ## [1] "New loanamt:"
    ## [1] 145169.3
    ## [1] 67
    ## [1] "Old loanamt:"
    ## [1] 145169.3
    ## [1] "New loanamt:"
    ## [1] 145083.2
    ## [1] 68
    ## [1] "Old loanamt:"
    ## [1] 145083.2
    ## [1] "New loanamt:"
    ## [1] 144996.7
    ## [1] 69
    ## [1] "Old loanamt:"
    ## [1] 144996.7
    ## [1] "New loanamt:"
    ## [1] 144909.7
    ## [1] 70
    ## [1] "Old loanamt:"
    ## [1] 144909.7
    ## [1] "New loanamt:"
    ## [1] 144822.3
    ## [1] 71
    ## [1] "Old loanamt:"
    ## [1] 144822.3
    ## [1] "New loanamt:"
    ## [1] 144734.4
    ## [1] 72
    ## [1] "Old loanamt:"
    ## [1] 144734.4
    ## [1] "New loanamt:"
    ## [1] 144646.1
    ## [1] 73
    ## [1] "Old loanamt:"
    ## [1] 144646.1
    ## [1] "New loanamt:"
    ## [1] 144557.4
    ## [1] 74
    ## [1] "Old loanamt:"
    ## [1] 144557.4
    ## [1] "New loanamt:"
    ## [1] 144468.2
    ## [1] 75
    ## [1] "Old loanamt:"
    ## [1] 144468.2
    ## [1] "New loanamt:"
    ## [1] 144378.6
    ## [1] 76
    ## [1] "Old loanamt:"
    ## [1] 144378.6
    ## [1] "New loanamt:"
    ## [1] 144288.6
    ## [1] 77
    ## [1] "Old loanamt:"
    ## [1] 144288.6
    ## [1] "New loanamt:"
    ## [1] 144198
    ## [1] 78
    ## [1] "Old loanamt:"
    ## [1] 144198
    ## [1] "New loanamt:"
    ## [1] 144107.1
    ## [1] 79
    ## [1] "Old loanamt:"
    ## [1] 144107.1
    ## [1] "New loanamt:"
    ## [1] 144015.6
    ## [1] 80
    ## [1] "Old loanamt:"
    ## [1] 144015.6
    ## [1] "New loanamt:"
    ## [1] 143923.8
    ## [1] 81
    ## [1] "Old loanamt:"
    ## [1] 143923.8
    ## [1] "New loanamt:"
    ## [1] 143831.4
    ## [1] 82
    ## [1] "Old loanamt:"
    ## [1] 143831.4
    ## [1] "New loanamt:"
    ## [1] 143738.6
    ## [1] 83
    ## [1] "Old loanamt:"
    ## [1] 143738.6
    ## [1] "New loanamt:"
    ## [1] 143645.4
    ## [1] 84
    ## [1] "Old loanamt:"
    ## [1] 143645.4
    ## [1] "New loanamt:"
    ## [1] 143551.6
    ## [1] 85
    ## [1] "Old loanamt:"
    ## [1] 143551.6
    ## [1] "New loanamt:"
    ## [1] 143457.4
    ## [1] 86
    ## [1] "Old loanamt:"
    ## [1] 143457.4
    ## [1] "New loanamt:"
    ## [1] 143362.7
    ## [1] 87
    ## [1] "Old loanamt:"
    ## [1] 143362.7
    ## [1] "New loanamt:"
    ## [1] 143267.6
    ## [1] 88
    ## [1] "Old loanamt:"
    ## [1] 143267.6
    ## [1] "New loanamt:"
    ## [1] 143172
    ## [1] 89
    ## [1] "Old loanamt:"
    ## [1] 143172
    ## [1] "New loanamt:"
    ## [1] 143075.9
    ## [1] 90
    ## [1] "Old loanamt:"
    ## [1] 143075.9
    ## [1] "New loanamt:"
    ## [1] 142979.3
    ## [1] 91
    ## [1] "Old loanamt:"
    ## [1] 142979.3
    ## [1] "New loanamt:"
    ## [1] 142882.2
    ## [1] 92
    ## [1] "Old loanamt:"
    ## [1] 142882.2
    ## [1] "New loanamt:"
    ## [1] 142784.7
    ## [1] 93
    ## [1] "Old loanamt:"
    ## [1] 142784.7
    ## [1] "New loanamt:"
    ## [1] 142686.7
    ## [1] 94
    ## [1] "Old loanamt:"
    ## [1] 142686.7
    ## [1] "New loanamt:"
    ## [1] 142588.1
    ## [1] 95
    ## [1] "Old loanamt:"
    ## [1] 142588.1
    ## [1] "New loanamt:"
    ## [1] 142489.1
    ## [1] 96
    ## [1] "Old loanamt:"
    ## [1] 142489.1
    ## [1] "New loanamt:"
    ## [1] 142389.6
    ## [1] 97
    ## [1] "Old loanamt:"
    ## [1] 142389.6
    ## [1] "New loanamt:"
    ## [1] 142289.6
    ## [1] 98
    ## [1] "Old loanamt:"
    ## [1] 142289.6
    ## [1] "New loanamt:"
    ## [1] 142189.1
    ## [1] 99
    ## [1] "Old loanamt:"
    ## [1] 142189.1
    ## [1] "New loanamt:"
    ## [1] 142088.1
    ## [1] 100
    ## [1] "Old loanamt:"
    ## [1] 142088.1
    ## [1] "New loanamt:"
    ## [1] 141986.5
    ## [1] 101
    ## [1] "Old loanamt:"
    ## [1] 141986.5
    ## [1] "New loanamt:"
    ## [1] 141884.5
    ## [1] 102
    ## [1] "Old loanamt:"
    ## [1] 141884.5
    ## [1] "New loanamt:"
    ## [1] 141782
    ## [1] 103
    ## [1] "Old loanamt:"
    ## [1] 141782
    ## [1] "New loanamt:"
    ## [1] 141678.9
    ## [1] 104
    ## [1] "Old loanamt:"
    ## [1] 141678.9
    ## [1] "New loanamt:"
    ## [1] 141575.4
    ## [1] 105
    ## [1] "Old loanamt:"
    ## [1] 141575.4
    ## [1] "New loanamt:"
    ## [1] 141471.3
    ## [1] 106
    ## [1] "Old loanamt:"
    ## [1] 141471.3
    ## [1] "New loanamt:"
    ## [1] 141366.7
    ## [1] 107
    ## [1] "Old loanamt:"
    ## [1] 141366.7
    ## [1] "New loanamt:"
    ## [1] 141261.5
    ## [1] 108
    ## [1] "Old loanamt:"
    ## [1] 141261.5
    ## [1] "New loanamt:"
    ## [1] 141155.9
    ## [1] 109
    ## [1] "Old loanamt:"
    ## [1] 141155.9
    ## [1] "New loanamt:"
    ## [1] 141049.7
    ## [1] 110
    ## [1] "Old loanamt:"
    ## [1] 141049.7
    ## [1] "New loanamt:"
    ## [1] 140943
    ## [1] 111
    ## [1] "Old loanamt:"
    ## [1] 140943
    ## [1] "New loanamt:"
    ## [1] 140835.8
    ## [1] 112
    ## [1] "Old loanamt:"
    ## [1] 140835.8
    ## [1] "New loanamt:"
    ## [1] 140728
    ## [1] 113
    ## [1] "Old loanamt:"
    ## [1] 140728
    ## [1] "New loanamt:"
    ## [1] 140619.7
    ## [1] 114
    ## [1] "Old loanamt:"
    ## [1] 140619.7
    ## [1] "New loanamt:"
    ## [1] 140510.8
    ## [1] 115
    ## [1] "Old loanamt:"
    ## [1] 140510.8
    ## [1] "New loanamt:"
    ## [1] 140401.4
    ## [1] 116
    ## [1] "Old loanamt:"
    ## [1] 140401.4
    ## [1] "New loanamt:"
    ## [1] 140291.4
    ## [1] 117
    ## [1] "Old loanamt:"
    ## [1] 140291.4
    ## [1] "New loanamt:"
    ## [1] 140180.9
    ## [1] 118
    ## [1] "Old loanamt:"
    ## [1] 140180.9
    ## [1] "New loanamt:"
    ## [1] 140069.9
    ## [1] 119
    ## [1] "Old loanamt:"
    ## [1] 140069.9
    ## [1] "New loanamt:"
    ## [1] 139958.3
    ## [1] 120
    ## [1] "Old loanamt:"
    ## [1] 139958.3
    ## [1] "New loanamt:"
    ## [1] 139846.1
    ## [1] 121
    ## [1] "Old loanamt:"
    ## [1] 139846.1
    ## [1] "New loanamt:"
    ## [1] 139733.4
    ## [1] 122
    ## [1] "Old loanamt:"
    ## [1] 139733.4
    ## [1] "New loanamt:"
    ## [1] 139620.1
    ## [1] 123
    ## [1] "Old loanamt:"
    ## [1] 139620.1
    ## [1] "New loanamt:"
    ## [1] 139506.2
    ## [1] 124
    ## [1] "Old loanamt:"
    ## [1] 139506.2
    ## [1] "New loanamt:"
    ## [1] 139391.8
    ## [1] 125
    ## [1] "Old loanamt:"
    ## [1] 139391.8
    ## [1] "New loanamt:"
    ## [1] 139276.8
    ## [1] 126
    ## [1] "Old loanamt:"
    ## [1] 139276.8
    ## [1] "New loanamt:"
    ## [1] 139161.2
    ## [1] 127
    ## [1] "Old loanamt:"
    ## [1] 139161.2
    ## [1] "New loanamt:"
    ## [1] 139045.1
    ## [1] 128
    ## [1] "Old loanamt:"
    ## [1] 139045.1
    ## [1] "New loanamt:"
    ## [1] 138928.3
    ## [1] 129
    ## [1] "Old loanamt:"
    ## [1] 138928.3
    ## [1] "New loanamt:"
    ## [1] 138811
    ## [1] 130
    ## [1] "Old loanamt:"
    ## [1] 138811
    ## [1] "New loanamt:"
    ## [1] 138693.1
    ## [1] 131
    ## [1] "Old loanamt:"
    ## [1] 138693.1
    ## [1] "New loanamt:"
    ## [1] 138574.6
    ## [1] 132
    ## [1] "Old loanamt:"
    ## [1] 138574.6
    ## [1] "New loanamt:"
    ## [1] 138455.5
    ## [1] 133
    ## [1] "Old loanamt:"
    ## [1] 138455.5
    ## [1] "New loanamt:"
    ## [1] 138335.8
    ## [1] 134
    ## [1] "Old loanamt:"
    ## [1] 138335.8
    ## [1] "New loanamt:"
    ## [1] 138215.6
    ## [1] 135
    ## [1] "Old loanamt:"
    ## [1] 138215.6
    ## [1] "New loanamt:"
    ## [1] 138094.7
    ## [1] 136
    ## [1] "Old loanamt:"
    ## [1] 138094.7
    ## [1] "New loanamt:"
    ## [1] 137973.2
    ## [1] 137
    ## [1] "Old loanamt:"
    ## [1] 137973.2
    ## [1] "New loanamt:"
    ## [1] 137851.1
    ## [1] 138
    ## [1] "Old loanamt:"
    ## [1] 137851.1
    ## [1] "New loanamt:"
    ## [1] 137728.4
    ## [1] 139
    ## [1] "Old loanamt:"
    ## [1] 137728.4
    ## [1] "New loanamt:"
    ## [1] 137605.1
    ## [1] 140
    ## [1] "Old loanamt:"
    ## [1] 137605.1
    ## [1] "New loanamt:"
    ## [1] 137481.1
    ## [1] 141
    ## [1] "Old loanamt:"
    ## [1] 137481.1
    ## [1] "New loanamt:"
    ## [1] 137356.6
    ## [1] 142
    ## [1] "Old loanamt:"
    ## [1] 137356.6
    ## [1] "New loanamt:"
    ## [1] 137231.4
    ## [1] 143
    ## [1] "Old loanamt:"
    ## [1] 137231.4
    ## [1] "New loanamt:"
    ## [1] 137105.6
    ## [1] 144
    ## [1] "Old loanamt:"
    ## [1] 137105.6
    ## [1] "New loanamt:"
    ## [1] 136979.2
    ## [1] 145
    ## [1] "Old loanamt:"
    ## [1] 136979.2
    ## [1] "New loanamt:"
    ## [1] 136852.1
    ## [1] 146
    ## [1] "Old loanamt:"
    ## [1] 136852.1
    ## [1] "New loanamt:"
    ## [1] 136724.4
    ## [1] 147
    ## [1] "Old loanamt:"
    ## [1] 136724.4
    ## [1] "New loanamt:"
    ## [1] 136596.1
    ## [1] 148
    ## [1] "Old loanamt:"
    ## [1] 136596.1
    ## [1] "New loanamt:"
    ## [1] 136467.1
    ## [1] 149
    ## [1] "Old loanamt:"
    ## [1] 136467.1
    ## [1] "New loanamt:"
    ## [1] 136337.5
    ## [1] 150
    ## [1] "Old loanamt:"
    ## [1] 136337.5
    ## [1] "New loanamt:"
    ## [1] 136207.2
    ## [1] 151
    ## [1] "Old loanamt:"
    ## [1] 136207.2
    ## [1] "New loanamt:"
    ## [1] 136076.3
    ## [1] 152
    ## [1] "Old loanamt:"
    ## [1] 136076.3
    ## [1] "New loanamt:"
    ## [1] 135944.7
    ## [1] 153
    ## [1] "Old loanamt:"
    ## [1] 135944.7
    ## [1] "New loanamt:"
    ## [1] 135812.5
    ## [1] 154
    ## [1] "Old loanamt:"
    ## [1] 135812.5
    ## [1] "New loanamt:"
    ## [1] 135679.6
    ## [1] 155
    ## [1] "Old loanamt:"
    ## [1] 135679.6
    ## [1] "New loanamt:"
    ## [1] 135546
    ## [1] 156
    ## [1] "Old loanamt:"
    ## [1] 135546
    ## [1] "New loanamt:"
    ## [1] 135411.8
    ## [1] 157
    ## [1] "Old loanamt:"
    ## [1] 135411.8
    ## [1] "New loanamt:"
    ## [1] 135276.9
    ## [1] 158
    ## [1] "Old loanamt:"
    ## [1] 135276.9
    ## [1] "New loanamt:"
    ## [1] 135141.3
    ## [1] 159
    ## [1] "Old loanamt:"
    ## [1] 135141.3
    ## [1] "New loanamt:"
    ## [1] 135005
    ## [1] 160
    ## [1] "Old loanamt:"
    ## [1] 135005
    ## [1] "New loanamt:"
    ## [1] 134868.1
    ## [1] 161
    ## [1] "Old loanamt:"
    ## [1] 134868.1
    ## [1] "New loanamt:"
    ## [1] 134730.5
    ## [1] 162
    ## [1] "Old loanamt:"
    ## [1] 134730.5
    ## [1] "New loanamt:"
    ## [1] 134592.2
    ## [1] 163
    ## [1] "Old loanamt:"
    ## [1] 134592.2
    ## [1] "New loanamt:"
    ## [1] 134453.2
    ## [1] 164
    ## [1] "Old loanamt:"
    ## [1] 134453.2
    ## [1] "New loanamt:"
    ## [1] 134313.5
    ## [1] 165
    ## [1] "Old loanamt:"
    ## [1] 134313.5
    ## [1] "New loanamt:"
    ## [1] 134173.1
    ## [1] 166
    ## [1] "Old loanamt:"
    ## [1] 134173.1
    ## [1] "New loanamt:"
    ## [1] 134032
    ## [1] 167
    ## [1] "Old loanamt:"
    ## [1] 134032
    ## [1] "New loanamt:"
    ## [1] 133890.2
    ## [1] 168
    ## [1] "Old loanamt:"
    ## [1] 133890.2
    ## [1] "New loanamt:"
    ## [1] 133747.7
    ## [1] 169
    ## [1] "Old loanamt:"
    ## [1] 133747.7
    ## [1] "New loanamt:"
    ## [1] 133604.5
    ## [1] 170
    ## [1] "Old loanamt:"
    ## [1] 133604.5
    ## [1] "New loanamt:"
    ## [1] 133460.5
    ## [1] 171
    ## [1] "Old loanamt:"
    ## [1] 133460.5
    ## [1] "New loanamt:"
    ## [1] 133315.9
    ## [1] 172
    ## [1] "Old loanamt:"
    ## [1] 133315.9
    ## [1] "New loanamt:"
    ## [1] 133170.5
    ## [1] 173
    ## [1] "Old loanamt:"
    ## [1] 133170.5
    ## [1] "New loanamt:"
    ## [1] 133024.4
    ## [1] 174
    ## [1] "Old loanamt:"
    ## [1] 133024.4
    ## [1] "New loanamt:"
    ## [1] 132877.6
    ## [1] 175
    ## [1] "Old loanamt:"
    ## [1] 132877.6
    ## [1] "New loanamt:"
    ## [1] 132730
    ## [1] 176
    ## [1] "Old loanamt:"
    ## [1] 132730
    ## [1] "New loanamt:"
    ## [1] 132581.7
    ## [1] 177
    ## [1] "Old loanamt:"
    ## [1] 132581.7
    ## [1] "New loanamt:"
    ## [1] 132432.6
    ## [1] 178
    ## [1] "Old loanamt:"
    ## [1] 132432.6
    ## [1] "New loanamt:"
    ## [1] 132282.8
    ## [1] 179
    ## [1] "Old loanamt:"
    ## [1] 132282.8
    ## [1] "New loanamt:"
    ## [1] 132132.3
    ## [1] 180
    ## [1] "Old loanamt:"
    ## [1] 132132.3
    ## [1] "New loanamt:"
    ## [1] 131981
    ## [1] 181
    ## [1] "Old loanamt:"
    ## [1] 131981
    ## [1] "New loanamt:"
    ## [1] 131828.9
    ## [1] 182
    ## [1] "Old loanamt:"
    ## [1] 131828.9
    ## [1] "New loanamt:"
    ## [1] 131676.1
    ## [1] 183
    ## [1] "Old loanamt:"
    ## [1] 131676.1
    ## [1] "New loanamt:"
    ## [1] 131522.5
    ## [1] 184
    ## [1] "Old loanamt:"
    ## [1] 131522.5
    ## [1] "New loanamt:"
    ## [1] 131368.2
    ## [1] 185
    ## [1] "Old loanamt:"
    ## [1] 131368.2
    ## [1] "New loanamt:"
    ## [1] 131213.1
    ## [1] 186
    ## [1] "Old loanamt:"
    ## [1] 131213.1
    ## [1] "New loanamt:"
    ## [1] 131057.2
    ## [1] 187
    ## [1] "Old loanamt:"
    ## [1] 131057.2
    ## [1] "New loanamt:"
    ## [1] 130900.5
    ## [1] 188
    ## [1] "Old loanamt:"
    ## [1] 130900.5
    ## [1] "New loanamt:"
    ## [1] 130743
    ## [1] 189
    ## [1] "Old loanamt:"
    ## [1] 130743
    ## [1] "New loanamt:"
    ## [1] 130584.8
    ## [1] 190
    ## [1] "Old loanamt:"
    ## [1] 130584.8
    ## [1] "New loanamt:"
    ## [1] 130425.8
    ## [1] 191
    ## [1] "Old loanamt:"
    ## [1] 130425.8
    ## [1] "New loanamt:"
    ## [1] 130265.9
    ## [1] 192
    ## [1] "Old loanamt:"
    ## [1] 130265.9
    ## [1] "New loanamt:"
    ## [1] 130105.3
    ## [1] 193
    ## [1] "Old loanamt:"
    ## [1] 130105.3
    ## [1] "New loanamt:"
    ## [1] 129943.9
    ## [1] 194
    ## [1] "Old loanamt:"
    ## [1] 129943.9
    ## [1] "New loanamt:"
    ## [1] 129781.6
    ## [1] 195
    ## [1] "Old loanamt:"
    ## [1] 129781.6
    ## [1] "New loanamt:"
    ## [1] 129618.6
    ## [1] 196
    ## [1] "Old loanamt:"
    ## [1] 129618.6
    ## [1] "New loanamt:"
    ## [1] 129454.7
    ## [1] 197
    ## [1] "Old loanamt:"
    ## [1] 129454.7
    ## [1] "New loanamt:"
    ## [1] 129290
    ## [1] 198
    ## [1] "Old loanamt:"
    ## [1] 129290
    ## [1] "New loanamt:"
    ## [1] 129124.5
    ## [1] 199
    ## [1] "Old loanamt:"
    ## [1] 129124.5
    ## [1] "New loanamt:"
    ## [1] 128958.2
    ## [1] 200
    ## [1] "Old loanamt:"
    ## [1] 128958.2
    ## [1] "New loanamt:"
    ## [1] 128791
    ## [1] 201
    ## [1] "Old loanamt:"
    ## [1] 128791
    ## [1] "New loanamt:"
    ## [1] 128623
    ## [1] 202
    ## [1] "Old loanamt:"
    ## [1] 128623
    ## [1] "New loanamt:"
    ## [1] 128454.2
    ## [1] 203
    ## [1] "Old loanamt:"
    ## [1] 128454.2
    ## [1] "New loanamt:"
    ## [1] 128284.5
    ## [1] 204
    ## [1] "Old loanamt:"
    ## [1] 128284.5
    ## [1] "New loanamt:"
    ## [1] 128113.9
    ## [1] 205
    ## [1] "Old loanamt:"
    ## [1] 128113.9
    ## [1] "New loanamt:"
    ## [1] 127942.6
    ## [1] 206
    ## [1] "Old loanamt:"
    ## [1] 127942.6
    ## [1] "New loanamt:"
    ## [1] 127770.3
    ## [1] 207
    ## [1] "Old loanamt:"
    ## [1] 127770.3
    ## [1] "New loanamt:"
    ## [1] 127597.2
    ## [1] 208
    ## [1] "Old loanamt:"
    ## [1] 127597.2
    ## [1] "New loanamt:"
    ## [1] 127423.2
    ## [1] 209
    ## [1] "Old loanamt:"
    ## [1] 127423.2
    ## [1] "New loanamt:"
    ## [1] 127248.4
    ## [1] 210
    ## [1] "Old loanamt:"
    ## [1] 127248.4
    ## [1] "New loanamt:"
    ## [1] 127072.7
    ## [1] 211
    ## [1] "Old loanamt:"
    ## [1] 127072.7
    ## [1] "New loanamt:"
    ## [1] 126896.1
    ## [1] 212
    ## [1] "Old loanamt:"
    ## [1] 126896.1
    ## [1] "New loanamt:"
    ## [1] 126718.6
    ## [1] 213
    ## [1] "Old loanamt:"
    ## [1] 126718.6
    ## [1] "New loanamt:"
    ## [1] 126540.2
    ## [1] 214
    ## [1] "Old loanamt:"
    ## [1] 126540.2
    ## [1] "New loanamt:"
    ## [1] 126361
    ## [1] 215
    ## [1] "Old loanamt:"
    ## [1] 126361
    ## [1] "New loanamt:"
    ## [1] 126180.8
    ## [1] 216
    ## [1] "Old loanamt:"
    ## [1] 126180.8
    ## [1] "New loanamt:"
    ## [1] 125999.8
    ## [1] 217
    ## [1] "Old loanamt:"
    ## [1] 125999.8
    ## [1] "New loanamt:"
    ## [1] 125817.8
    ## [1] 218
    ## [1] "Old loanamt:"
    ## [1] 125817.8
    ## [1] "New loanamt:"
    ## [1] 125634.9
    ## [1] 219
    ## [1] "Old loanamt:"
    ## [1] 125634.9
    ## [1] "New loanamt:"
    ## [1] 125451.1
    ## [1] 220
    ## [1] "Old loanamt:"
    ## [1] 125451.1
    ## [1] "New loanamt:"
    ## [1] 125266.4
    ## [1] 221
    ## [1] "Old loanamt:"
    ## [1] 125266.4
    ## [1] "New loanamt:"
    ## [1] 125080.8
    ## [1] 222
    ## [1] "Old loanamt:"
    ## [1] 125080.8
    ## [1] "New loanamt:"
    ## [1] 124894.2
    ## [1] 223
    ## [1] "Old loanamt:"
    ## [1] 124894.2
    ## [1] "New loanamt:"
    ## [1] 124706.8
    ## [1] 224
    ## [1] "Old loanamt:"
    ## [1] 124706.8
    ## [1] "New loanamt:"
    ## [1] 124518.3
    ## [1] 225
    ## [1] "Old loanamt:"
    ## [1] 124518.3
    ## [1] "New loanamt:"
    ## [1] 124329
    ## [1] 226
    ## [1] "Old loanamt:"
    ## [1] 124329
    ## [1] "New loanamt:"
    ## [1] 124138.7
    ## [1] 227
    ## [1] "Old loanamt:"
    ## [1] 124138.7
    ## [1] "New loanamt:"
    ## [1] 123947.4
    ## [1] 228
    ## [1] "Old loanamt:"
    ## [1] 123947.4
    ## [1] "New loanamt:"
    ## [1] 123755.2
    ## [1] 229
    ## [1] "Old loanamt:"
    ## [1] 123755.2
    ## [1] "New loanamt:"
    ## [1] 123562
    ## [1] 230
    ## [1] "Old loanamt:"
    ## [1] 123562
    ## [1] "New loanamt:"
    ## [1] 123367.8
    ## [1] 231
    ## [1] "Old loanamt:"
    ## [1] 123367.8
    ## [1] "New loanamt:"
    ## [1] 123172.7
    ## [1] 232
    ## [1] "Old loanamt:"
    ## [1] 123172.7
    ## [1] "New loanamt:"
    ## [1] 122976.6
    ## [1] 233
    ## [1] "Old loanamt:"
    ## [1] 122976.6
    ## [1] "New loanamt:"
    ## [1] 122779.5
    ## [1] 234
    ## [1] "Old loanamt:"
    ## [1] 122779.5
    ## [1] "New loanamt:"
    ## [1] 122581.5
    ## [1] 235
    ## [1] "Old loanamt:"
    ## [1] 122581.5
    ## [1] "New loanamt:"
    ## [1] 122382.4
    ## [1] 236
    ## [1] "Old loanamt:"
    ## [1] 122382.4
    ## [1] "New loanamt:"
    ## [1] 122182.4
    ## [1] 237
    ## [1] "Old loanamt:"
    ## [1] 122182.4
    ## [1] "New loanamt:"
    ## [1] 121981.3
    ## [1] 238
    ## [1] "Old loanamt:"
    ## [1] 121981.3
    ## [1] "New loanamt:"
    ## [1] 121779.3
    ## [1] 239
    ## [1] "Old loanamt:"
    ## [1] 121779.3
    ## [1] "New loanamt:"
    ## [1] 121576.2
    ## [1] 240
    ## [1] "Old loanamt:"
    ## [1] 121576.2
    ## [1] "New loanamt:"
    ## [1] 121372.1
    ## [1] 241
    ## [1] "Old loanamt:"
    ## [1] 121372.1
    ## [1] "New loanamt:"
    ## [1] 121167
    ## [1] 242
    ## [1] "Old loanamt:"
    ## [1] 121167
    ## [1] "New loanamt:"
    ## [1] 120960.9
    ## [1] 243
    ## [1] "Old loanamt:"
    ## [1] 120960.9
    ## [1] "New loanamt:"
    ## [1] 120753.8
    ## [1] 244
    ## [1] "Old loanamt:"
    ## [1] 120753.8
    ## [1] "New loanamt:"
    ## [1] 120545.6
    ## [1] 245
    ## [1] "Old loanamt:"
    ## [1] 120545.6
    ## [1] "New loanamt:"
    ## [1] 120336.3
    ## [1] 246
    ## [1] "Old loanamt:"
    ## [1] 120336.3
    ## [1] "New loanamt:"
    ## [1] 120126.1
    ## [1] 247
    ## [1] "Old loanamt:"
    ## [1] 120126.1
    ## [1] "New loanamt:"
    ## [1] 119914.7
    ## [1] 248
    ## [1] "Old loanamt:"
    ## [1] 119914.7
    ## [1] "New loanamt:"
    ## [1] 119702.3
    ## [1] 249
    ## [1] "Old loanamt:"
    ## [1] 119702.3
    ## [1] "New loanamt:"
    ## [1] 119488.9
    ## [1] 250
    ## [1] "Old loanamt:"
    ## [1] 119488.9
    ## [1] "New loanamt:"
    ## [1] 119274.4
    ## [1] 251
    ## [1] "Old loanamt:"
    ## [1] 119274.4
    ## [1] "New loanamt:"
    ## [1] 119058.8
    ## [1] 252
    ## [1] "Old loanamt:"
    ## [1] 119058.8
    ## [1] "New loanamt:"
    ## [1] 118842.1
    ## [1] 253
    ## [1] "Old loanamt:"
    ## [1] 118842.1
    ## [1] "New loanamt:"
    ## [1] 118624.4
    ## [1] 254
    ## [1] "Old loanamt:"
    ## [1] 118624.4
    ## [1] "New loanamt:"
    ## [1] 118405.5
    ## [1] 255
    ## [1] "Old loanamt:"
    ## [1] 118405.5
    ## [1] "New loanamt:"
    ## [1] 118185.6
    ## [1] 256
    ## [1] "Old loanamt:"
    ## [1] 118185.6
    ## [1] "New loanamt:"
    ## [1] 117964.6
    ## [1] 257
    ## [1] "Old loanamt:"
    ## [1] 117964.6
    ## [1] "New loanamt:"
    ## [1] 117742.4
    ## [1] 258
    ## [1] "Old loanamt:"
    ## [1] 117742.4
    ## [1] "New loanamt:"
    ## [1] 117519.2
    ## [1] 259
    ## [1] "Old loanamt:"
    ## [1] 117519.2
    ## [1] "New loanamt:"
    ## [1] 117294.8
    ## [1] 260
    ## [1] "Old loanamt:"
    ## [1] 117294.8
    ## [1] "New loanamt:"
    ## [1] 117069.3
    ## [1] 261
    ## [1] "Old loanamt:"
    ## [1] 117069.3
    ## [1] "New loanamt:"
    ## [1] 116842.7
    ## [1] 262
    ## [1] "Old loanamt:"
    ## [1] 116842.7
    ## [1] "New loanamt:"
    ## [1] 116615
    ## [1] 263
    ## [1] "Old loanamt:"
    ## [1] 116615
    ## [1] "New loanamt:"
    ## [1] 116386.1
    ## [1] 264
    ## [1] "Old loanamt:"
    ## [1] 116386.1
    ## [1] "New loanamt:"
    ## [1] 116156.1
    ## [1] 265
    ## [1] "Old loanamt:"
    ## [1] 116156.1
    ## [1] "New loanamt:"
    ## [1] 115924.9
    ## [1] 266
    ## [1] "Old loanamt:"
    ## [1] 115924.9
    ## [1] "New loanamt:"
    ## [1] 115692.5
    ## [1] 267
    ## [1] "Old loanamt:"
    ## [1] 115692.5
    ## [1] "New loanamt:"
    ## [1] 115459.1
    ## [1] 268
    ## [1] "Old loanamt:"
    ## [1] 115459.1
    ## [1] "New loanamt:"
    ## [1] 115224.4
    ## [1] 269
    ## [1] "Old loanamt:"
    ## [1] 115224.4
    ## [1] "New loanamt:"
    ## [1] 114988.6
    ## [1] 270
    ## [1] "Old loanamt:"
    ## [1] 114988.6
    ## [1] "New loanamt:"
    ## [1] 114751.5
    ## [1] 271
    ## [1] "Old loanamt:"
    ## [1] 114751.5
    ## [1] "New loanamt:"
    ## [1] 114513.3
    ## [1] 272
    ## [1] "Old loanamt:"
    ## [1] 114513.3
    ## [1] "New loanamt:"
    ## [1] 114273.9
    ## [1] 273
    ## [1] "Old loanamt:"
    ## [1] 114273.9
    ## [1] "New loanamt:"
    ## [1] 114033.3
    ## [1] 274
    ## [1] "Old loanamt:"
    ## [1] 114033.3
    ## [1] "New loanamt:"
    ## [1] 113791.6
    ## [1] 275
    ## [1] "Old loanamt:"
    ## [1] 113791.6
    ## [1] "New loanamt:"
    ## [1] 113548.6
    ## [1] 276
    ## [1] "Old loanamt:"
    ## [1] 113548.6
    ## [1] "New loanamt:"
    ## [1] 113304.3
    ## [1] 277
    ## [1] "Old loanamt:"
    ## [1] 113304.3
    ## [1] "New loanamt:"
    ## [1] 113058.9
    ## [1] 278
    ## [1] "Old loanamt:"
    ## [1] 113058.9
    ## [1] "New loanamt:"
    ## [1] 112812.2
    ## [1] 279
    ## [1] "Old loanamt:"
    ## [1] 112812.2
    ## [1] "New loanamt:"
    ## [1] 112564.3
    ## [1] 280
    ## [1] "Old loanamt:"
    ## [1] 112564.3
    ## [1] "New loanamt:"
    ## [1] 112315.2
    ## [1] 281
    ## [1] "Old loanamt:"
    ## [1] 112315.2
    ## [1] "New loanamt:"
    ## [1] 112064.8
    ## [1] 282
    ## [1] "Old loanamt:"
    ## [1] 112064.8
    ## [1] "New loanamt:"
    ## [1] 111813.2
    ## [1] 283
    ## [1] "Old loanamt:"
    ## [1] 111813.2
    ## [1] "New loanamt:"
    ## [1] 111560.3
    ## [1] 284
    ## [1] "Old loanamt:"
    ## [1] 111560.3
    ## [1] "New loanamt:"
    ## [1] 111306.1
    ## [1] 285
    ## [1] "Old loanamt:"
    ## [1] 111306.1
    ## [1] "New loanamt:"
    ## [1] 111050.7
    ## [1] 286
    ## [1] "Old loanamt:"
    ## [1] 111050.7
    ## [1] "New loanamt:"
    ## [1] 110794
    ## [1] 287
    ## [1] "Old loanamt:"
    ## [1] 110794
    ## [1] "New loanamt:"
    ## [1] 110536
    ## [1] 288
    ## [1] "Old loanamt:"
    ## [1] 110536
    ## [1] "New loanamt:"
    ## [1] 110276.7
    ## [1] 289
    ## [1] "Old loanamt:"
    ## [1] 110276.7
    ## [1] "New loanamt:"
    ## [1] 110016.1
    ## [1] 290
    ## [1] "Old loanamt:"
    ## [1] 110016.1
    ## [1] "New loanamt:"
    ## [1] 109754.3
    ## [1] 291
    ## [1] "Old loanamt:"
    ## [1] 109754.3
    ## [1] "New loanamt:"
    ## [1] 109491.1
    ## [1] 292
    ## [1] "Old loanamt:"
    ## [1] 109491.1
    ## [1] "New loanamt:"
    ## [1] 109226.6
    ## [1] 293
    ## [1] "Old loanamt:"
    ## [1] 109226.6
    ## [1] "New loanamt:"
    ## [1] 108960.7
    ## [1] 294
    ## [1] "Old loanamt:"
    ## [1] 108960.7
    ## [1] "New loanamt:"
    ## [1] 108693.6
    ## [1] 295
    ## [1] "Old loanamt:"
    ## [1] 108693.6
    ## [1] "New loanamt:"
    ## [1] 108425.1
    ## [1] 296
    ## [1] "Old loanamt:"
    ## [1] 108425.1
    ## [1] "New loanamt:"
    ## [1] 108155.3
    ## [1] 297
    ## [1] "Old loanamt:"
    ## [1] 108155.3
    ## [1] "New loanamt:"
    ## [1] 107884.1
    ## [1] 298
    ## [1] "Old loanamt:"
    ## [1] 107884.1
    ## [1] "New loanamt:"
    ## [1] 107611.5
    ## [1] 299
    ## [1] "Old loanamt:"
    ## [1] 107611.5
    ## [1] "New loanamt:"
    ## [1] 107337.6
    ## [1] 300
    ## [1] "Old loanamt:"
    ## [1] 107337.6
    ## [1] "New loanamt:"
    ## [1] 107062.4
    ## [1] 301
    ## [1] "Old loanamt:"
    ## [1] 107062.4
    ## [1] "New loanamt:"
    ## [1] 106785.7
    ## [1] 302
    ## [1] "Old loanamt:"
    ## [1] 106785.7
    ## [1] "New loanamt:"
    ## [1] 106507.7
    ## [1] 303
    ## [1] "Old loanamt:"
    ## [1] 106507.7
    ## [1] "New loanamt:"
    ## [1] 106228.3
    ## [1] 304
    ## [1] "Old loanamt:"
    ## [1] 106228.3
    ## [1] "New loanamt:"
    ## [1] 105947.5
    ## [1] 305
    ## [1] "Old loanamt:"
    ## [1] 105947.5
    ## [1] "New loanamt:"
    ## [1] 105665.2
    ## [1] 306
    ## [1] "Old loanamt:"
    ## [1] 105665.2
    ## [1] "New loanamt:"
    ## [1] 105381.6
    ## [1] 307
    ## [1] "Old loanamt:"
    ## [1] 105381.6
    ## [1] "New loanamt:"
    ## [1] 105096.5
    ## [1] 308
    ## [1] "Old loanamt:"
    ## [1] 105096.5
    ## [1] "New loanamt:"
    ## [1] 104810.1
    ## [1] 309
    ## [1] "Old loanamt:"
    ## [1] 104810.1
    ## [1] "New loanamt:"
    ## [1] 104522.2
    ## [1] 310
    ## [1] "Old loanamt:"
    ## [1] 104522.2
    ## [1] "New loanamt:"
    ## [1] 104232.8
    ## [1] 311
    ## [1] "Old loanamt:"
    ## [1] 104232.8
    ## [1] "New loanamt:"
    ## [1] 103942
    ## [1] 312
    ## [1] "Old loanamt:"
    ## [1] 103942
    ## [1] "New loanamt:"
    ## [1] 103649.8
    ## [1] 313
    ## [1] "Old loanamt:"
    ## [1] 103649.8
    ## [1] "New loanamt:"
    ## [1] 103356.1
    ## [1] 314
    ## [1] "Old loanamt:"
    ## [1] 103356.1
    ## [1] "New loanamt:"
    ## [1] 103060.9
    ## [1] 315
    ## [1] "Old loanamt:"
    ## [1] 103060.9
    ## [1] "New loanamt:"
    ## [1] 102764.2
    ## [1] 316
    ## [1] "Old loanamt:"
    ## [1] 102764.2
    ## [1] "New loanamt:"
    ## [1] 102466.1
    ## [1] 317
    ## [1] "Old loanamt:"
    ## [1] 102466.1
    ## [1] "New loanamt:"
    ## [1] 102166.5
    ## [1] 318
    ## [1] "Old loanamt:"
    ## [1] 102166.5
    ## [1] "New loanamt:"
    ## [1] 101865.3
    ## [1] 319
    ## [1] "Old loanamt:"
    ## [1] 101865.3
    ## [1] "New loanamt:"
    ## [1] 101562.7
    ## [1] 320
    ## [1] "Old loanamt:"
    ## [1] 101562.7
    ## [1] "New loanamt:"
    ## [1] 101258.5
    ## [1] 321
    ## [1] "Old loanamt:"
    ## [1] 101258.5
    ## [1] "New loanamt:"
    ## [1] 100952.9
    ## [1] 322
    ## [1] "Old loanamt:"
    ## [1] 100952.9
    ## [1] "New loanamt:"
    ## [1] 100645.7
    ## [1] 323
    ## [1] "Old loanamt:"
    ## [1] 100645.7
    ## [1] "New loanamt:"
    ## [1] 100337
    ## [1] 324
    ## [1] "Old loanamt:"
    ## [1] 100337
    ## [1] "New loanamt:"
    ## [1] 100026.7
    ## [1] 325
    ## [1] "Old loanamt:"
    ## [1] 100026.7
    ## [1] "New loanamt:"
    ## [1] 99714.85
    ## [1] 326
    ## [1] "Old loanamt:"
    ## [1] 99714.85
    ## [1] "New loanamt:"
    ## [1] 99401.47
    ## [1] 327
    ## [1] "Old loanamt:"
    ## [1] 99401.47
    ## [1] "New loanamt:"
    ## [1] 99086.51
    ## [1] 328
    ## [1] "Old loanamt:"
    ## [1] 99086.51
    ## [1] "New loanamt:"
    ## [1] 98769.99
    ## [1] 329
    ## [1] "Old loanamt:"
    ## [1] 98769.99
    ## [1] "New loanamt:"
    ## [1] 98451.88
    ## [1] 330
    ## [1] "Old loanamt:"
    ## [1] 98451.88
    ## [1] "New loanamt:"
    ## [1] 98132.18
    ## [1] 331
    ## [1] "Old loanamt:"
    ## [1] 98132.18
    ## [1] "New loanamt:"
    ## [1] 97810.88
    ## [1] 332
    ## [1] "Old loanamt:"
    ## [1] 97810.88
    ## [1] "New loanamt:"
    ## [1] 97487.97
    ## [1] 333
    ## [1] "Old loanamt:"
    ## [1] 97487.97
    ## [1] "New loanamt:"
    ## [1] 97163.45
    ## [1] 334
    ## [1] "Old loanamt:"
    ## [1] 97163.45
    ## [1] "New loanamt:"
    ## [1] 96837.31
    ## [1] 335
    ## [1] "Old loanamt:"
    ## [1] 96837.31
    ## [1] "New loanamt:"
    ## [1] 96509.54
    ## [1] 336
    ## [1] "Old loanamt:"
    ## [1] 96509.54
    ## [1] "New loanamt:"
    ## [1] 96180.13
    ## [1] 337
    ## [1] "Old loanamt:"
    ## [1] 96180.13
    ## [1] "New loanamt:"
    ## [1] 95849.07
    ## [1] 338
    ## [1] "Old loanamt:"
    ## [1] 95849.07
    ## [1] "New loanamt:"
    ## [1] 95516.35
    ## [1] 339
    ## [1] "Old loanamt:"
    ## [1] 95516.35
    ## [1] "New loanamt:"
    ## [1] 95181.98
    ## [1] 340
    ## [1] "Old loanamt:"
    ## [1] 95181.98
    ## [1] "New loanamt:"
    ## [1] 94845.93
    ## [1] 341
    ## [1] "Old loanamt:"
    ## [1] 94845.93
    ## [1] "New loanamt:"
    ## [1] 94508.2
    ## [1] 342
    ## [1] "Old loanamt:"
    ## [1] 94508.2
    ## [1] "New loanamt:"
    ## [1] 94168.78
    ## [1] 343
    ## [1] "Old loanamt:"
    ## [1] 94168.78
    ## [1] "New loanamt:"
    ## [1] 93827.66
    ## [1] 344
    ## [1] "Old loanamt:"
    ## [1] 93827.66
    ## [1] "New loanamt:"
    ## [1] 93484.84
    ## [1] 345
    ## [1] "Old loanamt:"
    ## [1] 93484.84
    ## [1] "New loanamt:"
    ## [1] 93140.3
    ## [1] 346
    ## [1] "Old loanamt:"
    ## [1] 93140.3
    ## [1] "New loanamt:"
    ## [1] 92794.05
    ## [1] 347
    ## [1] "Old loanamt:"
    ## [1] 92794.05
    ## [1] "New loanamt:"
    ## [1] 92446.06
    ## [1] 348
    ## [1] "Old loanamt:"
    ## [1] 92446.06
    ## [1] "New loanamt:"
    ## [1] 92096.33
    ## [1] 349
    ## [1] "Old loanamt:"
    ## [1] 92096.33
    ## [1] "New loanamt:"
    ## [1] 91744.85
    ## [1] 350
    ## [1] "Old loanamt:"
    ## [1] 91744.85
    ## [1] "New loanamt:"
    ## [1] 91391.61
    ## [1] 351
    ## [1] "Old loanamt:"
    ## [1] 91391.61
    ## [1] "New loanamt:"
    ## [1] 91036.61
    ## [1] 352
    ## [1] "Old loanamt:"
    ## [1] 91036.61
    ## [1] "New loanamt:"
    ## [1] 90679.84
    ## [1] 353
    ## [1] "Old loanamt:"
    ## [1] 90679.84
    ## [1] "New loanamt:"
    ## [1] 90321.28
    ## [1] 354
    ## [1] "Old loanamt:"
    ## [1] 90321.28
    ## [1] "New loanamt:"
    ## [1] 89960.92
    ## [1] 355
    ## [1] "Old loanamt:"
    ## [1] 89960.92
    ## [1] "New loanamt:"
    ## [1] 89598.77
    ## [1] 356
    ## [1] "Old loanamt:"
    ## [1] 89598.77
    ## [1] "New loanamt:"
    ## [1] 89234.8
    ## [1] 357
    ## [1] "Old loanamt:"
    ## [1] 89234.8
    ## [1] "New loanamt:"
    ## [1] 88869.02
    ## [1] 358
    ## [1] "Old loanamt:"
    ## [1] 88869.02
    ## [1] "New loanamt:"
    ## [1] 88501.4
    ## [1] 359
    ## [1] "Old loanamt:"
    ## [1] 88501.4
    ## [1] "New loanamt:"
    ## [1] 88131.95
    ## [1] 360
    ## [1] "Old loanamt:"
    ## [1] 88131.95
    ## [1] "New loanamt:"
    ## [1] 87760.65

I still owe what?
-----------------

$87,760 after 30 years. This is after paying $807.92 \* 360 months= $290,851.20 over the course of the 30 year loan cycle. Yikes. If you would like a visual, you can create a variable called 'loantracker'. The bounds don't matter, just specify the upper bound as 'Horizon' and define it later to equal 360 (months).

``` r
loanamt = 150000
Horizon = 360

loantracker = rep(0, Horizon)
```

``` r
for(month in 1:Horizon) {
InterestRate = 0.005
loanamt = (loanamt-807.92) * (1 + InterestRate)
loantracker[month] = loanamt
}
plot(loantracker)
```

![](Gustein_files/figure-markdown_github/unnamed-chunk-7-1.png)

What about subprime mortgages?
------------------------------

There has been a great deal of talk about the role of subprime mortgages and other predatory forms of lending in low-income and minority communities leading up the 2008 recession. So called "NINJA" loans often used "teaser rates", or variable interest loans. (NINJA stands for "no income, no job, no assets") The first few years have a very, very, low interest rate. Then it becomes much higher. To model this you can create a block for each interest rate.

What about adjusted interest rates?
-----------------------------------

Other mortgages The true power or Monte Carlo simulations is that you can randomly sample the interest rate from a vector of interest rates, given a range, etc. A good extension might be to include some variablility in the interest rate. First we create a vector of possible interest rates, followed by a vector of probabiities of each interest rate occuring.

``` r
outcome_values = c(.003, 0.004,0.0045,0.005)  # the possible interest rates
outcome_probs = c(.25, .25, .25,.25)  # the probabilities of each one
```

Now we can use these vectors in our loop. Note that the interest rate is no longer defined as a number within the loop, it is now randomly sampling one of the interest rates in the vector for each month. This is, of course, not realistic due to rates not changing monthly.You could change the horizons to years instead of months, and sample from a range of values of known interest rates to make it more realistic. Note that this plot is a bit more "squiggly" due to the different interest rates.

``` r
loanamt = 150000
Horizon = 360

loantracker = rep(0, Horizon)

for(month in 1:Horizon) {
InterestRate = sample(outcome_values, size = 1, prob = outcome_probs)
loanamt = (loanamt-807.92) * (1 + InterestRate)
loantracker[month] = loanamt
}
plot(loantracker)
```

![](Gustein_files/figure-markdown_github/unnamed-chunk-9-1.png)

Extension activities:
---------------------

These types of high apr loans are coming back with a vengeance: <https://www.cnbc.com/2018/04/12/sub-prime-mortgages-morph-into-non-prime-loans-and-demand-soars.html>

There are a million different ways to extend this activity. I think it's interesting to see what happens to our model when you pick a slightly higher interest rate, like .07% monthly. The loanamt stops decreasing! You actually end up owing more than the principal. Overall, this is a simple way to introduce "for" loops while showing their necessity for models that involve updating.

In terms of the bigger picture, it's important for students to see connections between median housing price and median income. If the median income can't buy the median house with a 30 year mortgage, gentrification is probably happening or about to happen.

Shout out to Dr. James Scott, got the idea for this while going through some of his R tutorials in class.
