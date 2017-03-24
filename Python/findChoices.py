def findChoices(cnts):
	from createChoices import createChoiceObjs
	from getChoice import getChoice
	import cv2
	from imutils import contours
	from findCircles import findCircles

	#image = cv2.imread("answers.jpg")
	#cnts = findCircles(image)

	choices = {}
	index = 1
	choiceObjs = createChoiceObjs()
	for c in cnts:
		(x, y, w, h) = cv2.boundingRect(c)
		centroidX = x+w/2
		centroidY = y+h/2
		for choice in choiceObjs:
			if centroidY >= choice.startPointY - 2 and centroidY <= choice.endPointY + 2 and centroidX >= choice.startPointX - 2 and centroidX <= choice.endPointX + 2:
				if not choice.number in choices:
					choices[choice.number] = getChoice(centroidX)
				else:
					#choices[choice.number].update(getChoice(centroidX))
					temp = choices[choice.number]
					new = [temp, getChoice(centroidX)]
					choices[choice.number] = new
				break
	for t in range(1,106):
		if not t in choices:
			choices[t] = ''
	#print choices
	return choices
