function importfile(fileToRead1)
%IMPORTFILE(FILETOREAD1)
%  지정된 파일에서 데이터 가져오기
%  FILETOREAD1:  읽을 파일

%  MATLAB에서 22-Sep-2022 15:21:35에 자동 생성됨

% 파일 가져오기
newData1 = load('-mat', fileToRead1);

% 기본 작업 공간에 해당 필드로부터 새 변수를 생성합니다.
vars = fieldnames(newData1);
for i = 1:length(vars)
    assignin('base', vars{i}, newData1.(vars{i}));
end

