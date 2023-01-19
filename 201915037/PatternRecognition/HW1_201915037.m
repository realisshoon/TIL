clear all; close all; clc;

load data;

h=  [0.1, 0.2, 0.4, 0.2, 0.1];

buffer=zeros(length(h),1);

re_data=[];
re_data=[data; zeros(length(1)-1,1)];

result_conv = zeros(length(re_data), 1);

for k=1:1:length(re_data)
    
    for j=1:1:length(buffer)-1
        buffer(j) = buffer(j+1);
    end
    buffer(end) = re_data(k);
    
    outval = 0;
    for j=1:1:length(buffer)
        outval = outval+buffer(j)*h(j);
    end
    
    result_conv(k) = outval;
end

convECG = conv(h, data);
result=result_conv;

figure;
subplot(311); plot(convECG);
subplot(312); plot(result_conv);
subplot(313); plot(convECG-result_conv);