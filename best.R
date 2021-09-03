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
