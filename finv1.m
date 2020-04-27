function p = fcdf1(x,v1,v2)
syms t
f1 = gamma((v1+v2)/2)/(gamma(v1/2)*gamma(v2/2))*(v1/v2)^(v1/2)*t^((v1-2)/2)/((1+(v1/v2)*t)^((v1+v2)/2));
sonuc = int(f1,0,x);
sonuc = double(sonuc);
p = sonuc;
