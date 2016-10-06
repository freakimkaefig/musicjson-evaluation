data <- read.csv("top10.csv", header=TRUE, sep=";", dec=",")
shapetime <- data$shapetime
ms <- data$ms
gar <- data$gar
interval <- data$interval
parson <- data$parson

# PDF
pdf("top10_scatterplots.pdf", width = 6, height = 6)
par(mfrow=c(2,2), mar=c(4,4,0,1.5))  # 2-column Layout
y <- shapetime
y_txt <- "2015-shapetime"

# Row 1
COLOR <- rgb(red=255, green=23, blue=68, maxColorValue=255)
x <- ms
x_txt <- "ms (original)"
plot(x, y, xlab="", ylab="", xaxt="n", yaxt="n")
axis(side=1, at=c(0, 0.2, 0.4, 0.6, 0.8, 1.0), tck=-.015, padj=-1.25)
mtext(x_txt, side=1, line=1.5, cex.lab=1, las=1)
axis(side=2, at=c(0, 1, 2, 3, 4, 5, 6))
mtext(y_txt, side=2, line=2.5, cex.lab=1, las=0)
abline(lm(y~x), col=COLOR, lwd=2)

COLOR <- rgb(red=61, green=90, blue=254, maxColorValue=255)
x <- gar
x_txt <- "gar (original)"
plot(x, y, xlab="", ylab="", xaxt="n", yaxt="n")
axis(side=1, at=c(0, 0.2, 0.4, 0.6, 0.8, 1.0), tck=-.015, padj=-1.25)
mtext(x_txt, side=1, line=1.5, cex.lab=1, las=1)
axis(side=2, at=c(0, 1, 2, 3, 4, 5, 6))
mtext(y_txt, side=2, line=2.5, cex.lab=1, las=0)
abline(lm(y~x), col=COLOR, lwd=2)

# Row 2
COLOR <- rgb(red=118, green=255, blue=3, maxColorValue=255)
x <- interval
x_txt <- "interval"
plot(x, y, xlab="", ylab="", xaxt="n", yaxt="n")
axis(side=1, at=c(0, 0.2, 0.4, 0.6, 0.8, 1.0), tck=-.015, padj=-1.25)
mtext(x_txt, side=1, line=1.5, cex.lab=1, las=1)
axis(side=2, at=c(0, 1, 2, 3, 4, 5, 6))
mtext(y_txt, side=2, line=2.5, cex.lab=1, las=0)
abline(lm(y~x), col=COLOR, lwd=2)

COLOR <- rgb(red=255, green=196, blue=0, maxColorValue=255)
x <- parson
x_txt <- "parson"
plot(x, y, xlab="", ylab="", xaxt="n", yaxt="n")
axis(side=1, at=c(0, 0.2, 0.4, 0.6, 0.8, 1.0), tck=-.015, padj=-1.25)
mtext(x_txt, side=1, line=1.5, cex.lab=1, las=1)
axis(side=2, at=c(0, 1, 2, 3, 4, 5, 6))
mtext(y_txt, side=2, line=2.5, cex.lab=1, las=0)
abline(lm(y~x), col=COLOR, lwd=2)

dev.off()

# PNG
png(filename="top10_scatterplots.png", width=1200, height=1200, res=150)
par(mfrow=c(2,2), mar=c(4,4,0,1.5))  # 2-column Layout
y <- shapetime
y_txt <- "2015-shapetime"


# Row 1
COLOR <- rgb(red=255, green=23, blue=68, maxColorValue=255)
x <- ms
x_txt <- "ms (original)"
plot(x, y, xlab="", ylab="", xaxt="n", yaxt="n")
axis(side=1, at=c(0, 0.2, 0.4, 0.6, 0.8, 1.0), tck=-.015, padj=-1.25)
mtext(x_txt, side=1, line=1.5, cex.lab=1, las=1)
axis(side=2, at=c(0, 1, 2, 3, 4, 5, 6))
mtext(y_txt, side=2, line=2.5, cex.lab=1, las=0)
abline(lm(y~x), col=COLOR, lwd=2)

COLOR <- rgb(red=61, green=90, blue=254, maxColorValue=255)
x <- gar
x_txt <- "gar (original)"
plot(x, y, xlab="", ylab="", xaxt="n", yaxt="n")
axis(side=1, at=c(0, 0.2, 0.4, 0.6, 0.8, 1.0), tck=-.015, padj=-1.25)
mtext(x_txt, side=1, line=1.5, cex.lab=1, las=1)
axis(side=2, at=c(0, 1, 2, 3, 4, 5, 6))
mtext(y_txt, side=2, line=2.5, cex.lab=1, las=0)
abline(lm(y~x), col=COLOR, lwd=2)

# Row 2
COLOR <- rgb(red=118, green=255, blue=3, maxColorValue=255)
x <- interval
x_txt <- "interval"
plot(x, y, xlab="", ylab="", xaxt="n", yaxt="n")
axis(side=1, at=c(0, 0.2, 0.4, 0.6, 0.8, 1.0), tck=-.015, padj=-1.25)
mtext(x_txt, side=1, line=1.5, cex.lab=1, las=1)
axis(side=2, at=c(0, 1, 2, 3, 4, 5, 6))
mtext(y_txt, side=2, line=2.5, cex.lab=1, las=0)
abline(lm(y~x), col=COLOR, lwd=2)

COLOR <- rgb(red=255, green=196, blue=0, maxColorValue=255)
x <- parson
x_txt <- "parson"
plot(x, y, xlab="", ylab="", xaxt="n", yaxt="n")
axis(side=1, at=c(0, 0.2, 0.4, 0.6, 0.8, 1.0), tck=-.015, padj=-1.25)
mtext(x_txt, side=1, line=1.5, cex.lab=1, las=1)
axis(side=2, at=c(0, 1, 2, 3, 4, 5, 6))
mtext(y_txt, side=2, line=2.5, cex.lab=1, las=0)
abline(lm(y~x), col=COLOR, lwd=2)

dev.off()