function myevent=get_even_component(xn,n0)//Hàm lấy tín hiệu chẵn y(n)=xe(n)
    // Tiền xử lí
    if n0==(length(xn)/2)+0.5 then
        a=length(xn);// a là độ rộng của tín hiệu y(n)=xe(n)
        b=0;//b=0 thì n0 nằm giữa tín hiệu đầu vào
    elseif n0<=length(xn)/2 then
        a=1+(length(xn)-n0)*2;
        b=1;// b=1 thì n0 nằm ở nửa trái phần tín hiệu đầu vào
    else 
        a=1+(n0-1)*2;
        b=2;// b=2 thì n0 nằm ở nửa phải phần tín hiệu đầu vào
    end
    if b==0 then // b=0 giữ nguyên giá trị vector xn 
        for i=1:a
            trucy(i)=xn(i);
        end
    end
    if b==1 then// b=1 thêm số 0 vào bên trái vector xn 
        k=1;
        g=1;
        for i=1:a
            if k<=(length(xn)-n0) then
                trucy(i)=0;
            else 
                trucy(i)=xn(g);
                g=g+1;
            end
            k=k+1;
        end
    end
    if b==2 then// b=2 thêm số 0 vào bên phải vector xn 
        k=1;
        for i=1:a
            if k<=length(xn) then
                trucy(i)=xn(i);
            else
                trucy(i)=0;
            end
            k=k+1;
        end
    end
    // Phần xử lí tín hiệu chẵn
    if b==1 then
        y0=a-length(xn)+n0;
    elseif b==2 then
        y0=n0;
    end
    for i=1:a
            yn(i)=1/2*(trucy(i)+trucy(a-i+1));
    end
    disp(" Tín hiệu chẵn y(n)=xe(n) là: ");
    disp(yn);
    disp("Vị trí điểm gốc là: ");
    disp(y0);
    //Vẽ đồ thị
    subplot(1,2,1);//Vẽ tín hiệu x(n)
    xlabel(" x(n) ");
    plot(-(n0-1)-1,0);
    plot(length(xn)-n0+1,0);
    for i=1:length(xn)
        plot([-n0+i,-n0+i],[0,xn(i)]);
    end
    subplot(1,2,2);//Vẽ tín hiệu y(n)
    xlabel(" y(n) = xe(n) ");
    plot(-(y0-1)-1,0);
    plot(length(yn)-y0+1,0);
    for i=1:a
         plot([-y0+i,-y0+i],[0,yn(i)]);
    end
endfunction
get_even_component([1,2,3,5,10,22,5],2);
