% witten by HoangTN

function poM = Mutation(po,h)

poM = [];
for j = 1:size(po,1)
    i = randi([1 size(po,1)]);
    p = po(i,:);
    
    mutation = randi(length(po(1,:)), 1,h);
    for k = 1:h
        p(mutation(k)) = rand(); % [-100 100] co the thay the theo bai
    end
    poM = [poM; p];
end

