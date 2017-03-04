% testShowDemo

CASE = 'test';
imgDir = CASE;
gtDir = imgDir;

imgFiles = dir(fullfile(imgDir, '*.jpg'));
nImg = numel(imgFiles);
for i = 1:nImg
    imgName = imgFiles(i).name;
    image = imread(fullfile(imgDir, imgName));
    gtFile = fullfile(gtDir, [imgName(1:end-3), 'txt']);
    gtData = importdata(gtFile);
    % show image and gt
    imshow(image);
    if ~isempty(gtData)
        gtData(:, 3) = gtData(:, 3) - gtData(:, 1);
        gtData(:, 4) = gtData(:, 4) - gtData(:, 2);
    end
    displayBox(gtData);
end