clc
close all
clear all


startProgram = 'True';

xt = 0;
yt = 0;
zt = 0;
xAngVal = 0;
yAngVal = 0;
zAngVal = 0;
startSpot = 0;
step = 0.00001 ; % lowering step has a number of cycles and then acquire more data

frontThershold = -5;
backThershold = 5;
leftThershold = 5;
rightThershold = -5;
printFlag = 0;
fprintf("\t\tWelcome to Smart Wheelchair\n\n")
fprintf("\t\tOpen app and click on START\n\n\n\n")

while (startProgram == 'True')
    url = "https://iotfirebase-bdfd4.firebaseio.com/.json";
    data = webread(url);
    xAngVelocity = str2double(data.SmartWheelchair.xAngVelocity);
    yAngVelocity = str2double(data.SmartWheelchair.yAngVelocity);
    zAngVelocity = str2double(data.SmartWheelchair.zAngVelocity);
    
    if (yAngVelocity < frontThershold)
        if(printFlag == 0)
            fprintf("Moving Front\n")
            printFlag = 1;
        end
    elseif (yAngVelocity > backThershold)
        if(printFlag == 0)
            fprintf("Moving Back\n")
            printFlag = 1;
        end
    elseif (xAngVelocity > leftThershold)
        if(printFlag == 0)
            fprintf("Turn Left\n")
            printFlag = 1;
        end
    elseif (xAngVelocity < rightThershold)
        if(printFlag == 0)
            fprintf("Turn Right\n")
            printFlag = 1;
        end
    else
        printFlag = 0;
    end
    
    if (xAngVelocity ~= 0)
        xAngVal = [ xAngVal, xAngVelocity ];
        subplot(3,1,1);
        plot(xAngVal);
        title('xAngVelocity')  
        if ((xt/step)-500 < 0)
            startSpot = 0;
        else
            startSpot = (xt/step)-500;
        end
        axis([ startSpot, (xt/step+10), -10 , 10 ]);
        grid
        xt = xt + step;
        drawnow;
        pause(0.01)

        yAngVal = [ yAngVal, yAngVelocity ];
        subplot(3,1,2);
        plot(yAngVal);
        title('yAngVelocity')  
        if ((yt/step)-500 < 0)
            startSpot = 0;
        else
            startSpot = (yt/step)-500;
        end
        axis([ startSpot, (yt/step+10), -10 , 10 ]);
        grid
        yt = yt + step;
        drawnow;
        pause(0.01)

        zAngVal = [ zAngVal, zAngVelocity ];
        subplot(3,1,3);
        plot(zAngVal);
        title('zAngVelocity')  
        if ((zt/step)-500 < 0)
            startSpot = 0;
        else
            startSpot = (zt/step)-500;
        end
        axis([ startSpot, (zt/step+10), -10 , 10 ]);
        grid
        zt = zt + step;
        drawnow;
        pause(0.01)
    end
end