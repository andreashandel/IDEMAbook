#making a hex sticker for the book

library('hexSticker')
library('ggplot2')
library('here')

#ggplot2 example
#p <- ggplot(aes(x = mpg, y = wt), data = mtcars) + geom_point()
#img <- p + theme_void() + theme_transparent()
#sticker(img, package="MADA Course", p_size=20, s_x=1, s_y=.75, s_width=1.3, s_height=1, filename= here('media',"MADAlogo.png"))


#img <- here('media',"IDEMAimage.png")
img <- "R0scheme.png"
sticker(img, package="IDEMA", p_size=20, p_y = 1.5, p_color ="#f0af7a",
                                   s_x=0.9, s_y=1, s_width=0.7, s_height=0.7, filename="IDEMABlogo.png", 
                                   h_fill = "#bcd2f5", h_color = "#7aa8f0")
