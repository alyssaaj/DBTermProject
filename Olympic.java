// Alyssa Jordan
// alj81
// 4/13/20


// Compile: javac -cp ojdbc7.jar Olympic.java
// Execute: java -cp ojdbc7.jar:. Olympic

import java.util.*;
import java.io.*;
import java.sql.*;
import java.sql.Date;

public class Olympic
{
	private static boolean loggedIn;
	private static String currentUser;
	private static int currentRole;
	private static boolean cont = true;
	private static final String username = "alj81";
    private static final String password = "4130619";
    private static final String url = "jdbc:oracle:thin:@class3.cs.pitt.edu:1521:dbclass";


	public static void main(String[] args) throws SQLException {

		Connection connection = null;
        try {
            DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
            connection = DriverManager.getConnection(url, username, password);
            connection.setAutoCommit(true);
            connection.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE);
        } catch (Exception e) {
            System.out.println(
                    "Error connecting to database. Printing stack trace: ");
            e.printStackTrace();
        }

        do{
        	do{
		        System.out.println("\nMenu");
		        System.out.println("  Enter the number corresponding to the option:");
		        System.out.println("	(1) Login");
		        System.out.println("	(2) Exit");

		        Scanner console_input = new Scanner(System.in);
		        String choice = console_input.nextLine();
		        
		        while (!choice.equals("1") && !choice.equals("2")){
			        System.out.println("Error: Invalid Input. Please enter 1, or 2.");
			        choice = console_input.nextLine();
			       
			    } 

			    int menu_choice = Integer.valueOf(choice);


			    switch(menu_choice){
			    	case 1:

			    		System.out.print("Enter username: ");
						String input1 = console_input.next();
						System.out.print("Enter password: ");
						String input2 = console_input.next();
			    		login(connection, input1, input2);
			    		break;
			    	case 2:
			    		exit();
			    		break;
			    }
			}while(!loggedIn);

			getRole(connection, currentUser);

		    
		    Scanner scanner = new Scanner(System.in);
		    String user, passkey, fname, lname, nationality, birth_place, sport_name, olympic_city, team_name;
		    int role_id, sport_id, venue_id, team_id, event_id, participant_id, olympic_id, k, n, position, country_id, coach_id;
		    Date event_time, dob;
		    String olympic_year;
		    char gender;

		    do {
			    switch(currentRole){
			    	case 1:
			    		System.out.println("\nMenu");
				        System.out.println("  Enter the number corresponding to the option:");
				        System.out.println("	(1) Create User");
				        System.out.println("	(2) Drop User");
				        System.out.println("	(3) Create Event");
				        System.out.println("	(4) Add Event Outcome");
				        System.out.println("	(5) Display Sport");
				        System.out.println("	(6) Display Event");
				        System.out.println("	(7) Country Ranking");
				        System.out.println("	(8) Top K Athletes");
				        System.out.println("	(9) Connected Athletes");
				        System.out.println("	(10) Logout");

				        Scanner s1 = new Scanner(System.in);
				        String c1 = s1.nextLine();
				        
				        while (!c1.equals("1") && !c1.equals("2") && !c1.equals("3") && !c1.equals("4") && !c1.equals("5") && !c1.equals("6") && !c1.equals("7") && !c1.equals("8") && !c1.equals("9") && !c1.equals("10")){
					        System.out.println("Error: Invalid Input. Please enter 1, 2, 3, 4, 5, 6, 7, 8, 9, or 10.");
					        c1 = s1.nextLine(); 
					    } 
					    int menu2_c1 = Integer.valueOf(c1);
			    		
			    		switch(menu2_c1){

			    			case 1:
								System.out.print("Enter username: ");
								user = scanner.next();
								System.out.print("Enter role_id: ");
								role_id = scanner.nextInt();
								if(role_id == 3){
									passkey = "GUEST";
								}
								else{

									System.out.print("Enter passkey: ");
									passkey = scanner.next();
								}

			    				createUser(connection, user, passkey, role_id);
			    				break;
			    			case 2:
								System.out.print("Enter the username of the user you would like to drop: ");
								user = scanner.next();
			    				dropUser(connection, user);
			    				break;
			    			case 3:
			    				System.out.print("Enter the sport ID: ");
			    				sport_id = Integer.valueOf(scanner.next());
			    				System.out.print("Enter the venue ID: ");
			    				venue_id = Integer.valueOf(scanner.next());
			    				System.out.print("Enter the event time: ");
			    				event_time = Date.valueOf(scanner.next());
			    				System.out.print("Enter the gender: ");
			    				gender = scanner.next().charAt(0);

			    				createEvent(connection, sport_id, venue_id, event_time, gender);
			    				break;
			    			case 4:
			    				System.out.print("Enter the Olympic game city: ");
			    				olympic_city = scanner.next();
			    				System.out.print("Enter the Olympic game year: ");
			    				olympic_year = scanner.next();
			    				System.out.print("Enter the team ID: ");
			    				team_id = Integer.valueOf(scanner.next());
			    				System.out.print("Enter the event ID: ");
			    				event_id = Integer.valueOf(scanner.next());
			    				System.out.print("Enter the participant ID: ");
			    				participant_id = Integer.valueOf(scanner.next());
			    				System.out.print("Enter the position: ");
			    				position = Integer.valueOf(scanner.next());
			    				addEventOutcome(connection, olympic_city, olympic_year, team_id, event_id, participant_id, position);
			    				break;
			    			case 5:
			    				System.out.print("Enter the sport name: ");
			    				sport_name = scanner.next();
			    				displaySport(connection, sport_name);
			    				break;
			    			case 6:
			    				System.out.print("Enter the Olympic game city: ");
			    				olympic_city = scanner.next();
			    				System.out.print("Enter the Olympic game year: ");
			    				olympic_year = scanner.next();
			    				System.out.print("Enter the event id: ");
			    				event_id = Integer.valueOf(scanner.next());
			    				displayEvent(connection, olympic_city, olympic_year, event_id);
			    				break;
			    			case 7:
			    				System.out.print("Enter the Olympic ID: ");
			    				olympic_id = Integer.valueOf(scanner.next());
			    				countryRanking(connection, olympic_id);
			    				break;
			    			case 8:
			    				System.out.print("Enter the Olympic ID: ");
			    				olympic_id = Integer.valueOf(scanner.next());
			    				System.out.print("Enter the number of top athletes you would like: ");
			    				k = Integer.valueOf(scanner.next());
			    				topkAthletes(connection, olympic_id, k);
			    				break;
			    			case 9:
			    				System.out.print("Enter participant_id for athlete: ");
			    				participant_id = Integer.valueOf(scanner.next());
			    				System.out.print("Enter the Olympic ID: ");
			    				olympic_id = Integer.valueOf(scanner.next());
			    				System.out.print("Enter the number of games: ");
			    				n = Integer.valueOf(scanner.next());
			    				connectedAthletes(connection, participant_id, olympic_id, n); 
			    				break;
			    			case 10:
			    				logout(connection);
			    				break;

			    		}

			    		break;
			    	case 2:
			    		System.out.println("\nMenu");
				        System.out.println("  Enter the number corresponding to the option:");
				        System.out.println("	(1) Create Team");
				        System.out.println("	(2) Register Team");
				        System.out.println("	(3) Add Participant");
				        System.out.println("	(4) Add Team Member");
				        System.out.println("	(5) Drop Team Member");
				        System.out.println("	(6) Display Sport");
				        System.out.println("	(7) Display Event");
				        System.out.println("	(8) Country Ranking");
				        System.out.println("	(9) Top K Athletes");
				        System.out.println("	(10) Connected Athletes");
				        System.out.println("	(11) Logout");

				        Scanner s2 = new Scanner(System.in);
				        String c2 = s2.nextLine();
				        
				        while (!c2.equals("1") && !c2.equals("2") && !c2.equals("3") && !c2.equals("4") && !c2.equals("5") && !c2.equals("6") && !c2.equals("7") && !c2.equals("8") && !c2.equals("9") && !c2.equals("10") && !c2.equals("11")){
					        System.out.println("Error: Invalid Input. Please enter 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, or 11.");
					        c2 = s2.nextLine(); 
					    } 
					    int menu2_c2 = Integer.valueOf(c2);

					    switch(menu2_c2){
			    			case 1:
			    				System.out.print("Enter the Olympic game city: ");
			    				olympic_city = scanner.next();
			    				System.out.print("Enter the Olympic game year: ");
			    				olympic_year = scanner.next();
			    				System.out.print("Enter the sport ID: ");
			    				sport_id = Integer.valueOf(scanner.next());
			    				System.out.print("Enter the country ID: ");
			    				country_id = Integer.valueOf(scanner.next());
			    				System.out.print("Enter the team name: ");
			    				team_name = scanner.next();
			    				System.out.print("Enter the coach ID: ");
			    				coach_id = Integer.valueOf(scanner.next());
			    				createTeam(connection, olympic_city, olympic_year, sport_id, country_id, team_name, coach_id);
			    				break;
			    			case 2:
			    				System.out.print("Enter the team ID: ");
			    				team_id = Integer.valueOf(scanner.next());
			    				System.out.print("Enter the event ID: ");
			    				event_id = Integer.valueOf(scanner.next());
			    				registerTeam(connection, team_id, event_id);
			    				break;
			    			case 3:
			    				System.out.print("Enter the participant's first name: ");
			    				fname = scanner.next();
			    				System.out.print("Enter the participant's last name: ");
			    				lname = scanner.next();
			    				System.out.print("Enter the participant's nationality: ");
			    				nationality = scanner.next();
			    				System.out.print("Enter the participant's birth place: ");
			    				birth_place = scanner.next();
			    				System.out.print("Enter the participant's dob: ");
			    				dob = Date.valueOf(scanner.next());
			    				addParticipant(connection, fname, lname, nationality, birth_place, dob);
			    				break;
			    			case 4:
			    				System.out.print("Enter the team ID: ");
			    				team_id = Integer.valueOf(scanner.next());
			    				System.out.print("Enter the participant ID:");
			    				participant_id = Integer.valueOf(scanner.next());
			    				addTeamMember(connection, team_id, participant_id);
			    				break;
			    			case 5:
			    				System.out.print("Enter the participant ID of the athlete you want to remove: ");
			    				participant_id = Integer.valueOf(scanner.next());
			    				dropTeamMember(connection, participant_id);
			    				break;
			    			case 6:
			    				System.out.print("Enter the sport name: ");
			    				sport_name = scanner.next();
			    				displaySport(connection, sport_name);
			    				break;
			    			case 7:
			    				System.out.print("Enter the Olympic game city: ");
			    				olympic_city = scanner.next();
			    				System.out.print("Enter the Olympic game year: ");
			    				olympic_year = scanner.next();
			    				System.out.print("Enter the event id: ");
			    				event_id = Integer.valueOf(scanner.next());
			    				displayEvent(connection, olympic_city, olympic_year, event_id);
			    				break;
			    			case 8:
			    				System.out.print("Enter the Olympic ID: ");
			    				olympic_id = Integer.valueOf(scanner.next());
			    				countryRanking(connection, olympic_id);
			    				break;
			    			case 9:
			    				System.out.print("Enter the Olympic ID: ");
			    				olympic_id = Integer.valueOf(scanner.next());
			    				System.out.print("Enter the number of top athletes you would like: ");
			    				k = Integer.valueOf(scanner.next());
			    				topkAthletes(connection, olympic_id, k);
			    				break;
			    			case 10:
			    				System.out.print("Enter participant_id for athlete: ");
			    				participant_id = Integer.valueOf(scanner.next());
			    				System.out.print("Enter the Olympic ID: ");
			    				olympic_id = Integer.valueOf(scanner.next());
			    				System.out.print("Enter the number of games: ");
			    				n = Integer.valueOf(scanner.next());
			    				connectedAthletes(connection, participant_id, olympic_id, n); 
			    				break;
			    			case 11:
			    				logout(connection);
			    				break;

			    		}

			    		break;
			    	default:
			    		System.out.println("\nMenu");
				        System.out.println("  Enter the number corresponding to the option:");
				        System.out.println("	(1) Display Sport");
				        System.out.println("	(2) Display Event");
				        System.out.println("	(3) Country Ranking");
				        System.out.println("	(4) Top K Athletes");
				        System.out.println("	(5) Connected Athletes");
				        System.out.println("	(6) Logout");

				        Scanner s3 = new Scanner(System.in);
				        String c3 = s3.nextLine();
				        
				        while (!c3.equals("1") && !c3.equals("2") && !c3.equals("3") && !c3.equals("4") && !c3.equals("5") && !c3.equals("6")){
					        System.out.println("Error: Invalid Input. Please enter 1, 2, 3, 4, 5, or 6.");
					        c3 = s3.nextLine(); 
					    } 
					    int menu2_c3 = Integer.valueOf(c3);

					    switch(menu2_c3){
			    			case 1:
			    				System.out.print("Enter the sport name: ");
			    				sport_name = scanner.next();
			    				displaySport(connection, sport_name);
			    				break;
			    			case 2:
			    				System.out.print("Enter the Olympic game city: ");
			    				olympic_city = scanner.next();
			    				System.out.print("Enter the Olympic game year: ");
			    				olympic_year = scanner.next();
			    				System.out.print("Enter the event id: ");
			    				event_id = Integer.valueOf(scanner.next());
			    				displayEvent(connection, olympic_city, olympic_year, event_id);
			    			case 3:
			    				System.out.print("Enter the Olympic ID: ");
			    				olympic_id = Integer.valueOf(scanner.next());
			    				countryRanking(connection, olympic_id);
			    				break;
			    			case 4:
			    				System.out.print("Enter the Olympic ID: ");
			    				olympic_id = Integer.valueOf(scanner.next());
			    				System.out.print("Enter the number of top athletes you would like: ");
			    				k = Integer.valueOf(scanner.next());
			    				topkAthletes(connection, olympic_id, k);
			    				break;
			    			case 5:
			    				System.out.print("Enter participant_id for athlete: ");
			    				participant_id = Integer.valueOf(scanner.next());
			    				System.out.print("Enter the Olympic ID: ");
			    				olympic_id = Integer.valueOf(scanner.next());
			    				System.out.print("Enter the number of games: ");
			    				n = Integer.valueOf(scanner.next());
			    				connectedAthletes(connection, participant_id, olympic_id, n); 
			    				break;
			    			case 6:
			    				logout(connection);
			    				break;
			    		}
			    		break;

			    }
	        } while(loggedIn);
	    
	    } while(cont);
	}

	public static void getRole(Connection connection, String user){
		try {
            connection.setAutoCommit(false);
            PreparedStatement stmt = connection.prepareStatement("SELECT role_id FROM USER_ACCOUNT WHERE username=?"); 
            stmt.setString(1, user);
            ResultSet res1 = stmt.executeQuery();
            res1.next();
            currentRole = res1.getInt("role_id");
            //System.out.println(currentRole);

        } catch (SQLException e1) {
        	System.out.println("uh oh");
            try {
                connection.rollback();
            } catch (SQLException e2) {
                System.out.println(e2.toString());
            }
        }

	}

