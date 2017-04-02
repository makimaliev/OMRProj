from findMainRegions import findMainRegions
from readNameAndGrade import readNameAndGrade
import cv2
from scan import scan
from utils import imResize

image = cv2.imread("images/testMarked.jpg")
#image = scan(image)
largeCnts = findMainRegions(image,1)

if len(largeCnts) != 5:
	print "Something went wrong!!!"
else:
	readNameAndGrade(image, largeCnts,1)
