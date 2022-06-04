% witten by HoangTN

function U = Convert_data(input,centers)

c = size(centers,1);
n = size(input,1);

m = 2;
D = zeros(c,n); % ma tran khoang cach
U = zeros(c,n); % ma tran ham thuoc

for i=1:c
    for j=1:n
        D(i,j)=pdist([centers(i,:); input(j,:)],'euclidean');
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