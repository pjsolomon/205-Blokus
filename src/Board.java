/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Xuanyou
 */
public class Board {
    private Block originBlock = new Block(0, 0, 5);
    private Block[][] Board = new Block[20][20];

    public Board() {
        for (int i = 0; i < Board.length; i++) {
            for (int j = 0; j < Board[i].length; j++) {
                originBlock.moveBlock(i, j);
                setBlock(i, j, originBlock);
            }
        }
    }

    public Board(int originX, int originY) {
        this.setOriginBlock(originX, originY);
        for (int i = 0; i < Board.length; i++) {
            for (int j = 0; j < Board[i].length; j++) {
                originBlock.moveBlock(i, j);
                setBlock(i, j, originBlock);
            }
        }
    }

    public void setOriginBlock(Block block) {
        originBlock = block;
    }

    public void setOriginBlock(int x, int y) {
        originBlock.setX(x);
        originBlock.setY(y);
    }

    public void setBlock(int x, int y, Block block) {
        Board[x][y] = block;
    }

    public boolean checkBlock(Block block) {
        if (block.getColor() == "white") {
            return true;
        } else {
            return false;
        }
    }
    
    public void draw(){
        for(int i = 0;i<this.Board.length;i++){
            for(int j = 0;j<this.Board[i].length;j++){
                Board[i][j].draw();
            }
        }
    }

    /*public boolean checkAvalible(Piece piece){
        return true;//change it when you work on this part.
    }*/
}
