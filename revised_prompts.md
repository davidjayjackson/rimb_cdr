```
Here is the requirement. Using the call detail record layout (Cdr.xlsx) to create a dataset containing 100,000 rows/call. The data is to have no more than 30 customers i.e. caller phone. And 30 destination phones The customers are located in Tunisia. Both phone numbers should be like the phone numbers in Tunisia. 
		(2)	The call dates are between 2023-10-01 and 2023-12-31. The call dates are to be random but there should more calls on Saturday and Sunday than during the rest of the day of the week. 
		(3)	The call duration is a random series of numbers between 0.25  and 180 minutes.
		(4)	 A fraud call is any call that is less than 2 minutes and 160 minutes ”. There is a column called fraud which will contain an “F” if the call is a fraud, and a “G” if the call is good. 
		(5)	No more than 10% of calls are to be flagged as fraud. 
		(6)	Finally 0.05 percent are to be “false positives”, and other 0.05 percent are to be false “negatives”, 
		
		(7)	OK, write data to a CSV file.
```
