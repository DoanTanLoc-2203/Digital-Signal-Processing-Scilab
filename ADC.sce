function signal=AS(a,co_si,omega,phi,number,t)
    signal=0;
    for i=1:number
        if(co_si(i)==0) then
            signal=signal+a(i)*cos(omega(i)*t+phi(i));
        else
            signal=signal+a(i)*sin(omega(i)*t+phi(i));
        end
    end
endfunction
number=3;// số tín hiệu thành phần có trong x(t)
a=[1,-1,3];//Biên độ của các tín hiệu thành phần
co_si=[0,1,0];//Cos/sin tương ứng với 0/1
omega=[%pi/2,%pi/8,%pi/4];// Tần số góc của các tín hiệu thành phần
phi=[0,0,%pi/3];// Pha ban đầu của các tín hiệu thành phần
// x(t)= cos((%pi*t)/2)-sin((%pi*t)/8)+3*cos((%pi*t)/4+%pi/3)
//Lấy mẫu
fmax=omega(1)/(2*%pi);//Tìm tần số fmax
for i=1:number
    if((omega(i)/(2*%pi))>fmax) then
        fmax=omega(i)/(2*%pi);
    end
end
Fs=2*fmax;// Tần số lấy mãu
for i=1:number
    omega(i)=omega(i)/Fs;
end

//Lượng tử
for i=1:number// Tìm bội chung nhỏ nhất của các chu kì nhỏ
    T(i)=(2*%pi)/omega(i);
end
Tmax=T(1);
for i=1:number
    if(T(i)>Tmax) then
        Tmax=T(i);
    end
end
k=0;
while k<number
    k=0;
    for i=1:number
        if(pmodulo(Tmax,T(i))==0) then
            k=k+1;
        end
        if(k==number)then
            Ts=Tmax;//Ts là chu kì của tín hiệu sau khi lấy mẫu
        end
    end
    Tmax=Tmax+1;
end

for i=1:Ts
    xn(i)=round(AS(a,co_si,omega,phi,number,i));// Tính giá trị của tín hiệu trong một chu kì
end
Delta=0.1//Bước nhảy
L=round(((max(xn)-min(xn))/Delta)+1);// Mức lượng tử
for i=1:Ts
    xnlevel(i)=(xn(i)-round(min(xn)))/Delta;
end
//Mã hóa
for i=1:Ts
    binaryxn(i)=dec2bin(xnlevel(i),10);
end
disp("Tín hiệu đã mã hóa:  ");
disp(binaryxn);
//Vẽ đồ thị
for i=1:Ts
    plot(i,xnlevel(i),".r");
    if(i<>1)
    plot([i,i],[xnlevel(i),xnlevel(i-1)]);
end
plot([i,i+1],[xnlevel(i),xnlevel(i)]);
plot(-1,-1);
plot(Ts,L+10);
end
