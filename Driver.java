// Alyssa Jordan
// alj81
// 4/13/20


// Compile: javac -cp ojdbc7.jar Olympic.java Driver.java
// Execute: java -cp ojdbc7.jar:. Driver

import java.util.*;
import java.io.*;
import java.sql.*;
import java.sql.Date;


public class Driver
{
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


        
        Olympic o = new Olympic();

        // Create User
        System.out.println("\n-- Create User --");
        String[] f1 = o.helperCreateUser();
        o.createUser(connection, f1[0], f1[1], Integer.parseInt(f1[2]));
        try {
        	connection.setAutoCommit(false);
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM USER_ACCOUNT WHERE user_id = (SELECT MAX(user_id) FROM USER_ACCOUNT)");
            //stmt.setString(1, f1[0]);
            ResultSet res = stmt.executeQuery();
            res.next();
            System.out.println("   "+res.getInt("user_id")+" "+res.getString("username")+" "+res.getString("passkey")+" "+res.getInt("role_id")+" "+res.getDate("last_login"));

        } catch (SQLException e1) {
        	System.out.println("Error");
            try {
                connection.rollback();
            } catch (SQLException e2) {
                System.out.println(e2.toString());
            }
        }

        // Drop User
        System.out.println("\n-- Drop User --");

        System.out.println("  Before:");
        try {
        	connection.setAutoCommit(false);
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM USER_ACCOUNT");
            ResultSet res = stmt.executeQuery();
            while(res.next()){
            	System.out.println("   "+res.getInt("user_id")+" "+res.getString("username")+" "+res.getString("passkey")+" "+res.getInt("role_id")+" "+res.getDate("last_login"));
            }
        } catch (SQLException e1) {
        	System.out.println("Error");
            try {
                connection.rollback();
            } catch (SQLException e2) {
                System.out.println(e2.toString());
            }
        }

        String f2 = o.helperDropUser();
        o.dropUser(connection, f2);

        System.out.println("  After:");
        try {
        	connection.setAutoCommit(false);
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM USER_ACCOUNT");
            ResultSet res = stmt.executeQuery();
            while(res.next()){
            	System.out.println("   "+res.getInt("user_id")+" "+res.getString("username")+" "+res.getString("passkey")+" "+res.getInt("role_id")+" "+res.getDate("last_login"));
            }
        } catch (SQLException e1) {
        	System.out.println("Error");
            try {
                connection.rollback();
            } catch (SQLException e2) {
                System.out.println(e2.toString());
            }
        }

       	// Create Event
       	System.out.println("\n-- Create Event --");
       	String[] f3 = o.helperCreateEvent();
       	o.createEvent(connection, Integer.parseInt(f3[0]), Integer.parseInt(f3[1]), Date.valueOf(f3[2]), f3[3].charAt(0));

       	try {
        	connection.setAutoCommit(false);
        	PreparedStatement stmt = connection.prepareStatement("SELECT * FROM EVENT WHERE event_id = (SELECT MAX(event_id) FROM EVENT)");
            //PreparedStatement stmt = connection.prepareStatement("SELECT * FROM EVENT WHERE sport_id = ? and venue_id = ? and event_time = ? and gender = ?");
            //stmt.setInt(1, Integer.parseInt(f3[0]));
            //stmt.setInt(2, Integer.parseInt(f3[1]));
            //stmt.setDate(3, Date.valueOf(f3[2]));
            //stmt.setString(4, f3[3]);
            ResultSet res = stmt.executeQuery();
            res.next();
            System.out.println("   "+res.getInt("event_id")+" "+res.getInt("sport_id")+" "+res.getInt("venue_id")+" "+res.getString("gender")+" "+res.getDate("event_time"));

        } catch (SQLException e1) {
        	System.out.println("Error");
            try {
                connection.rollback();
            } catch (SQLException e2) {
                System.out.println(e2.toString());
            }
        }

