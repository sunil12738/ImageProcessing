n=input('input the number of elements in 1*X vector: ');
sumx=0;
sumxy=0;
sumxx=0;
sumy=0;
for i=1:n
    x(i)=input('input the elements in X one by one');
    sumx=sumx+x(i);
end
for i=1:n
    y(i)=input('input the elements in Y one by one');
    sumy=sumy+y(i);
end
for i=1:n
    xy(i)=x(i)*y(i);
    xx(i)=x(i)*x(i);
end
sumxy=sum(xy);
sumxx=sum(xx);
slope=(n*sumxy-sumx*sumy)/(n*sumxx-sumx*sumx);
intercept=(sumy-slope*sumx)/n;
fprintf('The best fitting for this is: y = %fx + %f ',slope,intercept);