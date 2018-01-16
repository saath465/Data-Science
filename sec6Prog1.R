#Section 6 Lec 2
# factors

movie <- read.csv(file.choose())
head(movie)

colnames(movie) <- c("film", "Genre", "Cri_Rat", "Aud_Rat", "Budget_Mil", "year")

summary(movie)
 factor(movie$year)

 movie$year <- factor(movie$year)
 summary(movie)
 
 #-------------------Adding Aesthetics to the graph----------
 library(ggplot2)
 ggplot(data = movie,
        aes(x =  Cri_Rat, y = Aud_Rat, color = Genre, size = Budget_Mil)) + geom_point()

 #-------------------Plotting with layers----------
 #create an object for the graph
  Pl <-  ggplot(data = movie,aes(x =  Cri_Rat, y = Aud_Rat, color = Genre, size = Budget_Mil))
 
 #adding layers to the plot
 Pl + geom_line() + geom_point()
 
 
 #---------------playing with aesthetics--> Overriding--------------
 
 ql <-  ggplot(data = movie,aes(x =  Cri_Rat, y = Aud_Rat, color = Genre, size = Budget_Mil))
 
 #overriding 
 ql + geom_point(aes(color=Budget_Mil))
 
 ql + geom_line(size=1) + geom_point()
 
 #-------------Histograms and Density charts-------------
 #create a new graph object
 
 G <- ggplot(data = movie, aes(x = Cri_Rat, y = Aud_Rat))
G + geom_point() 

# histogram 
s <- ggplot(data = movie, aes(x = Budget_Mil))
s + geom_histogram(binwidth = 8, aes(fill = Genre), color = "Black")

#example 2 Density Chart
s <- ggplot(data = movie, aes(x = Aud_Rat))
s + geom_density(aes(fill = Genre), position = "stack")


#-----------------------------Box plots---------------
u <- ggplot(data=movie, aes(x=Genre, y=Aud_Rat, color = Genre))
u + geom_boxplot(size = 1)

#Layering

u + geom_boxplot(size = 1) + geom_point()

#testing jitter
 u + geom_jitter() + geom_boxplot(size = 1, alpha = 0.4)
 
 #--------------Facets----------------------
 #creating multiple plots
 
v <- ggplot(data = movie, aes(x = Budget_Mil))
v <- geom_histogram(binwidth=8, aes(fill=Genre), color="Black")

#add facet Grid
v + geom_histogram(binwidth = 8, aes(fill = Genre), color = "Black") + facet_grid(Genre~., scales = "free")


# facet for scatter plots

w <- ggplot(data = movie, aes(x = Cri_Rat, y = Aud_Rat))
w + geom_point(aes(color=Genre,size=Budget_Mil)) + facet_grid(Genre~year) + geom_smooth()



#-------------------- co-ordinates- ---------------------
#setting coordinates
#zoom functions
# see notes , do not use xlim and ylim directly.
w + geom_point(aes(color=Genre,size=Budget_Mil)) + facet_grid(Genre~year) + geom_smooth() + coord_cartesian(ylim = c(0,100))

#--------------------Themes---------------------v \
new_bud <- ggplot(data = movie, aes(x = Budget_Mil))
new_bud_h<- new_bud + geom_histogram(binwidth=8, aes(fill=Genre), color="Black")

#setting the themes
new_bud_h + xlab("Money") + ylab("Movies in Numbers") + ggtitle("Movie Budget") + theme(axis.title.x = element_text(color = "Green",size = 30),
                  axis.title.y = element_text(color = "Red", size = 30),
                  axis.text.x = element_text(size = 20),
                  axis.text.y = element_text(size = 20),
                  plot.title = element_text(colour = "Blue", size = 40, family = "courier"),
                  legend.title = element_text(size = 20),
                  legend.text = element_text(size = 20),
                  legend.position = c(1,1),
                  legend.justification = c(1,1))



