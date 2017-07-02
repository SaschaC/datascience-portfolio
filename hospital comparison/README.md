# Hospital Comparison

This repo contains 3 R functions for ranking US hospitals based on data from the Hospital Compare web site
run by the U.S. Department of Health and Human Services (http://hospitalcompare.hhs.gov). 

## Table of contents
- [Setup](#setup)
- [Functions](#functions)
	- [best()](#best)
	- [rankhospital()](#rankhospital)
	- [rankall()](#rankall)
- [Dataset](#dataset)

## Setup
Download all files of this repo into one folder. After having downloaded all files, open R and load one of the 3 R functions into your workspace by using the function `source()`. As an argument to `source()` you have to provide the path and file name of the function that you want to load.
For example, `source("best.R")`.
 
## Functions

### best()

#### Description
Find the best hospital with respect to mortality rates from "heart failure", "pneumonia", or "heart attack" in a specified state.

#### Usage 
best(state, outcome) 

#### Arguments
**state**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;string with a 2-character abbreviated state name<br>
**outcome**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;string corresponding to `"heart failure"`, `"pneumonia"`, or `"heart attack"`

#### Value
A character vector containing the name of the highest ranked hospital

#### Example

`best("TX", "heart failure")`

### rankhospital()

#### Description
Find a hospitals with a specified rank with respect to mortality rates from "heart failure", "pneumonia", or "heart attack" in a specified state.

#### Usage 
rankhospital(state, outcome, num) 

#### Arguments
**state**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;string with a 2-character abbreviated state name<br>
**outcome**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;string corresponding to `"heart failure"`, `"pneumonia"`, or `"heart attack"`<br>
**num**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;integer specifying the ranking
#### Value
A character vector containing the name of the hospital with the specified rank and outcome

#### Example

`rankhospital("TX", "heart failure", 3) # returns the hospital with the third-lowest mortality rate from heart failure in Texas`
  
## rankall()

#### Description
Find a hospital with a specified rank with respect to mortality rate from "heart failure", "pneumonia", or "heart attack" across all states.

#### Usage 
rankall(outcome, num) 

#### Arguments
**outcome**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;string corresponding to `"heart failure"`, `"pneumonia"`, or `"heart attack"`<br>
**num**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;integer specifying the ranking

#### Value
A character vector containing the name of the hospital with the specified rank and outcome

#### Example

`rankall("heart failure", 3) # returns the hospital with the third-lowest mortality rate from heart failure across all states

## Dataset

The data come from the Hospital Compare web site (http://hospitalcompare.hhs.gov)
run by the U.S. Department of Health and Human Services. The purpose of the web site is to provide data and
information about the quality of care at over 4,000 Medicare-certified hospitals in the U.S.

This repo contains two files from the website:
* **outcome-of-care-measures.csv:** Contains information about 30-day mortality and readmission rates
for heart attacks, heart failure, and pneumonia for over 4,000 hospitals (from 2012).
* **Hospital_Revised_Flatfiles.pdf:** Descriptions of the variables in each file (i.e the code book). This document contains information about many other files that are not included in this repo.

