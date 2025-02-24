
length_analysisunits = content(GET("https://api.neotomadb.org/v2.0/data/dbtables/analysisunits?count=true"))$data
if (is.null(length_analysisunits)) {
  length_analysisunits = content(GET("https://api.neotomadb.org/v2.0/data/dbtables/analysisunits?count=true"))$data
}

num_reps = ceiling(as.numeric(length_analysisunits[[1]]$count)/80000)

analysisunits = list()
for (i in seq(num_reps)) {
  start= (i-1)*80000
  end = i*80000
  newnits = content(GET(paste0("https://api.neotomadb.org/v2.0/data/dbtables/analysisunits?count=false&offset=",start,"&limit=",end)))$data
  
  analysisunits = append(analysisunits,newnits)
}


analysis_mat = matrix(nrow=length(analysisunits),ncol=11)

for (i in seq(length(analysisunits))) {
  for(j in seq(11) ) {
    if (!is.null(analysisunits[[i]][[j]])) {
      analysis_mat[i,j] = analysisunits[[i]][[j]]
    }}}


analysis_df = as.data.frame(analysis_mat)


names(analysis_df) = c("analysisunitid","collectionunitid","analysisunitname","depth","thickness","faciesid","mixed","igsn","notes","datecreated","datemodified")