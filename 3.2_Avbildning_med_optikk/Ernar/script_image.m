
filepath='C:\avbildning\Ernar\';


    [filename,filepath,FilterIndex] = uigetfile([filepath,'*.png']);
    %filename='stoy1 (1).png';

    %image analysis
    [m,v]=image_noise_analysis(filepath,filename)

    