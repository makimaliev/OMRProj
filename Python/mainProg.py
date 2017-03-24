import cv2
from findCircles import findCircles
from findLetters import findLetters
from showBlobs import showBlobs
from findChoices import findChoices

image = cv2.imread("Name.jpg")
cnts = findCircles(image)
text = findLetters(cnts)
print text
showBlobs(image, cnts)

image1 = cv2.imread("Surname.jpg")
cnts1 = findCircles(image1)
text1 = findLetters(cnts1)
print text1
showBlobs(image1, cnts1)

image2 = cv2.imread("answers.jpg")
cnts2 = findCircles(image2)
showBlobs(image2, cnts2)
choices = findChoices(cnts2)

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