// Organizer
	public static void createUser(Connection connection, String user, String passkey, int role_id){
	// Works	
		try {
			connection.setAutoCommit(false);
	        PreparedStatement stmt = connection.prepareStatement("INSERT INTO USER_ACCOUNT (user_id, username, passkey, role_id, last_login) VALUES (SEQ_USER_ACCOUNT.NEXTVAL, ?, ?, ?, sysdate)");
	        stmt.setString(1, user);
	        stmt.setString(2, passkey);
	        stmt.setInt(3, role_id);
	        stmt.executeUpdate();
	        connection.commit();
	    } catch (SQLException e1) {
	        try {
	            connection.rollback();
	        } catch (SQLException e2) {
	            System.out.println(e2.toString());
	        }
	        
	    }	
		
	}


	public static void dropUser(Connection connection, String user){
	// Works
        try {
            connection.setAutoCommit(false);
            PreparedStatement stmt = connection.prepareStatement("DELETE FROM USER_ACCOUNT WHERE username=?");
            stmt.setString(1, user);
            stmt.executeUpdate();
            connection.commit();
        } catch (SQLException e1) {
            try {
                connection.rollback();
            } catch (SQLException e2) {
                System.out.println(e2.toString());
            }
        }

        if (currentUser.equals(username)){
        	logout(connection);
        }

	}

	public static void createEvent(Connection connection, int sport_id, int venue_id, Date event_time, char gender){
	// Works
		try {
            connection.setAutoCommit(false);
            PreparedStatement stmt = connection.prepareStatement("INSERT INTO EVENT (event_id, sport_id, venue_id, event_time, gender) VALUES (SEQ_EVENT.NEXTVAL, ?, ?, ?, ?)");
            stmt.setInt(1, sport_id);
            stmt.setInt(2, venue_id);
            stmt.setDate(3, event_time);
            stmt.setString(4, String.valueOf(gender));
            stmt.executeUpdate();
            connection.commit();
        } catch (SQLException e1) {
        	System.out.println("This venue is at capacity.");
            try {
                connection.rollback();
            } catch (SQLException e2) {
                System.out.println(e2.toString());
            }
        }

	}

	public static void addEventOutcome(Connection connection, String olympic_city, String olympic_year, int team_id, int event_id, int participant_id, int position){
	// WORKS 
		try {
            connection.setAutoCommit(false);
            PreparedStatement stmt = connection.prepareStatement("SELECT olympic_id FROM OLYMPICS WHERE host_city = ? and EXTRACT(YEAR FROM opening_date) = ?"); 
            stmt.setString(1, olympic_city);
            stmt.setString(2, olympic_year);
            ResultSet res1 = stmt.executeQuery();
            res1.next();
            int olympic_id = res1.getInt("olympic_id");
            System.out.println(olympic_id);

            stmt = connection.prepareStatement("INSERT INTO SCOREBOARD (olympic_id, event_id, team_id, participant_id, position) VALUES (?, ?, ?, ?, ?)");
            stmt.setInt(1, olympic_id);
            stmt.setInt(2, event_id);
            stmt.setInt(3, team_id);
            stmt.setInt(4, participant_id);
            stmt.setInt(5, position);
            stmt.executeUpdate();
            connection.commit();
        } catch (SQLException e1) {
        	System.out.println("Unable to add Event Outcome");
            try {
                connection.rollback();
            } catch (SQLException e2) {
                System.out.println(e2.toString());
            }
        }

	}

