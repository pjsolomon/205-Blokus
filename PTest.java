import Piece

public void PTest(){

        String testName='Alice';
        String testColor='red';
        int testScore=0;
        int playerTests=4;

        Player testPlayer=new Player(testName,testColor,testScore);

        if(testPlayer.getName()==testName){
        playerTests-=1;
        }
        if(testPlayer.getColor()==testColor){
        playerTests-=1;
        }
        if(testPlayer.getScore()==testScore){
        playerTests-=1;
        }

        testPlayer.updateScore(10); //Update Score to 10
        if(testPlayer.getScore()==10){
        playerTests-=1;
        }

        if(playerTests==0){
        System.out.println('Passed all tests');
        }else{
        System.out.println('Player Tests Failed');
        }

        int pieceErrors=0;
        for(int x=0;x< 20;x++){
            for(int y=0;y< 20;y++){
                if(getPiece[x][y]!= ){
                    pieceErrors+=1;
                }
            }
        }

        Piece testPiece=new Piece(1,'red');
        testPiece.setColor('blue');
        if(testPiece.getColor()!='blue'){
            pieceErrors+=1;
        }

        testPiece.setOriginPosition(1,1);

        if(testPeice.getOriginPositionX() != 1 {
            pieceErrors += 1;
        }
        if(testPiece.getOriginPositionY() == 1){
            pieceErrors += 1;
        }

        Piece pieceArr[]=new Piece[21]
        for(int i=0;i<=21;++i){
            pieceArr[i]=new Piece(i,'color');

            System.out.print("Original");
            System.out.print(i);
            pieceArr[i].draw();

            System.out.print("Rotated 360, Reflected across X and Y and Back")
            piece[i].rotateRight();
            piece[i].rotateRight();
            piece[i].rotateRight();
            piece[i].rotateRight();

            piece[i].verticalFlip();
            piece[i].verticalFlip();

            piece[i].horizontalFlip();
            pieceArr[i].draw();
        }
}

public void main() {

}



