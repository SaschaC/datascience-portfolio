rankall <- function(outcome = "", num) { 
  
  outcome.data <- read.csv("outcome-of-care-measures.csv", colClasses="character")
  outcome.data[,c(11)] <- as.numeric(outcome.data[,c(11)])
  outcome.data[,c(17)] <- as.numeric(outcome.data[,c(17)])
  outcome.data[,c(23)] <- as.numeric(outcome.data[,c(23)])
  
  col.vector = c("heart attack"="Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", "heart failure" = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure", "pneumonia" = "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia") # die entsprechenden Spaltennummern
  
  if (sum(names(col.vector)==outcome)==0) { stop("invalid outcome")}
  
  outcome.data.split = split(outcome.data, outcome.data$State)
  
  hospital.vector = c()
  
  for (i in 1:length(outcome.data.split)) {
    outcome.data.state = outcome.data.split[[i]]
    outcome.data.state = outcome.data.state[!is.na(outcome.data.state[col.vector[outcome]]),]
    ranking.by.outcome = order(outcome.data.state[,col.vector[outcome]], outcome.data.state$Hospital.Name)
    ranked.outcome.data.state = outcome.data.state[ranking.by.outcome,]
  
    worst.best = c("worst" = length(ranked.outcome.data.state[, "Hospital.Name"]), "best" = 1)
  
    if (is.numeric(num) & num <= length(ranked.outcome.data.state[, "Hospital.Name"])) {
      hospital.vector = c(hospital.vector, ranked.outcome.data.state[num, "Hospital.Name"])                          
    }
    else if (is.numeric(num) & num > length(ranked.outcome.data.state[, "Hospital.Name"])) {
      hospital.vector = c(hospital.vector, NA)                              
    }
    else {
      hospital.vector = c(hospital.vector, ranked.outcome.data.state[worst.best[num], "Hospital.Name"])
    }
  }
  result = data.frame(hospital.vector,unique(outcome.data$State)[order(unique(outcome.data$State))])
  colnames(result) = c("hospital", "state")
  result
}
