from findMainRegions import findMainRegions
from readNameAndGrade import readNameAndGrade
import cv2
from scan import scan
from utils import imResize
import imutils

image = cv2.imread("images/test3.jpeg")
image = scan(image)
cv2.imshow("warped",imResize(image))
cv2.waitKey(0)
cv2.destroyAllWindows()

gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
#ret,th = cv2.threshold(gray,190,255,cv2.THRESH_BINARY)

#th = cv2.threshold(gray, 0, 255, cv2.THRESH_BINARY_INV | cv2.THRESH_OTSU)[1]
th = cv2.adaptiveThreshold(gray,255,cv2.ADAPTIVE_THRESH_GAUSSIAN_C, cv2.THRESH_BINARY,11,2)
#th = cv2.adaptiveThreshold(gray,255,cv2.ADAPTIVE_THRESH_MEAN_C, cv2.THRESH_BINARY,11,2)
th = ~th
cv2.imshow("Thresholded",imResize(th))
cv2.waitKey(0)
cv2.destroyAllWindows()

cl = cv2.morphologyEx(th, cv2.MORPH_CLOSE, cv2.getStructuringElement(cv2.MORPH_ELLIPSE,(5,5)))
cv2.imshow("imclose applied",imResize(cl))
cv2.waitKey(0)
cv2.destroyAllWindows()

contour,dummy = cv2.findContours(cl,cv2.RETR_CCOMP,cv2.CHAIN_APPROX_SIMPLE)
largeCnts = []
for c in contour:
	(x, y, w, h) = cv2.boundingRect(c)
	#print x,y,w,h
	ar = w / float(h)
	largeCnts.append(c)
	#if (w >= width/5.0 or h >= height/7.07) and (ar >= 0.2 and ar<=5.0):
		#largeCnts.append(c)

#sort largest regions from top to bottom
largeCnts = sorted(largeCnts, key=cv2.contourArea, reverse=True)
largeCnts = largeCnts[:5]

color = (0, 255, 0)
for cc in largeCnts:
	cv2.drawContours(image, [cc], -1, color, 3)
	(x, y, w, h) = cv2.boundingRect(cc)
cv2.imshow("Regions", imResize(image))
cv2.waitKey(0)
cv2.destroyAllWindows()

(x, y, w, h) = cv2.boundingRect(largeCnts[0])
test = image[y:y+h, x:x+w]

g = cv2.cvtColor(test, cv2.COLOR_BGR2GRAY)
#cv2.imshow("Original", image)
#cv2.imshow("Gray", gray)
bw = cv2.adaptiveThreshold(g,255,cv2.ADAPTIVE_THRESH_GAUSSIAN_C, cv2.THRESH_BINARY,11,2)
#bw = cv2.adaptiveThreshold(gray,255,cv2.ADAPTIVE_THRESH_MEAN_C, cv2.THRESH_BINARY,11,2)
#ret,bw = cv2.threshold(g,190,255,cv2.THRESH_BINARY)
bw=~bw
cv2.imshow("Regions", imResize(bw))
cv2.waitKey(0)
cv2.destroyAllWindows()

#Apply imopen
op = cv2.morphologyEx(bw, cv2.MORPH_OPEN, cv2.getStructuringElement(cv2.MORPH_CROSS,(9,9)))
# find contours in the thresholded image, then initialize
# the list of contours that correspond to questions
cnts = cv2.findContours(op.copy(), cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
cnts = cnts[0] if imutils.is_cv2() else cnts[1]
questionCnts = []

'''
# loop over the contours
for c in cnts:
	# compute the bounding box of the contour, then use the
	# bounding box to derive the aspect ratio
	(x, y, w, h) = cv2.boundingRect(c)
	ar = w / float(h)
	#print w,h,ar

	# in order to label the contour as a question, region
	# should be sufficiently wide, sufficiently tall, and
	# have an aspect ratio approximately equal to 1[+-0.5]
	if w >= 20 and h >= 20 and ar >= 0.7 and ar <= 1.5:
		questionCnts.append(c)
'''
