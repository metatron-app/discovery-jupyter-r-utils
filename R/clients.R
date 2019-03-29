library(jsonlite)
library(httr)

# Construct the URL for a metatron endpoint.
client.url <- function(host = "localhost", port = 80) {
  paste("http://", host, ":", port, sep="")
}
# Get raw data (json format) of selected chart
charts.get <- function(url = client.url(), did, limit) {
  req = httr::POST(paste(url, "/api/widgets/", did, "/data?limit=", limit, sep=""))
  jsonlite::fromJSON(httr::content(req, "text"))
}
# Get raw data (json format) of selected dashboard
dashboards.get <- function(url = client.url(), did, limit) {
  req = httr::POST(paste(url, "/api/dashboards/", did, "/data?limit=", limit, sep=""))
  jsonlite::fromJSON(httr::content(req, "text"))
}
# Get raw data (json format) of selected datasource
datasources.get <- function(url = client.url(), did, limit) {
  req = httr::POST(paste(url, "/api/datasources/", did, "/data?limit=", limit, sep=""))
  jsonlite::fromJSON(httr::content(req, "text"))
}
# Print out JSON Object
response.write <- function(json_object) {
  cat("<response>")
  cat(toJSON(json_object))
  cat("</response>")
}
