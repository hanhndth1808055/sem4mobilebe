import cv2
import sys
import time
import requests
from datetime import datetime
cascPath = "/home/pi/opencv/data/haarcascades/haarcascade_frontalface_default.xml"
# cascPath = "D:\setup\opencv\opencv\sources\data\haarcascades\haarcascade_frontalface_default.xml"

faceCascade = cv2.CascadeClassifier(cascPath)

video_capture = cv2.VideoCapture(0)
img_counter = 0

while True:
    nowObj = datetime.now()
    seconds = nowObj.strftime("%S")[1]
#     print(seconds)

    # Capture frame-by-frame
    ret, frame = video_capture.read()

    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

    if seconds == "5" or seconds == "0":
        faces = faceCascade.detectMultiScale(
            gray,
            scaleFactor=1.1,
            minNeighbors=5,
            minSize=(30, 30),
            flags=cv2.CASCADE_SCALE_IMAGE
        )
    
#     time.sleep(5)
    # Draw a rectangle around the faces
        for (x, y, w, h) in faces:
            cv2.rectangle(frame, (x, y), (x+w, y+h), (0, 255, 0), 2)
        if len(faces) > 0:
            dateTimeObj = datetime.now()
            timestampStr = dateTimeObj.strftime("%Y%H%M%S")
            img_name = "opencv_frame_{}.png".format(timestampStr)
            cv2.imwrite(img_name, frame)
            print(img_name+" written!")
            
            url = 'http://localhost:3333/face-recognize'
            myobj = {'group': 'car1',
                     'image': img_name}

            x = requests.post(url, data = myobj)

            print(x.text)
            img_counter+=1
    # Display the resulting frame
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break
    cv2.imshow('Video', frame)

# When everything is done, release the capture
video_capture.release()
cv2.destroyAllWindows()
