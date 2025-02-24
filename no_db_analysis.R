

joiner = dslinks_df %>% left_join(sites_df, by = join_by(siteid)) %>% left_join(datasetdatabases_df, by = join_by(datasetid)) %>% left_join(constituentdatabases_df) 

dups = joiner %>% group_by(siteid) %>% summarize(toString(unique(datasetid))) %>% left_join(sites_df) %>% group_by(geog) %>% count() %>% dplyr::filter(n>1) %>% left_join(joiner)

missers = sites_df %>% left_join(collectionunits_df,by=join_by(siteid)) %>% left_join(datasets_df,by=join_by(collectionunitid))  %>% left_join(datasetdatabases_df, by = join_by(datasetid)) %>% left_join(constituentdatabases_df) %>% dplyr::filter(is.na(collectionunitid) | is.na(datasetid)) %>% dplyr::select(c(siteid,sitename,collectionunitid,datasetid,databasename,databaseid,geog))


m_sfc = st_as_sfc(hex2raw(missers$geog),EWKB=TRUE)
missers_sf = st_as_sf(missers,geom=m_sfc) %>% dplyr::select(!geog)


missers_sf = missers_sf %>% dplyr::mutate(whatmiss = case_when(
  is.na(datasetid) & is.na(collectionunitid) ~ paste0(sitename, " missing: dataset + collectionunit"),
  is.na(datasetid) & !is.na(collectionunitid) ~ paste0(sitename, " missing: dataset"),
  !is.na(datasetid) & is.na(collectionunitid) ~ paste0(sitename, " missing: collectionunit"),
  !is.na(datasetid) & !is.na(collectionunitid) ~ paste0("none missing from ",sitename)))


pointSites_m = missers_sf[st_geometry_type(missers_sf) == "POINT",] 
polySites_m = missers_sf[st_geometry_type(missers_sf) == "POLYGON",] 


analy_missers = sites_df %>% left_join(collectionunits_df,by=join_by(siteid)) %>% left_join(analysis_df, by=join_by(collectionunitid)) %>% left_join(datasets_df,by=join_by(collectionunitid))  %>% left_join(datasetdatabases_df, by = join_by(datasetid)) %>% left_join(constituentdatabases_df) %>% dplyr::filter(is.na(analysisunitid)) %>% dplyr::select(c(siteid,sitename,collectionunitid,datasetid,databasename,databaseid,analysisunitid, geog)) 


am_sfc = st_as_sfc(hex2raw(analy_missers$geog),EWKB=TRUE)
analy_missers_sf = st_as_sf(analy_missers,geom=am_sfc) %>% dplyr::select(!geog)


analy_missers_nodb = analy_missers_sf %>% dplyr::filter(is.na(databaseid))
