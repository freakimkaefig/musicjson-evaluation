﻿* Encoding: UTF-8.
 
GET DATA 
  /TYPE=XLSX 
  /FILE='C:\Users\Lukas Lamm\Repositories\musicjson-evaluation\result\data\zuccal_first_10\data.xlsx' 
  /SHEET=name 'evaluation' 
  /CELLRANGE=FULL 
  /READNAMES=ON 
  /DATATYPEMIN PERCENTAGE=95.0 
  /HIDDEN IGNORE=YES. 
EXECUTE. 
DATASET NAME DataSet1 WINDOW=FRONT.

FREQUENCIES VARIABLES=ms gar interval parson ju 
  /FORMAT=NOTABLE 
  /PERCENTILES=5.0 10.0 25.0 50.0 75.0 90.0 95.0 
  /STATISTICS=STDDEV VARIANCE RANGE MINIMUM MAXIMUM SEMEAN MEAN MEDIAN 
  /HISTOGRAM NORMAL 
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=ms_ju gar_ju interval_ju parson_ju 
  /FORMAT=NOTABLE 
  /PERCENTILES=5 10 25 50 75 90 95 
  /STATISTICS=STDDEV VARIANCE RANGE MINIMUM MAXIMUM SEMEAN MEAN MEDIAN MODE SUM SKEWNESS SESKEW 
    KURTOSIS SEKURT 
  /GROUPED=ms_ju gar_ju interval_ju parson_ju 
  /HISTOGRAM NORMAL 
  /ORDER=ANALYSIS.

T-TEST PAIRS=ju ju ju ju WITH ms gar interval parson (PAIRED) 
  /CRITERIA=CI(.9500) 
  /MISSING=ANALYSIS.

NPAR TESTS 
  /WILCOXON=ju ju ju ju WITH ms gar interval parson (PAIRED) 
  /MISSING ANALYSIS.

NONPAR CORR 
  /VARIABLES=ms gar interval parson ju 
  /PRINT=BOTH TWOTAIL NOSIG 
  /MISSING=PAIRWISE.

NPTESTS 
  /RELATED TEST(ms gar interval parson ju) 
  /MISSING SCOPE=ANALYSIS USERMISSING=EXCLUDE 
  /CRITERIA ALPHA=0.05  CILEVEL=95.
