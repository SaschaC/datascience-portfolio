best <- function(state = "", outcome = "") { 
  
  outcome.data <- read.csv("outcome-of-care-measures.csv")
  outcome.data[,c(11)] <- as.numeric(outcome.data[,c(11)])
  outcome.data[,c(17)] <- as.numeric(outcome.data[,c(17)])
  
  outcome.data[,c(23)] <- as.numeric(outcome.data[,c(23)])
  col.vector = c("heart attack"="Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", "heart failure" = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure", "pneumonia" = "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia") # die entsprechenden Spaltennummer
  
  if (sum(outcome.data$State==state)==0) { stop("invalid state")}  
  if (sum(names(col.vector)==outcome)==0) { stop("invalid outcome")}
  outcome.data.state = outcome.data[outcome.data$State == state,] # nur der jeweilige Staat, nur der jeweilige outcome und Name
  outcome.data.state = outcome.data.state[!is.na(outcome.data.state[col.vector[outcome]]),]
  ranking.by.outcome = order(outcome.data.state[,col.vector[outcome]], outcome.data.state$Hospital.Name)
  ranked.outcome.data.state = outcome.data.state[ranking.by.outcome,]
  as.character(ranked.outcome.data.state[1, "Hospital.Name"])
}
