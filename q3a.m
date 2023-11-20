x = [1900, 1910, 1920, 1930, 1940, 1950, 1960, 1970, 1980, 1990, 2000];
y = [75.995, 91.972, 105.711, 123.203, 131.669, 150.697, 179.323, 203.212, 226.505, 249.633, 281.422];

[A, B, C, D, T] = splinefull(x, y);

%disply functinos used
type('splinefull.m')
type('spline_eval.m')
type('splinei.m')
type('splinezi.m')


x_fine = linspace(min(x), max(x), 1000);
y_fine = arrayfun(@(xi) spline_eval(xi, A, B, C, D, T), x_fine);


plot(x_fine, y_fine, 'b-');
hold on;

plot(x, y, 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 6);


x_spline = [x, 2010];
y_spline = arrayfun(@(xi) spline_eval(xi, A, B, C, D, T), x_spline);


plot(x_spline, y_spline, 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 6);


offset = 10; % Adjust the label offset as needed
for i = 1:length(x_spline)
    text(x_spline(i), y_spline(i) - offset, sprintf('(%d, %0.1f)', x_spline(i), y_spline(i)), 'FontSize', 8, 'Color', [0, 0, 1]);
end


hold off;
xlabel('Year');
ylabel('Value');
title('Cubic Spline Interpolation with Original and New Points');
xlim([min(x_spline)-5, max(x_spline)+5]);
ylim([min(y_spline)-5, max(y_spline)+5]);
legend('Spline', 'Original Points', 'New Points', 'Location', 'northwest');
