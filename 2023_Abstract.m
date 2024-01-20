% Data
y2023 = [45, 20, 20, 15];
labels = {'车载医保', '软交换', '音视频服务', '调度系统'};

% Create a 3D pie chart with percentages
figure;
h = pie3(y2023, labels);

% Customize pie chart properties
title('2023', 'FontSize', 16, 'FontWeight', 'bold');
colormap(gca, jet(numel(y2023))); % Use a colormap for better color distinction
legend(labels, 'Location', 'BestOutside', 'FontSize', 12);

% Adjust pie chart appearance
for i = 1:numel(h)
    if isa(h(i), 'matlab.graphics.primitive.Patch')
        h(i).EdgeColor = 'none'; % Remove black edges
    elseif isa(h(i), 'matlab.graphics.primitive.Text')
        h(i).FontSize = 12; % Adjust font size of text labels
    end
end

% Display percentages on the pie chart slices
percentValues = 100 * y2023 / sum(y2023);
textLabels = strcat(labels(:), {' ('}, num2str(percentValues', '%.1f'), {'%)'});
textH = findobj(h, 'Type', 'text');

for i = 1:numel(textH)
    textH(i).String = textLabels{i};
end
