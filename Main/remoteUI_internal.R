

bootstrapPage(
    tags$style(type = "text/css", "html, body {width:100%;height:100%}, .selectize-input { padding: 2px; min-height: 0;} #country_selection + div>.selectize-dropdown{width: 30px !important;}"), #note w/o this line, the code functions but content below doesn't start appearing then, just a grey screen
    
    
    ##the Main Map: 
    #leafletOutput("themainmap", width = "100%", height = "100%") #,
