##' swissinfo.ch's chart theme
##'
##' swi_theme(): ggplot copied/inspired from https://gist.github.com/hrbrmstr/283850725519e502e70c
##'
##' @name theme_swi
##' @param y_gridlines, a logical display y gridlines?
##' @param title_family, a string typeface for title
##' @param subtitle_family, a string typeface for subtitle
##' @param base_color, a colour string used for the axis lines
##' @import ggplot2  
##' @importFrom extrafont loadfonts choose_font
##' @inheritParams ggplot2::theme_minimal
##' @export
##' @examples
##' require(ggplot2)
##' require(swiTheme)
##' 
##' # swi_theme() with annotations
##' 
##' gg <- qplot(1:10, 1:10) + swi_theme()
##' # add y-axis label 
##' gg <- gg + geom_label(aes(x = 0, y = 10, label="y label text"),
##'   family = "OpenSans-CondensedLight", size=3.5, 
##'   hjust=0, label.size=0, color="#2b2b2b")
##' # basic axis scale and breaks
##' gg <- gg + scale_x_continuous(expand=c(0,0), breaks = seq(0, 10, by=2), 
##'   labels = seq(0, 10, by=2), limits=c(0, 10.2), name = NULL)
##' gg <- gg + scale_y_continuous(expand=c(0,0.3), breaks=seq(1, 10, by=1), limits=c(0, 10.2))
##' # footnote / caption / subtitle
##' caption <- "Note: Vacancies are counted as the number of days between a justice's death, retirement or resignation and the successor justice's swearing in (or commissioning in the case of a recess appointment) as a member of the court.Sources: U.S. Senate, 'Supreme Court Nominations, present-1789'; Supreme Court, 'Members of the Supreme Court of the United States'; Pew Research Center calculations"
##' caption  <- paste0(strwrap(caption, 160), sep="", collapse="\n")
##' subtitle <- "Here is a subtitle text. It describes what is displayed in the chart. It can mention many important details to under the graphic."
##' subtitle  <- paste0(strwrap(subtitle, 160), sep="", collapse="\n") 
## # Define the axis labels, footnote and subtitle
##' gg <- gg + labs(x=NULL, y=NULL, title="This is a title, choose it wisely",
##' subtitle=subtitle, caption=caption)
##' #annotations TODO !!!!
##' 

swi_theme <- function(
  base_size = 15,
  base_family = "OpenSans-CondensedLight", 
  title_family = "OpenSans-CondensedBold",
  subtitle_family = "OpenSans-CondensedLight",
  y_gridlines = TRUE,
  base_color = "#2b2b2b") {
  
  ret <- theme_minimal(base_family = base_family, base_size = base_size)
  ret <- ret + theme(panel.grid=element_line())
  if(y_gridlines) {
    ret <- ret + theme(
      panel.grid.major.y=element_line(color="#2b2b2b", linetype="dotted", size=0.15),
      axis.ticks.y=element_blank(),
      axis.text.y=element_text(margin=margin(r=-5))
      )    
  }
  else {
    ret <- ret + theme(panel.grid.major.y=element_blank())
    ret <- ret + theme(axis.ticks.y = element_line(color=base_color, size=0.25))
  }
  ret <- ret + theme(panel.grid.major.x=element_blank())
  ret <- ret + theme(panel.grid.minor.x=element_blank())
  ret <- ret + theme(panel.grid.minor.y=element_blank())
  ret <- ret + theme(axis.line=element_line())
  ret <- ret + theme(axis.line.y=element_blank())
  ret <- ret + theme(axis.line.x=element_line(color=base_color, size=0.15))
  ret <- ret + theme(axis.ticks=element_line())
  ret <- ret + theme(axis.ticks.x=element_line(color=base_color, size=0.15))

  ret <- ret + theme(axis.ticks.length=unit(5, "pt"))
  ret <- ret + theme(plot.margin=unit(c(0.3, 0, 0.3, 0), "cm"))
  ret <- ret + theme(plot.title=element_text(family = title_family, size = base_size * 1.5, margin=margin(b=13)))
  ret <- ret + theme(plot.subtitle=element_text(family = subtitle_family, color = '#4A4A4A'))
  ret <- ret + theme(plot.caption=element_text(size = base_size * 0.8, hjust=0, margin=margin(t=13), color = '#737373'))
  ret
}

