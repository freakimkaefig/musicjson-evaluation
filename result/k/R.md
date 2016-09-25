R
===

Daten einlesen
--------------------------------------------------
```
data1 <- read.csv("all.csv", header=TRUE, sep=";", dec=",")
```

3D-Scatterplots
--------------------------------------------------
```
library("plot3Drgl")

scatter3D(data1$k1, data1$k3, data1$similarity, colvar=data1$pair, main="Melodic SImilarity", xlab="k1", ylab="k3", zlab="similarity", bty="b2", pch=20, cex=1, ticktype="detailed", theta=120, phi=10)
```

Interaktiver Graph:
```
plotrgl()
```

Quellen
--------------------------------------------------
- http://www.sthda.com/english/wiki/impressive-package-for-3d-and-4d-graph-r-software-and-data-visualization
- http://blog.revolutionanalytics.com/2014/02/3d-plots-in-r.html
