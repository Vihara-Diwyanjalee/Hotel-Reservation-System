package com.hotel;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class HotelDBUtil {
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
    public static boolean insertHotel(String name, String type, InputStream photoStream) {
        boolean isSuccess = false;
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = DBConnect.getConnection();
            String sql = "INSERT INTO hotel (name, type, photo) VALUES (?, ?, ?)";

            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, type);
            pstmt.setBlob(3, photoStream);

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                isSuccess = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }

        return isSuccess;
    }
    
    
    public static List<Hotel> getAllHotels() {
        List<Hotel> hotels = new ArrayList<>();
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = DBConnect.getConnection();
            String sql = "SELECT id, name, type, photo FROM hotel";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String type = rs.getString("type");
                InputStream photoStream = rs.getBinaryStream("photo");

                Hotel hotel = new Hotel(id, name, type, photoStream);
                hotels.add(hotel);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources (rs, pstmt, con) in a finally block
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }

        return hotels;
    }
    
    public static InputStream getHotelPhoto(int hotelId) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        InputStream photoStream = null;

        try {
            con = DBConnect.getConnection();
            String sql = "SELECT photo FROM hotel WHERE id=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, hotelId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                photoStream = rs.getBinaryStream("photo");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }

        return photoStream;
    }
    
    public static Hotel getHotelById(int hotelId) {
        Hotel hotel = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = DBConnect.getConnection();
            String sql = "SELECT name, type, photo FROM hotel WHERE id=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, hotelId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String name = rs.getString("name");
                String type = rs.getString("type");
                InputStream photoStream = rs.getBinaryStream("photo");

                hotel = new Hotel(hotelId, name, type, photoStream);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources in a finally block as mentioned in the previous response
        }

        return hotel;
    }
    public static int getHotelCount() {
        int hotelCount = 0;

        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();
            String sql = "SELECT COUNT(*) FROM hotel"; // Adjust the table name as per your schema
            rs = stmt.executeQuery(sql);

            if (rs.next()) {
                hotelCount = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return hotelCount;
    }

    public static List<Hotel> searchHotels(String keyword) {
        List<Hotel> hotels = new ArrayList<>();
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = DBConnect.getConnection();
            String sql = "SELECT id, name, type, photo FROM hotel WHERE name LIKE ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, "%" + keyword + "%");
            rs = pstmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String type = rs.getString("type");
                InputStream photoStream = rs.getBinaryStream("photo");

                Hotel hotel = new Hotel(id, name, type, photoStream);
                hotels.add(hotel);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources (rs, pstmt, con) in a finally block
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }

        return hotels;
    }

    public static boolean deleteHotel(int hotelId) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = DBConnect.getConnection();
            String sql = "DELETE FROM hotel WHERE id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, hotelId);

            int rowsAffected = preparedStatement.executeUpdate();

            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false; // Delete operation failed
        } finally {
            // Close the connection and prepared statement in a finally block
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    public static boolean updateHotel(int hotelId, String name, String type) {
        Connection con = null;
        PreparedStatement ps = null;
        boolean isUpdated = false;

        try {
            con = DBConnect.getConnection(); // Get a database connection using your method
            String sql = "UPDATE hotel SET name = ?, type = ? WHERE id = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, type);
            ps.setInt(3, hotelId);

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                isUpdated = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return isUpdated;
    }

 // Imports and other methods...

    public static boolean updateHotelWithImage(int hotelId, String name, String type, InputStream imageStream) {
        Connection con = null;
        PreparedStatement ps = null;
        boolean isUpdated = false;

        try {
            con = DBConnect.getConnection();
            String sql = "UPDATE hotel SET name = ?, type = ?, image = ? WHERE id = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, type);
            ps.setBinaryStream(3, imageStream);
            ps.setInt(4, hotelId);

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                isUpdated = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources...
        }

        return isUpdated;
    }

}
