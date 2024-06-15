package com.Rooms;

public class Room {

	private int id;
	private String roomType ;
    private int roomNumber ;
    private int personNumber ;
    private int childNumber ;
    private String resFacilities ;
    private String description ;
    private String username ;

	public Room(int id, String roomType, int roomNumber, int personNumber, int childNumber, String resFacilities,
			String description, String username) {
		this.id = id;
		this.roomType = roomType;
		this.roomNumber = roomNumber;
		this.personNumber = personNumber;
		this.childNumber = childNumber;
		this.resFacilities = resFacilities;
		this.description = description;
		this.username = username;
	}

	public int getId() {
		return id;
	}

	public String getRoomType() {
		return roomType;
	}

	public int getRoomNumber() {
		return roomNumber;
	}

	public int getPersonNumber() {
		return personNumber;
	}

	public int getChildNumber() {
		return childNumber;
	}

	public String getResFacilities() {
		return resFacilities;
	}

	public String getDescription() {
		return description;
	}
	
	public String getUsername() {
		return username;
	}
	
}