// Coach
	public static void createTeam(Connection connection, String olympic_city, String olympic_year, int sport_id, int country_id, String team_name, int coach_id){
	// WORKS 
		try {
            connection.setAutoCommit(false);
            PreparedStatement stmt = connection.prepareStatement("SELECT olympic_id FROM OLYMPICS WHERE host_city = ? and EXTRACT(YEAR FROM opening_date) = ?"); 
            stmt.setString(1, olympic_city);
            stmt.setString(2, olympic_year);
            ResultSet res1 = stmt.executeQuery();
            res1.next();
            int olympic_id = res1.getInt("olympic_id");
            System.out.println(olympic_id);

            stmt = connection.prepareStatement("INSERT INTO TEAM (team_id, olympic_id, team_name, country_id, sport_id, coach_id) VALUES (SEQ_TEAM.NEXTVAL, ?, ?, ?, ?, ?)");
            stmt.setInt(1, olympic_id);
            stmt.setString(2, team_name);
            stmt.setInt(3, country_id);
            stmt.setInt(4, sport_id);
            stmt.setInt(5, coach_id);
            stmt.executeUpdate();
            connection.commit();
        } catch (SQLException e1) {
        	System.out.println("Trigger");
            try {
                connection.rollback();
            } catch (SQLException e2) {
                System.out.println(e2.toString());
            }
        }
	}

	public static void registerTeam(Connection connection, int team_id, int event_id){
	// Works	
		try {
			connection.setAutoCommit(false);
	        PreparedStatement stmt = connection.prepareStatement("INSERT INTO EVENT_PARTICIPATION (team_id, event_id, status) VALUES (?, ?, 'e')");
	        stmt.setInt(1, team_id);
	        stmt.setInt(2, event_id);
	        stmt.executeUpdate();
	        connection.commit();
	    } catch (SQLException e1) {
	        try {
	            connection.rollback();
	        } catch (SQLException e2) {
	            System.out.println(e2.toString());
	        }
	        
	    }

	}

	public static void addParticipant(Connection connection, String fname, String lname, String nationality, String birth_place, Date dob){
	// Works
		try {
			connection.setAutoCommit(false);
	        PreparedStatement stmt = connection.prepareStatement("INSERT INTO PARTICIPANT (participant_id, fname, lname, nationality, birth_place, dob) VALUES (SEQ_PARTICIPANT.NEXTVAL, ?, ?, ?, ?, ?)");
	        stmt.setString(1, fname);
	        stmt.setString(2, lname);
	        stmt.setString(3, nationality);
	        stmt.setString(4, birth_place);
	        stmt.setDate(5, dob);
	        stmt.executeUpdate();
	        connection.commit();
	    } catch (SQLException e1) {
	        try {
	            connection.rollback();
	        } catch (SQLException e2) {
	            System.out.println(e2.toString());
	        }
	        
	    }
	}

	public static void addTeamMember(Connection connection, int team_id, int participant_id){
	// WORKS 	
		try {
			connection.setAutoCommit(false);
	        PreparedStatement stmt = connection.prepareStatement("INSERT INTO TEAM_MEMBER (team_id, participant_id) VALUES (?, ?)");
	        stmt.setInt(1, team_id);
	        stmt.setInt(2, participant_id);
	        stmt.executeUpdate();
	        connection.commit();
	    } catch (SQLException e1) {
	        try {
	            connection.rollback();
	        } catch (SQLException e2) {
	            System.out.println(e2.toString());
	        }
	        
	    }

	}

	public static void dropTeamMember(Connection connection, int participant_id){
	// WORKS 
		try {
            connection.setAutoCommit(false);
            PreparedStatement stmt = connection.prepareStatement("DELETE FROM PARTICIPANT WHERE participant_id=?");
            stmt.setInt(1, participant_id);
            stmt.executeUpdate();
            connection.commit();
        } catch (SQLException e1) {
        	System.out.println("Athlete Dismissal Trigger");
            try {
                connection.rollback();
            } catch (SQLException e2) {
                System.out.println(e2.toString());
            }
        }
	}

