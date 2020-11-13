function fo=fold(xn,n0)// hàm fold: y(n)=x(-n)
    // xử lí hàm fold
    for i=1:length(xn)
        yn(i)=xn(length(xn)-i+1);
    end
    y0=1+length(xn)-n0;
    // in kết quả yn và y0
    disp("Giá trị của y(n) = x(-n) là: ");
    disp(yn);
    disp("Giá trị y0 là: ");
    disp(y0);
    // biểu diễn xn và yn trên đồ thị
    subplot(1,2,1);
    xlabel("x(n)");
    plot(-n0,0);
    plot(length(xn)-n0+1,0);
    for i=1:length(xn)
        plot([-n0+i,-n0+i],[0,xn(i)]);
    end
    subplot(1,2,2);
    xlabel("y(n) = x(-n)");
    plot(-y0,0);
    plot(length(yn)-y0+1,0);
    for i=1:length(yn)
        plot([-y0+i,-y0+i],[0,yn(i)]);
    end
endfunction
X=[1,2,3,4,5];
fold(X,2);
