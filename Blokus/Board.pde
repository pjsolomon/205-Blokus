public class Board {
    private color[][] board = new color[20][20];
    private int grid;
    private int originX;
    private int originY;
    
    public Board(){
      originX=0;
      originY=0;
      grid = 30;
      for(int i = 0; i < board.length; i++){
            for(int j = 0; j<board[i].length;j++){
              board[i][j]=#FFFFFF;
            }
        }
    }
    
    public Board(int grid){
      originX=0;
      originY=0;
        for(int i = 0; i < board.length; i++){
            for(int j = 0; j<board[i].length;j++){
              board[i][j]=#FFFFFF;
        }
      }
    }
    
    public Board(int originX, int originY,int grid){
      this.originX = originX;
      this.originY = originY;
        for(int i = 0; i < board.length; i++){
            for(int j = 0; j<board[i].length;j++){
              board[i][j]=#FFFFFF;
        }
      }
    }
    
    public void setBlock(int x, int y, int colorIndex){
        board[x][y] = colorIndex;
    }
    
    public boolean checkBlock(Block block){
        if(block.getColor()==#FFFFFF){
            return true;
        }else{
            return false;
        }
    }
    
    public void draw(){
      for(int i = 0; i < board.length; i++){
            for(int j = 0; j<board[i].length;j++){
              fill(board[i][j]);
              rect(originX+i*grid,originY+j*grid,grid,grid);
            }
        }
    }
    
    public boolean checkAndPlacePiece(Piece p){
      int[][] tempPiece = p.getPiece();
      int tempX;
      int tempY;
      ArrayList<Integer> positionX = new ArrayList<Integer>();
      ArrayList<Integer> positionY = new ArrayList<Integer>();
      boolean placeable = true;
      for(int i = 0; i < tempPiece.length; i++){
        for(int j = 0; j<tempPiece[i].length;j++){
              if(tempPiece[i][j] == 1){
                tempX = ((p.getOriginX()+30*(i-2))+originX)/30;
                tempY = ((p.getOriginY()+30*(j-2))+originY)/30;
                if(tempX<0
                ||tempX>19
                ||tempY<0
                ||tempY>19  ){
                  placeable = false;
                }else{
                  positionX.add(tempX);
                  positionY.add(tempY);
                }
              }
            }
        }
        if(placeable){
          for(int i = 0; i < positionX.size(); i++){
            this.setBlock(positionX.get(i),positionY.get(i),p.getColor());
          }
          return placeable;
        }else{
          return placeable;
        }
    }
    
    
}
