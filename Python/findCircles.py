def findCircles(img):
	import numpy as np
	import argparse
	import imutils
	import cv2
	gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
	#cv2.imshow("Original", image)
	#cv2.imshow("Gray", gray)
	#bw = cv2.adaptiveThreshold(gray,255,cv2.ADAPTIVE_THRESH_GAUSSIAN_C, cv2.THRESH_BINARY,11,2)
	#bw = cv2.adaptiveThreshold(gray,255,cv2.ADAPTIVE_THRESH_MEAN_C, cv2.THRESH_BINARY,11,2)
	ret,bw = cv2.threshold(gray,190,255,cv2.THRESH_BINARY)
	bw=~bw
	#Apply imopen
	op = cv2.morphologyEx(bw, cv2.MORPH_OPEN, cv2.getStructuringElement(cv2.MORPH_CROSS,(9,9)))
	# find contours in the thresholded image, then initialize
	# the list of contours that correspond to questions
	cnts = cv2.findContours(op.copy(), cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
	cnts = cnts[0] if imutils.is_cv2() else cnts[1]
	questionCnts = []

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
	return questionCnts
