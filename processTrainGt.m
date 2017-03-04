% processTrainGt

%% dirs and files
oriGtDir = 'trainGt';
destGtDir = 'train';
imgDir = destGtDir;

gtFiles = dir(fullfile(oriGtDir, '*.txt'));
nGt = numel(gtFiles);
for i = 1:nGt
    gtFileRawName = gtFiles(i).name;
    %gtFileRawName = 'wuda_10.jpg.txt';
    fprintf('%d:%s\n', i, gtFileRawName);
    gtFileName = fullfile(oriGtDir, gtFileRawName);
    gtData = importdata(gtFileName);
    if ~isempty(gtData)
        gtEightBox = gtData.data;
        xs = gtEightBox(:, 1:2:8);
        ys = gtEightBox(:, 2:2:8);
        nBox = size(xs, 1);
        minx = min(xs, [], 2);
        miny = min(ys, [], 2);
        maxx = max(xs, [], 2);
        maxy = max(ys, [], 2);
        width = maxx - minx + 1;
        height = maxy - miny + 1;
        showBox = [minx, miny, width, height];
        saveBox = [minx, miny, maxx, maxy];
        
    end
    % write to dest gt file
    destGtFileName = fullfile(destGtDir, [gtFileRawName(1:end-7), 'txt']);
    fp = fopen(destGtFileName, 'wt');
    fprintf(fp, '%d %d %d %d\n', saveBox');
    fclose(fp);
    
    % show image and gt
%     imgName = gtFileRawName(1:end-4);
%     image = imread(fullfile(imgDir, imgName));
%     imshow(image);
%     displayBox(box);
end

