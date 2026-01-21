//Тестбенч для семисегментного индикатора
`timescale 1ns / 1ps
module sev_seg_tb;
    reg [3:0] digit;
    wire [6:0] segments;        //gfedcba

//Подключаем модуль
    sev_seg dut(
        .digit(digit),
        .segments(segments)
    );
//Тест
    initial 
    begin
        $display("------------------------------------------");                 //Это просто строчки для отображения в консоли modelsim
        $display("test start");
        $display("------------------------------------------");
//Теперь нужно прописать все 16 значений, чтобы они прошли в тесте
    for(digit = 0; digit <= 15; digit = digit + 1)   
    #10;                                                //Это время нужно для обновления сигналов  
    /*Простое объяснение этой строчки 
    Шаг   digit сейчас     Проверка(digit<16)       Заходим в цикл?         Что делаем внутри?       digit + 1
    1        0                 0<16,  да               да                    печатаем 0              digit = 1 
    2        1                 1<16,  да               да                    печатаем 1              digit = 2        
    3        2                 2<16,  да               да                    печатаем 2              digit = 3
    4        3                 3<16,  да               да                    печатаем 3              digit = 4  
    ...     ...                     ...                ...                     ...                         ...
    15      15                 15<16,  да               да                   печатаем 15             digit = 16
    16      16                 16<16,  нет              нет               выходим из цикла                -            */
    begin
        case (digit)
                0:  $display("    %d   |     %b      |   0", digit, segments);              //в %d подставляется digit, в %b подставляется segments
                1:  $display("    %d   |     %b      |   1", digit, segments);
                2:  $display("    %d   |     %b      |   2", digit, segments);
                3:  $display("    %d   |     %b      |   3", digit, segments);
                4:  $display("    %d   |     %b      |   4", digit, segments);
                5:  $display("    %d   |     %b      |   5", digit, segments);
                6:  $display("    %d   |     %b      |   6", digit, segments);
                7:  $display("    %d   |     %b      |   7", digit, segments);
                8:  $display("    %d   |     %b      |   8", digit, segments);
                9:  $display("    %d   |     %b      |   9", digit, segments);
                10: $display("   %d    |     %b      |   A", digit, segments);
                11: $display("   %d    |     %b      |   b", digit, segments);
                12: $display("   %d    |     %b      |   C", digit, segments);
                13: $display("   %d    |     %b      |   d", digit, segments);
                14: $display("   %d    |     %b      |   E", digit, segments);
                15: $display("   %d    |     %b      |   F", digit, segments);
            endcase
        end

        #20;                                               //Ожидаем
        $display("-------------------------------------");
        $display("   test complete");
        $display("-------------------------------------");
        $finish;
    end
endmodule
