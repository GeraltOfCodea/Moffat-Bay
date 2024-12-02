/*
 * Moffat Bay Capstone Project
 * Developed by:
 * - Celine Del Mundo
 * - Ryan Norrbom
 * - Eric Williams-Phillips
 */
package com.MoffatBayLodge.beans;

public class User {
    private String userName;
    private int customerId;

    public User(String userName, int customerId) {
        this.userName = userName;
        this.customerId = customerId;
    }

    // Getters
    public String getUserName() {
        return userName;
    }

    public int getCustomerId() {
        return customerId;
    }

    // Setters (if needed)
    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }
}
