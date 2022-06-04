% witten by HoangTN

clear all;
close all;
clc;

% % Khoi tao dataset
% m = 2; % tham so fcm
% n = 100; % so luong mau
% d = 6; % so chieu
% df = randi([-50 50],n,d);

input = readtable('X_train.csv');
df = table2array(input);
d = size(df,2);
n = size(df,1);
m = 2; % tham so fcm
size(df)


% khoi tao quan the
N = 10; % so luong ca the
c = 5; % so luong cum

po = []; % quan the population
cc = []; % 1 ca the
for i = 1:N
    cc = [];
    for j = 1:c
        ct = randi([-50 50], 1, d);
        cc = [cc ct];
    end
    po = [po; cc];
end

result = [];
for s = 1:15
    s
    
    % tinh toan diem fitness
    F = fitness_func(df,po,d,c);
    if s >= 1
       f = sort(F, 'descend');
       result = [result f(1)];
    end

    % loc nhung ca the tot nhat de dan xen, y tuong theo bai An Improved...
    p = F./sum(F);
    for i = 2:N
       p(i) = p(i) + p(i-1);
    end

    poC = [];
    for i = 1:N/2 
       [P1 P2] = Parent_selection(p,po,d,c); % lay ngau nhien 2 ca the theo xac suat tren
       [c1 c2] = CrossoverDoublePoint(P1, P2); % lay theo code thay Su
       poC = [poC; c1; c2];
    end

    % dot bien
    h = 5; % so gene dot bien
    poM = Mutation(po,h);

    % tinh fitness cho tap poC và poM và chon ra nhung ca the tot nhat trong 3
    % quan the po, poC, poM de tao ra quan the moi
    [po FA] = Immune_selection(po,poC,poM,df,d,c);

    % FCM
    po = FCM(po,df,d,c);
end

best_cent = reshape(po(1,:),d,c)';
% Luu toa do tam da toi uu hoa
save centers.txt best_cent -ascii;

% Tinh toan ma tran ham thuoc U v?i tam da toi ?u
D = zeros(c,n); % ma tran khoang cach
U = zeros(c,n); % ma tran ham thuoc
for i=1:c
    for j=1:n
        D(i,j)=pdist([best_cent(i,:); df(j,:)],'euclidean');
    end
end
rev_distmx_initial=1./D;

rev_dmsq_initial=rev_distmx_initial.^(2/(m-1));
for j=1:n
    sum2=sum(rev_dmsq_initial(:,j),1);
    
    for i=1:c
        U(i,j)=rev_dmsq_initial(i,j)/sum2;
    end
end
save U_train.txt U -ascii;

% Tinh toan du lieu test va luu ra file U_test.txt
test = readtable('X_test.csv');
Xtest = table2array(test);
Utest = Convert_data(Xtest,best_cent);
save U_test.txt Utest -ascii;

plot(result,'r'); hold on;
display('max fitness:');
result(size(result,2))
% 
% [cen Uu obj_fcn] = newfcm(df, c);
% fit = 100./(obj_fcn + 1);
% plot(fit(1:30), 'b'); hold on;