       	// Add Event Outcome
       	System.out.println("\n-- Add Event Outcome --");
       	String[] f4 = o.helperAddEventOutcome();
       	o.addEventOutcome(connection, f4[0], f4[1], Integer.parseInt(f4[2]), Integer.parseInt(f4[3]), Integer.parseInt(f4[4]), Integer.parseInt(f4[5]));
       	try {
        	connection.setAutoCommit(false);
        	PreparedStatement stmt_prep = connection.prepareStatement("SELECT olympic_id FROM OLYMPICS WHERE host_city = ? and EXTRACT(YEAR FROM opening_date) = ?"); 
            stmt_prep.setString(1, f4[0]);
            stmt_prep.setString(2, f4[1]);
            ResultSet res_prep = stmt_prep.executeQuery();
            res_prep.next();

            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM SCOREBOARD WHERE olympic_id = ? and event_id = ? and participant_id =?");
            stmt.setInt(1, res_prep.getInt("olympic_id"));
            stmt.setInt(2, Integer.parseInt(f4[3]));
            stmt.setInt(3, Integer.parseInt(f4[4]));
            
            ResultSet res = stmt.executeQuery();
            res.next();
            System.out.println("   "+res.getInt("olympic_id")+" "+res.getInt("event_id")+" "+res.getInt("team_id")+" "+res.getInt("participant_id")+" "+res.getInt("position")+" "+res.getInt("medal_id"));

        } catch (SQLException e1) {
        	System.out.println("Error");
            try {
                connection.rollback();
            } catch (SQLException e2) {
                System.out.println(e2.toString());
            }
        }

       	// Create Team
       	System.out.println("\n-- Create Team --");
       	String[] f5 = o.helperCreateTeam();
       	o.createTeam(connection, f5[0], f5[1], Integer.parseInt(f5[2]), Integer.parseInt(f5[3]), f5[4], Integer.parseInt(f5[5]));
       	try {
        	connection.setAutoCommit(false);
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM TEAM WHERE team_id = (SELECT MAX(team_id) FROM TEAM)");
            ResultSet res = stmt.executeQuery();
            res.next();
            System.out.println("   "+res.getInt("team_id")+" "+res.getInt("olympic_id")+" "+res.getString("team_name")+" "+res.getInt("country_id")+" "+res.getInt("sport_id")+" "+res.getInt("coach_id"));

        } catch (SQLException e1) {
        	System.out.println("Error");
            try {
                connection.rollback();
            } catch (SQLException e2) {
                System.out.println(e2.toString());
            }
        }


       	// Register Team
       	System.out.println("\n-- Register Team --");
       	int[] f6 = o.helperRegisterTeam();
       	o.registerTeam(connection, f6[0], f6[1]);
       	try {
        	connection.setAutoCommit(false);
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM EVENT_PARTICIPATION WHERE team_id = ? and event_id = ?");
            stmt.setInt(1, f6[0]);
            stmt.setInt(2, f6[1]);

            ResultSet res = stmt.executeQuery();
            res.next();
            System.out.println("   "+res.getInt("team_id")+" "+res.getInt("event_id")+" "+res.getString("status"));

        } catch (SQLException e1) {
        	System.out.println("Error");
            try {
                connection.rollback();
            } catch (SQLException e2) {
                System.out.println(e2.toString());
            }
        }

       	// Add Participant
       	System.out.println("\n-- Add Participant --");
       	String[] f7 = o.helperAddParticipant();
       	o.addParticipant(connection, f7[0], f7[1], f7[2], f7[3], Date.valueOf(f7[4]));

       	try {
        	connection.setAutoCommit(false);
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM PARTICIPANT WHERE participant_id=(SELECT MAX(participant_id) FROM PARTICIPANT)");

            ResultSet res = stmt.executeQuery();
            res.next();
            System.out.println("   "+res.getInt("participant_id")+" "+res.getString("fname")+" "+res.getString("lname")+" "+res.getString("nationality")+" "+res.getString("birth_place")+" "+res.getDate("dob"));

        } catch (SQLException e1) {
        	System.out.println("Error");
            try {
                connection.rollback();
            } catch (SQLException e2) {
                System.out.println(e2.toString());
            }
        }

