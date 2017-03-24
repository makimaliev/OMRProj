def createLetterObjs():
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
	startPointY = 110;
	for i in letters:
		endY = startPointY+40
		temp = Letter(i, startPointY, endY)
		startPointY = endY + 10
		letterObj.append(temp)

	return letterObj
