

x = [1900, 1910, 1920, 1930, 1940, 1950, 1960, 1970, 1980, 1990, 2000];
y = [75.995, 91.972, 105.711, 123.203, 131.669, 150.697, 179.323, 203.212, 226.505, 249.633, 281.422];


% display the functions in use
type('ls.m');
type('fitls.m');



c = fitls(x, y, 2);


x_ls = [x(1:8), 1975, x(9:end)];
y_ls = zeros(1, length(x_ls));
for i = 1:length(x_ls)
    y_ls(i) = ls(x_ls(i), c, 2);
end


plot(x, y, 'bo', 'MarkerSize', 6, 'MarkerFaceColor', 'b'); % 'bo' for blue circles
hold on;


x_range = linspace(min(x_ls), max(x_ls), 100);
y_range = arrayfun(@(z) ls(z, c, 2), x_range);
plot(x_range, y_range, 'k-'); 


plot(x_ls, y_ls, 'ro', 'MarkerSize', 6, 'MarkerFaceColor', 'r'); % 'r*' for red stars


for i = 1:length(x_ls)
    text(x_ls(i) - 10, y_ls(i) + 10, sprintf('(%d, %0.1f)', x_ls(i), y_ls(i)), 'FontSize', 8, 'Color', [1, 0, 0]);
end


hold off;
xlabel('Year');
ylabel('Value');
title('Least Squares Polynomial Fit with Original and LS Points');
legend('Original Points', 'LS Fit', 'LS Points', 'Location', 'northwest');


fprintf('Least Squares Polynomial: p(x) = ');
for i = 1:length(c)
    fprintf('%f x^%d ', c(i), i-1);
    if i ~= length(c)
        fprintf('+ ');
    end
end
fprintf('\nLeast Squares at 1975 = %f\n', y_ls(9));







