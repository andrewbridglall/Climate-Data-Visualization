
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$linePlot <- renderPlot({
    
    plot_data <- filter(monthly_temps,year<=input$currentYear)
    
    current_year <- input$currentYear
    current_monthly_temps <- filter(monthly_temps, year<= current_year)
    
    summary_anomaly_year <- summarize(group_by(current_monthly_temps, year), average = mean(temperature_anomaly,na.rm=T))
    
    max_anom_index <- which.max(summary_anomaly_year$average)
    max_anom_value <- summary_anomaly_year$average[max_anom_index]
    max_anom_year <- summary_anomaly_year$year[max_anom_index]
    
    
    ggplot(plot_data, aes(x=month, y=temperature_anomaly, color=temperature_anomaly, alpha=year-input$currentYear))+
      geom_line(aes(group=year, size =year == input$currentYear))+
      scale_size_manual(values=c(.5,2))+
      scale_color_gradientn(colors=rev(rainbow(2)),guide=F)+
      theme_minimal()+scale_x_discrete(name="Month", breaks=levels(monthly_temps$month)[seq(2,12,2)])+
      ylab("Temperature Anomaly in Degrees Celsius")+
      ggtitle(paste("Historical Temperature Anomalies \n From 1880 to",input$currentYear,"by Month"))+
      ylim(-.75,1.25)+theme(legend.position = "none", panel.grid = element_blank())+
      geom_hline(yintercept = max_anom_value, linetype = "dashed")
    
  })
  

  output$columnPlot <- renderPlot({
    
    current_monthly_temps <- filter(monthly_temps, year<= input$currentYear)
    
    plot_data <- summarize(group_by(current_monthly_temps, year), 
                           average = mean(temperature_anomaly,na.rm=T))
    
    ggplot(plot_data, aes(x=year, y=average, fill=average))+ 
      geom_col()+scale_fill_gradientn(colors=rev(rainbow(2)),guide=F)+theme_minimal()+
      ylim(-1,1)+
      labs(x="", y="")+
      scale_x_continuous(limits=c(1879,2017))+
      theme(legend.position = "none", panel.grid = element_blank(), panel.background = element_blank())
    
  })
  
  
})
