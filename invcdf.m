function F = invcdf(olasilik, v1, v2)
a = 0.0001;
onf = 0;
sonf = 1000;
onola = fcdf1(onf, v1, v2);
sonola = fcdf1(sonf, v1, v2);
aralik = 100;
onaralik = 100.0;

if(olasilik <= sonola && olasilik >= onola)
while aralik > a
    adim = onf:onaralik:sonf;
    n = length(adim);
    for i = 1:n-1
        onola = fcdf1(adim(i), v1, v2);
        sonola = fcdf1(adim(i+1), v1, v2);
        if(onola <= olasilik && sonola >= olasilik)
            onf = adim(i);
            sonf = adim(i+1);
            break;
        end
    end
    aralik = aralik / 10.0;
    onaralik = onaralik / 10.0;
end
F = (onf + sonf) / 2.0;
else
    F = sonf;
end