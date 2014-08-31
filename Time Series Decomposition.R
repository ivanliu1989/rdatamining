setwd('C:\\Users\\Ivan.Liuyanfeng\\Desktop\\Data_Mining_Work_Space\\rdatamining')
a <- ts(1:30, frequency=12, start=c(2011,3))
print(a)
str(a)
attributes(a)
par(mfcol=c(1,1))
plot(AirPassengers)
# decompose time series
apts <- ts(AirPassengers, frequency=12)
f <- decompose(apts)
# seasonal figures
f$figure
plot(f$figure, type="b", xaxt="n", xlab="")
# get names of 12 months in English words
monthNames <- months(ISOdate(2011,1:12,1))
# label x-axis with month names
# las is set to 2 for vertical label orientation
axis(1, at=1:12, labels=monthNames, las=2)
plot(f)
