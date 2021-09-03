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