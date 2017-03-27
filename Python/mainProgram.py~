from findMainRegions import findMainRegions
from readNameAndGrade import readNameAndGrade
import cv2
from scan import scan

image = cv2.imread("images/testMarked.jpg")
#image = scan(image)

largeCnts = findMainRegions(image)

if len(largeCnts) != 5:
	print "Something went wrong!!!"
else:
	readNameAndGrade(image, largeCnts)
