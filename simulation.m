%Monte-Carlo simulaiton for EEE558 Project 1
%L selected antennas; M antenna numbers; K KPSK; gamma_bar average SNR; r
%correlation coefficient
function P = simulation(L,M,K,gamma_bar,r)
pi = 3.141592;
threshold = 500;
if K == 2
    PSK = [1 -1];                                       %BPSK
    error = 0;                                          %error number
    simunumber = 0;                                     %Monte-Carlo simulation number
    while(error<=threshold)
        S = PSK(floor(rand(1)+0.5)+1);                  %transmitted signal
        mu = zeros(1,M)';
        sigma = r*ones(M) + (1-r)*eye(M);
        V = 1/sqrt(2)*randn(1,M) + 1/sqrt(2)*j*randn(1,M);  %complex noise
        h = 1/sqrt(2)*mvnrnd(mu,sigma,1) + 1/sqrt(2)*j*mvnrnd(mu,sigma,1);  %channel gain
        X = sqrt(gamma_bar)*h.*S + V;                   %received signal
        [SortedX,position] = sort(abs(X),'descend');
        X = X(position(1:L));                           %Pick the highest L signal
        H = h(position(1:L));                           %corresponding channel
        check = real(sum(conj(H).*X));                  %Detection statistic
        if check >= 0                                   %Detection result
            result = PSK(1);
        else
            result = PSK(2);
        end
        if result == S                                  %result check 
            simunumber =simunumber +1;
        else
            error = error+1;
            simunumber = simunumber+1;
        end
        if simunumber >= 2000000
            threshold = 100;
        end
    end
end
if K == 4
    PSK = [exp(j*2*pi*(0:K-1)/K)];                      %QPSK
    error = 0;                                          %error number
    simunumber = 0;                                     %Monte-Carlo simulation number
    while(error<=threshold)
        S = PSK(floor(4*rand(1))+1);                    %transmitted signal
        mu = zeros(1,M)';
        sigma = r*ones(M) + (1-r)*eye(M);
        V = 1/sqrt(2)*randn(1,M) + 1/sqrt(2)*j*randn(1,M);  %complex noise
        h = 1/sqrt(2)*mvnrnd(mu,sigma,1) + 1/sqrt(2)*j*mvnrnd(mu,sigma,1);  %channel gain
        X = sqrt(gamma_bar)*h.*S + V;                   %received signal
        [SortedX,position] = sort(abs(X),'descend');
        X = X(position(1:L));                           %Pick the highest L signal
        H = h(position(1:L));                           %corresponding channel
        check = angle(sum(conj(H).*X));                 %Detection statistic
        if check>-pi/4 & check<=pi/4                   %Detection result
            result = PSK(1);
        elseif check>pi/4 & check<=3*pi/4
            result = PSK(2);
        elseif check<=-pi/4 & check>-3*pi/4
            result = PSK(4);
        else
            result = PSK(3);
        end
        if result == S                                  %result check 
            simunumber =simunumber +1;
        else
            error = error+1;
            simunumber = simunumber+1;
        end
        if simunumber >= 2000000
            threshold = 100;
        end
    end
end
if K == 8
    PSK = [exp(j*2*pi*(0:K-1)/K)];                      %8PSK
    error = 0;                                          %error number
    simunumber = 0;                                     %Monte-Carlo simulation number
    while(error<=threshold)
        S = PSK(floor(8*rand(1))+1);                    %transmitted signal
        mu = zeros(1,M)';
        sigma = r*ones(M) + (1-r)*eye(M);
        V = 1/sqrt(2)*randn(1,M) + 1/sqrt(2)*j*randn(1,M);  %complex noise
        h = 1/sqrt(2)*mvnrnd(mu,sigma,1) + 1/sqrt(2)*j*mvnrnd(mu,sigma,1);  %channel gain
        X = sqrt(gamma_bar)*h.*S + V;                   %received signal
        [SortedX,position] = sort(abs(X),'descend');
        X = X(position(1:L));                           %Pick the highest L signal
        H = h(position(1:L));                           %corresponding channel
        check = angle(sum(conj(H).*X));                 %Detection statistic
        if check>=-pi/8 & check<=pi/8                   %Detection result
            result = PSK(1);
        elseif check>pi/8 & check<=3*pi/8
            result = PSK(2);
        elseif check>3*pi/8 & check<=5*pi/8
            result = PSK(3);
        elseif check>5*pi/8 & check<=7*pi/8
            result = PSK(4);
        elseif check>-7*pi/8 & check<=-5*pi/8
            result = PSK(6);
        elseif check>-5*pi/8 & check<=-3*pi/8
            result = PSK(7);
        elseif check>-3*pi/8 & check<=-pi/8
            result = PSK(8);
        else
            result = PSK(5);
        end
        if result == S                                  %result check 
            simunumber =simunumber +1;
        else
            error = error+1;
            simunumber = simunumber+1;
        end
        if simunumber >= 2000000
            threshold = 100;
        end
    end
end
P = error/simunumber;                                   %Symbol error rate