// ALL
	public static void login(Connection connection, String username, String passkey){
	// Works
		try{
			connection.setAutoCommit(false);
	        PreparedStatement stmt = connection.prepareStatement("SELECT * FROM user_account WHERE username=? AND passkey=?");
	        stmt.setString(1, username);
	        stmt.setString(2, passkey);
	        ResultSet rs = stmt.executeQuery();
	        if (rs.next()) {
	            loggedIn = true;
	            currentUser = username;
	            System.out.println("Successfully logged in");
	        } else {
	            System.out.println("Username and/or password not recognized");
	        }
	    } catch (SQLException e1) {
	        try {
	            connection.rollback();
	        } catch (SQLException e2) {
	            System.out.println(e2.toString());
	        }
	    }
	}

	public static void displaySport(Connection connection, String sport_name){
	// WORKS 
		// display the:
			// olympic year it was added SPORTS dob
			// events of that sport EVENT 
			// gender EVENT
			// the medal winners and their countries SCOREBOARD
		try {
			connection.setAutoCommit(false);


            PreparedStatement stmt = connection.prepareStatement("SELECT sport_id, EXTRACT(YEAR FROM dob) as ydob FROM SPORT WHERE sport_name=?");
	        stmt.setString(1, sport_name);
	        ResultSet res1 = stmt.executeQuery();
            res1.next();
            int sport_id = res1.getInt("sport_id");
            String dob = res1.getString("ydob");
            System.out.println(sport_name+":");
            System.out.println("	Olympic year added: "+dob);

            stmt = connection.prepareStatement("SELECT event_id, gender FROM EVENT WHERE sport_id=?");
	        stmt.setInt(1, sport_id);
	        ResultSet res2 = stmt.executeQuery();
            System.out.println("	Events: ");
            int event_id;
            char gender;
            while(res2.next()){
            	event_id = res2.getInt("event_id");
            	gender = res2.getString("gender").charAt(0);
            	System.out.println("		Event ID: "+event_id+"	Gender: "+gender);


            	stmt = connection.prepareStatement("SELECT p.fname, p.lname, m.medal_title, c.country FROM SCOREBOARD s Join TEAM t on s.team_id=t.team_id JOIN COUNTRY c on t.country_id=c.country_id JOIN PARTICIPANT p on s.participant_id=p.participant_id JOIN MEDAL m on s.medal_id = m.medal_id WHERE s.event_id=? ORDER BY s.olympic_id asc, s.medal_id asc");
            	stmt.setInt(1, event_id);
	        	ResultSet res3 = stmt.executeQuery();
	        	System.out.println("			Medal Winners & Countries:");
	        	
	        	String fname, lname, country, medal_title;
	        	while(res3.next()){
	        		fname = res3.getString("fname");
	        		lname = res3.getString("lname");
	        		//medal_title = res3.getString("m.medal_title");
	        		country = res3.getString("country");
	        		System.out.println("				"+fname+" "+lname+"    "+country);
	        	}
            	
            	
            }


	    } catch (SQLException e1) {
	        try {
	            connection.rollback();
	        } catch (SQLException e2) {
	            System.out.println(e2.toString());
	        }
	        
	    }

	}

	public static void displayEvent(Connection connection, String olympic_city, String olympic_year, int event_id){
	// WORKs 
		// olympic game
		// event name (sport_name + event_id)
		// participant
		// position		SCOREBOARD
		// earned medal
		try{
			connection.setAutoCommit(false);
            PreparedStatement stmt = connection.prepareStatement("SELECT olympic_id FROM OLYMPICS WHERE host_city = ? and EXTRACT(YEAR FROM opening_date) = ?"); 
            stmt.setString(1, olympic_city);
            stmt.setString(2, olympic_year);
            ResultSet res1 = stmt.executeQuery();
            res1.next();
            int olympic_id = res1.getInt("olympic_id");

            System.out.println("\nOlympic Game: "+olympic_city+" "+olympic_year);

            stmt = connection.prepareStatement("SELECT s.sport_name FROM EVENT e JOIN SPORT s on e.sport_id=s.sport_id WHERE event_id=?");
            stmt.setInt(1, event_id);
            ResultSet res2 = stmt.executeQuery();
            res2.next();
            String sport_name = res2.getString("sport_name");

            System.out.println("Event Name: "+sport_name+" "+event_id);

            stmt = connection.prepareStatement("SELECT p.fname, p.lname, s.position, m.medal_title FROM SCOREBOARD s JOIN PARTICIPANT p on s.participant_id=p.participant_id LEFT OUTER JOIN MEDAL m on s.medal_id=m.medal_id WHERE event_id=?");
            stmt.setInt(1, event_id);
            ResultSet res3 = stmt.executeQuery();
            String fname, lname, medal_title;
            int position;
            System.out.println("Participants: ");
            while(res3.next()){	
            	fname = res3.getString("fname");
            	lname = res3.getString("lname");
            	position = res3.getInt("position");
            	medal_title = res3.getString("medal_title");
            	System.out.println("	"+fname+" "+lname+" Position: "+position+" Medal: "+medal_title);
            }

        } catch (SQLException e1) {
	        try {
	            connection.rollback();
	        } catch (SQLException e2) {
	            System.out.println(e2.toString());
	        }
	        
	    }


	}

	public static void countryRanking(Connection connection, int olympic_id){
	// Works
		// all participanting countries (abbrevation)
		// first year the country participated in the olympics
		// number of gold, silver and bronze medals
		// rank from points
		try{
			connection.setAutoCommit(false);
            PreparedStatement stmt = connection.prepareStatement("SELECT distinct c.country_id, c.country_code, oyear, sum(onceperteam) as country_total FROM TEAM t JOIN COUNTRY c on t.country_id=c.country_id JOIN (SELECT cid, EXTRACT(YEAR FROM o.opening_date) as oyear FROM OLYMPICS o JOIN (SELECT tt.country_id as cid, min(tt.olympic_id) as firstoly FROM TEAM tt group by tt.country_id) on o.olympic_id=firstoly) on c.country_id=cid JOIN (SELECT distinct s.event_id, s.team_id as stid, m.points as onceperteam FROM SCOREBOARD s JOIN MEDAL m on s.medal_id=m.medal_id) on stid=t.team_id WHERE t.olympic_id = ? group by c.country_id, c.country_code, oyear ORDER BY country_total desc");   
            stmt.setInt(1, olympic_id);
            ResultSet res1 = stmt.executeQuery();
            int country_id;
            String country_code;
            String oyear;
            int country_total, gold, silver, bronze;
            System.out.println("\nCountry Ranking:");
            while(res1.next())
            {
	            country_id = res1.getInt("country_id");
	            country_code = res1.getString("country_code");
	            oyear = res1.getString("oyear");
	            country_total = res1.getInt("country_total");

	            
	            stmt = connection.prepareStatement("SELECT COUNT(*) as gold FROM (SELECT distinct s.event_id, s.team_id, t.country_id as tcid, s.medal_id as smid FROM SCOREBOARD s JOIN TEAM t on s.team_id=t.team_id JOIN COUNTRY c on t.country_id=c.country_id) where tcid=? and smid=1");
	            stmt.setInt(1, country_id);
	            ResultSet res2 = stmt.executeQuery();
	            res2.next();
	            gold = res2.getInt("gold");

	            stmt = connection.prepareStatement("SELECT COUNT(*) as silver FROM (SELECT distinct s.event_id, s.team_id, t.country_id as tcid, s.medal_id as smid FROM SCOREBOARD s JOIN TEAM t on s.team_id=t.team_id JOIN COUNTRY c on t.country_id=c.country_id) where tcid=? and smid=2");
	            stmt.setInt(1, country_id);
	            ResultSet res3 = stmt.executeQuery();
	            res3.next();
	            silver = res3.getInt("silver");

	            stmt = connection.prepareStatement("SELECT COUNT(*) as bronze FROM (SELECT distinct s.event_id, s.team_id, t.country_id as tcid, s.medal_id as smid FROM SCOREBOARD s JOIN TEAM t on s.team_id=t.team_id JOIN COUNTRY c on t.country_id=c.country_id) where tcid=? and smid=3");
	            stmt.setInt(1, country_id);
	            ResultSet res4 = stmt.executeQuery();
	            res4.next();
	            bronze = res4.getInt("bronze");

	            System.out.println("	"+country_code+" "+oyear+ " TOTAL POINTS: "+country_total+ " GOLD: "+gold+ " SILVER: "+silver+" BRONZE: "+bronze);
	        }



        } catch (SQLException e1) {
	        try {
	            connection.rollback();
	        } catch (SQLException e2) {
	            System.out.println(e2.toString());
	        }
	        
	    }
	}

	public static void topkAthletes(Connection connection, int olympic_id, int k){
	// WORKS
		
    	try{
			connection.setAutoCommit(false);
            PreparedStatement stmt = connection.prepareStatement("SELECT p.participant_id, p.fname, p.lname, sum(pts) as total_rank FROM TEAM t JOIN TEAM_MEMBER tm on t.team_id=tm.team_id JOIN PARTICIPANT p on tm.participant_id=p.participant_id JOIN (SELECT distinct s.event_id, s.team_id, s.participant_id as spid, m.points as pts FROM SCOREBOARD s JOIN MEDAL m on s.medal_id=m.medal_id) on spid=tm.participant_id WHERE t.olympic_id=? GROUP BY p.participant_id, p.fname, p.lname ORDER BY total_rank desc FETCH FIRST ? ROWS ONLY");
            stmt.setInt(1, olympic_id);
            stmt.setInt(2, k);
            ResultSet res1 = stmt.executeQuery();
            
            String fname, lname;
            int total_rank, gold, silver, bronze, participant_id;
            System.out.println("\nTop "+k+" Athletes:");
            while(res1.next())
            {
            	participant_id = res1.getInt("participant_id");
	            fname = res1.getString("fname");
	            lname = res1.getString("lname");
	            total_rank = res1.getInt("total_rank");

	            stmt = connection.prepareStatement("SELECT COUNT(*) as gold FROM (SELECT distinct s.event_id, s.team_id, s.participant_id as spid, s.medal_id as smid FROM SCOREBOARD s JOIN TEAM t on s.team_id=t.team_id) where spid=? and smid=1");
	            stmt.setInt(1, participant_id);
	            ResultSet res2 = stmt.executeQuery();
	            res2.next();
	            gold = res2.getInt("gold");

	            stmt = connection.prepareStatement("SELECT COUNT(*) as silver FROM (SELECT distinct s.event_id, s.team_id, s.participant_id as spid, s.medal_id as smid FROM SCOREBOARD s JOIN TEAM t on s.team_id=t.team_id) where spid=? and smid=2");
	            stmt.setInt(1, participant_id);
	            ResultSet res3 = stmt.executeQuery();
	            res3.next();
	            silver = res3.getInt("silver");

	            stmt = connection.prepareStatement("SELECT COUNT(*) as bronze FROM (SELECT distinct s.event_id, s.team_id, s.participant_id as spid, s.medal_id as smid FROM SCOREBOARD s JOIN TEAM t on s.team_id=t.team_id) where spid=? and smid=3");
	            stmt.setInt(1, participant_id);
	            ResultSet res4 = stmt.executeQuery();
	            res4.next();
	            bronze = res4.getInt("bronze");

	            System.out.println("	"+fname+" "+lname+" TOTAL POINTS: "+total_rank+ " GOLD: "+gold+ " SILVER: "+silver+" BRONZE: "+bronze);
	        	
	        }

        } catch (SQLException e1) {
	        try {
	            connection.rollback();
	        } catch (SQLException e2) {
	            System.out.println(e2.toString());
	        }
	        
	    }
	}

	public static void connectedAthletes(Connection connection, int participant_id, int olympic_id, int n){
	// TO DO
		try{
			connection.setAutoCommit(false);
            PreparedStatement stmt = connection.prepareStatement("");
           	//stmt.setInt(1, participant_id);
           	//stmt.setInt(2, olympic_id);
            ResultSet res1 = stmt.executeQuery();

            
        } catch (SQLException e1) {
	        try {
	            connection.rollback();
	        } catch (SQLException e2) {
	            System.out.println(e2.toString());
	        }
	        
	    }

	}

	public static void logout(Connection connection){
	// Works
		currentUser = null;
		currentRole = 0;
		loggedIn = false;

	}

	public static void exit(){
	// Works
		cont = false;
		System.exit(0);
	}
}