##' swissinfo.ch theme for ggplot2
##'
##' swi_dark_map, a dark theme for maps with no axis, no ticks, no axis text, no grid lines
##'
##' @rdname theme_swi
##' @inheritParams theme_swi
##' @param bg.colour a string the colour of the chart background
##' @param colour a string the colour for text
##' @examples
##' 
##' # swi_dark_map
##' \dontrun{
##' qplot(1:10, 1:10, size = 10:1, color = I("red")) + 
##' swi_dark_map() + 
##' labs(title = "A dark map theme: no grid lines, no axes, no ticks", subtitle = "A subtitle")
##' }
##' @export
swi_dark_map <- function(
  base_size = 15, 
  base_family = "OpenSans-CondensedLight",
  title_family = "OpenSans-CondensedBold", 
  subtitle_family = "OpenSans-CondensedLight",
  bg.colour = '#1a0000', 
  colour = '#ffffff'
) {
  ret <- theme_minimal(base_family = base_family, base_size = base_size)
  ret <- ret + 
    theme(
      # PANEL, PLOT, AXIS & GRID
      panel.background = element_rect(fill = bg.colour, size = 0, color = bg.colour),
      panel.border = element_blank(),
      plot.background = element_rect(fill = bg.colour, size = 0, color = bg.colour),
      axis.line = element_blank(),
      axis.ticks = element_blank(), 
      axis.title = element_blank(), 
      axis.text = element_blank(),
      panel.grid.major=element_blank(),
      panel.grid.minor=element_blank(),
      plot.margin = unit(c(0.2, 0.2, 0, 0), "cm"),
      # TEXT & LEGEND
      plot.title = element_text(family = title_family, size = base_size * 1.4, margin=margin(b=13), colour = colour),
      plot.subtitle = element_text(family = subtitle_family, color = colour),
      plot.caption = element_text(size = base_size * 0.8, hjust=0, margin=margin(t=13), color = '#e6e6e6'),
      legend.text = element_text(colour = colour, size = base_size, hjust = 1),
      legend.title = element_text(colour = colour, size = base_size * 1.1),
      legend.key.width = unit(1.4, "lines"),
      legend.key.height = unit(0.6, "lines"),
      legend.position = "top",
      legend.title.align = 0,
      strip.text = element_text(family = title_family, colour = "#ffe6e6", size = 14)
    ) 
  ret
}



##' swissinfo.ch's chart theme
##'
##' swissinfo minimal font and color ggplot2 theme
##'
##' @rdname theme_swi
##' @param ticks \code{logical} Show axis ticks?
##' @param base_size Base font size
##' @param base_family Base font family
##' @import ggplot2 
##' @importFrom grid unit
##' @importFrom extrafont loadfonts choose_font
##' @export
##' @examples
##' 
##' qplot(1:10, 1:10, size = 10:1) + xlab("axis x label") + ylab ("y axis label") + theme_swi()
##' qplot(mtcars$mpg) + theme_swi()
##'
##'
theme_swi <- function(ticks=TRUE, base_family="Open Sans", base_size=11) {
  choose_font(base_family, FALSE)
  ret <- theme_minimal(base_family=base_family, base_size=base_size) +
    theme(
      plot.title   = element_text(hjust = 0, vjust = 5, size = rel(2), face = "bold"),
      axis.title.x = element_text(hjust = 1, vjust = 0, size = rel(1.6)),
      axis.title.y = element_text(vjust = 1, hjust = 1, size = rel(1.6)),
      axis.line         =  element_line(linetype = "solid", size = 0.1),
      plot.margin = unit(c(2, 1, 1, 1), "lines"),
      panel.grid = element_blank()
    )
  if (!ticks) {
    ret <- ret + theme(axis.ticks = element_blank())
  }
  ret
}

