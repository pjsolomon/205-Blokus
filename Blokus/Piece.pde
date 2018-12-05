public class Piece {
  int[][] piece = new int[5][5];
  int type;
  int originX;
  int originY;
  color col;
  boolean beenDrawed = false;
  
  public Piece(Piece p){
    piece = p.getPiece();
    type = p.getType();
    originX = p.getOriginX();
    originY = p.getOriginY();
    col = p.getColor();
  }
  
  public Piece(int type, color col) {
    for(int i=0;i<5;i++){
            for(int j=0;j<5;j++){
                piece[i][j]=0;
            }
    }
    setDefaultPiece(type);
    setColor(col);
  }
  
  public int[][] getPiece() {
    return piece;
  }
  
  public color getColor(){
    return col;
  }
  
  public int getType(){
    return type;
  }
  
  public int getOriginX(){
    return originX;
  }
  
  public int getOriginY(){
    return originY;
  }
  
  public boolean getBeenDrawed(){
    return beenDrawed;
  }
  
  public void setBeenDrawed(boolean tf){
    beenDrawed = tf;
  }
  
  
  public void setDefaultPiece(int type){
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
    
    public void setColor(color col){
        this.col = col;
    }

    public void setOrigin(int x,int y){
        originX = x - (x % 30);
        originY = y - (y % 30);
    }
    
    public void drawPreview() {
      fill(col);
      for(int i=0;i<piece.length;i++){
            for(int j=0;j<piece[i].length;j++){
                if(piece[i][j] == 1) {
                  rect(originX+15*(i-2), originY+15*(j-2), 15,15);
                }
            }
          }
    }
    
    public void draw() {
      fill(col);
      for(int i=0;i<piece.length;i++){
            for(int j=0;j<piece[i].length;j++){
                if(piece[i][j] == 1) {
                  rect(originX+30*(i-2),originY+30*(j-2), 30,30);
                }
            }
          }
    }
    public void delete(){
      for(int i = 0; i<5;i++){
        for(int j = 0 ; j<5;j++){
          piece[i][j] = 0;
        }
      }
    }
}
