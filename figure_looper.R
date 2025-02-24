

db_map = read.csv('dbids_names.csv') %>% dplyr::select(Database,dbid) %>% drop_na()
db_list = list()
for ( i in c(2,3,4,5,6,7,10,11,12,13,14,15,17,18,19,20,22,23,25,26,27,28,29,30,31, 32,33,35,36,37,38,39,41,42,43)) {
  if (exists('nullloc')) {
    rm(nullloc)}
  if (exists('db_name')) {
    rm(db_name)}
  if (exists('db_specific')) {
    rm(db_specific)}
  if (exists('map_dups')) {
    rm(map_dups)}
  if (exists('db_spec_analymiss')) {
    rm(db_spec_analymiss)}
  if (exists('whereanaly')) {
    rm(whereanaly)}
  db_mapper = db_map %>% dplyr::filter(dbid == i)
  db_name = db_mapper$Database[[1]]
  db_specific = dups %>% dplyr::filter(databaseid == i) %>% group_by(siteid) %>% summarize(toString(unique(datasetid)),geog,sitename) %>% distinct()
  db_specific2 = dups %>% dplyr::filter(databaseid == i) %>% group_by(siteid) %>% summarize(toString(unique(datasetid)),geog,sitename) %>% distinct() %>% group_by(geog) %>% summarize(toString(unique(siteid)),toString(unique(sitename)))
  
  db_specific3 = dups %>% dplyr::filter(databaseid == i) %>% group_by(siteid) %>% summarize(toString(unique(datasetid)),geog,sitename) %>% distinct() %>% group_by(geog) %>% summarize(toString(unique(siteid)),toString(unique(sitename))) %>% ungroup() %>% dplyr::filter(!is.na(geog))
  
  if (length(db_specific3[[1]]) > 0) {
    coords3 = st_coordinates(st_centroid(st_as_sfc(hex2raw(db_specific3$geog),EWKB=TRUE)))
    db_specific3 = cbind(db_specific3,coords3) %>% ungroup() %>% dplyr::select(!geog)
    names(db_specific3) = c("siteids", "sitenames", "longitude","latitude")}
  
  notnullloc = db_specific2 %>% dplyr::filter(!is.na(geog))
  rm(db_sf)
  if(length(notnullloc[[1]]) > 0) {
    sfc = st_as_sfc(hex2raw(notnullloc$geog),EWKB=TRUE)
    
    db_sf = st_as_sf(notnullloc,geom=sfc) %>% dplyr::select(!geog)
    names(db_sf) = c("siteids","sitenames","geom")
  }
  nullloc = db_specific %>% dplyr::filter(is.na(geog)) %>% dplyr::select(!geog)
  names(nullloc) = c("siteid", "datasetids","sitename")
  
  if (exists("db_sf")) {
    pointSites = db_sf[st_geometry_type(db_sf) == "POINT",] 
    polySites = db_sf[st_geometry_type(db_sf) == "POLYGON",] 
    
    map_dups =  leaflet() %>%
      addTiles() %>%
      addPolygons(data = polySites, 
                  color = "red", 
                  weight = 5, 
                  fillColor = "orange", 
                  fillOpacity = 0.35, 
                  popup = ~sitenames)  %>%
      addCircleMarkers(data = pointSites, 
                       radius = 5, 
                       color = "blue", 
                       fillColor = "blue", 
                       fillOpacity = 0.5, 
                       stroke = FALSE, 
                       popup = ~sitenames)
    
    if(length(polySites[[1]]) > 0 | length(pointSites[[1]]) > 0) {
      assign(paste0("map_dups_",i),map_dups)}} else {
        map_dups = NULL
      }
  
  datatable(nullloc,rownames=FALSE)
  
  assign(paste0("dups_na_",i),nullloc)
  
  db_spec_analymiss = analy_missers_sf %>% dplyr::filter(databaseid==i)
  
  datatable(db_spec_analymiss)
  
  assign(paste0("analymiss_",i),db_spec_analymiss)
  
  
  
  pointSites_am = db_spec_analymiss[st_geometry_type(db_spec_analymiss) == "POINT",] 
  polySites_am = db_spec_analymiss[st_geometry_type(db_spec_analymiss) == "POLYGON",] 
  
  whereanaly = leaflet() %>%
    addTiles() %>%
    addPolygons(data = polySites_am, 
                color = "red", 
                weight = 5, 
                fillColor = "orange", 
                fillOpacity = 0.35, 
                popup = ~sitename)  %>%
    addCircleMarkers(data = pointSites_am, 
                     radius = 5, 
                     color = "blue", 
                     fillColor = "blue", 
                     fillOpacity = 0.5, 
                     stroke = FALSE, 
                     popup = ~sitename)
  
  if(length(polySites_am[[1]]) > 0 | length(pointSites_am[[1]]) > 0) {
    assign(paste0("whereanaly_",i),whereanaly)}
  
  db_spec_analymiss = db_spec_analymiss %>% dplyr::select(!c(databasename,databaseid)) %>% st_drop_geometry()
  specific_list = list(dbid=i,db_name=db_name,nulls = nullloc, dups = db_specific3, dup_map=map_dups,missing_analysis = db_spec_analymiss,map_missing_analysis = whereanaly)
  
  db_list = append(db_list,list(specific_list))
}