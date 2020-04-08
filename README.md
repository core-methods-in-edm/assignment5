# Introduction to Predictive Analytics in R with CART

This repo contains files for an assignment (assignment 5) on the basics of
predictive analytics in R for HUDK 4050: Core Methods in Educational Data
Mining. The focus is on two decision tree algorithms - CART and Conditional
Inference Trees.

HUDK 4050 is the first of three core courses in the Learning Analytics MS at
Teachers College, Columbia University focusing on the thinking, methods, and
conventions in data science. Particular attention is given to the fields of
Educational Data Mining and Learning Analytics. Refer to the
[Syllabus](https://github.com/timothyLeeXQ/HUDK-4050-Syllabus) (forked from
the [main repo](https://github.com/core-methods-in-edm/syllabus) which may
contain updates for future class iterations) for more information on HUDK 4050.

Other classes in the series are:
* [HUDK 4051: Learning Analytics:
 Process and Theory](https://github.com/timothyLeeXQ/HUDK-4051-Syllabus) ([Main
 repo](https://github.com/la-process-and-theory/syllabus))
* HUDK 5053: Feature Engineering Studio (Starting in May 2020.
 [Main repo](https://github.com/feature-engineering-studio/syllabus))

## Instructor Notes

For this assignment we will be using data from the Assistments Intelligent Tutoring system. This system gives students hints based on how they perform on math problems. We want to see if we can build a decision tree to help teachers decide which students to follow up with, based on students' performance in Assistments. We will create three groups ("teacher should intervene", "teacher should monitor student progress" and "no action") based on students' previous use of the system and how many hints they use. To do this we will be building a decision tree using the "party" package. The party package builds decision trees based on a set of statistical stopping rules.

Please "fork" and "clone" this repository to RStudio to complete the assignment.

# Codebook
id - student id
prior_prob_count - The number of problems a student has done in the system prior to the surrent session  
score - The score the student achieved in the current session  
hints - The number of hints the student requested in the current session  
hint.y - Whether or not the student asked for hints in the current session  
complete - Whether or not the student completed the current session  
action - The action suggested by the system to a teacher about a given student based on their performance
