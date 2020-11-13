function Adv=advance(xn,n0,k)//hàm advance: y(n)=x(n+k)
    // xử lí hàm advance
    if(k<=0)then
        disp("giá trị k không hợp lệ");
    else
        for i=1:length(xn)
            yn(i)=xn(i);
        end
        if(k>length(xn)-n0) then
            for i=length(xn)+1:k-(length(xn)-n0)+length(xn)
                yn(i)=0;
            end
        end
        y0=n0+k;
        //in kết quả yn và y0
        disp("Giá trị của y(n) = x(n+" + string(k) + ") là: ");
        disp(yn);
        disp("Giá trị y0 là: ");
        disp(y0);
        // biểu diễn xn và yn trên đồ thị
        subplot(1,2,1);
        xlabel("x(n)")
        plot(-n0,0);
        plot(length(xn)-n0+1,0);
        for i=1:length(xn)
            plot([-n0+i,-n0+i],[0,xn(i)]);
        end
        subplot(1,2,2);
        xlabel("y(n) = x(n+"+string(k)+")");
        plot(-y0,0);
        plot(length(yn)-y0+1,0);
        for i=1:length(yn)
            plot([-y0+i,-y0+i],[0,yn(i)]);
        end
    end
endfunction
X=[4,1,2,3];
advance(X,1,5);
