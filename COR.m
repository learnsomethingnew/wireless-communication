P1 = [];
P2 = [];
P3 = [];
for gamma_bar = 0:20
    P2 = [P2 simulation(1,2,8,10^(gamma_bar/10),0)];    %r = 0
    P1 = [P1 analysis
end
%plot all three curves on one figure
figure;
semilogy(0:20,P1,'k');
hold on;
semilogy(0:20,P2,'k+-');
semilogy(0:20,P3,'ko-');
title('L = 1,M = 2,K = 8');
xlabel('gamma bar/dB');ylabel('symbol error rate');
legend(' is 0.5 correalated',' is uncorrelated',' is 0.9 correlated');
hold;