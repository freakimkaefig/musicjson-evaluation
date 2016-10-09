data <- read.csv("original/data.csv", header=TRUE, sep=";", dec=",")
shapetime <- data$shapetime
ms <- data$ms
gar <- data$gar
interval <- data$interval
parson <- data$parson

data <- read.csv("adjusted/data.csv", header=TRUE, sep=";", dec=",")
ms_a <- data$ms
gar_a <- data$gar

pdf("scatterplots.pdf", width = 8, height = 5)
par(mfcol=c(2,3), mar=c(4,4,0,1.5))  # 2-column Layout
COLOR <- "#212121"
y <- shapetime
y_txt <- "2015-shapetime"


# Col 1 (ms)
x <- ms
x_txt <- "ms (original)"
plot(x, y, xlab="", ylab="", xaxt="n", yaxt="n", col=COLOR)
axis(side=1, at=c(0, 0.2, 0.4, 0.6, 0.8, 1.0), tck=-.015, padj=-1.25)
mtext(x_txt, side=1, line=1.5, cex.lab=1, las=1)
axis(side=2, at=c(0, 1, 2, 3, 4, 5, 6))
mtext(y_txt, side=2, line=2.5, cex.lab=1, las=0)
x <- ms_a
x_txt <- "ms (adjusted)"
plot(x, y, xlab="", ylab="", xaxt="n", yaxt="n", col=COLOR)
axis(side=1, at=c(0, 0.2, 0.4, 0.6, 0.8, 1.0), tck=-.015, padj=-1.25)
mtext(x_txt, side=1, line=1.5, cex.lab=1, las=1)
axis(side=2, at=c(0, 1, 2, 3, 4, 5, 6))
mtext(y_txt, side=2, line=2.5, cex.lab=1, las=0)

# Col 2 (gar)
x <- gar
x_txt <- "gar (original)"
plot(x, y, xlab="", ylab="", xaxt="n", yaxt="n", col=COLOR)
axis(side=1, at=c(0, 0.2, 0.4, 0.6, 0.8, 1.0), tck=-.015, padj=-1.25)
mtext(x_txt, side=1, line=1.5, cex.lab=1, las=1)
axis(side=2, at=c(0, 1, 2, 3, 4, 5, 6))
mtext(y_txt, side=2, line=2.5, cex.lab=1, las=0)
x <- gar_a
x_txt <- "gar (adjusted)"
plot(x, y, xlab="", ylab="", xaxt="n", yaxt="n", col=COLOR)
axis(side=1, at=c(0, 0.2, 0.4, 0.6, 0.8, 1.0), tck=-.015, padj=-1.25)
mtext(x_txt, side=1, line=1.5, cex.lab=1, las=1)
axis(side=2, at=c(0, 1, 2, 3, 4, 5, 6))
mtext(y_txt, side=2, line=2.5, cex.lab=1, las=0)

# Col 3 (interval, parson)
x <- interval
x_txt <- "interval"
plot(x, y, xlab="", ylab="", xaxt="n", yaxt="n", col=COLOR)
axis(side=1, at=c(0, 0.2, 0.4, 0.6, 0.8, 1.0), tck=-.015, padj=-1.25)
mtext(x_txt, side=1, line=1.5, cex.lab=1, las=1)
axis(side=2, at=c(0, 1, 2, 3, 4, 5, 6))
mtext(y_txt, side=2, line=2.5, cex.lab=1, las=0)
x <- parson
x_txt <- "parson"
plot(x, y, xlab="", ylab="", xaxt="n", yaxt="n", col=COLOR)
axis(side=1, at=c(0, 0.2, 0.4, 0.6, 0.8, 1.0), tck=-.015, padj=-1.25)
mtext(x_txt, side=1, line=1.5, cex.lab=1, las=1)
axis(side=2, at=c(0, 1, 2, 3, 4, 5, 6))
mtext(y_txt, side=2, line=2.5, cex.lab=1, las=0)

dev.off()