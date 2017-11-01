clear all; close all; 
X=dlmread('housing_price_data.dat');
F=sortrows([X(:,5) X(:,2)]);
F=F(25:600,:);   % size 576x2 
X_Original=F(:,1); 
normalize = max(X_Original)-min(X_Original  );
X_normlized = X_Original/normalize;
X = [repmat(1,length(F),1) X_normlized];
y=F(:,2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Parameters 
%   X = 576*2  [1, size_of_house] 
%   y = 576x1 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Initialize learning rate 
w_OLS=pinv(X'*X)*X'*y;
w_OLS
yhat=X*w_OLS;
figure; hold off; 
scatter(X(:,2)*normalize,y, 50, '.'); hold; 
plot(X(:,2)*normalize,yhat,'r'); 
xlabel('Size in square Feet'); ylabel('Price'); 