public class Player {
    private int score;
    private int userTurn;
    private color col;
    private Piece[] pieces;

    
   public Player(color col,int turn){
       this.col = col;
       userTurn = turn;
       pieces = new Piece[21];
       initializePieces();
   }
   
   public int getUserTurn(){
     return userTurn;
   }
   
   public Piece[] getPieces(){
     return pieces;
   }
   
   //only called this method when the game ended.
    public void countScore(){
        int[][] temp = new int[5][5];
        for(int i = 0; i < pieces.length;i++){
            temp = pieces[i].getPiece();
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
    
    public void initializePieces(){
        for(int i=0;i<21;i++){
            Piece temp = new Piece(i+1,col);
            pieces[i] = temp;        
        }
    }
   
}
