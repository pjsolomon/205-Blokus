public class Block {
    private int x;
    private int y;
    private int width;
    private color col = #FFFFFF;
    
    public Block(int x, int y,int width){
        this.x = x;
        this.y = y;
        this.width = width;
        rect(x,y,width,width);
    }
    
    public Block(int x, int y,int width, color col){
        this.x = x;
        this.y = y;
        this.width = width;
        this.col = col;
        fill(col);
        rect(x,y,width,width);
    }
    
    public int getX(){
        return this.x;
    }
    
    public int getY(){
        return this.y;
    }
    
    public int getWidth(){
        return this.width;
    }
    
    public color getColor(){
        return this.col;
    }
    
    public void setX(int x){
        this.x = x;
    }
    
    public void setY(int y){
        this.y = y;
    }
    
    public void setWidth(int width){
        this.width = width;
    }
    
    public void setColor(color col){
        this.col = col;
    }
    
    public void moveBlock(int horizontal,int vertical){
        this.x += horizontal*this.width;
        this.y += vertical*this.width;
    }

}
