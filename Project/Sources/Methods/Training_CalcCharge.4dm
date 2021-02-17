//%attributes = {}
[Training:7]Charge:6:=[Training:7]Hourly_Rate:11*[Training:7]Time_Spent:5
[Training:7]GST:7:=[Training:7]Charge:6*Fnd_Pref_GetReal("Tax Rate"; 0)
[Training:7]Total:9:=[Training:7]Charge:6+[Training:7]GST:7