       	// Add Team Member
       	System.out.println("\n-- Add Team Member --");
       	int[] f8 = o.helperAddTeamMember();
       	o.addTeamMember(connection, f8[0], f8[1]);
       	try {
        	connection.setAutoCommit(false);
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM TEAM_MEMBER WHERE team_id = ? and participant_id = ?");
            stmt.setInt(1, f8[0]);
            stmt.setInt(2, f8[1]);

            ResultSet res = stmt.executeQuery();
            res.next();
            System.out.println("   "+res.getInt("team_id")+" "+res.getInt("participant_id"));

        } catch (SQLException e1) {
        	System.out.println("Error");
            try {
                connection.rollback();
            } catch (SQLException e2) {
                System.out.println(e2.toString());
            }
        }

       	// Drop Team Member
       	System.out.println("\n-- Drop Team Member --");

       	System.out.println("  Before:");
        try {
        	connection.setAutoCommit(false);
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM TEAM_MEMBER FETCH FIRST 8 ROWS ONLY");
            ResultSet res = stmt.executeQuery();
            while(res.next()){
            	System.out.println("   "+res.getInt("team_id")+" "+res.getInt("participant_id"));
            }
        } catch (SQLException e1) {
        	System.out.println("Error");
            try {
                connection.rollback();
            } catch (SQLException e2) {
                System.out.println(e2.toString());
            }
        }

        int f9 = o.helperDropTeamMember();
       	o.dropTeamMember(connection, f9);

        System.out.println("\n  After:");
        try {
        	connection.setAutoCommit(false);
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM TEAM_MEMBER FETCH FIRST 8 ROWS ONLY");
            ResultSet res = stmt.executeQuery();
            while(res.next()){
            	System.out.println("   "+res.getInt("team_id")+" "+res.getInt("participant_id"));
            }
        } catch (SQLException e1) {
        	System.out.println("Error");
            try {
                connection.rollback();
            } catch (SQLException e2) {
                System.out.println(e2.toString());
            }
        }


       	// Login
       	System.out.println("\n-- Login --");
       	String[] f10 = o.helperLogin();
       	o.login(connection, f10[0], f10[1]);

       	try{
			connection.setAutoCommit(false);
	        PreparedStatement stmt = connection.prepareStatement("SELECT * FROM user_account WHERE username=? AND passkey=?");
	        stmt.setString(1, f10[0]);
	        stmt.setString(2, f10[1]);
	        ResultSet res = stmt.executeQuery();
	        res.next();
	        System.out.println("   User Logged In Info: "+res.getInt("user_id")+" "+res.getString("username")+" "+res.getString("passkey")+" "+res.getInt("role_id")+" "+res.getDate("last_login"));

	    } catch (SQLException e1) {
	        try {
	            connection.rollback();
	        } catch (SQLException e2) {
	            System.out.println(e2.toString());
	        }
	    }


	    // Display Sport
	    System.out.println("\n-- Display Sport --");
	    String f11 = o.helperDisplaySport();
	    o.displaySport(connection, f11);

	    // Display Event
	    System.out.println("\n-- Display Event --");
	    String[] f12 = o.helperDisplayEvent();
	    o.displayEvent(connection, f12[0], f12[1], Integer.parseInt(f12[2]));

	    // Country Ranking
	    System.out.println("\n-- Country Ranking --");
	    int f13 = o.helperCountryRanking();
	    o.countryRanking(connection, f13);

	    // Top K Athletes
	    System.out.println("\n-- Top K Athletes --");
	    int[] f14 = o.helperTopKAthletes();
	    o.topkAthletes(connection, f14[0], f14[1]);

	    // logout
	    System.out.println("\n-- Logout --");
	    o.logout(connection);

	    // exit
	    System.out.println("\n-- Exit --");
	    o.exit();

	}

}