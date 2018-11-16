/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.util.ArrayList;
/**
 *
 * @author Xuanyou
 */
public class Player {
    private String name;
    private int score;
    private String color;
    private ArrayList<Piece> pieces = new ArrayList<Piece>();
    private int piecePoolX;
    private int piecePoolY;

    public Player(String name,String color,int score){
        this.name = name;
        this.color = color;
        this.score = score;
        this.piecePoolX = 0;
        this.piecePoolY = 0;
        initializePieces();
    }
    
    public String getName(){
        return name;
    }
    
    public int getScore(){
        return score;
    }
    
    public String getColor(){
        return color;
    }
    
    public void setName(String name){
        this.name = name;
    }
    
    public void setColor(String color){
        this.color = color;
    }
    
    //only called this method when the game ended.
    public void countScore(){
        int[][] temp = new int[5][5];
        for(int i = 0; i < pieces.size();i++){
            temp = pieces.get(i).getPiece();
            for(int j=0;j<temp.length;j++){
                for(int k=0;k<temp[j].length;k++){
                    if(temp[j][k] == 1){
                        //one block worth for 100 point(feel free to change it)
                        this.score += 100; 
                    }
                }
            }
        }
    }
    
    public void setPiecePoolPosition(int x, int y){
        this.piecePoolX = x;
        this.piecePoolY = y;
    }
    
    public void initializePieces(){
        for(int i=0;i<21;i++){
            Piece temp = new Piece(i,color);
            //20 is 4 times of width of one block which is 5 now. remember to 
            //change it if you change the width of block make sure change the number
            temp.setOriginPosition(piecePoolX+20, piecePoolY+20);
        }
    }
    
    public void drawPiecePool(){
        for(int i=0;i<pieces.size();i++){
            pieces.get(i).draw();
        }
    }
    
    public void remove(int i){
        pieces.remove(i);
    }

}
