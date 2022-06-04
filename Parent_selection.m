% witten by HoangTN

function [P1, P2] = Parent_selection(p,po,d,c)

P1 = [];
P2 = [];
N = size(po,1);

    p1 = rand(); % neu nhieu ca the qua thi xac suat roi vao cac ca bi chia ra rat nho
    for k = 1:N
        if p1 <= p(k)
            P1 = po(k,:);
            break;
        end
    end
    
    p2 = rand(); % neu nhieu ca the qua thi xac suat roi vao cac ca bi chia ra rat nho
    for k = 1:N
        if p2 <= p(k)
            P2 = po(k,:);
            break;
        end
    end