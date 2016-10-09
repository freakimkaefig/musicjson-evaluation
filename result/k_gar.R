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

gar <- read.csv("k/gar.csv", header=TRUE, sep=";", dec=",")

# Scatterplot for gar
pdf("k_gar.pdf", width = 7.3, height = 6)
par(mar=c(1.5,0,1,6.8), xpd=TRUE)
scatter3D(gar$k1, gar$k3, gar$similarity, type="p",
          colkey=FALSE, colvar=gar$pair, col=colors,
          main="Melodic Similarity", xlab="k1", ylab="k3", zlab="similarity", 
          bty="b2", pch=20, cex=1, ticktype="detailed", 
          theta=130, phi=10)
legend(0.5,0, ids, col=colors, pch=20, ncol=1)
dev.off()
