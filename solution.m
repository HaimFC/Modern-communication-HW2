% ---------------------------- Question 1 ------------------------------- %
% Both Gaussian and Laplace error probabillity
SNR = 0:0.0001:3;
Laplace = 0.5*exp(-2*sqrt(SNR));
Gaussian = 0.5*erfc(sqrt(SNR));
figure;
plot(SNR,Gaussian, SNR,Laplace);
title("Probability Error (Gaussian + Laplase)");
xlabel('SNR[db]');
ylabel('Error prob');
legend("Gaussian","Laplace");
% ---------------------------- Question 2 ------------------------------- %
%Gaussian Noise
%%
SNR_dB = -6:6;
symbols = randsrc(10^5, 1); %Generate Symbols
arrSymbols = repmat(transpose(symbols),length(SNR_dB),1); % create matrix
rGaussian = zeros(length(SNR_dB), 10^5); % Initialize the probability of error vectors
for k=1:length(SNR_dB)
n0 = 1/10^(SNR_dB (k)/10); % Convert SNR from dB to linear scale
% Generate Gaussian noise samples
noise = sqrt(n0/2)*randn(length(symbols),1);
rGaussian(k,:) = noise + symbols;
end
% Create new matrix in size of rGaussian but contains only 1 and -1 by the
% val of rGaussian. bigger than 0 is , lower is -1.
gaussianValues = sign(rGaussian) .* (rGaussian > 0) + (-1) .* (rGaussian <= 0);
gaussianErrorProb = (sum(transpose(gaussianValues ~= arrSymbols)))/length(arrSymbols(1,:));
% Plot the probability of error of the decoded symbols stream as a function of SNR(Gaussian).
figure;
plot(SNR_dB,gaussianErrorProb);
title("Probability Error (Gaussian)");
xlabel("SNR[db]");
ylabel("Error prob");
%Laplase Noise
%%
SNR_dB = -6:6;
symbols = randsrc(10^5,1);
arrSymbols = repmat(transpose(symbols),length(SNR_dB),1);
rlaplace = zeros(length(SNR_dB),10^5);
for k = 1:length(SNR_dB)
rlaplace(k,:) = laprnd(1, length(arrSymbols(1,:)),0,sqrt(1/(10^(SNR_dB (k)/10))/2));
end
% Create new matrix in size of rGaussian but contains only 1 and -1 by the
% val of rGaussian. bigger than 0 is , lower is -1.
rlaplace = rlaplace + arrSymbols;
laplaseValues = sign(rlaplace) .* (rlaplace > 0) + (-1) .* (rlaplace <= 0);
errorProblaplace = (sum(transpose(laplaseValues ~= arrSymbols)))/length(arrSymbols(1,:));
% Plot the probability of error of the decoded symbols stream as a function of SNR (Laplase).
figure;
plot(SNR_dB,errorProblaplace);
title("Probability Error (Laplase)");
xlabel("SNR[db]");
ylabel("Error prob");
% third part,plot all together
figure
plot(SNR_dB,gaussianErrorProb,SNR_dB,errorProblaplace);
title("Probability Error (Gaussian + Laplase)");
legend("Gaussian","Laplace");
xlabel("SNR[db]");
ylabel("Error prob");
%e laprnd.m MATLAB function (From moodle).
%%
function y = laprnd(m, n, mu, sigma)
%LAPRND generate i.i.d. laplacian random number drawn from laplacian distribution
% with mean mu and standard deviation sigma.
% mu : mean
% sigma : standard deviation
% [m, n] : the dimension of y.
% Default mu = 0, sigma = 1.
% For more information, refer to
% http://en.wikipedia.org./wiki/Laplace_distribution
% Author : Elvis Chen (bee33@sjtu.edu.cn)
% Date : 01/19/07
%Check inputs
if nargin < 2
error('At least two inputs are required');
end
if nargin == 2
mu = 0; sigma = 1;
end
if nargin == 3
sigma = 1;
end
% Generate Laplacian noise
u = rand(m, n)-0.5;
b = sigma / sqrt(2);
y = mu - b * sign(u).* log(1- 2* abs(u));
end