R
==================================================

Read data from file
--------------------------------------------------
```
data <- read.csv("data.csv", header=TRUE, sep=";", dec=",")

shapetime <- data$shapetime
ms <- data$ms
gar <- data$gar
interval <- data$interval
parson <- data$parson
```

Histogram
--------------------------------------------------
```
pdf("histogram_shapetime.pdf", width = 12, height = 9)
par(mar=c(5,5,0,0))
hist(shapetime, breaks=106, angle=45, density=25, xlab="Melodic Similarity Score", ylab="Häufigkeit", cex.lab=1.2, main=NULL)
dev.off()
```

Scatterplots
--------------------------------------------------
```
pdf("original_scatterplots.pdf", width = 8, height = 8)
par(mfrow=c(2,2))  # 2-column Layout

# ms
plot(ms, shapetime, main="ms - shapetime", xlab="ms", ylab="2015-shapetime")
abline(lm(shapetime~ms), col=4)  # regression line
lines(lowess(ms, shapetime), col="red")  # lowess line

# gar
plot(gar, shapetime, main="gar - shapetime", xlab="gar", ylab="2015-shapetime")
abline(lm(shapetime~gar), col=4)  # regression line
lines(lowess(gar, shapetime), col="red")  # lowess line

# interval
plot(interval, shapetime, main="interval - shapetime", xlab="interval", ylab="2015-shapetime")
abline(lm(shapetime~interval), col=4)  # regression line
lines(lowess(interval, shapetime), col="red")  # lowess line

# parson
plot(parson, shapetime, main="parson - shapetime", xlab="parson", ylab="2015-shapetime")
abline(lm(shapetime~parson), col=4)  # regression line
lines(lowess(parson, shapetime), col="red")  # lowess line

dev.off()
```

3D Plots
--------------------------------------------------
```
library("plot3Drgl")

scatter3D(gar, shapetime, data$pair, colvar=data$pair, main="gar vs shapetime (raw)", xlab="gar", ylab="shapetime", zlab="pair", bty="b2", pch=20, cex=1, ticktype="detailed", theta=120, phi=10)

scatter3D(rank(gar), rank(shapetime), data$pair, colvar=data$pair, main="gar vs shapetime (ranked)", xlab="gar", ylab="shapetime", zlab="pair", bty="b2", pch=20, cex=1, ticktype="detailed", theta=120, phi=10)
```

Interactive graphs:
```
plotrgl()
```


Correlations
--------------------------------------------------
Simple correlation coefficient:
```
cor(gar, shapetime, method="pearson")
cor(gar, shapetime, method="spearman")
```
With significance (two-sided):
```
library(Hmisc)

rcorr(gar, shapetime, type="pearson")
rcorr(gar, shapetime, type="spearman")
```

Pipe output to file:
```
outfile <- "correlations.md"
cat("", file=outfile, sep="\t", append=FALSE)

# Pearson
cat("PEARSON PRODUCT-MOMENT CORRELATION COEFFICIENT", "==============================================", "\n", file=outfile, sep="\n", append=TRUE)

out <- capture.output(rcorr(ms, shapetime, type="pearson"))
cat("Pearson correlation ms(x) - shapetime(y)", "----------------------------------------------", "```", out, "```", "\n", file=outfile, sep="\n", append=TRUE)

out <- capture.output(rcorr(gar, shapetime, type="pearson"))
cat("Pearson correlation gar(x) - shapetime(y)", "----------------------------------------------", "```", out, "```", "\n", file=outfile, sep="\n", append=TRUE)

out <- capture.output(rcorr(interval, shapetime, type="pearson"))
cat("Pearson correlation interval(x) - shapetime(y)", "----------------------------------------------", "```", out, "```", "\n", file=outfile, sep="\n", append=TRUE)

out <- capture.output(rcorr(parson, shapetime, type="pearson"))
cat("Pearson correlation parson(x) - shapetime(y)", "----------------------------------------------", "```", out, "```", "\n", file=outfile, sep="\n", append=TRUE)


# Spearman
cat("SPEARMAN'S RANK CORRELATION COEFFICIENT", "==============================================", "\n", file=outfile, sep="\n", append=TRUE)

out <- capture.output(rcorr(ms, shapetime, type="spearman"))
cat("Spearman correlation ms(x) - shapetime(y)", "----------------------------------------------", "```", out, "```", "\n", file=outfile, sep="\n", append=TRUE)

out <- capture.output(rcorr(gar, shapetime, type="spearman"))
cat("Spearman correlation gar(x) - shapetime(y)", "----------------------------------------------", "```", out, "```", "\n", file=outfile, sep="\n", append=TRUE)

out <- capture.output(rcorr(interval, shapetime, type="spearman"))
cat("Spearman correlation interval(x) - shapetime(y)", "----------------------------------------------", "```", out, "```", "\n", file=outfile, sep="\n", append=TRUE)

out <- capture.output(rcorr(parson, shapetime, type="spearman"))
cat("Spearman correlation parson(x) - shapetime(y)", "----------------------------------------------", "```", out, "```", "\n", file=outfile, sep="\n", append=TRUE)
```


Sources
--------------------------------------------------
- http://www.sthda.com/english/wiki/impressive-package-for-3d-and-4d-graph-r-software-and-data-visualization
- http://blog.revolutionanalytics.com/2014/02/3d-plots-in-r.html
- http://www.statmethods.net/graphs/scatterplot.html
- http://www.statmethods.net/stats/correlations.html
- https://de.wikibooks.org/wiki/GNU_R:_hist
- https://de.wikibooks.org/wiki/GNU_R:_plot
