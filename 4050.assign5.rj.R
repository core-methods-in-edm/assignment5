install.packages("party", "rpart")

library(rpart)
library(party)
D1 <- read.table("intelligent_tutor.csv", sep = ",", header = TRUE)

### First we will build a classification tree to predict which students ask a teacher for help, 
### which start a new session, or which give up, based on whether or not the student completed a session (D1$complete) 
### and whether or not they asked for hints (D1$hint.y).

c.tree <- rpart(action ~ hint.y + complete, method="class", data=D1) 
#Notice the standard R notion for a formula X ~ Y
c.tree
# Look at the error of this tree

printcp(c.tree)

# Plot the tree
# post generates a pdf that journals would use (vector graphics)
post(c.tree, file = "tree.ps", title = "Session Completion Action: 1 - Ask teacher, 2 - Start new session, 3 - Give up")

### REGRESSION TREE - TEACHER INTERVENTION TREE

### We will create three groups ("teacher should intervene", "teacher should monitor student progress" and "no action")
### based on students' previous use of the system and how many hints they use. 
### To do this we will be building a decision tree using the "party" package.

### Take a look at our outcome variable "score"
hist(D1$score)


### Create a categorical outcome variable based on student score to advise the teacher using an "ifelse" statement

D1$advice <- ifelse(D1$score <=0.4, "intervene", ifelse(D1$score > 0.4 & D1$score <=0.8, "monitor", "no action"))

### Build a decision tree that predicts "advice" based on how many problems students have answered before, 
### the percentage of those problems they got correct and how many hints they required

score_ctree <- ctree(factor(advice) ~ prior_prob_count + prior_percent_correct + hints, D1)

plot(score_ctree)

### According tot he Rplot the highest levels of intervetion suggestion came from the decision tree variables Prior_percentage_correct & hints.  
### We should also make a note of students who answer less the 85 questions & use no hints.  Those students should also be monitored. 

### Upload the data "intelligent_tutor_new.csv" and 
### use the predict function (D2$prediction <- predict(score_ctree, D2)) to predict the assignments of the new data set. 
### What is the error rate on your predictions of the new data?

D2 <- read.csv("intelligent_tutor_new.csv")




