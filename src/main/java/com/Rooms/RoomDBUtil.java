package com.Rooms;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.customer.Customer;
import com.customer.DBConnect;

public class RoomDBUtil {

	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;

	// insert data
	public static boolean insertData(String roomType, int roomNumber, int personNumber, int childNumber,
			String resFacilities, String description, String username) {

		isSuccess = false;

		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "insert into reservationsdetails values (0,'" + roomType + "','" + roomNumber + "','"
					+ personNumber + "','" + childNumber + "','" + resFacilities + "','" + description + "', '"
					+ username + "')";
			int rs = stmt.executeUpdate(sql);

			if (rs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isSuccess;
	}

	// display Data

	public static List<Room> displayInsertedData(String username) {

		ArrayList<Room> room = new ArrayList<>();

		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from reservationsdetails where username ='" + username + "'";
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int roomId = rs.getInt(1);
				String roomType = rs.getString(2);
				int roomNumber = rs.getInt(3);
				int personNumber = rs.getInt(4);
				int childNumber = rs.getInt(5);
				String resFacilities = rs.getString(6);
				String description = rs.getString(7);
				String userName = rs.getString(8);

				Room r1 = new Room(roomId, roomType, roomNumber, personNumber, childNumber, resFacilities, description,
						userName);
				room.add(r1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return room;
	}

	// Update data
	public static boolean updateRoomDetails(String id, String roomType, int roomNumber, int personNumber,  
			int childNumber, String resFacilities, String description, String username) {

		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "update reservationsdetails set roomType='" + roomType + "',roomNumber='" + roomNumber
					+ "',personNumber='" + personNumber + "', childNumber='" + childNumber + "',resFacilities='"
					+ resFacilities + "',description='" + description + "'" + "where id='" + id + "'";
			int rs = stmt.executeUpdate(sql);

			if (rs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isSuccess;
	}

	//delete data
	public static boolean deleteRoom(String id) {

		int convId = Integer.parseInt(id);

		try {

			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "delete from reservationsdetails where id='" + convId + "'";
			int r = stmt.executeUpdate(sql);

			if (r > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isSuccess;
	}
	
	
}

















