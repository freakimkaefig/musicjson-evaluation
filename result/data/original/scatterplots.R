data <- read.csv("data.csv", header=TRUE, sep=";", dec=",")

shapetime <- data$shapetime
ms <- data$ms
gar <- data$gar
interval <- data$interval
parson <- data$parson

#pdf("scatterplots.pdf", width = 8, height = 8)
par(mfrow=c(2,2), mar=c(4,4,0.5,1.5))  # 2-column Layout
y <- shapetime
y_txt <- "2015-shapetime"
COLOR <- rgb(red=156, green=0, blue=75, maxColorValue=255)

# ms
x <- ms
x_txt <- "ms"
plot(x, y, xlab="", ylab="", xaxt="n", yaxt="n")
axis(side=1, at=c(0, 0.2, 0.4, 0.6, 0.8, 1.0), tck=-.015, padj=-1.25)
mtext(x_txt, side=1, line=1.5, cex.lab=1, las=1)
axis(side=2, at=c(0, 1, 2, 3, 4, 5, 6))
mtext(y_txt, side=2, line=2.5, cex.lab=1, las=0)
abline(lm(y~x), col=COLOR, lwd=2)

# gar
x <- gar
x_txt <- "gar"
plot(x, y, xlab="", ylab="", xaxt="n", yaxt="n")
axis(side=1, at=c(0, 0.2, 0.4, 0.6, 0.8, 1.0), tck=-.015, padj=-1.25)
mtext(x_txt, side=1, line=1.5, cex.lab=1, las=1)
axis(side=2, at=c(0, 1, 2, 3, 4, 5, 6))
mtext(y_txt, side=2, line=2.5, cex.lab=1, las=0)
abline(lm(y~x), col=COLOR, lwd=2)

# interval
x <- interval
x_txt <- "interval"
plot(x, y, xlab="", ylab="", xaxt="n", yaxt="n")
axis(side=1, at=c(0, 0.2, 0.4, 0.6, 0.8, 1.0), tck=-.015, padj=-1.25)
mtext(x_txt, side=1, line=1.5, cex.lab=1, las=1)
axis(side=2, at=c(0, 1, 2, 3, 4, 5, 6))
mtext(y_txt, side=2, line=2.5, cex.lab=1, las=0)
abline(lm(y~x), col=COLOR, lwd=2)

# parson
x <- parson
x_txt <- "parson"
plot(x, y, xlab="", ylab="", xaxt="n", yaxt="n")
axis(side=1, at=c(0, 0.2, 0.4, 0.6, 0.8, 1.0), tck=-.015, padj=-1.25)
mtext(x_txt, side=1, line=1.5, cex.lab=1, las=1)
axis(side=2, at=c(0, 1, 2, 3, 4, 5, 6))
mtext(y_txt, side=2, line=2.5, cex.lab=1, las=0)
abline(lm(y~x), col=COLOR, lwd=2)

#dev.off()