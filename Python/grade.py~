def grade(choices):
	answers = {}
	f = open('answerKey.txt', 'r')
	index = 1
	for line in f:
		line = line.strip('\n')
		answers[index] = line
		index = index + 1

	correct = 0
	wrong = 0
	for i in range(1,106):
		if len(choices[i]) > 1:
			wrong = wrong + 1
		else:
			if choices[i] == answers[i]:
				correct = correct + 1
			else:
				wrong = wrong + 1		

	#print wrong, correct
	print "Grade = " , (correct - wrong/4)*100/105, "%"
