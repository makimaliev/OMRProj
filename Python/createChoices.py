def createChoiceObjs():

	class Choice:
		def __init__(self):
			self.number = 0
			self.startPointX = 0
			self.startPointY = 0
			self.endPointX = 0
			self.endPointY = 0

	choiceObjs = []
	numbers = list(range(1,106))
	startX = 56
	startY = 59

	currentX = startX
	currentY = startY

	count = 0

	for i in numbers:
		obj = Choice()
		obj.number = i
		obj.startPointX = currentX
		obj.startPointY = currentY
		currentY = currentY+40
		obj.endPointX = currentX + 240
		obj.endPointY = currentY
		choiceObjs.append(obj)
		currentY = currentY+9.85
		count = count + 1
		if count == 15:
			currentY = startY
			currentX = currentX + 300
			count = 0;

	return choiceObjs
