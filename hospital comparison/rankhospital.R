rankhospital <- function(state = "", outcome = "", num) { 
  
  outcome.data <- read.csv("outcome-of-care-measures.csv", colClasses="character")
  outcome.data[,c(11)] <- as.numeric(outcome.data[,c(11)])
  outcome.data[,c(17)] <- as.numeric(outcome.data[,c(17)])
  outcome.data[,c(23)] <- as.numeric(outcome.data[,c(23)])
  
  col.vector = c("heart attack"="Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", "heart failure" = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure", "pneumonia" = "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia") # die entsprechenden Spaltennummern
  
  if (sum(outcome.data$State==state)==0) { stop("invalid state")}
  if (sum(names(col.vector)==outcome)==0) { stop("invalid outcome")}
  
  outcome.data.state = outcome.data[outcome.data$State == state,] # nur der jeweilige Staat
  
  outcome.data.state = outcome.data.state[!is.na(outcome.data.state[col.vector[outcome]]),]
  ranking.by.outcome = order(outcome.data.state[,col.vector[outcome]], outcome.data.state$Hospital.Name)
  ranked.outcome.data.state = outcome.data.state[ranking.by.outcome,]
  
 worst.best = c("worst" = length(ranked.outcome.data.state[, "Hospital.Name"]), "best" = 1)
  
  if (is.numeric(num) & num <= length(ranked.outcome.data.state[, "Hospital.Name"])) {
    ranked.outcome.data.state[num, "Hospital.Name"]  
  }
  else if (is.numeric(num) & num > length(ranked.outcome.data.state[, "Hospital.Name"])) {
    return(NA)  
  }
  else {
    ranked.outcome.data.state[worst.best[num], "Hospital.Name"]
  }
}
