

``` r
pkgs = c("sf", "tidyverse", "ggrepel")
# Install packages if not already installed
new_pkgs = pkgs[!pkgs %in% installed.packages()[, "Package"]]
if(length(new_pkgs) > 0) {
  install.packages(new_pkgs)
}
for(pkg in pkgs) {
  library(pkg, character.only = TRUE)
}
```

``` r
transport_authorities = read_sf("transport_authorities.geojson")
names(transport_authorities)
```

    [1] "name"     "geometry"

``` r
nrow(transport_authorities)
```

    [1] 80

``` r
transport_authorities$name
```

     [1] "Bedford"                                           
     [2] "Blackburn with Darwen"                             
     [3] "Blackpool"                                         
     [4] "Bournemouth, Christchurch and Poole"               
     [5] "Bracknell Forest"                                  
     [6] "Brighton and Hove"                                 
     [7] "Buckinghamshire"                                   
     [8] "Cambridgeshire and Peterborough Combined Authority"
     [9] "Central Bedfordshire"                              
    [10] "Cheshire East"                                     
    [11] "Cheshire West and Chester"                         
    [12] "Cornwall"                                          
    [13] "Cumbria"                                           
    [14] "Derby"                                             
    [15] "Derbyshire"                                        
    [16] "Devon"                                             
    [17] "Dorset"                                            
    [18] "East Riding of Yorkshire"                          
    [19] "East Sussex"                                       
    [20] "Essex"                                             
    [21] "Gloucestershire"                                   
    [22] "Greater London"                                    
    [23] "Greater Manchester Combined Authority"             
    [24] "Hampshire"                                         
    [25] "Herefordshire"                                     
    [26] "Hertfordshire"                                     
    [27] "Isle of Wight"                                     
    [28] "Isles of Scilly"                                   
    [29] "Kent"                                              
    [30] "Kingston upon Hull"                                
    [31] "Lancashire"                                        
    [32] "Leicester"                                         
    [33] "Leicestershire"                                    
    [34] "Lincolnshire"                                      
    [35] "Liverpool City Region Combined Authority"          
    [36] "Luton"                                             
    [37] "Medway"                                            
    [38] "Milton Keynes"                                     
    [39] "Norfolk"                                           
    [40] "North East Joint Transport Committee"              
    [41] "North East Lincolnshire"                           
    [42] "North Lincolnshire"                                
    [43] "North Northamptonshire"                            
    [44] "North Somerset"                                    
    [45] "North Yorkshire"                                   
    [46] "Nottingham"                                        
    [47] "Nottinghamshire"                                   
    [48] "Oxfordshire"                                       
    [49] "Plymouth"                                          
    [50] "Portsmouth"                                        
    [51] "Reading"                                           
    [52] "Rutland"                                           
    [53] "South Yorkshire Combined Authority"                
    [54] "Shropshire"                                        
    [55] "Slough"                                            
    [56] "Somerset"                                          
    [57] "Southampton"                                       
    [58] "Southend-on-Sea"                                   
    [59] "Staffordshire"                                     
    [60] "Stoke-on-Trent"                                    
    [61] "Suffolk"                                           
    [62] "Surrey"                                            
    [63] "Swindon"                                           
    [64] "Tees Valley Combined Authority"                    
    [65] "Telford and Wrekin"                                
    [66] "Thurrock"                                          
    [67] "Torbay"                                            
    [68] "Warrington"                                        
    [69] "Warwickshire"                                      
    [70] "West Berkshire"                                    
    [71] "West Midlands ITA"                                 
    [72] "West Northamptonshire"                             
    [73] "West of England Combined Authority"                
    [74] "West Sussex"                                       
    [75] "West Yorkshire Combined Authority"                 
    [76] "Wiltshire"                                         
    [77] "Windsor and Maidenhead"                            
    [78] "Wokingham"                                         
    [79] "Worcestershire"                                    
    [80] "York"                                              

``` r
# ggplot2 with ggrepel for name labels
ggplot(transport_authorities) +
  geom_sf() +
  geom_sf_text(aes(label = name), size = 3, nudge_y = 0.1, check_overlap = TRUE) +
  theme_minimal() +
  labs(title = "Transport Authorities in the UK")
```

![](README_files/figure-commonmark/transport_authorities_map-1.png)
