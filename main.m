% main.m
% This script when run should compute all values and make all plots
% required by the project.
% To do so, you must fill the functions in the functions/ folder,
% and create scripts in the scripts/ folder to make the required
% plots.

% Add folders to path
addpath('./functions/','./scripts/');

% Add plot defaults
plotDefaults;

% %% Exercise1
%Input Values
N = 78
T = 2769
n = N-1
alpha = 5
q1 = 0.02
q2 = 0.04
V = 100
y1 = 2008
m1 = 9
da1 = 16
% % Compute values
[dates,X] = loadStockData('C:\Users\wc145\ECON672\Projects\Data\HD5min.csv',0)
[rDates, r] = getReturns(dates, X, N, T)
[t_present] = Identifydate(rDates,n,T,y1,m1,da1)
t_past = t_present-1;

[tau,b] = getTimeOfDay(r,n,t_past)
cut = getThreshold(r, n, t_past, tau, alpha)
[rc,rd,c] = SeparateJumps(r,rDates, n, t_past, cut)
TV = getTV(rc, n, t_past)

[CI_lower,CI_upper] = getCI(TV,rc, n, t_past)
[Prob1] = getProbabilityatRisk(q1,TV(t_past,1))
[Prob1_upper] = getProbabilityatRisk(q1,CI_upper(t_past,1))
[Prob1_lower] = getProbabilityatRisk(q1,CI_lower(t_past,1))
[Prob2] = getProbabilityatRisk(q2,TV(t_past,1))
[Prob2_upper] = getProbabilityatRisk(q2,CI_upper(t_past,1))
[Prob2_lower] = getProbabilityatRisk(q2,CI_lower(t_past,1))

[VaR] = getVaR(V,TV(t_past,1))
[VaR_lower] = getVaR(V,CI_lower(t_past,1))
[VaR_upper] = getVaR(V,CI_upper(t_past,1))

%% Exercise2
% y1 = 2015
% m1 = 1
% da1 = 22
% N = 78
% T = 2769
% n = N-1
% N_t = 66
% 
% [D] = ImportData('C:\Users\wc145\ECON672\Projects\Data\Options\Options\20150122_66.mat')
% [dates,X] = loadStockData('C:\Users\wc145\ECON672\Projects\Data\SPY5min.csv',0)
% [rDates, r] = getReturns(dates, X, N, T)
% [RV] = getRV(r, n, T)
% sigma = sqrt(252*RV)
% [t_present] = Identifydate(rDates,n,T,y1,m1,da1)
% 
% % Black-Scholes Model
% for i = 1:N_t
%     [Call(i,1), Put(i,1)] = BLScallput(D(i,3), D(i,7), D(i,4), D(i,8), sigma(t_present,1), D(i,5));
% end
% plot2C(D, N_t,' Jan.22nd,2015')
% plot2D(D, N_t,Put,' Jan.22nd,2015')

