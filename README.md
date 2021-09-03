The data for this assignment come from the [Hospital Compare web
site](http://hospitalcompare.hhs.gov) run by the U.S. Department of
Health and Human Services. The purpose of the web site is to provide
data and information about the quality of care at over 4,000
Medicare-certified hospitals in the U.S. This dataset essentially covers
all major U.S. hospitals.

The Hospital Compare web site contains a lot of data and within the
scope of this assignment I will only look at a small subset of it. In
particular, in the repository you will find three files:  
\* outcome-of-care-measures.csv: Contains information about 30-day
mortality and readmission rates for heart attacks, heart failure, and
pneumonia for over 4,000 hospitals.  
\* hospital-data.csv: Contains information about each hospital.  
\* Hospital_Revised_Flatfiles.pdf: Descriptions of the variables in each
file (i.e the code book). Please note that this document contains
information about many other files that are not used in this programming
assignment.

\#\#\#1 Plotting the 30-day mortality rates for heart attack I start by
reading the outcome data into R via the read.csv function – let us also
look at the first few rows.

``` r
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
```

    ##   Provider.Number                    Hospital.Name                  Address.1 Address.2 Address.3         City State ZIP.Code
    ## 1          010001 SOUTHEAST ALABAMA MEDICAL CENTER     1108 ROSS CLARK CIRCLE                           DOTHAN    AL    36301
    ## 2          010005    MARSHALL MEDICAL CENTER SOUTH 2505 U S HIGHWAY 431 NORTH                             BOAZ    AL    35957
    ## 3          010006   ELIZA COFFEE MEMORIAL HOSPITAL         205 MARENGO STREET                         FLORENCE    AL    35631
    ## 4          010007         MIZELL MEMORIAL HOSPITAL              702 N MAIN ST                              OPP    AL    36467
    ## 5          010008      CRENSHAW COMMUNITY HOSPITAL        101 HOSPITAL CIRCLE                          LUVERNE    AL    36049
    ## 6          010010    MARSHALL MEDICAL CENTER NORTH    8000 ALABAMA HIGHWAY 69                     GUNTERSVILLE    AL    35976
    ##   County.Name Phone.Number Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
    ## 1     HOUSTON   3347938701                                                      14.3
    ## 2    MARSHALL   2565938310                                                      18.5
    ## 3  LAUDERDALE   2567688400                                                      18.1
    ## 4   COVINGTON   3344933541                                             Not Available
    ## 5    CRENSHAW   3343353374                                             Not Available
    ## 6    MARSHALL   2565718000                                             Not Available
    ##   Comparison.to.U.S..Rate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
    ## 1                                                No Different than U.S. National Rate
    ## 2                                                No Different than U.S. National Rate
    ## 3                                                No Different than U.S. National Rate
    ## 4                                                           Number of Cases Too Small
    ## 5                                                           Number of Cases Too Small
    ## 6                                                           Number of Cases Too Small
    ##   Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
    ## 1                                                                                 12.1
    ## 2                                                                                 14.7
    ## 3                                                                                 14.8
    ## 4                                                                        Not Available
    ## 5                                                                        Not Available
    ## 6                                                                        Not Available
    ##   Upper.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
    ## 1                                                                                 17.0
    ## 2                                                                                 23.0
    ## 3                                                                                 21.8
    ## 4                                                                        Not Available
    ## 5                                                                        Not Available
    ## 6                                                                        Not Available
    ##   Number.of.Patients...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
    ## 1                                                                            666
    ## 2                                                                             44
    ## 3                                                                            329
    ## 4                                                                             14
    ## 5                                                                              9
    ## 6                                                                             22
    ##                                Footnote...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
    ## 1                                                                                                  
    ## 2                                                                                                  
    ## 3                                                                                                  
    ## 4 number of cases is too small (fewer than 25) to reliably tell how well the hospital is performing
    ## 5 number of cases is too small (fewer than 25) to reliably tell how well the hospital is performing
    ## 6 number of cases is too small (fewer than 25) to reliably tell how well the hospital is performing
    ##   Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
    ## 1                                                       11.4
    ## 2                                                       15.2
    ## 3                                                       11.3
    ## 4                                                       13.6
    ## 5                                                       13.8
    ## 6                                                       12.5
    ##   Comparison.to.U.S..Rate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
    ## 1                                                 No Different than U.S. National Rate
    ## 2                                                        Worse than U.S. National Rate
    ## 3                                                 No Different than U.S. National Rate
    ## 4                                                 No Different than U.S. National Rate
    ## 5                                                 No Different than U.S. National Rate
    ## 6                                                 No Different than U.S. National Rate
    ##   Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
    ## 1                                                                                   9.5
    ## 2                                                                                  12.2
    ## 3                                                                                   9.1
    ## 4                                                                                  10.0
    ## 5                                                                                   9.9
    ## 6                                                                                   9.9
    ##   Upper.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
    ## 1                                                                                  13.7
    ## 2                                                                                  18.8
    ## 3                                                                                  13.9
    ## 4                                                                                  18.2
    ## 5                                                                                  18.7
    ## 6                                                                                  15.6
    ##   Number.of.Patients...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
    ## 1                                                                             741
    ## 2                                                                             234
    ## 3                                                                             523
    ## 4                                                                             113
    ## 5                                                                              53
    ## 6                                                                             163
    ##   Footnote...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
    ## 1                                                                                                                         10.9
    ## 2                                                                                                                         13.9
    ## 3                                                                                                                         13.4
    ## 4                                                                                                                         14.9
    ## 5                                                                                                                         15.8
    ## 6                                                                                                                          8.7
    ##   Comparison.to.U.S..Rate...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
    ## 1                                             No Different than U.S. National Rate
    ## 2                                             No Different than U.S. National Rate
    ## 3                                             No Different than U.S. National Rate
    ## 4                                             No Different than U.S. National Rate
    ## 5                                             No Different than U.S. National Rate
    ## 6                                                   Better than U.S. National Rate
    ##   Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
    ## 1                                                                               8.6
    ## 2                                                                              11.3
    ## 3                                                                              11.2
    ## 4                                                                              11.6
    ## 5                                                                              11.4
    ## 6                                                                               6.8
    ##   Upper.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
    ## 1                                                                              13.7
    ## 2                                                                              17.0
    ## 3                                                                              15.8
    ## 4                                                                              19.0
    ## 5                                                                              21.5
    ## 6                                                                              11.0
    ##   Number.of.Patients...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
    ## 1                                                                         371
    ## 2                                                                         372
    ## 3                                                                         836
    ## 4                                                                         239
    ## 5                                                                          61
    ## 6                                                                         315
    ##   Footnote...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia Hospital.30.Day.Readmission.Rates.from.Heart.Attack
    ## 1                                                                                                                  19.0
    ## 2                                                                                                         Not Available
    ## 3                                                                                                                  17.8
    ## 4                                                                                                         Not Available
    ## 5                                                                                                         Not Available
    ## 6                                                                                                         Not Available
    ##   Comparison.to.U.S..Rate...Hospital.30.Day.Readmission.Rates.from.Heart.Attack
    ## 1                                          No Different than U.S. National Rate
    ## 2                                                     Number of Cases Too Small
    ## 3                                          No Different than U.S. National Rate
    ## 4                                                     Number of Cases Too Small
    ## 5                                                     Number of Cases Too Small
    ## 6                                                     Number of Cases Too Small
    ##   Lower.Readmission.Estimate...Hospital.30.Day.Readmission.Rates.from.Heart.Attack
    ## 1                                                                             16.6
    ## 2                                                                    Not Available
    ## 3                                                                             14.9
    ## 4                                                                    Not Available
    ## 5                                                                    Not Available
    ## 6                                                                    Not Available
    ##   Upper.Readmission.Estimate...Hospital.30.Day.Readmission.Rates.from.Heart.Attack
    ## 1                                                                             21.7
    ## 2                                                                    Not Available
    ## 3                                                                             21.5
    ## 4                                                                    Not Available
    ## 5                                                                    Not Available
    ## 6                                                                    Not Available
    ##   Number.of.Patients...Hospital.30.Day.Readmission.Rates.from.Heart.Attack
    ## 1                                                                      728
    ## 2                                                                       21
    ## 3                                                                      342
    ## 4                                                                        1
    ## 5                                                                        4
    ## 6                                                                       13
    ##                                      Footnote...Hospital.30.Day.Readmission.Rates.from.Heart.Attack
    ## 1                                                                                                  
    ## 2 number of cases is too small (fewer than 25) to reliably tell how well the hospital is performing
    ## 3                                                                                                  
    ## 4 number of cases is too small (fewer than 25) to reliably tell how well the hospital is performing
    ## 5 number of cases is too small (fewer than 25) to reliably tell how well the hospital is performing
    ## 6 number of cases is too small (fewer than 25) to reliably tell how well the hospital is performing
    ##   Hospital.30.Day.Readmission.Rates.from.Heart.Failure
    ## 1                                                 23.7
    ## 2                                                 22.5
    ## 3                                                 19.8
    ## 4                                                 27.1
    ## 5                                                 24.7
    ## 6                                                 23.9
    ##   Comparison.to.U.S..Rate...Hospital.30.Day.Readmission.Rates.from.Heart.Failure
    ## 1                                           No Different than U.S. National Rate
    ## 2                                           No Different than U.S. National Rate
    ## 3                                                 Better than U.S. National Rate
    ## 4                                           No Different than U.S. National Rate
    ## 5                                           No Different than U.S. National Rate
    ## 6                                           No Different than U.S. National Rate
    ##   Lower.Readmission.Estimate...Hospital.30.Day.Readmission.Rates.from.Heart.Failure
    ## 1                                                                              21.3
    ## 2                                                                              19.2
    ## 3                                                                              17.2
    ## 4                                                                              22.4
    ## 5                                                                              19.9
    ## 6                                                                              20.1
    ##   Upper.Readmission.Estimate...Hospital.30.Day.Readmission.Rates.from.Heart.Failure
    ## 1                                                                              26.5
    ## 2                                                                              26.1
    ## 3                                                                              22.9
    ## 4                                                                              31.9
    ## 5                                                                              30.2
    ## 6                                                                              28.2
    ##   Number.of.Patients...Hospital.30.Day.Readmission.Rates.from.Heart.Failure
    ## 1                                                                       891
    ## 2                                                                       264
    ## 3                                                                       614
    ## 4                                                                       135
    ## 5                                                                        59
    ## 6                                                                       173
    ##   Footnote...Hospital.30.Day.Readmission.Rates.from.Heart.Failure Hospital.30.Day.Readmission.Rates.from.Pneumonia
    ## 1                                                                                                             17.1
    ## 2                                                                                                             17.6
    ## 3                                                                                                             16.9
    ## 4                                                                                                             19.4
    ## 5                                                                                                             18.0
    ## 6                                                                                                             18.7
    ##   Comparison.to.U.S..Rate...Hospital.30.Day.Readmission.Rates.from.Pneumonia
    ## 1                                       No Different than U.S. National Rate
    ## 2                                       No Different than U.S. National Rate
    ## 3                                       No Different than U.S. National Rate
    ## 4                                       No Different than U.S. National Rate
    ## 5                                       No Different than U.S. National Rate
    ## 6                                       No Different than U.S. National Rate
    ##   Lower.Readmission.Estimate...Hospital.30.Day.Readmission.Rates.from.Pneumonia
    ## 1                                                                          14.4
    ## 2                                                                          15.0
    ## 3                                                                          14.7
    ## 4                                                                          15.9
    ## 5                                                                          14.0
    ## 6                                                                          15.7
    ##   Upper.Readmission.Estimate...Hospital.30.Day.Readmission.Rates.from.Pneumonia
    ## 1                                                                          20.4
    ## 2                                                                          20.6
    ## 3                                                                          19.5
    ## 4                                                                          23.2
    ## 5                                                                          22.8
    ## 6                                                                          22.2
    ##   Number.of.Patients...Hospital.30.Day.Readmission.Rates.from.Pneumonia
    ## 1                                                                   400
    ## 2                                                                   374
    ## 3                                                                   842
    ## 4                                                                   254
    ## 5                                                                    56
    ## 6                                                                   326
    ##   Footnote...Hospital.30.Day.Readmission.Rates.from.Pneumonia
    ## 1                                                            
    ## 2                                                            
    ## 3                                                            
    ## 4                                                            
    ## 5                                                            
    ## 6

Evidently, there are many columns in this dataset but I am particularly
interested in column 11 – the 30-day death rates from heart attack. Let
us look at a simple histogram for this outcome.

``` r
outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11], main="30-day mortality rates for heart attack", xlab="Mortality rate")
```

![](README_files/figure-markdown_github/unnamed-chunk-2-1.png)

### 2 Finding the best hospital in a state

For this part of the assignment, I am to write a function called best
that take two arguments: the 2-character abbreviated name of a state and
an outcome name. The function reads the outcome-of-care-measures.csv
file and returns a character vector with the name of the hospital that
has the best (i.e. lowest) 30-day mortality for the specified outcome in
that state. The hospital name is the name provided in the Hospital.Name
variable. The outcomes can be one of “heart attack”, “heart failure”, or
“pneumonia”. Hospitals that do not have data on a particular outcome
should be excluded from the set of hospitals when deciding the rankings.
If there is a tie for the best hospital for a given outcome, then the
hospital names should be sorted in alphabetical order and the first
hospital in that set should be chosen (i.e. if hospitals “b”, “c”, and
“f” are tied for best, then hospital “b” should be returned). The
function should check the validity of its arguments. If an invalid state
value is passed to best, the function should throw an error via the stop
function with the exact message “invalid state”. If an invalid outcome
value is passed to best, the function should throw an error via the stop
function with the exact message “invalid outcome”. In sum, the function
should follow the following outline:

best \<- function(state, outcome) {  
\#\# Read outcome data  
\#\# Check that state and outcome are valid  
\#\# Return hospital name in that state with lowest 30-day death rate  
}

My resulting function is as follows:

``` r
best <- function(state, outcome) {
  outcomes <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  state_subset <- outcomes[outcomes$State==state,]
  if (nrow(state_subset)==0) (stop("invalid state"))
  if (!((identical(outcome, "heart attack")|(identical(outcome, "heart failure"))|(identical(outcome, "pneumonia"))))) (stop("invalid outcome")) 
  suppressWarnings(ifelse ((outcome=="heart attack"), 
  (state_cond_subset <- state_subset[which.min(state_subset$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack),]),
  (ifelse ((outcome=="heart failure"), 
  (state_cond_subset <- state_subset[which.min(state_subset$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure),]),
  (state_cond_subset <- state_subset[which.min(state_subset$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia),])))))                                                       
  print(state_cond_subset$Hospital.Name)
}
```

Note that I have used which.min function because it handles ties
implicitly in the way specified by the assignment and If this extremum
is unique (or empty), the results are the same as (but more efficient
than) which(x == min(x, na.rm = TRUE)). However, since which.min does
not have the option of passing the na.rm=TRUE argument, I have to
explicitly supress warnings to have “clean” output. Here is the example
of output:

``` r
best("TX", "heart attack")
```

    ## [1] "CYPRESS FAIRBANKS MEDICAL CENTER"

``` r
best("TX", "heart failure")
```

    ## [1] "FORT DUNCAN MEDICAL CENTER"

``` r
best("MD", "heart attack")
```

    ## [1] "JOHNS HOPKINS HOSPITAL, THE"

``` r
best("MD", "pneumonia")
```

    ## [1] "GREATER BALTIMORE MEDICAL CENTER"

``` r
best("BB", "heart attack")
```

    ## Error in best("BB", "heart attack"): invalid state

``` r
best("NY", "hert attack")
```

    ## Error in best("NY", "hert attack"): invalid outcome

### 3 Ranking hospitals by outcome in a state

The next part is to write a function called rankhospital that takes
three arguments: the 2-character abbreviated name of a state (state), an
outcome (outcome), and the ranking of a hospital in that state for that
outcome (num). The function will read the outcome-of-care-measures.csv
file and return a character vector with the name of the hospital that
has the ranking specified by the num argument. For example, the call
rankhospital(“MD”, “heart failure”, 5) would return a character vector
containing the name of the hospital with the 5th lowest 30-day death
rate for heart failure. There is a caveat: the num argument can take
values “best”, “worst”, or an integer indicating the ranking (smaller
numbers are better). If the number given by num is larger than the
number of hospitals in that state, then the function should return NA.
Hospitals that do not have data on a particular outcome should be
excluded from the set of hospitals when deciding the rankings. As
previously, it may occur that multiple hospitals have the same 30-day
mortality rate for a given cause of death. In those cases ties are to be
broken using the hospital name, i.e. alphabetically. The function should
check the validity of its arguments. If an invalid state value is passed
to rankhospital, the function should throw an error via the stop
function with the exact message “invalid state”. If an invalid outcome
value is passed to rankhospital, the function should throw an error via
the stop function with the exact message “invalid outcome”. Here is the
template for the function:

rankhospital \<- function(state, outcome, num = “best”) {  
\#\# Read outcome data  
\#\# Check that state and outcome are valid  
\#\# Return hospital name in that state with the given rank 30-day death
rate  
}

The resulting function is:

``` r
rankhospital <- function( state, outcome, num = "best") {
  outcomes <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  state_subset <- outcomes[outcomes$State==state,]
  if (nrow(state_subset)==0) (stop("invalid state"))
  if (!((identical(outcome, "heart attack")|(identical(outcome, "heart failure"))|(identical(outcome, "pneumonia"))))) (stop("invalid outcome")) 
  suppressWarnings(if (outcome=="heart attack") (order_vector <-order(as.numeric(state_subset$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack), state_subset$Hospital.Name, na.last = NA)))
  suppressWarnings(if (outcome=="heart failure") (order_vector <-order(as.numeric(state_subset$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure), state_subset$Hospital.Name, na.last = NA)))
  suppressWarnings(if (outcome=="pneumonia") (order_vector <-order(as.numeric(state_subset$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia), state_subset$Hospital.Name, na.last = NA)))
  ifelse ((num=="best"), (state_subset[(order_vector[1]),2]),
  (ifelse ((num=="worst"), (state_subset[(order_vector[(length(order_vector))]),2]),
                  (state_subset[(order_vector[num]),2]))))
  }
```

What is notable here is that order function allows us to easily index a
vector and provide a second vector to break ties. Let us explore some
sample output:

``` r
rankhospital("TX", "heart failure", 4)
```

    ## [1] "DETAR HOSPITAL NAVARRO"

``` r
rankhospital("MD", "heart attack", "worst")
```

    ## [1] "HARFORD MEMORIAL HOSPITAL"

``` r
rankhospital("MN", "heart attack", 5000)
```

    ## [1] NA

``` r
rankhospital("BB", "pneumonia", 5)
```

    ## Error in rankhospital("BB", "pneumonia", 5): invalid state

``` r
rankhospital("AZ", "hert attack", 2)
```

    ## Error in rankhospital("AZ", "hert attack", 2): invalid outcome

``` r
rankhospital("OK", "pneumonia")
```

    ## [1] "HILLCREST HOSPITAL CUSHING"

### 4 Ranking hospitals in all states

The last function is rankall that takes two arguments: an outcome name
(outcome) and a hospital rank- ing (num). The function reads the
outcome-of-care-measures.csv file and returns a 2-column data frame
containing the hospital in each state that has the ranking specified in
num. For example the function call rankall(“heart attack”, “best”) would
return a data frame containing the names of the hospitals that are the
best in their respective states for 30-day heart attack death rates. The
function should return a value for every state (some may be NA). The
first column in the data frame is named hospital, which contains the
hospital name, and the second column is named state, which contains the
2-character abbreviation for the state name. Hospitals that do not have
data on a particular outcome should be excluded from the set of
hospitals when deciding the rankings. Ties should be handled the same
way (alphabetically) and for the purposes of this assignment it is not
desirable to call the rankhospital function. Again, the function should
check the validity of its arguments. If an invalid outcome value is
passed to rankall, the function should throw an error via the stop
function with the exact message “invalid outcome”. The num variable can
take values “best”, “worst”, or an integer indicating the ranking
(smaller numbers are better). If the number given by num is larger than
the number of hospitals in that state, then the function should return
NA.  
The function should use the following template:

rankall \<- function(outcome, num = “best”) { \#\# Read outcome data  
\#\# Check that state and outcome are valid  
\#\# For each state, find the hospital of the given rank  
\#\# Return a data frame with the hospital names and the  
\#\# (abbreviated) state name  
}

The resulting function is (with thanks to hints provided by Github user
[timmyshen)](https://gist.github.com/timmyshen/6905511):

``` r
rankall <- function(outcome, num = "best") {
  outcomes <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  if (!((identical(outcome, "heart attack")|(identical(outcome, "heart failure"))|(identical(outcome, "pneumonia"))))) (stop("invalid outcome"))
  if (identical(outcome, "heart attack")) (i <- 11)
  if (identical(outcome, "heart failure")) (i<-17)
  if (identical(outcome, "pneumonia")) (i<- 23)
  states <-levels(as.factor(outcomes$State))
  result.df <- data.frame()
  for (state in states) {
  each.state <- outcomes[outcomes$State==state,]
  each.state[,i] <-as.numeric(x=each.state[,i])
  each.state <- each.state[(complete.cases(each.state)),]
  ifelse ((num=="best"), (num_as_numeric <-1), 
          (ifelse ((num=="worst"), (num_as_numeric <- nrow(each.state)), (num_as_numeric <- num))))
  each.state <- each.state[(order(each.state[,i], each.state$Hospital.Name)),]
  return.names <-each.state[num_as_numeric,]$Hospital.Name
  result.df<- rbind(result.df, list(return.names[1], state))
  }
  colnames(x=result.df) <- c('Hospital', 'State')
  result.df
  }
```

The sample output can be seen below:

``` r
head(rankall("heart attack", 20), 10)
```

    ##                               Hospital State
    ## 1                                 <NA>    AK
    ## 2       D W MCMILLAN MEMORIAL HOSPITAL    AL
    ## 3    ARKANSAS METHODIST MEDICAL CENTER    AR
    ## 4  JOHN C LINCOLN DEER VALLEY HOSPITAL    AZ
    ## 5                SHERMAN OAKS HOSPITAL    CA
    ## 6             SKY RIDGE MEDICAL CENTER    CO
    ## 7              MIDSTATE MEDICAL CENTER    CT
    ## 8                                 <NA>    DC
    ## 9                                 <NA>    DE
    ## 10      SOUTH FLORIDA BAPTIST HOSPITAL    FL

``` r
tail(rankall("pneumonia", "worst"), 3)
```

    ##                                      Hospital State
    ## 52 MAYO CLINIC HEALTH SYSTEM - NORTHLAND, INC    WI
    ## 53                     PLATEAU MEDICAL CENTER    WV
    ## 54           NORTH BIG HORN HOSPITAL DISTRICT    WY

``` r
tail(rankall("heart failure"), 10)
```

    ##                                                             Hospital State
    ## 45                         WELLMONT HAWKINS COUNTY MEMORIAL HOSPITAL    TN
    ## 46                                        FORT DUNCAN MEDICAL CENTER    TX
    ## 47 VA SALT LAKE CITY HEALTHCARE - GEORGE E. WAHLEN VA MEDICAL CENTER    UT
    ## 48                                          SENTARA POTOMAC HOSPITAL    VA
    ## 49                            GOV JUAN F LUIS HOSPITAL & MEDICAL CTR    VI
    ## 50                                              SPRINGFIELD HOSPITAL    VT
    ## 51                                         HARBORVIEW MEDICAL CENTER    WA
    ## 52                                    AURORA ST LUKES MEDICAL CENTER    WI
    ## 53                                         FAIRMONT GENERAL HOSPITAL    WV
    ## 54                                        CHEYENNE VA MEDICAL CENTER    WY
