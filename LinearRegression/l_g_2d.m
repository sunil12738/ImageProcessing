n=input('enter the value of n in n X m: ');
m=input('enter the value of m in n X m: ');
for i=1:n
    for j=1:m
        fprintf('enter the value of x(%d,%d)',i,j);
        temp=input(' ');
        x(i,j)=temp;
    end
end
for i=1:n
    
        fprintf('enter the value of y(%d)',i);
        temp=input(' ');
        y(i)=temp;
    
end
xt=x.';
theta=pinv(xt*x)*xt;

fin_res=theta*(y.');
for i=1:m  
        fprintf('%d \n',fin_res(i));
end