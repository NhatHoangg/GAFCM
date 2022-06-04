% witten by HoangTN

function [npo, FA] = Immune_selection(po,poC,poM,df,d,c)

N = size(po,1);
F1 = fitness_func(df,po,d,c);
F2 = fitness_func(df,poC,d,c);
F3 = fitness_func(df,poM,d,c);

Po = [po; poC; poM];
F = [F1; F2; F3];

[O I] = sort(F, 'descend'); % sap xep giam dan fitness cua cac ca the trong 3 quan the
npo = [];
FA = [];
for i = 1:N % lay ra N ca the co fitness cao nhat
    npo = [npo; Po(I(i),:)];
    FA = [FA; F(I(i),:)];
end