setwd('C:\\Users\\Ivan.Liuyanfeng\\Desktop\\Data_Mining_Work_Space\\rdatamining')
fit <- arima(AirPassengers, order=c(1,0,0), list(order=c(2,1,0), period=12))
fore <- predict(fit, n.ahead=24)
# error bounds at 95% confidence level
U <- fore$pred + 2*fore$se
L <- fore$pred - 2*fore$se
png('ts_forecasting.png')
ts.plot(AirPassengers, fore$pred, U, L, col=c(1,2,4,4), lty = c(1,1,2,2))
legend("topleft", c("Actual", "Forecast", "Error Bounds (95% Confidence)"), col=c(1,2,4), lty=c(1,1,2))
dev.off()