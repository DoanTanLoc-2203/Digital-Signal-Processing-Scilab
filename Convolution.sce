function [A,B]=delay(xn,n0,k)//Hàm delay
    if k>=n0 then
        for i=1:k-n0+1
            xnnew(i)=0;
        end
        for i=k-n0+1+1:k-n0+length(xn)+1
            xnnew(i)=xn(i-k+n0-1);
        end
        n0=1;
    else
        xnnew=xn;
        n0=n0-k;
    end
    A=xnnew;
    B=n0;
endfunction

function [A,B]=advance(xn,n0,k)//Hàm advance
    for i=1:length(xn)
        xnnew(i)=xn(i);
    end
    if(k>length(xn)-n0) then
        for i=length(xn)+1:k-(length(xn)-n0)+length(xn)
            xnnew(i)=0;
        end
    end
    n0=n0+k;
    A=xnnew;
    B=n0;
endfunction

function [A,B]=fold(xn,n0)// Hàm fold
    for i=1:length(xn)
        y(i)=xn(length(xn)-i+1);
    end
    y0=1+length(xn)-n0;
    A=y;
    B=y0;
endfunction
function [A,B]=multiply(xn,n0,xm,m0)//Hàm multiply  
    a=abs(m0-n0);
    if n0>m0 then
        xnnew0=xn;
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
    b=abs(length(xmnew0)-length(xnnew0));
    if length(xnnew0)>length(xmnew0) then
        xnnew1=xnnew0;
        k=1;
        for i=1:length(xnnew0)
            if k<=length(xmnew0) then
                xmnew1(i)=xmnew0(i);
            else
                xmnew1(i)=0;
            end
            k=k+1;
        end
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
    if n0>m0 then
        y0=n0;
    elseif n0<m0 then
        y0=m0;
    else
        y0=n0;
    end
    for i=1:length(xnnew1)
        y(i)=xnnew1(i)*xmnew1(i);
    end
    A=y;
    B=y0;
endfunction

function convo=convolution(xn,n0,hn,h0)//Hàm convolution
    //Tinh độ dài của tín hiệu y(n)
    partleft=length(xn)-n0+length(hn)-2;//Số phần tử với giá trị k âm 
    partright=n0;//Số phần tử với giá trị k dương 
    for i=1:partleft//phần k âm
        [an,a0]=advance(hn,h0,partleft-i+1);
        [bn,b0]=fold(an,a0);
        [cn,c0]=multiply(xn,n0,bn,b0);
        k=0;
        for j=1:length(cn)
            k=k+cn(j);
        end
        yn1(i)=k;// Tín hiệu với chỉ số âm của yn
    end
    for i=1:partright// phần k dương
        [an,a0]=delay(hn,h0,i);
        [bn,b0]=fold(an,a0);
        [cn,c0]=multiply(xn,n0,bn,b0);
        k=0;
        for j=1:length(cn)
            k=k+cn(j);
        end
        yn2(i)=k;// Tín hiệu với chỉ số dương của yn
    end
    //Tổng hộp tín hiệu của yn
    for i=1:partleft+partright+1
        if(i<=partleft) then
            yn(i)=yn1(i);
        elseif i==partleft+1 then
            [an,a0]=fold(hn,h0);
            [bn,b0]=multiply(xn,n0,an,a0);
            k=0;
            for j=1:length(bn)
                k=k+bn(j);
            end
            yn(i)=k;
        else 
            yn(i)=yn2(i-partleft-1);
        end
    end
    y0=partleft+1;
    [yn,y0]=fold(yn,y0);
    disp(" Tín hiệu chẵn y(n) là: ");
    disp(yn);
    disp("Vị trí điểm gốc là: ");
    disp(y0);
    //Vẽ đồ thị
    subplot(1,3,1);// Vẽ đồ thị x(n)
    xlabel(" x(n) ");
    plot(-(n0-1)-1,0);
    plot(length(xn)-n0+1,0);
    for i=1:length(xn)
        plot([-n0+i,-n0+i],[0,xn(i)]);
    end
    subplot(1,3,2);// Vẽ đồ thị h(n)
    xlabel(" h(n) ");
    plot(-(h0-1)-1,0);
    plot(length(hn)-h0+1,0);
    for i=1:length(hn)
        plot([-h0+i,-h0+i],[0,hn(i)]);
    end
    subplot(1,3,3);// Vẽ đồ thị y(n)
    xlabel(" y(n) ");
    plot(-(y0-1)-1,0);
    plot(length(yn)-y0+1,0);
    for i=1:length(yn)
        plot([-y0+i,-y0+i],[0,yn(i)]);
    end
endfunction
convolution([2,3,4],1,[1,2,3],2);

