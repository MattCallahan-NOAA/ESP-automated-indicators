library(httr)
#from Abigail Tyrell's AKesp package
get_esp_data <- function(stock) {
  base_url <- "https://apex.psmfc.org/akfin/data_marts/akmp/esp_indicators?intended_esp="
  stock_url <- stock %>%
    stringr::str_replace_all(" ", "%20")
  
  url <- paste0(base_url, stock_url)
  
  data <- httr::content(httr::GET(url),
                        type = "application/json"
  ) %>%
    dplyr::bind_rows()
  
  return(data)
}

#heatwave
data<-get_esp_data("Alaska Sablefish")%>%
  filter(INDICATOR_NAME=="Annual_Heatwave_GOA_Model" )

unique(data$PRODUCT_DESCRIPTION)

#chlorophyll
data <- httr::content(httr::GET("https://apex.psmfc.org/akfin/data_marts/akmp/esp_indicators?"),
                      type = "application/json"
) %>%
  dplyr::bind_rows()

unique(data$INDICATOR_NAME)
"Spring_Chlorophylla_Biomass_SMBKC_Satellite"
"Spring_Chlorophylla_Biomass_WCGOA_Satellite"
"Spring_Chlorophylla_Peak_WCGOA_Satellite" 
"Spring_Chlorophylla_Biomass_SEBS_Inner_Shelf_Satellite" 
"Spring_Chlorophylla_Biomass_EGOA_Satellite"                            
"Spring_Chlorophylla_Biomass_SEBS_Satellite"                            
"Spring_Chlorophylla_Peak_EGOA_Satellite"                               
"Spring_Chlorophylla_Peak_SEBS_Satellite"

data2<-data%>%filter(grepl('Chlorophylla', INDICATOR_NAME))
unique(data2$CONTACT)
unique(data2$PRODUCT_DESCRIPTION)
