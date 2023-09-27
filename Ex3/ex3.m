% this is for computing histogram of ferrari image and density function
addpath("images/");
addpath("Ex3/");
im = imread("ferrari.JPG");
fig_hist = figure;
title( "Histograms");
xlabel('Bit');
ylabel('number of occurencies');

fig_hist.Position = [100 100 1200 800];
subplot(1,3,1);
legend('RED');
[h1, density_fun1]=compute_histogram(im, 1, true);
bar(h1);
grid on;
subplot(1,3,2);
[h2, density_fun2]=compute_histogram(im, 2, true);
bar(h2);
legend('GREEN');
grid on;
subplot(1,3,3);

[h3, density_fun3]=compute_histogram(im, 3, true);
grid on;
bar(h3);
grid on;
legend('BLUE');
imwrite(getframe(fig_hist).cdata, "histograms.jpg");

n=2;
fig_df=figure;
fig_df.Position = [100 100 1200 800];
title( "Density function");

subplot(1,3,1);

plot(density_fun1, 'DisplayName','Channel red',  'color','r','linewidth',n);
legend;
grid on;
subplot(1,3,2);

plot(density_fun2, 'DisplayName','Channel green', 'color','g','linewidth',n);
legend;
grid on;
subplot(1,3,3);
plot(density_fun3, 'DisplayName','Channel blue', 'color','b','linewidth',n); 
grid on;
legend;
sgtitle('Density function') 
imwrite(getframe(fig_df).cdata, "density_function.jpg");



