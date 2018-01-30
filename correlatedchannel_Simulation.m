% correlated channel
r1 = [];
r2 = [];
r = [];
d = [];
for M = 1:3
    for gamma = 0:30
        [r1 r2] = analysis(M,10.^(gamma/10));
        r = [r r1];
        d = [d r2];
    end
end
%change i = 1,2,3 to get BPSK,QPSK,8PSK
i = 2
figure;
semilogy(0:30,r(i,1:31),'k');
hold on;
xlabel('gamma bar/dB');ylabel('symbol error rate');
title('QPSK');
semilogy(0:30,r(i,32:62),'k+-');
semilogy(0:30,r(i,63:93),'ko-');
semilogy(0:30,d(i,1:31),'k*-');
semilogy(0:30,d(i,32:62),'ks-');
semilogy(0:30,d(i,63:93),'kx-');
legend(' is M = 1,SC','is M = 2,SC',' is M = 3,SC',' is M= 1,MRC',' is M = 2,MRC',' is M = 3,MRC');
hold;