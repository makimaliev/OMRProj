def showBlobs(img, cnts):
	from utils import imResize
	import cv2
	color = (0, 255, 0)
	for c in (cnts):
		cv2.drawContours(img, [c], -1, color, 3)
	newIm = imResize(img)
	cv2.imshow("Blobs", newIm)
	cv2.waitKey(0)
	cv2.destroyAllWindows()
