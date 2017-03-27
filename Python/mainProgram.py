from findMainRegions import findMainRegions
from readNameAndGrade import readNameAndGrade
import cv2

image = cv2.imread("testMarked.jpg")
largeCnts = findMainRegions(image)
if len(largeCnts) != 5:
	print "Something went wrong!!!"
else:
	readNameAndGrade(image, largeCnts)