% y1 = 2015
% m1 = 1
% da1 = 26
% N_t = 46
% 
% [D] = ImportData('C:\Users\wc145\ECON672\Projects\Data\Options\Options\20150126_46.mat')
% [t_present] = Identifydate(rDates,n,T,y1,m1,da1)
% 
% % Black-Scholes Model
% for i = 1:N_t
%     [Call(i,1), Put(i,1)] = BLScallput(D(i,3), D(i,7), D(i,4), D(i,8), sigma(t_present,1), D(i,5));
% end
% plot2D(D, N_t,Put,' Jan.26th,2015')
% 
% y1 = 2015
% m1 = 2
% da1 = 4
% N_t = 66
% 
% [D] = ImportData('C:\Users\wc145\ECON672\Projects\Data\Options\Options\20150204_66.mat')
% [t_present] = Identifydate(rDates,n,T,y1,m1,da1)
% 
% % Black-Scholes Model
% for i = 1:N_t
%     [Call(i,1), Put(i,1)] = BLScallput(D(i,3), D(i,7), D(i,4), D(i,8), sigma(t_present,1), D(i,5));
% end
% plot2D(D, N_t,Put,' Feb.4th,2015')
% 
% y1 = 2015
% m1 = 3
% da1 = 16
% N_t = 52
% 
% [D] = ImportData('C:\Users\wc145\ECON672\Projects\Data\Options\Options\20150316_52.mat')
% [t_present] = Identifydate(rDates,n,T,y1,m1,da1)
% 
% % Black-Scholes Model
% for i = 1:N_t
%     [Call(i,1), Put(i,1)] = BLScallput(D(i,3), D(i,7), D(i,4), D(i,8), sigma(t_present,1), D(i,5));
% end
% plot2D(D, N_t,Put,' Mar.16th,2015')
% 
% y1 = 2015
% m1 = 5
% da1 = 20
% N_t = 51
% 
% [D] = ImportData('C:\Users\wc145\ECON672\Projects\Data\Options\Options\20150520_51.mat')
% [t_present] = Identifydate(rDates,n,T,y1,m1,da1)
% 
% % Black-Scholes Model
% for i = 1:N_t
%     [Call(i,1), Put(i,1)] = BLScallput(D(i,3), D(i,7), D(i,4), D(i,8), sigma(t_present,1), D(i,5));
% end
% plot2D(D, N_t,Put,' May.20th,2015')
% 
% y1 = 2015
% m1 = 7
% da1 = 17
% N_t = 54
% 
% [D] = ImportData('C:\Users\wc145\ECON672\Projects\Data\Options\Options\20150717_54.mat')
% [t_present] = Identifydate(rDates,n,T,y1,m1,da1)
% 
% % Black-Scholes Model
% for i = 1:N_t
%     [Call(i,1), Put(i,1)] = BLScallput(D(i,3), D(i,7), D(i,4), D(i,8), sigma(t_present,1), D(i,5));
% end
% plot2D(D, N_t,Put,' Jul.17th,2015')
% 
% y1 = 2015
% m1 = 8
% da1 = 5
% N_t = 45
% 
% [D] = ImportData('C:\Users\wc145\ECON672\Projects\Data\Options\Options\20150805_45.mat')
% [t_present] = Identifydate(rDates,n,T,y1,m1,da1)
% 
% % Black-Scholes Model
% for i = 1:N_t
%     [Call(i,1), Put(i,1)] = BLScallput(D(i,3), D(i,7), D(i,4), D(i,8), sigma(t_present,1), D(i,5));
% end
% plot2D(D, N_t,Put,' Aug.5th,2015')
% 
% y1 = 2015
% m1 = 9
% da1 = 10
% N_t = 78
% 
% [D] = ImportData('C:\Users\wc145\ECON672\Projects\Data\Options\Options\20150910_78.mat')
% [t_present] = Identifydate(rDates,n,T,y1,m1,da1)
% 
% % Black-Scholes Model
% for i = 1:N_t
%     [Call(i,1), Put(i,1)] = BLScallput(D(i,3), D(i,7), D(i,4), D(i,8), sigma(t_present,1), D(i,5));
% end
% plot2D(D, N_t,Put,' Sep.10th,2015')
% 
% y1 = 2015
% m1 = 10
% da1 = 9
% N_t = 61
% 
% [D] = ImportData('C:\Users\wc145\ECON672\Projects\Data\Options\Options\20151009_61.mat')
% [t_present] = Identifydate(rDates,n,T,y1,m1,da1)
% 
% % Black-Scholes Model
% for i = 1:N_t
%     [Call(i,1), Put(i,1)] = BLScallput(D(i,3), D(i,7), D(i,4), D(i,8), sigma(t_present,1), D(i,5));
% end
% plot2D(D, N_t,Put,' Oct.9th,2015')
% 
% y1 = 2015
% m1 = 10
% da1 = 30
% N_t = 55
% 
% [D] = ImportData('C:\Users\wc145\ECON672\Projects\Data\Options\Options\20151030_55.mat')
% [t_present] = Identifydate(rDates,n,T,y1,m1,da1)
% 
% % Black-Scholes Model
% for i = 1:N_t
%     [Call(i,1), Put(i,1)] = BLScallput(D(i,3), D(i,7), D(i,4), D(i,8), sigma(t_present,1), D(i,5));
% end
% plot2D(D, N_t,Put,' Oct.30th,2015')
% 
% y1 = 2015
% m1 = 12
% da1 = 4
% N_t = 55
% 
% [D] = ImportData('C:\Users\wc145\ECON672\Projects\Data\Options\Options\20151204_55.mat')
% [t_present] = Identifydate(rDates,n,T,y1,m1,da1)
% 
% % Black-Scholes Model
% for i = 1:N_t
%     [Call(i,1), Put(i,1)] = BLScallput(D(i,3), D(i,7), D(i,4), D(i,8), sigma(t_present,1), D(i,5));
% end
% plot2D(D, N_t,Put,' Dec.4th,2015')

