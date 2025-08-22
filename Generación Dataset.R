set.seed(123)  
SAMPLE_SIZE <- 200

# Generate numeric variables
Age <- sample(20:30, size = SAMPLE_SIZE, replace = TRUE)
Social_Media_Hours <- round(runif(SAMPLE_SIZE, min = 0, max = 5), 1)
Physical_Exercise_Hours <- round(runif(SAMPLE_SIZE, min = 0, max = 3), 1)
Daily_Study_Hours <- round(runif(SAMPLE_SIZE, min = 0, max = 6), 1)
Stress_Level <- round(rnorm(SAMPLE_SIZE, mean = 5, sd = 2))
Monthly_Expenses <- round(rnorm(SAMPLE_SIZE, mean = 1500, sd = 300))
Income_Level <- round(rnorm(SAMPLE_SIZE, mean = 2500, sd = 500))
Num_Online_Courses_Taken <- sample(0:10, size = SAMPLE_SIZE, replace = TRUE)

# Generate *categorical* variables
Favorite_Genre <- sample(c("Action", "Comedy", "Drama"), 
                         size = SAMPLE_SIZE, replace = TRUE, prob = c(0.3, 0.4, 0.3))
Career_Track <- sample(c("DataScientist", "WebDev", "Manager", "Freelancer"),
                       size = SAMPLE_SIZE, replace = TRUE, prob = c(0.3, 0.3, 0.2, 0.2))


Binary_Status <- sample(c("Yes", "No"), 
                        size = SAMPLE_SIZE, replace = TRUE, 
                        prob = c(0.2, 0.8))

# Constrain Stress_Level to be within 1-10
Stress_Level[Stress_Level < 1] <- 1
Stress_Level[Stress_Level > 10] <- 10

# Combine into a data frame
student_data <- data.frame(
  Age,
  Social_Media_Hours,
  Physical_Exercise_Hours,
  Daily_Study_Hours,
  Stress_Level,
  Monthly_Expenses,
  Income_Level,
  Num_Online_Courses_Taken,
  Favorite_Genre,
  Career_Track,
  Binary_Status
)

# Convert relevant variables to factor explicitly
student_data$Favorite_Genre <- factor(student_data$Favorite_Genre)
student_data$Career_Track   <- factor(student_data$Career_Track)
student_data$Binary_Status  <- factor(student_data$Binary_Status)

# Inspect the dataset
str(student_data)
head(student_data)
table(student_data$Binary_Status)

# If desired, save dataset 
# write.csv(student_data, "student_data_with_binary.csv", row.names = FALSE)