public class Board {
    private color[][] board = new color[20][20];
    private int grid;
    private int originX;
    private int originY;
    private int tempX;
    private int tempY;

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

    public int getBlock(int x, int y){
      return board[x][y];
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
      ArrayList<Integer> positionX = new ArrayList<Integer>();
      ArrayList<Integer> positionY = new ArrayList<Integer>();
      boolean placeable = true;
      boolean corners = false;
      for(int i = 0; i < tempPiece.length; i++){
        for(int j = 0; j<tempPiece[i].length;j++){
              //System.out.println(board[tempX][tempY]);
              if(tempPiece[i][j] == 1){
                tempX = ((p.getOriginX()+30*(i-2))+originX)/30;
                tempY = ((p.getOriginY()+30*(j-2))+originY)/30;

                if(tempX > 0
                && tempX <19
                && tempY > 0
                && tempY < 19){
                if(board[tempX][tempY] != -1 && board[tempX][tempY] == p.getColor()
                ||board[tempX+1][tempY] != -1 && board[tempX+1][tempY] == p.getColor()
                ||board[tempX][tempY+1] != -1 && board[tempX][tempY+1] == p.getColor()
                ||board[tempX-1][tempY] != -1 && board[tempX-1][tempY] == p.getColor()
                ||board[tempX][tempY-1] != -1 && board[tempX][tempY-1] == p.getColor()){
                  placeable = false;
                }
                if((board[tempX+1][tempY+1] == p.getColor()
                || board[tempX-1][tempY+1] == p.getColor()
                || board[tempX-1][tempY-1] == p.getColor()
                || board[tempX+1][tempY-1] == p.getColor())){
                  corners = true;
                }
                }else if(tempX == 0
                && tempY > 0
                && tempY < 19){
                  if(board[tempX][tempY] != -1 && board[tempX][tempY] == p.getColor()
                    ||board[tempX+1][tempY] != -1 && board[tempX+1][tempY] == p.getColor()
                    ||board[tempX][tempY+1] != -1 && board[tempX][tempY+1] == p.getColor()
                    ||board[tempX][tempY-1] != -1 && board[tempX][tempY-1] == p.getColor()){
                    placeable = false;
                }

                }else if(tempY == 0
                && tempX > 0
                && tempX < 19){
                  if(board[tempX][tempY] != -1 && board[tempX][tempY] == p.getColor()
                ||board[tempX+1][tempY] != -1 && board[tempX+1][tempY] == p.getColor()
                ||board[tempX][tempY+1] != -1 && board[tempX][tempY+1] == p.getColor()
                ||board[tempX-1][tempY] != -1 && board[tempX-1][tempY] == p.getColor()){
                   placeable = false;
                }

                }else if(tempY == 19
                && tempX > 0
                && tempX < 19){
                  if(board[tempX][tempY] != -1 && board[tempX][tempY] == p.getColor()
                ||board[tempX+1][tempY] != -1 && board[tempX+1][tempY] == p.getColor()
                ||board[tempX-1][tempY] != -1 && board[tempX-1][tempY] == p.getColor()
                ||board[tempX][tempY-1] != -1 && board[tempX][tempY-1] == p.getColor()){
                   placeable = false;
                }
                }else if(tempX == 19
                && tempY > 0
                && tempY < 19){
                  if(board[tempX][tempY] != -1 && board[tempX][tempY] == p.getColor()
                ||board[tempX][tempY+1] != -1 && board[tempX][tempY+1] == p.getColor()
                ||board[tempX-1][tempY] != -1 && board[tempX-1][tempY] == p.getColor()
                ||board[tempX][tempY-1] != -1 && board[tempX][tempY-1] == p.getColor()){
                   placeable = false;
                }
                }else if(tempX == 19
                && tempY == 19
                && board[tempX][tempY] == -1
                && p.getColor() == -13487416){ //blue
                  placeable = true;
                  corners = true;

                }else if(tempX == 0
                && tempY == 0
                && board[tempX][tempY] == -1
                && p.getColor() == -3657166){  //red
                  placeable = true;
                  corners = true;

                }else if(tempX == 19
                && tempY == 0
                && board[tempX][tempY] == -1
                && p.getColor() == -6888886){
                  placeable = true;
                  corners = true;

                }else if(tempX == 0
                && tempY == 19
                && board[tempX][tempY] == -1
                && p.getColor() == -200){
                  placeable = true;
                  corners = true;
                }

                if(tempX<0
                ||tempX>19
                ||tempY<0
                ||tempY>19
                ){
                   placeable = false;
                   corners = false;
                }
              else{
                  positionX.add(tempX);
                  positionY.add(tempY);
                }
              }
            }
        }
        System.out.println("Placeable: "+placeable);
        System.out.println("Corners: " +corners);
        if(placeable && corners){
          for(int i = 0; i < positionX.size(); i++){
            this.setBlock(positionX.get(i),positionY.get(i),p.getColor());
          }
          return placeable && corners;
        }else{
          return placeable && corners;
        }
    }


}
