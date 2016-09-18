Auswertungen mit R
============================================================

Einlesen von CSV-Dateien in Dataset
------------------------------------------------------------
```
data <- data.frame(ms=read.delim("path/to/ms.csv", header=FALSE)[,2], ju=read.delim("/path/to/ju-2015shapeh.csv", header=FALSE)[,2])
```

Scatterplot
------------------------------------------------------------
Einfacher Scatterplot:
```
plot(data[[1]], data[[2]], main="Scatterplot", xlab="MS", ylab="JU-ShapeH", pch=19)
```

Hinzufügen einer Regressionslinie:
```
abline(lm(data[[2]]~data[[1]]), col="red")
```

Hinzufügen einer LOWESS-Linie:
```
lines(lowess(data[[1]], data[[2]]), col="blue")
```
