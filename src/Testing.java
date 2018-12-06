public class Testing {
    Block block = new Block(4,4,5, "White");
    Board board = new Board(50, 50);

    void testBoard() {
        System.out.println(board.checkBlock(block));
        board.setOriginBlock(10,10);

    }

    void testBlock(){
        //should print White, 4, 5, 4, 10, 10

        System.out.println("Block color: " + block.getColor());
        System.out.println("Block X: " + block.getX());
        System.out.println("Block width: " + block.getWidth());
        System.out.println("Block Y: " + block.getY());
        block.moveBlock(6,6);
        System.out.println("Block Y: " + block.getY());
        System.out.println("Block X: " + block.getX());
    }
}