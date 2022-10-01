import cv2 

img = cv2.imread('images/face.jpg')
face_classifier = cv2.CascadeClassifier('haarcascades/haarcascade_frontalface_default.xml')
faces = face_classifier.detectMultiScale(img,1.2,4)

def make_face_blur(img,faces_coord):
    for (x, y, w, h) in faces_coord:
        # To make a face blurred
        ROI = img[y:y+h, x:x+w]
        blur = cv2.GaussianBlur(ROI, (91,91),0) 
        # Insert ROI back into image
        img[y:y+h, x:x+w] = blur
        # To make a bounding box #*(Not Necessary)
        cv2.rectangle(img,(x,y),(x+w,y+h),(0,255,0),4)


make_face_blur(img,faces)
# pring the image shape 
print('Image Shape: ',img.shape)
cv2.imwrite('images/face_blur.jpg',img)
# cv2.imshow('Face Blur',img)
# cv2.waitKey(0)
# cv2.destroyAllWindows()