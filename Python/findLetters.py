def findLetters(imH, cnts):
	from imutils import contours
	import cv2
	from createLetters import createLetterObjs
	letters = createLetterObjs(imH)
	cnts = contours.sort_contours(cnts, method="left-to-right")[0]
	text = ""
	for c in cnts:
		(x, y, w, h) = cv2.boundingRect(c)
		pointY = y+h/2
		for l in letters:
			if pointY >= l.startPointY - 2 and pointY <= l.endPointY + 2:
				text = text  + l.letter
				break
	return text