##' swissinfo.ch scatter plot theme for ggplot2
##'
##' theme_swiYLines: a ggplot2 theme with horizontal grid lines
##'
##' @rdname theme_swi
##' @inheritParams theme_swi
##' @param axisColor the color for the axis and their ticks and labels
##' @param base_family2 secondary font family
##' @param yaxis a logical display the y axis
##' @examples
##' 
##' qplot(1:10, 1:10, size = 10:1) + xlab("axis x label") + ylab ("y axis label") + theme_swiYLines()
##' @export
theme_swiYLines <- function(
  yaxis=FALSE, base_family="Open Sans", base_family2 = "Open Sans Semibold",
  base_size=11, axisColor = "#7E8279") {
  
  choose_font(base_family, FALSE)
  choose_font(base_family2, FALSE)
  
  ret <- theme_minimal(base_family=base_family, base_size=base_size) +
    theme(
      plot.title   = element_text(hjust = 0, vjust = 5, size = rel(2), face = "bold"),
      ## AXIS
      axis.text    = element_text(size = rel(1.3)),
      axis.text.x    = element_text(vjust = 1.4),
      axis.text.y    = element_text(vjust = -0.3, hjust = 2),
      axis.title   = element_text(size = rel(1.6), family = base_family2, color = axisColor),
      axis.title.x = element_text(hjust = 1, vjust = 3),
      axis.title.y = element_text(vjust = 1, hjust = 1),
      axis.line    =  element_line(linetype = "solid", size = 0.9, color = axisColor, lineend = "round"),
      axis.ticks   =  element_line(size = 0.3,  color = axisColor),
      axis.ticks.y =  element_blank(),
      axis.ticks.length = unit(2.6, "mm"),
      ## PLOT MARGIN
      plot.margin = unit(c(2.2, 1, 1.8, 1), "cm"),
      ## GRID LINES
      panel.grid.major.x = element_blank(),
      panel.grid.minor.x = element_blank(),
      panel.grid.minor.y = element_blank(),
      panel.grid.major.y = element_line(colour = "lightgrey", size = 0.1, lineend = "round"),
      legend.key.size = unit(0.5, "cm")
    )
  if(!yaxis) {
    ret <- ret + theme(axis.line.y = element_blank())
  }
  ret
}

##' swissinfo.ch theme for ggplot2
##'
##' theme_swi2, with grid lines ggplot2 minimal theme
##'
##' @rdname theme_swi
##' @inheritParams theme_swi
##' @examples
##' qplot(1:10, 1:10, size = 10:1) + xlab("axis x label") + ylab ("y axis label") + theme_swi2()
##' @export
theme_swi2 <- function(
  base_family="Open Sans", base_family2 = "Open Sans Semibold",
  base_size=11, axisColor = "#7E8279") {
  
  choose_font(base_family, FALSE)
  choose_font(base_family2, FALSE)
  
  ret <- theme_minimal(base_family=base_family, base_size=base_size) +
    theme(
      plot.title   = element_text(hjust = 0, vjust = 5, size = rel(2), face = "bold"),
      ## AXIS
      axis.title   = element_text(size = rel(1.5), family = base_family2, color = axisColor),
      axis.title.x = element_text(hjust = 1, vjust = -0.15),
      axis.title.y = element_text(vjust = 1, hjust = 1),
      ## PLOT MARGIN
      plot.margin = unit(c(2, 1, 1, 1), "lines")
      ## GRID LINES
    )
  ret
}

##' swissinfo.ch theme for ggplot2
##'
##' theme_swiMin, a minimal theme with no axis, no ticks, no axis text, no grid lines
##'
##' @rdname theme_swi
##' @inheritParams theme_swi
##' @examples
##' 
##'  qplot(1:10, 1:10, size = 10:1) + theme_swiMin() + ggtitle("Minimal theme: no axis & no ticks")
##' @export
theme_swiMin <- function(base_family="Open Sans", base_size=11) {
  choose_font(base_family, FALSE)
  ret <- theme_minimal(base_family=base_family, base_size=base_size) +
    theme(
      plot.title   = element_text(hjust = 0, vjust = 5, size = rel(2), face = "bold"),
      axis.ticks   = element_blank(), 
      axis.title   = element_blank(),
      axis.text    = element_blank(), 
      axis.line    = element_blank(), 
      plot.margin = unit(c(2, 1, 1, 1), "lines"),
      panel.grid = element_blank()
    )
  ret
}
