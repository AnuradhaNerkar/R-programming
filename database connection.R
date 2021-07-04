#Script to connect MySQL with R#

install.packages("DBI");

library(DBI);

install.packages("odbc");

require("odbc");

con <- dbConnect(odbc::odbc(), .connection_string = "Driver={MySQL ODBC 8.0 Unicode Driver};",Server="localhost",Database="university",UID="root",PWD="",Port=3306);

dbGetInfo(con)

dbListTables(con)

dbExecute(con,"SELECT * from department");

dbReadTable(con,"department")

res <- dbSendQuery(con, "SELECT avg(budget) from department");

dbColumnInfo(res)

dbFetch(res)

result <- dbSendQuery(con, "SELECT * from department");

df<-data.frame(dbFetch(result));

print(df);

con <- dbConnect(odbc::odbc(), .connection_string = "Driver={MySQL ODBC 8.0 Unicode Driver};",Server="localhost",Database="mtcars",UID="root",PWD="27062000",Port=3306);

dbListTables(con)

dbWriteTable(con, "mtcars",mtcars);

dbListTables(con)

dbWriteTable(con,"cars",cars)

dbListTables(con)

dbListFields(con,"mtcars")

dbReadTable(con,"mtcars")

res <- dbSendQuery(con, "SELECT * FROM mtcars WHERE cyl = 4");

dbFetch(res)

dbRemoveTable(con, "mtcars")

dbListTables(con)

dbDisconnect(con)



