import cv2
from findCircles import findCircles
from findLetters import findLetters
from showBlobs import showBlobs
from findChoices import findChoices
from grade import grade

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
grade(choices)
