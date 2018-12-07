color c2 = #FFCC00;
int grid = 30;
boolean holdingPiece;
boolean gameOver;
int turn = 0;
Piece[] startPiece = new Piece[4];
Piece currentPiece;
Piece tempPiece;
//Create Demo Pieces
Piece[] bluePiece;
Piece[] redPiece;
Board board;
ComputerPlayer cp = new ComputerPlayer(-13487416,-3657166);

Button quit;
Button instructions;
Button newGame;
Button outOfMoves;
void settings(){
  size(1200,800);
}

//Setup Method creates on-run functionality and variables.
void setup() { //Set Window Size
  stroke(2); //Set Line Width
  currentPiece = null;
  board = new Board();
  turn = 0;
  gameOver = false;

  startPiece[0] = new Piece(1,color(#FA8072));//red
  startPiece[0].setOrigin(0,0);
  startPiece[1] = new Piece(1,color(#98FB98));//green
  startPiece[1].setOrigin(570,0);
  startPiece[2] = new Piece(1,color(#ADD8E6));//blue
  startPiece[2].setOrigin(570,570);
  startPiece[3] = new Piece(1,color(#FFFF66));//yellow
  startPiece[3].setOrigin(0,570);

  bluePiece = new Piece[21];
  redPiece = new Piece[21];
  for(int i = 0; i < 21; i++){
    bluePiece[i] = new Piece(i+1, color(50, 50, 200));
    bluePiece[i].setOrigin(680 + ((75*i) % 450), 60 + (floor(i/6)*100));
  }
  for(int i = 0; i < 21; i++){
    redPiece[i] = new Piece(i+1, color(200, 50, 50));
    redPiece[i].setOrigin(680 + ((75*i) % 450), 460 + (floor(i/6)*100));
  }
  holdingPiece = false;

  quit = new Button("Quit", 300, 650, 100, 50);
  newGame = new Button("New Game", 50, 650, 100, 50);
  instructions = new Button("How To Play", 175, 650, 100, 50);
  outOfMoves = new Button(" Out of Moves", 425, 650,100,50);

  cp = new ComputerPlayer(-6888886,-200);
}


//Draw is a continuous loop that runs infinitely after setup()
void draw() {

  clear();
  background(255);
  noFill();

  //Draw Grid
  board.draw();

  //Draw start pieces
  for(int i = 0; i < 4;i++){
    startPiece[i].draw();
  }

  //Draw Containers
  for(int i = 0; i < 2; ++i) {
    noFill();
    rect(630,(i * 400),520,390);
  }

  //Create Piece that Follows Mouse
  if(currentPiece!=null){
    currentPiece.draw();
  }

  for(int i = 0; i < 21; i++){
    bluePiece[i].drawPreview();
  }

  for(int i = 0; i < 21; i++){
    redPiece[i].drawPreview();
  }
  if(holdingPiece == true && currentPiece!=null){
    currentPiece.setOrigin(mouseX,mouseY);
  }

  if(turn%4 == 1){
    if(cp.takeTurn(board,-6888886)!=null){
      turn++;
    } else {
      gameOver = true;
    }
    startPiece[1].delete();
  }else if (turn%4 == 3){
    if(cp.takeTurn(board,-200)!= null){
      turn++;
    } else {
      gameOver = true;
    }
    startPiece[3].delete();
  }
  
  //Check if either player cannot go, then display gameover.
  if(gameOver){
    fill(220);
    rect(100,100,1000,500);
    String s = "Game Over!";
    Integer playerScore = countScore(bluePiece) + countScore(redPiece);
    String ps = playerScore.toString();
    Integer computerScore = cp.getScore();
    String cs = computerScore.toString();
    
    fill(50);
    textSize(60);
    text(s, 100, 100, 1000, 200);  // Text wraps within text box
    textSize(30);
    s = "Player Score: " + ps;
    text(s, 100, 100, 1000, 500);  // Text wraps within text box
    s = "Computer Score: " + cs;
    text(s, 100, 100, 1000, 650);  // Text wraps within text box
    if(playerScore > computerScore){
      s = "Computer Wins!";
    } else {
      s = "Player Wins!";
    }
    text(s, 100, 100, 1000, 850);  // Text wraps within text box
    textSize(12);
  }

  quit.Draw();
  instructions.Draw();
  newGame.Draw();
  outOfMoves.Draw();
}

void mousePressed() {
  if(holdingPiece
  &&mouseX>0
  &&mouseY>0
  &&mouseX<600
  &&mouseY<600) {
    boolean keepGoing = board.checkAndPlacePiece(currentPiece);
    if(keepGoing){
      if(currentPiece.getColor() == color(200,50,50)){
       startPiece[0].delete();
     }else if(currentPiece.getColor() == color(50,50,200)){
       startPiece[2].delete();
     }
      holdingPiece = false;
      currentPiece = null;
      turn++;
      tempPiece = null;
    }
  } else {
    for(int i = 0; i < 21; i++){
    if(mouseX>(650+(75*i)%450)
    &&mouseX<(725+(75*i)%450)
    &&mouseY>30 + (floor(i/6)*100)
    &&mouseY<105 +(floor(i/6)*100)
    &&bluePiece[i].getBeenDrawed()==false
    &&turn % 4 ==0
    ){
      bluePiece[i].setBeenDrawed(true);
      Piece temp = new Piece(bluePiece[i].getType(),
      bluePiece[i].getColor());
      if(tempPiece == null){
        tempPiece = bluePiece[i];
      }else{
        tempPiece.recreate();
        tempPiece.setBeenDrawed(false);
        tempPiece = bluePiece[i];
      }
      currentPiece = temp;
      bluePiece[i].delete();
      holdingPiece = true;
    }
    if(mouseX>(650+(75*i)%450)
    &&mouseX<(725+(75*i)%450)
    &&mouseY>430 + (floor(i/6)*100)
    &&mouseY<505 +(floor(i/6)*100)
    &&turn % 4 == 2){
      redPiece[i].setBeenDrawed(true);
      Piece temp = new Piece(redPiece[i].getType(),
      redPiece[i].getColor());
      if(tempPiece == null){
        tempPiece = redPiece[i];
      }else{
        tempPiece.recreate();
        tempPiece.setBeenDrawed(false);
        tempPiece = redPiece[i];
      }
      currentPiece = temp;
      redPiece[i].delete();
      holdingPiece = true;
    }
  }
  }

  if (quit.MouseIsOver()) {
    exit();
  }
  if (newGame.MouseIsOver()) {
    setup();
  }
  if (instructions.MouseIsOver()) {
    String[] args = {"SecondApplet"};
    Instructions sa = new Instructions();
    PApplet.runSketch(args, sa);
  }
  if(outOfMoves.MouseIsOver()) {
    gameOver = true;
  }
}


void keyPressed() {
  if (keyCode == UP){
    if(currentPiece != null) currentPiece.verticalFlip();
  } else if (keyCode == DOWN){
    if(currentPiece != null) currentPiece.horizontalFlip();
  } else if (keyCode == LEFT){

  } else if (keyCode == RIGHT){
    if(currentPiece != null) currentPiece.rotateRight();
  }

}

//Counts up score.
public int countScore(Piece[] pieces){
        int score = 0;
        int[][] temp = new int[5][5];
        for(int i = 0; i < pieces.length;i++){
            temp = pieces[i].getPiece();
            for(int j=0;j<temp.length;j++){
                for(int k=0;k<temp[j].length;k++){
                    if(temp[j][k] == 1){
                        //one block worth for 100 point(feel free to change it)
                        score += 1; 
                    }
                }
            }
        }
        return score;
}
