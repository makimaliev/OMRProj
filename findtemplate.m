function[res] = findtemplate(im, temp, th)
out = normxcorr2(temp, im);
[m, n] = size(temp);
out = out(m+1: end, n+1: end);
bw = out > th;
r = regionprops(bwlabel(bw));
res = r;