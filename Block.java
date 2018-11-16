/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Xuanyou
 */
public class Block {
    private int x;
    private int y;
    private int width;
    private String color = "white";

    public Block(int x, int y,int width){
        this.x = x;
        this.y = y;
        this.width = width;
    }

    public Block(int x, int y,int width, String color){
        this.x = x;
        this.y = y;
        this.width = width;
        this.color = color;
    }

    public int getX(){
        return this.x;
    }

    public int getY(){
        return this.y;
    }

    public int getWidth(){
        return this.width;
    }

    public String getColor(){
        return this.color;
    }

    public void setX(int x){
        this.x = x;
    }

    public void setY(int y){
        this.y = y;
    }

    public void setWidth(int width){
        this.width = width;
    }

    public void setColor(String color){
        this.color = color;
    }

    public void moveBlock(int horizontal,int vertical){
        this.x += horizontal*this.width;
        this.y += vertical*this.width;
    }
    
    public void draw(){
        //fill up this method to draw a square base on the width and (x,y) that 
        //exist in the JavaFx scene. Feel free to change color in private
        //to the enum or int that works for javaFX
    }

}

