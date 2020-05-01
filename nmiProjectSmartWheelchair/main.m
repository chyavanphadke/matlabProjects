clc

url = "https://iotfirebase-bdfd4.firebaseio.com/.json";
data = webread(url);
xAngVelocity = data.SmartWheelchair.xAngVelocity;
yAngVelocity = data.SmartWheelchair.yAngVelocity;
zAngVelocity = data.SmartWheelchair.zAngVelocity;
