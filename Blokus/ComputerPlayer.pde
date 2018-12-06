//Computer Player Class, called to complete computer turn. Functionality includes
//taking turns and methods to return the computer player score
public class ComputerPlayer {
  
    private color col1;
    private color col2;
    private Piece[] p1 = new Piece[21];
    private Piece[] p2 = new Piece[21];

   
   public ComputerPlayer(color col1, color col2) { //Set defaults
       this.col1 = col1;
       this.col2 = col2;
       
      for (int i = 0; i < 21; ++i) {
       p1[i] = new Piece(i+1, col1);
       p2[i] = new Piece(i+1, col2);
      }   
   }
   
//takeTurn is called to have the computer complete a turn, based on the current game state
   public Board takeTurn(Board board, color col) {
     if(col == col1){
       for(int piece = 20; piece >= 0; piece--) {
         for(int i = 0; i < 20; i++) {
           for(int j = 0; j < 20; j++) {
             p1[piece].setOrigin(i*30,j*30);
             //Determine if piece placement is legal, and piece hasn't been drawn yet.
             if(board.checkAndPlacePiece(p1[piece]) && p1[piece].getBeenDrawed()==false) {
               p1[piece].setBeenDrawed(true);
               p1[piece].delete();
               return board;
             }
           }
         }
       }
     } else if(col == col2) {
       for(int piece = 0; piece < p2.length; piece++) {
         for(int i = 0; i < 20; i++) {
           for(int j = 0; j < 20; j++) {
             p2[piece].setOrigin(i*30,j*30);
             //Determine if piece placement is legal, and piece hasn't been drawn yet.
             if(board.checkAndPlacePiece(p2[piece]) && p2[piece].getBeenDrawed()==false){
               p2[piece].setBeenDrawed(true);
               p2[piece].delete();
               return board;
             }
           }
         }
       }
     }
     return null;
   }
   
   
   public int getScore() {
     int sumScore = 0;
     for(int i = 0; i < p1.length; i++) {
       Piece p = p1[i];
       int[][] temp = new int[5][5];
       temp = p.getPiece();
       for(int a = 0; a < 5; a++){
         for(int b = 0; b < 5; b++) {
           if(temp[a][b] != 0){
             sumScore += 1;
           }
         }
       }
     }
     
     for(int i = 0; i < p2.length; i++) {
       Piece p = p2[i];
       int[][] temp = new int[5][5];
       temp = p.getPiece();
       for(int a = 0; a < 5; a++){
         for(int b = 0; b < 5; b++) {
           if(temp[a][b] != 0){
             sumScore += 1;
           }
         }
       }
     
     }
   return sumScore;
  }
  
}
