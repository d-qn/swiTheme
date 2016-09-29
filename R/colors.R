
##' swissinfo.ch standard color palette
##' 
##' Just a bunch of hex color vectors...
##' 
##' Color palette as vector (no function). Colors can be sequential (one color), diverging (2 colors) 
##'
##' @rdname colors_swi
##' @export
##' @examples
##' pie(rep(1,length(swi_pal)), col=swi_pal)
swi_pal <- c("#336666", "#368596", "#669999", "#366096",
             "#333366", "#666699", "#996699", "#663333",
             "#ab3d3f", "#996666", "#ac673e", "#ac7f3e",
             "#666633", "#999966", "#89a23a", "#3a9736",
             "#aa8959", "#bfa681", "#d4c3aa", "#e5dbcd",
             "#efe9e0", "#f7f5ed")

##' swissinfo random color palette
##'
##' @rdname colors_swi
##' @export
##' @examples
##' pie(rep(1,length(swi_rpal)), col=swi_rpal)
swi_rpal <- swi_pal[c(9, 6, 3, 8, 1, 4, 7, 11, 16, 5, 14, 13, 15, 2, 10, 18, 20, 19, 12, 17, 22, 21)]

## swissinfo diverging color palette with 10 levels
##' @rdname colors_swi
##' @export
##' @examples
##' pie(rep(1,length(swi_dpal)), col=swi_dpal)
swi_dpal <- c("#476666", "#537373", "#5F7F7F", "#6C8C8C", "#789A99", "#DBBF8B", "#CCB27E", "#BEA472", "#B09766", "#A28959")

## another swissinfo diverging color palette with 10 levels based on interactive things color scheme for the federal ballot
##' @rdname colors_swi
##' @export
##' @examples
##' pie(rep(1,length(swi_dpal2)), col=swi_dpal2)
swi_dpal2 <- c("#336666", "#4E8080", "#689A9A", "#82B5B5", "#9DD0D0", "#E2C08C", "#C7A472", "#AA8959", "#907142", "#75582B")

## another swissinfo diverging color palette, 11 levels. Also based on interactive things color scheme for the federal ballot. But with white (very light grey) in the middle
##' @rdname colors_swi
##' @export
##' @examples
##' pie(rep(1,length(swi_dpal3)), col=swi_dpal3)
swi_dpal3 <- c('#75582b','#917448','#ad916c','#c6b095','#ddd0c2','#f2f2f2','#c9d5d4','#a1b9b8','#7b9c9c','#568181','#336666')


##  swissinfo single hue color palette
##' @rdname colors_swi
##' @export
##' @examples
##' pie(rep(1,length(swi_spal)), col=swi_spal)
swi_spal <- c("#f7f5ed", "#efe9e0", "#e5dbcd", "#d4c3aa", "#bfa681", "#aa8959")



