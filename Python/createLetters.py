def createLetterObjs(imH):
	import string

	class Letter:
		def __init__(self, letter, sY, eY):
			self.letter = letter
			self.startPointY = sY
			self.endPointY = eY

	letterObj = []
	letters = list(string.ascii_uppercase)
	letters.remove('Q')
	letters.remove('W')
	letters.remove('X')
	#startPointY = 110;
	startPointY = imH/11.5;
	bubleH = imH/31.5
	bubleMargin = imH/125.7
	for i in letters:
		endY = startPointY+bubleH
		temp = Letter(i, startPointY, endY)
		startPointY = endY + bubleMargin
		letterObj.append(temp)

	return letterObj
