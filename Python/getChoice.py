def getChoice(x, imW):
	out = ''
	startX = imW/37.66
	bubleW = imW/52.72
	bubleMargin = imW/210.9
	xMargin = imW/35.15

	endX = startX + bubleW
	for i in range(1,8):
		 if x >= startX - 2 and x <= endX + 2:
		     out = 'A'
		     break
		 startX = endX + bubleMargin
		 endX = startX + bubleW
		 if x >= startX - 2 and x <= endX + 2:
		     out = 'B'
		     break
		 startX = endX + bubleMargin
		 endX = startX + bubleW
		 if x >= startX - 2 and x <= endX + 2:
		     out = 'C'
		     break
		 startX = endX + bubleMargin
		 endX = startX + bubleW
		 if x >= startX - 2 and x <= endX + 2:
		     out = 'D'
		     break
		 startX = endX + bubleMargin
		 endX = startX + bubleW
		 if x >= startX - 2  and x <= endX + 2:
		     out = 'E'
		     break
		 startX = endX + xMargin
		 endX = startX + bubleW
	return out
