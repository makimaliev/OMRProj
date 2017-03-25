import cv2
from utils import imResize

image = cv2.imread("testMarked.jpg")
gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
img = cv2.medianBlur(gray, 3)
edges = cv2.Canny(img,100,200)
cl = cv2.morphologyEx(edges, cv2.MORPH_CLOSE, cv2.getStructuringElement(cv2.MORPH_ELLIPSE,(20,20)))
contour,dummy = cv2.findContours(cl,cv2.RETR_CCOMP,cv2.CHAIN_APPROX_SIMPLE)
for cnt in contour:
	cv2.drawContours(cl,[cnt],0,255,-1)

largeCnts = []
for c in contour:
	(x, y, w, h) = cv2.boundingRect(c)
	ar = w / float(h)
	#print w,h,ar
	if (w >= 600 or h >= 600) and (ar >= 0.2 and ar<=5.0):
		largeCnts.append(c)

print len(largeCnts)
for l in largeCnts:
	(x, y, w, h) = cv2.boundingRect(l)
	ar = w / float(h)
	print w,h,ar

color = (0, 255, 0)
for cc in largeCnts:
	cv2.drawContours(image, [cc], -1, color, 3)

newIm = imResize(image,5)
cv2.imshow("Fig", newIm)
cv2.waitKey(0)
