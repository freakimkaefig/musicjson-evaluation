library("plot3D")

pairs <- c(0:9)
ids <- c("4410/4411", 
         "4419/4420", 
         "4421/4436", 
         "4433/4503", 
         "4441/4483", 
         "4487/4499", 
         "4489/4503", 
         "4490/4493", 
         "4502/4503")
colors <- c("#9C27B0", "#F44336", "#8BC34A", "#03A9F4", "#FF9800", "#3F51B5", "#FFEB3B", "#009688", "#795548")

ms <- read.csv("k/ms.csv", header=TRUE, sep=";", dec=",")

# Scatterplot for ms
pdf("k_ms.pdf", width = 8, height = 4.5)
par(mar=c(4,4,2,7.2), xpd=FALSE, oma=c(0,0,0,0))
scatter2D(ms$k1, ms$similarity,
          colkey=FALSE, colvar=ms$pair, col=colors,
          main="Melodic Similarity", xlab="k1", ylab="similarity",
          bty="b2", pch=20, cex=1.5)
par(xpd=TRUE)
legend(1.08, 0.75, ids, col=colors, pch=20, ncol=1)
dev.off()
