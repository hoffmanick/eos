---
title: "Neotoma's Human Records"
author: "Nick Hoffman"
date: "October 31st 2023"
output:
  html_document:
    df_print: paged
    highlight: pygment
    keep_md: yes
    number_sections: no
    theme: journal
editor_options:
    chunk_output_type: inline
---

<style type="text/css">
p {
  font-size:18px;
}

ul {
  font-size:18px;
}

li {
  font-size:18px;
}
table {
   padding: 0;border-collapse: collapse;
   layout: fixed;
   width: 90%; }
table tr {
   border-top: 1px solid #cccccc;
   background-color: white;
   margin: 0;
   padding: 0; }
table tr:nth-child(2n) {
   background-color: #f8f8f8; }
table tr th {
   font-weight: bold;
   border: 1px solid #cccccc;
   margin: 0;
   padding: 6px 13px; }
table tr td {
   border: 1px solid #cccccc;
   margin: 0;
   padding: 6px 13px; }
table tr th :first-child, table tr td :first-child {
   margin-top: 0; }
table tr th :last-child, table tr td :last-child {
   margin-bottom: 0; }
.html-widget {
    margin: auto;
}
</style>

---

This document shows what records of Homo sapiens I was able to find in Neotoma. My method was first to download the entire "taxa" table (46,302 rows) and find the taxonid for any relevant sounding taxa. The first table below shows the taxa I found.



```{=html}
<div class="datatables html-widget html-fill-item-overflow-hidden html-fill-item" id="htmlwidget-97c0e5595b7301129da9" style="width:100%;height:auto;"></div>
<script type="application/json" data-for="htmlwidget-97c0e5595b7301129da9">{"x":{"filter":"none","vertical":false,"data":[["6116","6821","6822","7196"],["Homo sapiens","Homo","Hominidae","cf. Homo sapiens"],["6821","6822","6359","6171"],["FALSE","FALSE","FALSE","TRUE"]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th>taxonid<\/th>\n      <th>taxonname<\/th>\n      <th>highertaxonid<\/th>\n      <th>extinct<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"columnDefs":[],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script>
```

(FYI, taxonid 6359 is Primates, and 6171 is Mammalia)

Then I searched for all occurrences of any of those taxa. 

The map below shows the sites they come from, and the table below that shows the sample information on those 28 human samples I found.

![](neoHomo_files/figure-html/occurrences-1.png)<!-- -->
```{=html}
<div class="datatables html-widget html-fill-item-overflow-hidden html-fill-item" id="htmlwidget-b71506c6957e8a8b9103" style="width:100%;height:auto;"></div>
<script type="application/json" data-for="htmlwidget-b71506c6957e8a8b9103">{"x":{"filter":"none","vertical":false,"data":[["10701973","10702024","10753226","5744545","6114933","6487625","6555181","6599214","6898066","9571220","9571221","8417492","8417619","8417620","9592405","9591858","8418001","8417538","8418169","8418444","8418541","10714599","10715912","10715913","10715918","962924","964550","926195"],["Homo sapiens","Homo sapiens","Homo sapiens","Homo sapiens","Homo sapiens","Homo sapiens","Homo sapiens","Homo sapiens","Homo sapiens","Homo sapiens","Homo sapiens","Homo sapiens","Homo sapiens","Homo sapiens","Homo sapiens","Homo sapiens","Homo sapiens","Homo sapiens","Homo sapiens","Homo sapiens","Homo sapiens","Homo sapiens","Homo sapiens","Homo sapiens","Homo sapiens","cf. Homo sapiens","cf. Homo sapiens","cf. Homo sapiens"],["1","10","10","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","2"],["NISP","NISP","NISP","present/absent","present/absent","present/absent","present/absent","present/absent","present/absent","NISP","NISP","NISP","NISP","NISP","NISP","NISP","NISP","NISP","NISP","NISP","NISP","presence/absence","NISP","NISP","NISP","present/absent","present/absent","NISP"],["4225","4225","11750","9580","1830","1250","4720","4500","1625","-2000","-2000","7444","8250","7750","9280","-5500","5450","4450","-4000","-3000","-3600","6480","-1650","-1800","-1400","1170","2200","1990"],["150","150","1380","9330","1850","1275","3950","3800","1817","-1700","-1700","6800","7550","7550","8610","-5000","3950","4150","-1700","-2100","1300","4500","-1300","-1650","-1300","1170","1650","1880"],["55876","55876","55949","41179","41541","42003","42640","42666","44726","52491","52491","48820","48824","48824","52576","52572","48828","48822","48830","48832","48834","55899","55908","55908","55908","7474","7638","5083"],["29362","29362","29397","23777","23927","24130","24231","24239","25894","28207","28207","27290","27290","27290","28237","28235","27293","27291","27294","27295","27296","29374","29380","29380","29380","6119","6284","4002"],["Cuatro Cienegas","Cuatro Cienegas","Frightful Cave","Kennewick Man Site","Eaton Ferry Cemetery [31Wr4b]","The East St. Louis Stone Quarry Site Cemetery [11-S-468]","Port au Choix Site [EeBi-2]","Nevin [40.1]","22OK904","Marki Alonia","Marki Alonia","Aktopraklık","Aktopraklık","Aktopraklık","Nevali Cori","Uğurlu Höyük","Bakla Tepe","Bademağacı","İkiztepe","Titriş Höyük","Ya'amun","Tepexpan","Tell Atchana","Tell Atchana","Tell Atchana","Butcher [23CL118]","Burkemper [23LN104]","Naze [32SN246]"],["PaleoVertebrates of Latin America","PaleoVertebrates of Latin America","PaleoVertebrates of Latin America","Faunal Isotope Database","Faunal Isotope Database","Faunal Isotope Database","Faunal Isotope Database","Faunal Isotope Database","Faunal Isotope Database","Neotoma","Neotoma","Faunal Isotope Database","Faunal Isotope Database","Faunal Isotope Database","Faunal Isotope Database","Faunal Isotope Database","Faunal Isotope Database","Faunal Isotope Database","Faunal Isotope Database","Faunal Isotope Database","Faunal Isotope Database","PaleoVertebrates of Latin America","Faunal Isotope Database","Faunal Isotope Database","Faunal Isotope Database","FAUNMAP","FAUNMAP","FAUNMAP"]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th>occid<\/th>\n      <th>taxonname<\/th>\n      <th>value<\/th>\n      <th>sampleunits<\/th>\n      <th>ageolder<\/th>\n      <th>ageyounger<\/th>\n      <th>datasetid<\/th>\n      <th>siteid<\/th>\n      <th>sitename<\/th>\n      <th>database<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"columnDefs":[],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script>
```

I think there must be different conventions going on here for the age ranges. All the negative age values haven't happened yet, if they're meant to correspond to "number of years before 1950." 


Below I just separate out the sites that have polygon-shapes when I searched for them with the occurrence API, out of curiosity...

![](neoHomo_files/figure-html/polygons-1.png)<!-- -->![](neoHomo_files/figure-html/polygons-2.png)<!-- -->![](neoHomo_files/figure-html/polygons-3.png)<!-- -->
