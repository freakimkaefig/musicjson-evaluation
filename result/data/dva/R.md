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
par(mfrow=c(4,2))  # 2-column Layout

# ms
plot(ms, shapeh, main="ms vs shapeh (raw)", xlab="ms", ylab="shapeh")
abline(lm(shapeh~ms), col=4)  # regression line
lines(lowess(ms, shapeh), col="red")  # lowess line

plot(rank(ms), rank(shapeh), main="ms vs shapeh (ranked)", xlab="ms", ylab="shapeh")
abline(lm(rank(shapeh)~rank(ms)), col=4) # regression line
lines(lowess(rank(ms), rank(shapeh)), col="red") # lowess line

# gar
plot(gar, shapeh, main="gar vs shapeh (raw)", xlab="gar", ylab="shapeh")
abline(lm(shapeh~gar), col=4)  # regression line
lines(lowess(gar, shapeh), col="red")  # lowess line

plot(rank(gar), rank(shapeh), main="gar vs shapeh (ranked)", xlab="gar", ylab="shapeh")
abline(lm(rank(shapeh)~rank(gar)), col=4) # regression line
lines(lowess(rank(gar), rank(shapeh)), col="red") # lowess line

# interval
plot(interval, shapeh, main="interval vs shapeh (raw)", xlab="interval", ylab="shapeh")
abline(lm(shapeh~interval), col=4)  # regression line
lines(lowess(interval, shapeh), col="red")  # lowess line

plot(rank(interval), rank(shapeh), main="interval vs shapeh (ranked)", xlab="interval", ylab="shapeh")
abline(lm(rank(shapeh)~rank(interval)), col=4) # regression line
lines(lowess(rank(interval), rank(shapeh)), col="red") # lowess line

# parson
plot(parson, shapeh, main="parson vs shapeh (raw)", xlab="parson", ylab="shapeh")
abline(lm(shapeh~parson), col=4)  # regression line
lines(lowess(parson, shapeh), col="red")  # lowess line

plot(rank(parson), rank(shapeh), main="parson vs shapeh (ranked)", xlab="parson", ylab="shapeh")
abline(lm(rank(shapeh)~rank(parson)), col=4) # regression line
lines(lowess(rank(parson), rank(shapeh)), col="red") # lowess line
```

3D Plots
--------------------------------------------------
```
library("plot3Drgl")

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
