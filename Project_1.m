%EEE558 Project1
%Fixed M antennas vary L for hybrid of selection combining and MRC
%L = 1:M 
%M = 1,2,3; K = 2,4,8
clc;
%Monte-Carlo simulation
%r = 0
i = 1;
result = zeros(18,32);
for M = 1:3
    for L = 1:M
        for K = [2 4 8]
            P = [];
            %choose different gamma_bar range
            if M == 1
                b = 30;
            elseif M == 2
                    if L == 1
                        b = 30;
                    else
                        b = 18;
                    end
            else
                if L == 1
                    b = 18;
                elseif L == 2
                    b = 13;
                else
                    b = 11;
                end
            end 
            for gamma_bar_db = 0:b
                P = [P simulation(L,M,K,10^(gamma_bar_db/10),0)];
            end
            %Different plot for different L,M,K pairs
            figure;semilogy(0:b,P);
            result(i,1:b+1) = P;
            i = i+1;
            S = sprintf('L = %d  M = %d  K = %d',L,M,K);
            title(S);
            H = gcf;
            saveas(H,fullfile('C:\Users\weile\Desktop\2016FALL',S),'jpg');
            S
        end
    end
end






    
