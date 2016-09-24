R
==================================================

Daten einlesen
---
```
data <- read.csv("data.csv", header=TRUE, sep=";", dec=",")
```

Scatterplots
--------------------------------------------------
```
library("plot3Drgl")

par(mfrow=c(2,2))  # 4-spaltiges Layout

plot(gar, shapeh, main="gar vs shapeh (raw)", xlab="gar", ylab="shapeh")
abline(lm(shapeh~gar), col=4)  # Regressionslinie
lines(lowess(gar, shapeh), col="red")  # LOWESS Linie

plot(rank(gar), rank(shapeh), main="gar vs shapeh (ranked)", xlab="gar", ylab="shapeh")
abline(lm(rank(shapeh)~rank(gar)), col=4) # Regressionslinie
lines(lowess(rank(gar), rank(shapeh)), col="red") # LOWESS Linie

scatter3D(gar, shapeh, data$pair, colvar=data$pair, main="gar vs shapeh (raw)", xlab="gar", ylab="shapeh", zlab="pair", bty="b2", pch=20, cex=1, ticktype="detailed", theta=120, phi=10)

scatter3D(rank(gar), rank(shapeh), data$pair, colvar=data$pair, main="gar vs shapeh (ranked)", xlab="gar", ylab="shapeh", zlab="pair", bty="b2", pch=20, cex=1, ticktype="detailed", theta=120, phi=10)
```

Interaktiver Graph:
```
plotrgl()
```

Korrelationen
--------------------------------------------------
Einfacher Korrelationskoeffizient:
```
cor(gar, shapeh, method="pearson")
cor(gar, shapeh, method="spearman")
```
Mit Signifikanzniveau (zweiseitig):
```
library(Hmisc)

rcorr(gar, shapeh, type="pearson")
rcorr(gar, shapeh, type="spearman")
```


Quellen
--------------------------------------------------
- http://www.sthda.com/english/wiki/impressive-package-for-3d-and-4d-graph-r-software-and-data-visualization
- http://blog.revolutionanalytics.com/2014/02/3d-plots-in-r.html
- http://www.statmethods.net/graphs/scatterplot.html
- http://www.statmethods.net/stats/correlations.html
