import cv2
from utils import imResize
from utils import sort_contours
from findCircles import findCircles
from findLetters import findLetters
from showBlobs import showBlobs
from findChoices import findChoices
from grade import grade

#read image
image = cv2.imread("testMarked.jpg")
#convert to grayscale
gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
#remove noise
img = cv2.medianBlur(gray, 3)
#detect edges
edges = cv2.Canny(img,100,200)
#apply imclose
cl = cv2.morphologyEx(edges, cv2.MORPH_CLOSE, cv2.getStructuringElement(cv2.MORPH_ELLIPSE,(20,20)))
#find connected components
contour,dummy = cv2.findContours(cl,cv2.RETR_CCOMP,cv2.CHAIN_APPROX_SIMPLE)
for cnt in contour:
	cv2.drawContours(cl,[cnt],0,255,-1)

#find largest regions
largeCnts = []
for c in contour:
	(x, y, w, h) = cv2.boundingRect(c)
	ar = w / float(h)
	#print w,h,ar
	if (w >= 600 or h >= 600) and (ar >= 0.2 and ar<=5.0):
		largeCnts.append(c)

#sort largest regions from top to bottom
(largeCnts, boundingBoxes) = sort_contours(largeCnts, "top-to-bottom")
'''
for l in largeCnts:
	(x, y, w, h) = cv2.boundingRect(l)
	ar = w / float(h)
	print x,y,w,h,ar

'''
#crop as images
(x1, y1, w1, h1) = cv2.boundingRect(largeCnts[1])
maxH1 = image[y1:y1+h1, x1:x1+w1]
(x2, y2, w2, h2) = cv2.boundingRect(largeCnts[0])
maxH2 = image[y2:y2+h2, x2:x2+w2]
(x3, y3, w3, h3) = cv2.boundingRect(largeCnts[4])
maxW = image[y3:y3+h3, x3:x3+w3]

'''
#show cropped images
color = (0, 255, 0)
for cc in largeCnts:
	cv2.drawContours(image, [cc], -1, color, 3)
	(x, y, w, h) = cv2.boundingRect(cc)
	temp = image[y:y+h, x:x+w]
	cv2.imshow("Cropped",temp)
	cv2.waitKey(0)
'''
#find circles and recognize letters for name
cntsName = findCircles(maxH1)
text1 = findLetters(h1, cntsName)
print text1
#showBlobs(maxH1, cnts)

#find circles and recognize letters for surname
cntsSurname = findCircles(maxH2)
text2 = findLetters(h2, cntsSurname)
print text2

#find circles and grade test
cnts2 = findCircles(maxW)
#showBlobs(maxW, cnts2)
choices = findChoices(cnts2)
grade(choices)

#newIm = imResize(image,5)
#cv2.imshow("Fig", newIm)
#cv2.waitKey(0)
