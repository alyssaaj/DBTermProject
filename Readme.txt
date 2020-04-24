Readme.txt
Alyssa Jordan (alj81)
DB Term Project

Please have ojdbc7.jar in the same folder where you are running this project from.

In order for the Driver to successfully run, you must reinitialized the database (i.e. run schema.sql, triggers.sql, and init.sql). This is because you will be unable to add the same information due to some constraints and after a run information will be deleted and therefore cannot be dropped again.

If you are running the Driver.java and then would like to run queries.sql, you must once again reinitialized the database.

Driver.java
	Compile: javac -cp ojdbc7.jar Olympic.java Driver.java
	Execute: java -cp ojdbc7.jar:. Driver


Olympic.java

	Compile: javac -cp ojdbc7.jar Olympic.java
	Execute: java -cp ojdbc7.jar:. Olympic


	If you run my init.sql script, the following users will be available for you to use to test:
		Username: o1     Password: pass    Role: Organizer
		Username: o2     Password: pass    Role: Organizer
		Username: c1     Password: pass    Role: Coach
		Username: c2     Password: pass    Role: Coach
		Username: g1     Password: GUEST   Role: Guest

	The program will prompt you with what to enter at each step on the command line.