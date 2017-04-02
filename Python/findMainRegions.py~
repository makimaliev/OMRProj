def findMainRegions(image, DEBUG = 0):
	import cv2
	from utils import imResize

	#read image and find height, width
	height, width = image.shape[:2]

	if DEBUG == 1: 
		print height, width
		print "Ratio = ", width/float(height) 

	#convert to grayscale
	gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
	#remove noise
	img = cv2.medianBlur(gray, 3)
	if DEBUG == 1:
		cv2.imshow("median blur applied",imResize(img))
		cv2.waitKey(0)
		cv2.destroyAllWindows()
	#detect edges
	edges = cv2.Canny(img,100,200)
	if DEBUG == 1:
		cv2.imshow("canny applied", imResize(edges))
		cv2.waitKey(0)
		cv2.destroyAllWindows()
	#apply imclose
	cl = cv2.morphologyEx(edges, cv2.MORPH_CLOSE, cv2.getStructuringElement(cv2.MORPH_ELLIPSE,(20,20)))
	if DEBUG == 1:
		cv2.imshow("imclose applied", imResize(cl))
		cv2.waitKey(0)
		cv2.destroyAllWindows()
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
	largeCnts = sorted(largeCnts, key=cv2.contourArea, reverse=True)

	return largeCnts
