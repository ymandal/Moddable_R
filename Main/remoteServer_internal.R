#1) Loading the map for the interface
  output$themainmap <- renderLeaflet(  #leaflet map the way you want, requires 
    {leaflet::leaflet() %>% addTiles(group = "Detailed") %>% addProviderTiles(provider = providers$Stadia.StamenToner, group = "Dark",   #(learned the zoom and nativezoom options in a gis stackexchange)
                                                                              options = providerTileOptions(maxNativeZoom=20,maxZoom=100)) %>%  #these zoom options were supposed to set it so that if user zooms past 20, they just see blown up 20-level tiles rather than trying to load up more tiles. You've set it to work this way if they load up to 100-level zoom (but really only need to go to like 22 or smthg since I don't think leaflet goes beyond 22) 
        leaflet::addProviderTiles(providers$CartoDB.Positron, group = "Light") %>%
        leaflet::addProviderTiles(providers$Stadia.StamenTerrain, group = "Terrain") %>%
        leaflet::setView(-36,38, zoom = 3) %>%    #Note, in future you want to set this 3 as the max zoom level too
        addLayersControl(baseGroups = c("Dark", "Light", "Detailed", "Terrain"),
                         options = layersControlOptions(collapsed = FALSE)) 
      #%>% leaflet::showGroup("Simplified") #this sets the group that you'll show, but having to do it for all statements dealing w leafletproxy below is exhausting, and could interfere with user's actions if they press a button and I take away from the tile style that they keep wanting to use (so I'll set the stamen toner as default by listing it first instead, no work-around available really)
    }) #curly brackets for expression to sort out your map
