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

public class Piece {
    private int[][] piece = new int[5][5]; //create a 5X5 2dMatrix (0 stand for no block 1 means have block there, piece[2][2] is the original block)
    private int type;
    private int originX = 0;
    private int originY = 0;
    private String color;

    public Piece(int type, String color){
        for(int i=0;i<5;i++){
            for(int j=0;j<5;j++){
                piece[i][j]=0;
            }
        }
        setDefualtPiece(type);
    }

    public int[][] getPiece(){
        return piece;
    }

    public Piece(int x,int y,int type){
        setOriginPosition(x,y);
        for(int i=0;i<5;i++){
            for(int j=0;j<5;j++){
                piece[i][j]=0;
            }
        }
        setDefualtPiece(type);
    }

    public void rotateRight(){
        int[][] temp = new int[5][5];
        int dst = 4;
        for(int i=0;i<5;i++,dst--){
            for(int j=0;j<5;j++){
                temp[j][dst] = piece[i][j];
            }
        }
        piece = temp;
    }

    public void verticalFlip(){
        int[][] temp = new int[5][5];
        int dst;
        for(int i=0;i<5;i++){
            dst = 4;
            for(int j=0;j<5;j++,dst--){
                temp[i][dst] = piece[i][j];
            }
        }
        piece = temp;
    }

    public void horizontalFlip(){
        int[][] temp = new int[5][5];
        int dst = 4;
        for(int i=0;i<5;i++,dst--){
            for(int j=0;j<5;j++){
                temp[dst][j] = piece[i][j];
            }
        }
        piece = temp;
    }

    public void setColor(String color){
        this.color = color;
    }

    public void setOriginPosition(int x,int y){
        originX = x;
        originY = y;
    }

    public void setDefualtPiece(int type){
        this.type = type;
        switch(type){
            case 1:
                piece[2][2] = 1;
                break;
            case 2:
                piece[2][2] = 1;
                piece[2][3] = 1;
                break;
            case 3:
                piece[2][1] = 1;
                piece[2][2] = 1;
                piece[2][3] = 1;
                break;
            case 4:
                piece[1][2] = 1;
                piece[2][2] = 1;
                piece[2][3] = 1;
                break;
            case 5:
                piece[2][0] = 1;
                piece[2][1] = 1;
                piece[2][2] = 1;
                piece[2][3] = 1;
                break;
            case 6:
                piece[1][1] = 1;
                piece[2][1] = 1;
                piece[2][2] = 1;
                piece[2][3] = 1;
                break;
            case 7:
                piece[2][1] = 1;
                piece[2][2] = 1;
                piece[2][3] = 1;
                piece[3][3] = 1;
                break;
            case 8:
                piece[2][1] = 1;
                piece[2][2] = 1;
                piece[3][1] = 1;
                piece[3][2] = 1;
                break;
            case 9:
                piece[1][2] = 1;
                piece[2][2] = 1;
                piece[2][1] = 1;
                piece[3][1] = 1;
                break;
            case 10:
                piece[2][0] = 1;
                piece[2][1] = 1;
                piece[2][2] = 1;
                piece[2][3] = 1;
                piece[2][4] = 1;
                break;
            case 11:
                piece[1][1] = 1;
                piece[2][1] = 1;
                piece[2][2] = 1;
                piece[2][3] = 1;
                piece[2][4] = 1;
                break;
            case 12:
                piece[1][1] = 1;
                piece[1][2] = 1;
                piece[2][2] = 1;
                piece[2][3] = 1;
                piece[2][4] = 1;
                break;
            case 13:
                piece[1][1] = 1;
                piece[1][2] = 1;
                piece[2][1] = 1;
                piece[2][2] = 1;
                piece[2][3] = 1;
                break;
            case 14:
                piece[1][1] = 1;
                piece[1][3] = 1;
                piece[2][1] = 1;
                piece[2][2] = 1;
                piece[2][3] = 1;
                break;
            case 15:
                piece[2][0] = 1;
                piece[2][1] = 1;
                piece[2][2] = 1;
                piece[3][2] = 1;
                piece[2][3] = 1;
                break;
            case 16:
                piece[1][2] = 1;
                piece[3][2] = 1;
                piece[2][2] = 1;
                piece[2][3] = 1;
                piece[2][4] = 1;
                break;
            case 17:
                piece[2][0] = 1;
                piece[2][1] = 1;
                piece[2][2] = 1;
                piece[3][2] = 1;
                piece[4][2] = 1;
                break;
            case 18:
                piece[1][1] = 1;
                piece[2][1] = 1;
                piece[2][2] = 1;
                piece[3][2] = 1;
                piece[3][3] = 1;
                break;
            case 19:
                piece[1][1] = 1;
                piece[1][2] = 1;
                piece[2][2] = 1;
                piece[3][2] = 1;
                piece[3][3] = 1;
                break;
            case 20:
                piece[1][1] = 1;
                piece[1][2] = 1;
                piece[2][2] = 1;
                piece[3][2] = 1;
                piece[2][3] = 1;
                break;
            case 21:
                piece[2][1] = 1;
                piece[1][2] = 1;
                piece[2][2] = 1;
                piece[3][2] = 1;
                piece[2][3] = 1;
                break;
        }
    }

    public void draw(){
        for(int i=0;i<piece.length;i++){
            for(int j=0;j<piece[i].length;j++){
                System.out.print(piece[i][j]+"\t");
            }
            System.out.println();
        }
    }

}
