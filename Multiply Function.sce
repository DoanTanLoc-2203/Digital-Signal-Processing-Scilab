function mymultiply=multiply(xn,n0,xm,m0)// Hàm multiply y(n)= x1(n).x2(n)
    // Tiền xử lí tín hiệu xn và xm  
    // Bổ sung thêm a lần phần tử '0' vào bên trái tín hiệu xm 
    a=abs(m0-n0);
    if n0>m0 then                       //xn --> xnnew0
        xnnew0=xn;                      //xm --> xmnew0
        k=1;
        g=1;
        for i=1:(a+length(xm))
            if k<=a then
                xmnew0(i)=0;
            else
                xmnew0(i)=xm(g);
                g=g+1;
            end
            k=k+1;
        end
    // Bổ sung thêm a lần phần tử '0' vào bên trái tín hiệu xn 
    elseif n0<m0 then
        xmnew0=xm;
        k=1;
        g=1;
        for i=1:(a+length(xn))
            if k<=a then
                xnnew0(i)=0;
            else
                xnnew0(i)=xn(g);
                g=g+1;
            end
            k=k+1;
        end
    else
        xnnew0=xn;
        xmnew0=xm;
    end
    // Bổ sung thêm b lần phần tử '0' vào bên phải tín hiệu xmnew0 
    b=abs(length(xmnew0)-length(xnnew0));
    if length(xnnew0)>length(xmnew0) then           //xnnew0 --> xnnew1
        xnnew1=xnnew0;                              //xmnew0 -->xmnew1
        k=1;
        for i=1:length(xnnew0)
            if k<=length(xmnew0) then
                xmnew1(i)=xmnew0(i);
            else
                xmnew1(i)=0;
            end
            k=k+1;
        end
    // Bổ sung thêm b lần phần tử '0' vào bên phải tín hiệu xnnew0
    elseif length(xnnew0)<length(xmnew0) then
        xmnew1=xmnew0;
        k=1;
        for i=1:length(xmnew0)
            if k<=length(xnnew0) then
                xnnew1(i)=xnnew0(i);
            else
                xnnew1(i)=0;
            end
            k=k+1;
        end
    else
        xnnew1=xnnew0;
        xmnew1=xmnew0;
    end
    // Xác định điểm gốc mới y0
    if n0>m0 then 
        y0=n0;
    elseif n0<m0 then
        y0=m0;
    else
        y0=n0;
    end
    // Nhân hai tín hiệu xnnew1 và xmnew1
    for i=1:length(xnnew1)
        yn(i)=xnnew1(i)*xmnew1(i);
    end
    //In kết quả của yn và y0
    disp("Giá trị y(n) = x1(n) . x2(n) là: ");
    disp(yn);
    disp("Giá trị của y0 là: ")
    disp(y0);
    //Biểu diễn xn, xm và yn trên đồ thị
    subplot(1,3,1);// biểu diễn xn
    xlabel("x1(n)");
    plot(-n0,0);
    plot(length(xn)-n0+1,0);
    for i=1:length(xn)
        plot([-n0+i,-n0+i],[0,xn(i)]);
    end
    subplot(1,3,2);// biểu diễn xm
    xlabel("x2(n)");
    plot(-m0,0);
    plot(length(xm)-m0+1,0);
    for i=1:length(xm)
        plot([-m0+i,-m0+i],[0,xm(i)]);
    end
    subplot(1,3,3);// biểu diễn yn
    xlabel("y(n) = x1(n) . x2(n) ");
    plot(-y0,0);
    plot(length(yn)-y0+1,0);
    for i=1:length(yn)
        plot([-y0+i,-y0+i],[0,yn(i)]);
    end
endfunction
Xn=[3,1,1,1,1,1];
Xm=[1,2,1,0,1];
multiply(Xn,2,Xm,2);
