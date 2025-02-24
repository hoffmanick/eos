
tables = c("dslinks","sites", "datasetdatabases","constituentdatabases","collectionunits","datasets")


for (i in seq(length(tables))) {
  
  table = tables[[i]]
  dslinks = content(GET(paste0("https://api.neotomadb.org/v2.0/data/dbtables?table=",table,"&limit=75000&offset=0")))$data
  
  
  dsl_df = matrix(nrow=length(dslinks),ncol=length(dslinks[[1]]))
  
  for (j in seq(1,length(dslinks))) {
    for (k in seq(length(dslinks[[1]]))) {
      if (!is.null(dslinks[[j]][[k]])) {
        dsl_df[j,k] = dslinks[[j]][[k]]
      }
    }
  }
  
  dsl_df = as.data.frame(dsl_df)
  
  names(dsl_df) = names(dslinks[[1]]) 
  
  assign(paste0(table,"_df"), dsl_df)
}

sites_df = sites_df %>% dplyr::mutate(siteid = as.numeric(siteid))

collectionunits_df = collectionunits_df %>% dplyr::mutate(siteid = as.numeric(siteid))
dslinks_df = dslinks_df %>% dplyr::mutate(datasetid=as.character(datasetid))
