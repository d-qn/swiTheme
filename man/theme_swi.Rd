% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/swiTheme.R
\name{theme_swi}
\alias{theme_swi}
\alias{swi_theme}
\alias{swi_dark_map}
\alias{theme_swi}
\alias{theme_swiYLines}
\alias{theme_swi2}
\alias{theme_swiMin}
\title{swissinfo.ch's chart theme}
\usage{
swi_theme(base_size = 15, base_family = "OpenSans-CondensedLight",
  title_family = "OpenSans-CondensedBold",
  subtitle_family = "OpenSans-CondensedLight", y_gridlines = TRUE,
  base_color = "#2b2b2b")

swi_dark_map(base_size = 15, base_family = "OpenSans-CondensedLight",
  title_family = "OpenSans-CondensedBold",
  subtitle_family = "OpenSans-CondensedLight", bg.colour = "#1a0000",
  colour = "#ffffff")

theme_swi(ticks = TRUE, base_family = "Open Sans", base_size = 11)

theme_swiYLines(yaxis = FALSE, base_family = "Open Sans",
  base_family2 = "Open Sans Semibold", base_size = 11,
  axisColor = "#7E8279")

theme_swi2(base_family = "Open Sans", base_family2 = "Open Sans Semibold",
  base_size = 11, axisColor = "#7E8279")

theme_swiMin(base_family = "Open Sans", base_size = 11)
}
\arguments{
\item{base_size}{Base font size}

\item{base_family}{Base font family}

\item{title_family, }{a string typeface for title}

\item{subtitle_family, }{a string typeface for subtitle}

\item{y_gridlines, }{a logical display y gridlines?}

\item{base_color, }{a colour string used for the axis lines}

\item{bg.colour}{a string the colour of the chart background}

\item{colour}{a string the colour for text}

\item{ticks}{\code{logical} Show axis ticks?}

\item{yaxis}{a logical display the y axis}

\item{base_family2}{secondary font family}

\item{axisColor}{the color for the axis and their ticks and labels}
}
\description{
swi_theme(): ggplot copied/inspired from https://gist.github.com/hrbrmstr/283850725519e502e70c

swi_dark_map, a dark theme for maps with no axis, no ticks, no axis text, no grid lines

swissinfo minimal font and color ggplot2 theme

theme_swiYLines: a ggplot2 theme with horizontal grid lines

theme_swi2, with grid lines ggplot2 minimal theme

theme_swiMin, a minimal theme with no axis, no ticks, no axis text, no grid lines
}
\examples{
require(ggplot2)
require(swiTheme)

# swi_theme() with annotations

gg <- qplot(1:10, 1:10) + swi_theme()
# add y-axis label 
gg <- gg + geom_label(aes(x = 0, y = 10, label="y label text"),
  family = "OpenSans-CondensedLight", size=3.5, 
  hjust=0, label.size=0, color="#2b2b2b")
# basic axis scale and breaks
gg <- gg + scale_x_continuous(expand=c(0,0), breaks = seq(0, 10, by=2), 
  labels = seq(0, 10, by=2), limits=c(0, 10.2), name = NULL)
gg <- gg + scale_y_continuous(expand=c(0,0.3), breaks=seq(1, 10, by=1), limits=c(0, 10.2))
# footnote / caption / subtitle
caption <- "Note: Vacancies are counted as the number of days between a justice's death, retirement or resignation and the successor justice's swearing in (or commissioning in the case of a recess appointment) as a member of the court.Sources: U.S. Senate, 'Supreme Court Nominations, present-1789'; Supreme Court, 'Members of the Supreme Court of the United States'; Pew Research Center calculations"
caption  <- paste0(strwrap(caption, 160), sep="", collapse="\\n")
subtitle <- "Here is a subtitle text. It describes what is displayed in the chart. It can mention many important details to under the graphic."
subtitle  <- paste0(strwrap(subtitle, 160), sep="", collapse="\\n") 
gg <- gg + labs(x=NULL, y=NULL, title="This is a title, choose it wisely",
subtitle=subtitle, caption=caption)
#annotations TODO !!!!


# swi_dark_map
\dontrun{
qplot(1:10, 1:10, size = 10:1, color = I("red")) + 
swi_dark_map() + 
labs(title = "A dark map theme: no grid lines, no axes, no ticks", subtitle = "A subtitle")
}

qplot(1:10, 1:10, size = 10:1) + xlab("axis x label") + ylab ("y axis label") + theme_swi()
qplot(mtcars$mpg) + theme_swi()



qplot(1:10, 1:10, size = 10:1) + xlab("axis x label") + ylab ("y axis label") + theme_swiYLines()
qplot(1:10, 1:10, size = 10:1) + xlab("axis x label") + ylab ("y axis label") + theme_swi2()

 qplot(1:10, 1:10, size = 10:1) + theme_swiMin() + ggtitle("Minimal theme: no axis & no ticks")
}
