library(jsonlite)
library(httr)

# Construct the URL for a metatron endpoint.
client.url <- function(host = "localhost", port = 80) {
  paste("http://", host, ":", port, sep="")
}
client.full.url <- function(url = "http://localhost:80") {
  paste(url)
}

set_params <- function(...){
  return(as.list(match.call())[-1])
}

# Get raw data (json format) of selected chart
charts.get <- function(url = client.url(), did, ...) {
  api_params <- c(...)
  api_url <- paste(url, "/api/widgets/", did, "/data", sep="")

  req = httr::POST(
    url = api_url,
    query = api_params
  )
  jsonlite::fromJSON(httr::content(req, "text"))
}
# Get raw data (json format) of selected dashboard
dashboards.get <- function(url = client.url(), did, ...) {
  api_params <- c(...)
  api_url <- paste(url, "/api/dashboards/", did, "/data", sep="")

  req = httr::POST(
    url = api_url,
    query = api_params
  )
  jsonlite::fromJSON(httr::content(req, "text"))
}
# Get raw data (json format) of selected datasource
datasources.get <- function(url = client.url(), did, ...) {
  api_params <- c(...)
  api_url <- paste(url, "/api/datasources/", did, "/data", sep="")

  req = httr::POST(
    url = api_url,
    query = api_params
  )
  jsonlite::fromJSON(httr::content(req, "text"))
}
# Print out JSON Object
response.write <- function(json_object) {
  cat("<response>")
  cat(toJSON(json_object))
  cat("</response>")
}
