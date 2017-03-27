def readNameAndGrade(image, largeCnts, DEBUG = 0):
	import cv2
	from findCircles import findCircles
	from findLetters import findLetters
	from showBlobs import showBlobs
	from findChoices import findChoices
	from grade import grade
	from utils import imResize
	
	if DEBUG == 1:
		for l in largeCnts:
			(x, y, w, h) = cv2.boundingRect(l)
			ar = w / float(h)
			print w,h,ar

	#crop as images
	(x1, y1, w1, h1) = cv2.boundingRect(largeCnts[1])
	maxH1 = image[y1:y1+h1, x1:x1+w1]
	(x2, y2, w2, h2) = cv2.boundingRect(largeCnts[2])
	maxH2 = image[y2:y2+h2, x2:x2+w2]
	(x3, y3, w3, h3) = cv2.boundingRect(largeCnts[0])
	maxW = image[y3:y3+h3, x3:x3+w3]

	if DEBUG == 1:
		#show cropped images
		color = (0, 255, 0)
		for cc in largeCnts:
			cv2.drawContours(image, [cc], -1, color, 3)
			(x, y, w, h) = cv2.boundingRect(cc)
			temp = image[y:y+h, x:x+w]
			cv2.imshow("Cropped",temp)
			cv2.waitKey(0)
	
	#newIm = imResize(image,3)
	#cv2.imshow("Fig", newIm)
	#cv2.waitKey(0)

	#find circles and recognize letters for name
	cntsName = findCircles(maxH1)
	text1 = findLetters(h1, cntsName)
	print text1
	if DEBUG == 1:
		showBlobs(maxH1, cntsName)

	#find circles and recognize letters for surname
	cntsSurname = findCircles(maxH2)
	text2 = findLetters(h2, cntsSurname)
	print text2
	if DEBUG == 1:
		showBlobs(maxH2, cntsSurname)

	#find circles and grade test
	cnts2 = findCircles(maxW)
	if DEBUG == 1:
		showBlobs(maxW, cnts2)
	choices = findChoices(cnts2, w3, h3)
	grade(choices)
