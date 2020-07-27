clc;
clf;
clear all;
close all;
Kp = 55.7616;
Kd = 0.7836;
beta = 0.9789;
K= 1.53;
T = 0.0254;
Wcr = (abs(1/Kd))^(1/beta);
Wcr1 = (abs(1/0.0254));
w = logspace(-4 , 4, 1000);
mask = w < Wcr;
 mask1 = w < Wcr1;
mag1 = 20*log10(Kp)*ones(size(w));
mag2 = 20*log10(Kd)*ones(size(w));
mag3 = 20*log10(K)*ones(size(w));
mag4 =  mask.*(20*log10(1/Kd)) + (~mask).*(20*beta*log10(w));
mag5 = -20*log10(w);
mag6 =  (mask1).*(-20*log10(1)) + (~mask1).*(-20*log10(0.0254*w));
combined = mag1 + mag2 + mag3 + mag4 + mag5 + mag6 ;
 
figure(1);
plot(1,1);
semilogx(w, mag1,'Color','black')
xlabel('Frequency(rad/sec)','FontSize', 15);
ylabel('Magnitude dB','FontSize', 15);
grid on;
 
figure(2);
plot(1,2);
semilogx(w, mag2,'Color','black')
xlabel('Frequency(rad/sec)','FontSize', 15);
ylabel('Magnitude dB','FontSize', 15);
grid on;
 
figure(3);
plot(1,3);
semilogx(w, mag3,'Color','black')
xlabel('Frequency(rad/sec)','FontSize', 15);
ylabel('Magnitude dB','FontSize', 15);
grid on;
 
figure (4);
plot(1,4);
semilogx(w, mag4,'Color','black')
xlabel('Frequency(rad/sec)','FontSize', 15);
ylabel('Magnitude dB','FontSize', 15);
grid on;
 
figure (5);
plot(1,5);
semilogx(w, mag5,'Color','black')
xlabel('Frequency(rad/sec)','FontSize', 15);
ylabel('Magnitude dB','FontSize', 15);
grid on;
 
figure (6);
plot(1,6);
semilogx(w, mag6,'Color','black')
xlabel('Frequency(rad/sec)','FontSize', 15);
ylabel('Magnitude dB','FontSize', 15);
grid on;
 
figure(7);
plot(1,7);
semilogx(w, combined,'Color','black','LineStyle','--')
xlabel('Frequency(rad/sec)','FontSize', 15);
ylabel('Magnitude dB','FontSize', 15);
grid on;
legend('Asymptotic magnitude bode plot','Location','NorthEast')
 
 
plot(1,1);
semilogx(w, combined,'Color','black','LineStyle','--')
xlabel('Frequency(rad/sec)','FontSize', 15);
ylabel('Magnitude dB','FontSize', 15);
grid on;
hold on;
 
 
clc;
clear 
K = 1.53;
Kp = 55.7616;
Kd = 0.7836;
beta = 0.9789;
T = 0.0254;
 
w=logspace(-4,4,1000);
Mag=@(w) (20*log10(abs(sqrt(Kp).^2)) + 20*log10(abs(sqrt(Kd).^2)) + 20*log10(abs(sqrt(K).^2)) + 20*log10(abs(sqrt((i.*w).^beta + (1/Kd)).^2)) - 20*log10(abs(sqrt((T*(i.*w)) + 1).^2)) - 20*log10(abs(sqrt(i*w).^2)));   
semilogx(w,Mag(w) ,'Color','black');
hold on;
grid on;
xlabel('Frequency (rad/sec)','FontSize', 15);
ylabel('Magnitude (dB)','FontSize', 15);
legend('Asymptotic magnitude bode plot','Exact magnitude bode plot','Location','NorthEast')


