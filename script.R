library(rpart)
library(party)
library(dplyr)

D1 <- read.table("intelligent_tutor.csv", sep = ",", header = TRUE)

c.tree <- rpart(action ~ hint.y + complete, method="class", data=D1) #Notice the standard R notion for a formula X ~ Y

#Look at the error of this tree
printcp(c.tree)

#Plot the tree
post(c.tree, file = "tree.ps", title = "Session Completion Action: 1 - Ask teacher, 2 - Start new session, 3 - Give up")

hist(D1$score)

D1$advice <- ifelse(D1$score <=0.4, "intervene", ifelse(D1$score > 0.4 & D1$score <=0.8, "monitor", "no action"))

score_ctree <- ctree(factor(advice) ~ prior_prob_count + prior_percent_correct + hints, D1)

plot(score_ctree)

D2 <- read.table("intelligent_tutor_new.csv", sep = ",", header = TRUE)

D2$prediction <- predict(score_ctree, D2)

D3 <- dplyr::count(D2, prediction)

