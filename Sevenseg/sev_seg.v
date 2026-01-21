module sev_seg (
    input [3:0] digit,              //число от 0 до 15
    output reg [6:0] segments       //выход на сегменты g f e d c b a
);
//Мы берем за основу общий АНОД (потому как на моей китайской плате общий анод), то есть 1 - сегмент не светится. 0 - светится.
    always @(*)
    case (digit)
    0: segments = 7'b1000000; /*0      Получается у нас есть число от 0 до F(hex), которое мы можем отобразить на сегментах. Будь у нас общий катод, то было бы 0111111.    
                                       g f e d c b a
                                       1 0 0 0 0 0 0  Это и есть цифра 0 на семисегментнике */
    1: segments = 7'b1111001; //1
    2: segments = 7'b0100100; //2
    3: segments = 7'b0110000; //3
    4: segments = 7'b0011001; //4
    5: segments = 7'b0010010; //5
    6: segments = 7'b0000010; //6
    7: segments = 7'b1111000; //7
    8: segments = 7'b0000000; //8
    9: segments = 7'b0010000; //9
    10: segments = 7'b0001000; //A
    11: segments = 7'b0000011; //B
    12: segments = 7'b1000110; //C
    13: segments = 7'b0100001; //D
    14: segments = 7'b0000110; //E  
    15: segments = 7'b0001110; //F
    default segments = 7'b1111111;
    endcase
endmodule


