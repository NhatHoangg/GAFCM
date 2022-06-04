% witten by HoangTN

function F = fitness_func(df,po,d,c)

F = []; % ham fitness cua cac ca the
m = 2; % dac trung cho muc do chia se du lieu
N = size(po,1); % so luong ca the
n = size(df,1); % so luong example dau vao
D = zeros(c,n);
U = zeros(c,n);

for k = 1:N
    center = po(k,:);
    cent = reshape(center, d,c)';
    
    for i=1:c
        for j=1:n
            D(i,j)=pdist([cent(i,:); df(j,:)],'euclidean');
        
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
    
    tmp = U.^2;
    D2 = D.^2;
    J = sum(sum(tmp.*D2));
    
    fitness = 100/(J+1); % theo bai [126]
    F = [F; fitness];
end
