package com.hotel;
import java.io.InputStream;

public class Hotel {
    private int id;
    private String name;
    private String type;
    private InputStream photo;

    public Hotel(int id, String name, String type, InputStream photo) {
        this.id = id;
        this.name = name;
        
        this.type = type;
        this.photo = photo;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

   

    public String getType() {
        return type;
    }

    public InputStream getPhoto() {
        return photo;
    }
}
