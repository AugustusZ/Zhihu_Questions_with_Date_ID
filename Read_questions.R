library("RCurl")

# PREPARE ID LIST FROM http://www.zhihu.com/question/20415740
valid_date <- seq.Date(from = as.Date("1955-02-25"), by = "day", to = as.Date("2015-12-31"))
IDs <- gsub("-", "", as.character(valid_date))

# PREPARE DATA FRAME
QID <- character(0)
Question <- character(0)
Category <- character(0)
Questions <- data.frame(QID, Question, Category)

for (ID in IDs) {
  # READ HTML
  Q_url <- paste0("http://www.zhihu.com/question/", ID)
  if (url.exists(Q_url)) {
    Q_name_line <- as.character(read.delim(Q_url)[[1]][7])
    Q_name_line_split <- unlist(strsplit(Q_name_line, split=" - "))
    Questions <- rbind(Questions, data.frame(QID = ID, Question = Q_name_line_split[1], Category = Q_name_line_split[2]))
    rm(Q_name_line)
    rm(Q_name_line_split)  
  }
}

View(Questions)
write.csv(Questions, file = "Zhihu_Questions.csv")
