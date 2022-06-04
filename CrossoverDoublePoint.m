% witten by HoangTN

function [child1,child2] = CrossoverDoublePoint(p1,p2)

    N = size(p1,2);
    temp = round(N/2);
    x1 = randi([1 temp]);
    x2 = randi([temp+1 N]);
    child1 = [p1(1:x1) p2(x1+1:x2) p1(x2+1:end)];
    child2 = [p2(1:x1) p1(x1+1:x2) p2(x2+1:end)];
end