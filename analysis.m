function [SC,MRC] = analysis(M,gamma_bar)
%analytic result for SC K = 2
P_SC2 = @(x) normcdf(sqrt(2.*x),'upper').*M/gamma_bar.*(1-exp(-x./gamma_bar)).^(M-1).*exp(-x./gamma_bar);
%analytical result of symbol error rate
P_SC_symbol_e2 = integral(P_SC2,0,inf); 
%analytic result for SC K = 4
P_SC4 = @(x) normcdf(sqrt(x),'upper').*M/gamma_bar.*(1-exp(-x./gamma_bar)).^(M-1).*exp(-x./gamma_bar);
%analytical result of symbol error rate
P_SC_symbol_e4 = integral(P_SC4,0,inf); 
%analytic result for SC K = 8 using Ps approxiamtion
P_SC8 = @(x) 2*normcdf(sqrt(2.*x)*sin(3.1415/8),'upper').*M/gamma_bar.*(1-exp(-x./gamma_bar)).^(M-1).*exp(-x./gamma_bar);
%analytical result of symbol error rate
P_SC_symbol_e8 = integral(P_SC8,0,inf); 

%analytic result for MRC K = 2
P_MRC2 = @(x) normcdf(sqrt(2.*x),'upper').*(x.^(M-1).*exp(-x./gamma_bar))./(gamma_bar^M*factorial(M-1));
P_MRC_symbol_e2 = integral(P_MRC2,0,inf);
%analytic result for MRC K = 4
P_MRC4 = @(x) (1-(1-normcdf(sqrt(2.*x),'upper')).^2).*(x.^(M-1).*exp(-x./gamma_bar))./(gamma_bar^M*factorial(M-1));
P_MRC_symbol_e4 = integral(P_MRC4,0,inf);
%analytic result for MRC K = 8
P_MRC8 = @(x) 2*normcdf(sqrt(2.*x)*sin(3.14/8),'upper').*(x.^(M-1).*exp(-x./gamma_bar))./(gamma_bar^M*factorial(M-1));
P_MRC_symbol_e8 = integral(P_MRC8,0,inf);

%Output all the analytic results
fprintf('M = %d, gamma_bar = %.2f\n', M, gamma_bar);
disp('Analytic results for SC');
fprintf('P_SC_2 = %.3f\n',P_SC_symbol_e2);
fprintf('P_SC_4 = %.3f\n',P_SC_symbol_e4);
fprintf('P_SC_8 = %.3f\n',P_SC_symbol_e8);
disp('Analytic results for MRC');
fprintf('P_MRC_2 = %.3f\n',P_MRC_symbol_e2);
fprintf('P_MRC_4 = %.3f\n',P_MRC_symbol_e4);
fprintf('P_MRC_8 = %.3f\n\n',P_MRC_symbol_e8);
SC = [P_SC_symbol_e2;P_SC_symbol_e4;P_SC_symbol_e8];
MRC = [P_MRC_symbol_e2;P_MRC_symbol_e4;P_MRC_symbol_e8];