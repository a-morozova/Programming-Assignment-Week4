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