% %% Exercise3
% nc = 1000
% S0 = 50
% r0 = 0.013
% T0 = 90/365
% V0 = 40
% q0 = 0.025
% K0 = [42.5 44 48 50 52 55]'
% 
% for i = 1:6
%     [~, Put_BS(i,1)] = BLScallput(S0, K0(i,1), r0, T0, V0/100, q0);
%     [Put_HW(i,1)] = HWput(S0,K0(i,1),r0,T0,V0,q0,nc);
% end
% plot3B(K0, S0,Put_BS,Put_HW)
% 
% y1 = 2015
% m1 = 1
% da1 = 22
% N = 78
% T = 2769
% n = N-1
% N_t = 66
% 
% [D] = ImportData('C:\Users\wc145\ECON672\Projects\Data\Options\Options\20150122_66.mat')
% [dates,X] = loadStockData('C:\Users\wc145\ECON672\Projects\Data\SPY5min.csv',0)
% [rDates, r] = getReturns(dates, X, N, T)
% [RV] = getRV(r, n, T)
% sigma = sqrt(252*RV)
% [t_present] = Identifydate(rDates,n,T,y1,m1,da1)
% 
% for i = 1:N_t
%     [Call(i,1), Put(i,1)] = BLScallput(D(i,3), D(i,7), D(i,4), D(i,8), sigma(t_present,1), D(i,5));
%     [Put_HW_real(i,1)] = HWput(D(i,3), D(i,7), D(i,4), D(i,8), sigma(t_present,1)*100, D(i,5),nc);
% end
% 
% plot3C(D, N_t,Put,Put_HW_real,' Jan.22nd,2015')
% 
% y1 = 2015
% m1 = 1
% da1 = 12
% N_t = 55
% [D] = ImportData('C:\Users\wc145\ECON672\Projects\Data\Options\Options\20150112_55.mat')
% [t_present] = Identifydate(rDates,n,T,y1,m1,da1)
% for i = 1:N_t
%     [Call(i,1), Put(i,1)] = BLScallput(D(i,3), D(i,7), D(i,4), D(i,8), sigma(t_present,1), D(i,5));
%     [Put_HW_real(i,1)] = HWput(D(i,3), D(i,7), D(i,4), D(i,8), sigma(t_present,1)*100, D(i,5),nc);
% end
% plot3C(D, N_t,Put,Put_HW_real,' Jan.12nd,2015')
% 
% y1 = 2015
% m1 = 1
% da1 = 30
% N_t = 66
% [D] = ImportData('C:\Users\wc145\ECON672\Projects\Data\Options\Options\20150130_66.mat')
% [t_present] = Identifydate(rDates,n,T,y1,m1,da1)
% for i = 1:N_t
%     [Call(i,1), Put(i,1)] = BLScallput(D(i,3), D(i,7), D(i,4), D(i,8), sigma(t_present,1), D(i,5));
%     [Put_HW_real(i,1)] = HWput(D(i,3), D(i,7), D(i,4), D(i,8), sigma(t_present,1)*100, D(i,5),nc);
% end
% plot3C(D, N_t,Put,Put_HW_real,' Jan.30th,2015')
% 
% y1 = 2015
% m1 = 2
% da1 = 19
% N_t = 47
% [D] = ImportData('C:\Users\wc145\ECON672\Projects\Data\Options\Options\20150219_47.mat')
% [t_present] = Identifydate(rDates,n,T,y1,m1,da1)
% for i = 1:N_t
%     [Call(i,1), Put(i,1)] = BLScallput(D(i,3), D(i,7), D(i,4), D(i,8), sigma(t_present,1), D(i,5));
%     [Put_HW_real(i,1)] = HWput(D(i,3), D(i,7), D(i,4), D(i,8), sigma(t_present,1)*100, D(i,5),nc);
% end
% plot3C(D, N_t,Put,Put_HW_real,' Feb.19th,2015')
% 
% y1 = 2015
% m1 = 4
% da1 = 2
% N_t = 46
% [D] = ImportData('C:\Users\wc145\ECON672\Projects\Data\Options\Options\20150402_46.mat')
% [t_present] = Identifydate(rDates,n,T,y1,m1,da1)
% for i = 1:N_t
%     [Call(i,1), Put(i,1)] = BLScallput(D(i,3), D(i,7), D(i,4), D(i,8), sigma(t_present,1), D(i,5));
%     [Put_HW_real(i,1)] = HWput(D(i,3), D(i,7), D(i,4), D(i,8), sigma(t_present,1)*100, D(i,5),nc);
% end
% plot3C(D, N_t,Put,Put_HW_real,' Apr.2nd,2015')
% 
% y1 = 2015
% m1 = 5
% da1 = 22
% N_t = 50
% [D] = ImportData('C:\Users\wc145\ECON672\Projects\Data\Options\Options\20150522_50.mat')
% [t_present] = Identifydate(rDates,n,T,y1,m1,da1)
% for i = 1:N_t
%     [Call(i,1), Put(i,1)] = BLScallput(D(i,3), D(i,7), D(i,4), D(i,8), sigma(t_present,1), D(i,5));
%     [Put_HW_real(i,1)] = HWput(D(i,3), D(i,7), D(i,4), D(i,8), sigma(t_present,1)*100, D(i,5),nc);
% end
% plot3C(D, N_t,Put,Put_HW_real,' May.22nd,2015')
% 
% y1 = 2015
% m1 = 6
% da1 = 12
% N_t = 43
% [D] = ImportData('C:\Users\wc145\ECON672\Projects\Data\Options\Options\20150612_43.mat')
% [t_present] = Identifydate(rDates,n,T,y1,m1,da1)
% for i = 1:N_t
%     [Call(i,1), Put(i,1)] = BLScallput(D(i,3), D(i,7), D(i,4), D(i,8), sigma(t_present,1), D(i,5));
%     [Put_HW_real(i,1)] = HWput(D(i,3), D(i,7), D(i,4), D(i,8), sigma(t_present,1)*100, D(i,5),nc);
% end
% plot3C(D, N_t,Put,Put_HW_real,' Jun.12nd,2015')
% 
% y1 = 2015
% m1 = 7
% da1 = 23
% N_t = 60
% [D] = ImportData('C:\Users\wc145\ECON672\Projects\Data\Options\Options\20150723_60.mat')
% [t_present] = Identifydate(rDates,n,T,y1,m1,da1)
% for i = 1:N_t
%     [Call(i,1), Put(i,1)] = BLScallput(D(i,3), D(i,7), D(i,4), D(i,8), sigma(t_present,1), D(i,5));
%     [Put_HW_real(i,1)] = HWput(D(i,3), D(i,7), D(i,4), D(i,8), sigma(t_present,1)*100, D(i,5),nc);
% end
% plot3C(D, N_t,Put,Put_HW_real,' Jul.23rd,2015')
% 
% y1 = 2015
% m1 = 9
% da1 = 10
% N_t = 78
% [D] = ImportData('C:\Users\wc145\ECON672\Projects\Data\Options\Options\20150910_78.mat')
% [t_present] = Identifydate(rDates,n,T,y1,m1,da1)
% for i = 1:N_t
%     [Call(i,1), Put(i,1)] = BLScallput(D(i,3), D(i,7), D(i,4), D(i,8), sigma(t_present,1), D(i,5));
%     [Put_HW_real(i,1)] = HWput(D(i,3), D(i,7), D(i,4), D(i,8), sigma(t_present,1)*100, D(i,5),nc);
% end
% plot3C(D, N_t,Put,Put_HW_real,' Sep.10th,2015')
% 
% y1 = 2015
% m1 = 10
% da1 = 16
% N_t = 65
% [D] = ImportData('C:\Users\wc145\ECON672\Projects\Data\Options\Options\20151016_65.mat')
% [t_present] = Identifydate(rDates,n,T,y1,m1,da1)
% for i = 1:N_t
%     [Call(i,1), Put(i,1)] = BLScallput(D(i,3), D(i,7), D(i,4), D(i,8), sigma(t_present,1), D(i,5));
%     [Put_HW_real(i,1)] = HWput(D(i,3), D(i,7), D(i,4), D(i,8), sigma(t_present,1)*100, D(i,5),nc);
% end
% plot3C(D, N_t,Put,Put_HW_real,' Oct.16th,2015')
% 
% y1 = 2015
% m1 = 11
% da1 = 3
% N_t = 57
% [D] = ImportData('C:\Users\wc145\ECON672\Projects\Data\Options\Options\20151103_57.mat')
% [t_present] = Identifydate(rDates,n,T,y1,m1,da1)
% for i = 1:N_t
%     [Call(i,1), Put(i,1)] = BLScallput(D(i,3), D(i,7), D(i,4), D(i,8), sigma(t_present,1), D(i,5));
%     [Put_HW_real(i,1)] = HWput(D(i,3), D(i,7), D(i,4), D(i,8), sigma(t_present,1)*100, D(i,5),nc);
% end
% plot3C(D, N_t,Put,Put_HW_real,' Nov.3rd,2015')
% %% Exercise4
% N_high = 4621
% T_high = 252
% n_high = N_high-1
% kn = 60
% kn_max = 120
% % Compute Values
% [dates_high,X_high] = loadStockData('C:\Users\wc145\ECON672\Projects\Data\Stocks5Sec\TSLA-2016.csv',1)
% [rDates_high, r_high] = getReturns(dates_high, X_high, N_high, T_high);
% [RV_c] = getRVcoarse(n_high,kn,N_high,X_high,T_high)
% [RVSIG,RVSIG2] = getRVSignature(n_high,X_high,kn_max,T_high,N_high)
% [Noise] = getNoise(r_high, n_high, T_high)
% [AveNoise] = mean(Noise)
% [AveContri] = ContriAve(T_high,kn_max,Noise,n_high,RVSIG)
% [RV_s] = getSubRV(T_high,kn,n_high,X_high,N_high)
% [RVsubave] = getSubaveRV(T_high,RV_s,kn)
% [TSRV] = getTSRV(RVsubave,Noise,n_high,T_high,kn)
% 
% for kn = 1:kn_max
%     [RV_s] = getSubRV(T_high,kn,n_high,X_high,N_high);
%     [RVsubave] = getSubaveRV(T_high,RV_s,kn);
%     [TSRVSIG(:,kn)] = getTSRV(RVsubave,Noise,n_high,T_high,kn);
% end
% [TSRVSIG2] = getTSRVSignature(kn_max,T_high,TSRVSIG)    
% 
% % Make Plots
% plot4B(RVSIG2, kn_max,' TSLA2016')
% plot4E(AveContri, kn_max,' TSLA2016')
% plot4G(RV_c,TSRV,rDates_high,n_high,T_high,' TSLA2016')
% plot4H(RVSIG2,TSRVSIG2, kn_max,' TSLA2016')
% 
% N_high = 4621
% T_high = 252
% n_high = N_high-1
% kn = 60
% kn_max = 120
% % Compute Values
% [dates_high,X_high] = loadStockData('C:\Users\wc145\ECON672\Projects\Data\Stocks5Sec\IBM-2014.csv',1)
% [rDates_high, r_high] = getReturns(dates_high, X_high, N_high, T_high);
% [RV_c] = getRVcoarse(n_high,kn,N_high,X_high,T_high)
% [RVSIG,RVSIG2] = getRVSignature(n_high,X_high,kn_max,T_high,N_high)
% [Noise] = getNoise(r_high, n_high, T_high)
% [AveNoise] = mean(Noise)
% [AveContri] = ContriAve(T_high,kn_max,Noise,n_high,RVSIG)
% [RV_s] = getSubRV(T_high,kn,n_high,X_high,N_high)
% [RVsubave] = getSubaveRV(T_high,RV_s,kn)
% [TSRV] = getTSRV(RVsubave,Noise,n_high,T_high,kn)
% 
% for kn = 1:kn_max
%     [RV_s] = getSubRV(T_high,kn,n_high,X_high,N_high);
%     [RVsubave] = getSubaveRV(T_high,RV_s,kn);
%     [TSRVSIG(:,kn)] = getTSRV(RVsubave,Noise,n_high,T_high,kn);
% end
% [TSRVSIG2] = getTSRVSignature(kn_max,T_high,TSRVSIG)    
% 
% % Make Plots
% plot4B(RVSIG2, kn_max,' IBM2014')
% plot4E(AveContri, kn_max,' IBM2014')
% plot4G(RV_c,TSRV,rDates_high,n_high,T_high,' IBM2014')
% plot4H(RVSIG2,TSRVSIG2, kn_max,' IBM2014')