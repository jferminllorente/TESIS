clc; close all;
Ts = 1.5;
t = 1:0.001:50;
x = sin(2*pi*t);
figure; plot(x,'k','LineWidth',2),ylim([-2 2]);
%%
y = 1*(t<10) -1*(t>=10 & t<30) + 1*(t>=30);
figure; plot(y,'k','LineWidth',2),ylim([-2 2]);
%%
pulse = @(t) 1*(t>=0 & t<Ts);
ak = sign(rand(1,floor(max(t)/Ts))-0.5);
spreading = 0*t;
for ii = 1:length(ak)
    spreading = spreading + ak(ii)*pulse(t-(ii-1)*Ts);
end
figure;
plot(spreading,'k','LineWidth',2),ylim([-2 2]);
%%
figure;
DSSS = x.*y.*spreading;
plot(DSSS,'k','LineWidth',2),ylim([-2 2]);