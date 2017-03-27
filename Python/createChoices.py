def createChoiceObjs(imW, imH):

	class Choice:
		def __init__(self):
			self.number = 0
			self.startPointX = 0
			self.startPointY = 0
			self.endPointX = 0
			self.endPointY = 0

	choiceObjs = []
	numbers = list(range(1,106))
	startX = imW/37.66
	startY = imH/14.38
	bubleH = imH/21.22
	bubleMargin = imH/86.19
	widthX = imW/8.78
	widhtXFull = imW/7.03

	currentX = startX
	currentY = startY

	count = 0

	for i in numbers:
		obj = Choice()
		obj.number = i
		obj.startPointX = currentX
		obj.startPointY = currentY
		currentY = currentY+bubleH
		obj.endPointX = currentX + widthX
		obj.endPointY = currentY
		choiceObjs.append(obj)
		currentY = currentY+bubleMargin
		count = count + 1
		if count == 15:
			currentY = startY
			currentX = currentX + widhtXFull
			count = 0;

	return choiceObjs
