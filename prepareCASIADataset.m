% prepareCASIADataset

%% dirs and files
CASE = 'train';
sourceImgDir = CASE;
sourceGtDir = CASE;
destDataBase = '/home/lili/datasets/CASIA/';
destImgDir = fullfile(destDataBase, 'img', CASE);
destGtDir = fullfile(destDataBase, 'gt', CASE, 'txt');
mkdir(destImgDir);
mkdir(destGtDir);

%% copy images to destImgDir, write gt to destGtDir
imgFiles = dir(fullfile(sourceImgDir, '*.jpg'));
nImg = numel(imgFiles);
for i = 1:nImg
    imgRawName = imgFiles(i).name;
    fprintf('%d:%s\n', i, imgRawName);
    % copy images
    sourceImgName = fullfile(sourceImgDir, imgRawName);
    destImgName = fullfile(destImgDir, imgRawName);
    copyfile(sourceImgName, destImgName);
    % write gt
    sourceGtFile = fullfile(sourceGtDir, [imgRawName(1:end-3), 'txt']);
    gtData = importdata(sourceGtFile);
    destGtFile = fullfile(destGtDir, [imgRawName(1:end-3), 'txt']);
    fp = fopen(destGtFile, 'wt');
    fprintf(fp, '%d, %d, %d, %d, "#"\n', gtData');
    fclose(fp);
end