clear all; clc
disp("------------------------------");
disp("F tablosu için 1");
disp("F(X|v1,v2) = p  X değeri için 2");
disp("F(X|v1,v2) = p  p değeri için 3");
girdi = input('Değerini giriniz: ');

if girdi == 1
disp("Olasılık değerini giriniz.");
disp("----------------------------------------");
disp("0.90 için  1");
disp("0.95 için  2");
disp("0.975 için 3");
disp("0.999 için 4");
tablo = input("Değerini giriniz : ");

if tablo == 1
  for i = 1:10
    for j = 1:30
        v1 = i;
        v2 = j;
    x(j+2,i+2) = (v2/v1)*(1/betainv(0.10,v2/2,v1/2)-1);
    end
 end
    x(2,:) = [0 0 1 2 3 4 5 6 7 8 9 10];
    x(:,2) = -1:30;
    x(2,:) = [0 0 1 2 3 4 5 6 7 8 9 10];
    x(:,2) = -1:30;
    x= num2str(x);
    x(1,:) = "-";
    x(:,1) = "|";
    disp("Alfa = 0.10 için Satirlar v1, Sütunlar v2 serbestlik dereceleridir.");
    disp(x)
elseif tablo == 2
    for i = 1:10
    for j = 1:30
        v1 = i;
        v2 = j;
x(j+2,i+2) = (v2/v1)*(1/betainv(0.05,v2/2,v1/2)-1);
    end
end
x(2,:) = [0 0 1 2 3 4 5 6 7 8 9 10];
x(:,2) = -1:30;
x(2,:) = [0 0 1 2 3 4 5 6 7 8 9 10];
x(:,2) = -1:30;
x= num2str(x);
x(1,:) = "-";
x(:,1) = "|";
disp("Alfa = 0.05 için Satirlar v1, Sütunlar v2 serbestlik dereceleridir.");
disp(x)
elseif tablo == 3
    for i = 1:10
        for j = 1:30
        v1 = i;
        v2 = j;
        x(j+2,i+2) = (v2/v1)*(1/betainv(0.025,v2/2,v1/2)-1);
    end
end
x(2,:) = [0 0 1 2 3 4 5 6 7 8 9 10];
x(:,2) = -1:30;
x(2,:) = [0 0 1 2 3 4 5 6 7 8 9 10];
x(:,2) = -1:30;
x= num2str(x);
x(1,:) = "-";
x(:,1) = "|";
disp("Alfa = 0.025 için Satirlar v1, Sütunlar v2 serbestlik dereceleridir.");
disp(x)
elseif tablo == 4
    for i = 1:10
    for j = 1:30
        v1 = i;
        v2 = j;
x(j+2,i+2) = (v2/v1)*(1/betainv(0.001,v2/2,v1/2)-1);
    end
end
x(2,:) = [0 0 1 2 3 4 5 6 7 8 9 10];
x(:,2) = -1:30;
x(2,:) = [0 0 1 2 3 4 5 6 7 8 9 10];
x(:,2) = -1:30;
x= num2str(x);
x(1,:) = "-";
x(:,1) = "|";
disp("Alfa = 0.001 için Satirlar v1, Sütunlar v2 serbestlik dereceleridir.");
disp(x)
end
elseif girdi ==2
    kontrol = 1;
    while kontrol == 1
        v1 = input("v1 değerini giriniz: ");
        v2 = input("v2 değerini giriniz: ");
        if v1>0 && v2>0
            kontrol = 0;
        else
            disp("v1 ve v2 değerlerini pozitif giriniz...");
        end
    end
    kontrol = 1;
    while kontrol == 1
    olasilik = input("Olasılık değerini giriniz: ");
    if olasilik >= 0 && olasilik <=1
        kontrol = 0;
    else
        disp("Olasilik değerini 0 ile 1 arasında giriniz..")
    end
    end
    sonuc = invcdf(olasilik,v1,v2);
    disp(sonuc)
    
    syms t
    f1 = gamma((v1+v2)/2)/(gamma(v1/2)*gamma(v2/2))*(v1/v2)^(v1/2)*t^((v1-2)/2)/((1+(v1/v2)*t)^((v1+v2)/2));
    x1=0;
    for i = 1:(sonuc+10)
        y(i) = int(f1,0,x1);
        x2(i) = x1;
        x1 = x1+1;
    end
    plot(x2,y)
    xL = xlim;
    yL = ylim;
    line([0 0], yL,'Color','black');  
    line(xL, [0 0],'Color','black');  
    xline(sonuc);
    for i = 1:sonuc
    line( [i i] , [0 y(i)])
    end
    txt = ["% " ,num2str(olasilik)];
    text(sonuc-sonuc/3,olasilik/2,txt);
    txt = ['\leftarrow ' 'x = '  num2str(sonuc)];
    text(sonuc,olasilik/3,txt)
    
elseif girdi == 3
    kontrol = 1;
    while kontrol == 1
        v1 = input("v1 değerini giriniz: ");
        v2 = input("v2 değerini giriniz: ");
        if v1>0 && v2>0
            kontrol = 0;
        else
            disp("v1 ve v2 değerlerini pozitif giriniz...");
        end
    end
    kontrol = 1;
    while kontrol == 1
    x = input("X değerini giriniz: ");
    if x>=0 && x <= 1000
        kontrol = 0;
    else
        disp("X değerini 0 ile 1000 arasında giriniz");
    end
    end
    sonuc = fcdf1(x,v1,v2);
    disp(sonuc)
    syms t
    f1 = gamma((v1+v2)/2)/(gamma(v1/2)*gamma(v2/2))*(v1/v2)^(v1/2)*t^((v1-2)/2)/((1+(v1/v2)*t)^((v1+v2)/2));
    x1=0;
    for i = 1:(x+10)
        y(i) = int(f1,0,x1);
        x2(i) = x1;
        x1 = x1+1;
    end
    plot(x2,y);
    xL = xlim;
    yL = ylim;
    line([0 0], yL,'Color','black');  
    line(xL, [0 0],'Color','black');  
    xline(x);
    for i = 1:x
    line( [i i] , [0 y(i)])
    end
    txt = ["% " ,num2str(sonuc)];
    text(x-x/3,sonuc/2,txt);
    txt = ['\leftarrow ' 'x = '  num2str(x)];
    text(x,sonuc/3,txt)

end