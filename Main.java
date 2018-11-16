/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Xuanyou
 */
public class Main {
    public static void main(String[] args){
        Piece p1 = new Piece(20, "white");
        p1.draw();
        System.out.println();
        p1.rotateRight();
        p1.draw();
        System.out.println();
        p1.horizontalFlip();
        p1.draw();
        System.out.println();
        p1.verticalFlip();
        p1.draw();
        System.out.println();
    }
}
