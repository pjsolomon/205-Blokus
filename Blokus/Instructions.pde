class Instructions extends PApplet {
  public void settings() {
    size(600, 400);
    
  }
 
  public void draw() {
    clear();
    background(255);
    noFill();
    String s = "Each color’s first play must be made on a corner square of the game board. Every play after the first must only touch the corners of a matching color but may touch any other color in any way.";
    fill(50);
    text(s, 10, 10, 600, 400);  // Text wraps within text box
    String t = "The player and the CPU alternates what color they play between their two colors. ";
    fill(50);
    text(t, 10, 60, 600, 400);  // Text wraps within text box
    String a = "How To Win:";
    fill(50);
    text(a, 10, 110, 600, 400);  // Text wraps within text box
    String q = "The player with fewest remaining squares in their pieces wins the game; each square is worth -1 point.";
    fill(50);
    text(q, 10, 140, 600, 400);  // Text wraps within text box
    String b = "Additional Points:";
    fill(50);
    text(b, 10, 190, 600, 400);  // Text wraps within text box
    String r = "If all of a colors pieces have been played then +15 points the player can earn an additional 5 points if the last piece is also the smallest piece (single square).";
    fill(50);
    text(r, 10, 220, 600, 400);  // Text wraps within text box
    
  }
  void exit()
  {
    dispose();
  }
}
