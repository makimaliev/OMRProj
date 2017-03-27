def findMainRegions(image, DEBUG = 0):
	import cv2
	from utils import sort_contours

	#read image and find height, width
	height, width = image.shape[:2]

	if DEBUG == 1: 
		print height, width
		print "Ratio = ", width/float(height) 

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

	#find largest regions
	largeCnts = []
	for c in contour:
		(x, y, w, h) = cv2.boundingRect(c)
		ar = w / float(h)
		if DEBUG == 1:
			print w,h,ar
		if (w >= width/5.0 or h >= height/7.07) and (ar >= 0.2 and ar<=5.0):
			largeCnts.append(c)
	
	#sort largest regions from top to bottom
	(largeCnts, boundingBoxes) = sort_contours(largeCnts, "top-to-bottom")

	return largeCnts
