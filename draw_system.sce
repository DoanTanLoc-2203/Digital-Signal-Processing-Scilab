function draw=draw_system (an, bm, opt)
    //Option 1
    if(opt==0) then
        disp("x(n)------→("+string(bm(1))+")------→(✚)------→(✚)-------------------→y(n)");
        if length(an)==length(bm) then//độ dài vector a=b
            for i=2:length(bm)
                disp("      |                ↑          ↑               |          ");
                disp("      ↓                |          |               ↓          ");
                disp("    [Z╶¹]              |          |             [Z╶¹]        ");
                disp("      |                |          |               |          ");
                if i==length(bm)then
                    disp("      ---→("+string(bm(i))+")---------          (✚)←--("+string(an(i-1))+")--------");
                else
                    disp("      ---→("+string(bm(i))+")------→(✚)         (✚)←--("+string(an(i-1))+")--------");
                end
            end
            disp("                                  ↑               |");
            disp("                                  |               ↓");
            disp("                                  |             [Z╶¹]");
            disp("                                  |               |");
            disp("                                  -----("+string(an(length(an)))+")←-------");
        elseif length(an)<length(bm) then// Độ dài vector a < b
            for i=2:length(an)+1
                disp("      |                ↑          ↑               |          ");
                disp("      ↓                |          |               ↓          ");
                disp("    [Z╶¹]              |          |             [Z╶¹]        ");
                disp("      |                |          |               |          ");
                if i==length(an)+1 then
                    if(i<>length(bm)) then
                        disp("      ---→("+string(bm(i))+")------→(✚)          -----("+string(an(i-1))+")--------");
                    else
                        disp("      ---→("+string(bm(i))+")---------            -----("+string(an(i-1))+")--------");
                    end
                else
                    disp("      ---→("+string(bm(i))+")------→(✚)         (✚)←--("+string(an(i-1))+")--------");
                end
            end
            for i=length(an)+2:length(bm)
                disp("      |                ↑");
                disp("      ↓                |");
                disp("    [Z╶¹]              |");
                disp("      |                |");
                if i==length(bm) then   
                    disp("      ---→("+string(bm(i))+")----------");
                else
                    disp("      ---→("+string(bm(i))+")------→(✚)");
                end
            end
        else // Độ dài vector a > b
            for i=2:length(bm)
                disp("      |                ↑          ↑               |          ");
                disp("      ↓                |          |               ↓          ");
                disp("    [Z╶¹]              |          |             [Z╶¹]        ");
                disp("      |                |          |               |          ");
                if i==length(bm) then
                    disp("      ---→("+string(bm(i))+")---------          (✚)←-----("+string(an(i-1))+")------");
                else
                    disp("      ---→("+string(bm(i))+")------→(✚)         (✚)←--("+string(an(i-1))+")--------");
                end
            end
            for i=length(bm)+1:length(an)+1
                disp("                                  ↑               |          ");
                disp("                                  |               ↓          ");
                disp("                                  |             [Z╶¹]        ");
                disp("                                  |               |          ");
                if i<>length(an)+1 then
                    disp("                                 (✚)←-----("+string(an(i-1))+")------");
                else
                    disp("                                  --------("+string(an(i-1))+")------");
                end
            end
        end
    //Option 2
    else
        disp("x(n)---→(✚)-----------------------→("+string(bm(1))+")---→(✚)-------→y(n)");
        if length(an)==length(bm) then// Độ dài vector a = b
            for i=2:length(bm)
                disp("          ↑              ↓                   ↑          ");
                disp("          |            [Z╶¹]                 |          ");
                disp("          |              |                   |          ");
                if i<>length(bm)then
                    disp("         (✚)←--("+string(an(i-1))+")←--------------→("+string(bm(i))+")---→(✚)   ");
                else
                    disp("         (✚)←--("+string(an(i-1))+")←--------------→("+string(bm(i))+")-----→   ");
                end
            end
            disp("          ↑              ↓    ");
            disp("          |            [Z╶¹]  ");
            disp("          |              |    "); 
            disp("          ←----("+string(an(i-1))+")←------");
        elseif length(an)<length(bm) then// Độ dài vector a < b
            for i=2:length(an)+1
                disp("          ↑              ↓                   ↑          ");
                disp("          |            [Z╶¹]                 |          ");
                disp("          |              |                   |          ");
                if i<>length(bm)then
                    if i<>length(an)+1 then
                        disp("         (✚)←--("+string(an(i-1))+")←--------------→("+string(bm(i))+")---→(✚)   ");
                    else
                        disp("          ←----("+string(an(i-1))+")←--------------→("+string(bm(i))+")---→(✚)   ");
                    end
                else
                    if i<>length(an)+1 then
                        disp("         (✚)←--("+string(an(i-1))+")←--------------→("+string(bm(i))+")-----→   ");
                    else
                    disp("          ←----("+string(an(i-1))+")←--------------→("+string(bm(i))+")------→   ");
                    end
                end
            end
            for i=length(an)+2:length(bm)
                disp("                         ↓                   ↑          ");
                disp("                       [Z╶¹]                 |          ");
                disp("                         |                   |          ");
                if i<>length(bm) then
                    disp("                         ----------→("+string(bm(i))+")--→(✚)   ");
                else
                    disp("                         ----------→("+string(bm(i))+")-----→   ");
                end
            end
        else // Độ dài vector a > b
            for i=2:length(bm)
                disp("          ↑              ↓                   ↑          ");
                disp("          |            [Z╶¹]                 |          ");
                disp("          |              |                   |          ");
                if i<>length(bm)then
                    if i<>length(an)+1 then
                        disp("         (✚)←--("+string(an(i-1))+")←--------------→("+string(bm(i))+")---→(✚)   ");
                    else
                        disp("          ←----("+string(an(i-1))+")←--------------→("+string(bm(i))+")---→(✚)   ");
                    end
                else
                    if i<>length(an)+1 then
                        disp("         (✚)←--("+string(an(i-1))+")←--------------→("+string(bm(i))+")-----→   ");
                    else
                        disp("          ←----("+string(an(i-1))+")←--------------→("+string(bm(i))+")------→   ");
                    end
                end
             end
             for i=length(bm)+1:length(an)+1
                disp("          ↑              ↓   ");
                disp("          |            [Z╶¹] ");
                disp("          |              |   ");
                if i<>length(an)+1 then
                    disp("         (✚)←--("+string(an(i-1))+")←-----");
                else
                    disp("          ←-----("+string(an(i-1))+")←-----");
                end
             end
        end
    end
endfunction
disp("Option 1");
draw_system([1,2,3,3,5],[1,3,5],0);
//disp("Option 2");
//draw_system([1,2,3,3,5],[1,3,5],1);
