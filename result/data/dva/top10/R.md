R
==================================================

Read data from file
--------------------------------------------------
```
data <- read.csv("top10.csv", header=TRUE, sep=";", dec=",")

shapetime <- data$shapetime
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
plot(ms, shapetime, main="ms vs shapetime (raw)", xlab="ms", ylab="shapetime")
abline(lm(shapetime~ms), col=4)  # regression line
lines(lowess(ms, shapetime), col="red")  # lowess line

plot(rank(ms), rank(shapetime), main="ms vs shapetime (ranked)", xlab="ms", ylab="shapetime")
abline(lm(rank(shapetime)~rank(ms)), col=4) # regression line
lines(lowess(rank(ms), rank(shapetime)), col="red") # lowess line

# gar
plot(gar, shapetime, main="gar vs shapetime (raw)", xlab="gar", ylab="shapetime")
abline(lm(shapetime~gar), col=4)  # regression line
lines(lowess(gar, shapetime), col="red")  # lowess line

plot(rank(gar), rank(shapetime), main="gar vs shapetime (ranked)", xlab="gar", ylab="shapetime")
abline(lm(rank(shapetime)~rank(gar)), col=4) # regression line
lines(lowess(rank(gar), rank(shapetime)), col="red") # lowess line

# interval
plot(interval, shapetime, main="interval vs shapetime (raw)", xlab="interval", ylab="shapetime")
abline(lm(shapetime~interval), col=4)  # regression line
lines(lowess(interval, shapetime), col="red")  # lowess line

plot(rank(interval), rank(shapetime), main="interval vs shapetime (ranked)", xlab="interval", ylab="shapetime")
abline(lm(rank(shapetime)~rank(interval)), col=4) # regression line
lines(lowess(rank(interval), rank(shapetime)), col="red") # lowess line

# parson
plot(parson, shapetime, main="parson vs shapetime (raw)", xlab="parson", ylab="shapetime")
abline(lm(shapetime~parson), col=4)  # regression line
lines(lowess(parson, shapetime), col="red")  # lowess line

plot(rank(parson), rank(shapetime), main="parson vs shapetime (ranked)", xlab="parson", ylab="shapetime")
abline(lm(rank(shapetime)~rank(parson)), col=4) # regression line
lines(lowess(rank(parson), rank(shapetime)), col="red") # lowess line
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
cat("Spearman correlation ms(x) - shapetime(y)", "----------------------------------------------", "```", out, "```", "\n",file=outfile, sep="\n", append=TRUE)

out <- capture.output(rcorr(gar, shapetime, type="spearman"))
cat("Spearman correlation gar(x) - shapetime(y)", "----------------------------------------------", "```", out, "```", "\n", file=outfile, sep="\n", append=TRUE)

out <- capture.output(rcorr(interval, shapetime, type="spearman"))
cat("Spearman correlation interval(x) - shapetime(y)", "----------------------------------------------", "```", out, "```", "\n", file=outfile, sep="\n", append=TRUE)

out <- capture.output(rcorr(parson, shapetime, type="spearman"))
cat("Spearman correlation parson(x) - shapetime(y)", "----------------------------------------------", "```", out, "```", "\n", file=outfile, sep="\n", append=TRUE)
```


Sources
--------------------------------------------------
- http://www.statmethods.net/graphs/scatterplot.html
- http://www.statmethods.net/stats/correlations.html
