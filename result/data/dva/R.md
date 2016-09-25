R
==================================================

Read data from file
--------------------------------------------------
```
data <- read.csv("data.csv", header=TRUE, sep=";", dec=",")

shapeh <- data$shapeh
ms <- data$ms
gar <- data$gar
interval <- data$interval
parson <- data$parson
```


Scatterplots
--------------------------------------------------
```
library("plot3Drgl")

par(mfrow=c(2,2))  # 4-column Layout

plot(gar, shapeh, main="gar vs shapeh (raw)", xlab="gar", ylab="shapeh")
abline(lm(shapeh~gar), col=4)  # regression line
lines(lowess(gar, shapeh), col="red")  # lowess line

plot(rank(gar), rank(shapeh), main="gar vs shapeh (ranked)", xlab="gar", ylab="shapeh")
abline(lm(rank(shapeh)~rank(gar)), col=4) # regression line
lines(lowess(rank(gar), rank(shapeh)), col="red") # lowess line

scatter3D(gar, shapeh, data$pair, colvar=data$pair, main="gar vs shapeh (raw)", xlab="gar", ylab="shapeh", zlab="pair", bty="b2", pch=20, cex=1, ticktype="detailed", theta=120, phi=10)

scatter3D(rank(gar), rank(shapeh), data$pair, colvar=data$pair, main="gar vs shapeh (ranked)", xlab="gar", ylab="shapeh", zlab="pair", bty="b2", pch=20, cex=1, ticktype="detailed", theta=120, phi=10)
```

Interactive graphs:
```
plotrgl()
```


Correlations
--------------------------------------------------
Simple correlation coefficient:
```
cor(gar, shapeh, method="pearson")
cor(gar, shapeh, method="spearman")
```
With significance (two-sided):
```
library(Hmisc)

rcorr(gar, shapeh, type="pearson")
rcorr(gar, shapeh, type="spearman")
```

Pipe output to file:
```
outfile <- "correlations.md"
cat("", file=outfile, sep="\t", append=FALSE)

# Pearson
cat("PEARSON PRODUCT-MOMENT CORRELATION COEFFICIENT", "==============================================", "\n", file=outfile, sep="\n", append=TRUE)

out <- capture.output(rcorr(ms, shapeh, type="pearson"))
cat("Pearson correlation ms - shapeh", "----------------------------------------------", "```", out, "```", "\n", file=outfile, sep="\n", append=TRUE)

out <- capture.output(rcorr(gar, shapeh, type="pearson"))
cat("Pearson correlation gar - shapeh", "----------------------------------------------", "```", out, "```", "\n", file=outfile, sep="\n", append=TRUE)

out <- capture.output(rcorr(interval, shapeh, type="pearson"))
cat("Pearson correlation interval - shapeh", "----------------------------------------------", "```", out, "```", "\n", file=outfile, sep="\n", append=TRUE)

out <- capture.output(rcorr(parson, shapeh, type="pearson"))
cat("Pearson correlation parson - shapeh", "----------------------------------------------", "```", out, "```", "\n", file=outfile, sep="\n", append=TRUE)


# Spearman
cat("SPEARMAN'S RANK CORRELATION COEFFICIENT", "==============================================", "\n", file=outfile, sep="\n", append=TRUE)

out <- capture.output(rcorr(ms, shapeh, type="spearman"))
cat("Spearman correlation ms - shapeh", "----------------------------------------------", "```", out, "```", "\n", file=outfile, sep="\n", append=TRUE)

out <- capture.output(rcorr(gar, shapeh, type="spearman"))
cat("Spearman correlation gar - shapeh", "----------------------------------------------", "```", out, "```", "\n", file=outfile, sep="\n", append=TRUE)

out <- capture.output(rcorr(interval, shapeh, type="spearman"))
cat("Spearman correlation interval - shapeh", "----------------------------------------------", "```", out, "```", "\n", file=outfile, sep="\n", append=TRUE)

out <- capture.output(rcorr(parson, shapeh, type="spearman"))
cat("Spearman correlation parson - shapeh", "----------------------------------------------", "```", out, "```", "\n", file=outfile, sep="\n", append=TRUE)
```


Sources
--------------------------------------------------
- http://www.sthda.com/english/wiki/impressive-package-for-3d-and-4d-graph-r-software-and-data-visualization
- http://blog.revolutionanalytics.com/2014/02/3d-plots-in-r.html
- http://www.statmethods.net/graphs/scatterplot.html
- http://www.statmethods.net/stats/correlations.html
