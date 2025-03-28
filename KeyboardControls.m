global key
% the ultrasonic should be port 1, and the color sensor should be 4, the
% algorithm should hug the closest left wall, and traverse the whole thing
% that way. Requires ultrasonic sensor to be facing left and the touch
% sensor extended with a stick facing forward
InitKeyboard();
brick.SetColorMode(4,2);
function traverse(obj)
    while 1
        colorCheck();
        


        

        
    end
end
function colorCheck(obj)
    if brick.ColorCode(4) == 4 || brick.ColorCode(2) == 2 || brick.ColorCode(4) == 3
        manualMode();
    end
    if brick.ColorCode(4) == 5
        brick.StopAllMotors();
        pause(1);
    end
end
function manualMode(obj)
    while 1
        pause(.1);
        switch key
            case 'uparrow'
                 brick.MoveMotor('A', 50);
                 brick.MoveMotor('B', 50);
                 pause(1);
                 brick.StopAllMotors();
            case 'downarrow'
                brick.MoveMotor('A',-50);
                brick.MoveMotor('B',-50);
                pause(1);
                brick.StopAllMotors();
            case 'rightarrow'
                brick.MoveMotor('A',50);
                pause(.1);
                brick.StopMotor('A');
            case 'leftarrow'
                brick.MoveMotor('B',50);
                pause(.1);
                brick.StopMotor('B');
            case 'q'
                brick.StopAllMotors();
                break;
            case 0
                disp("Press key to control");
        end
    end
    CloseKeyboard();
    traverse();
end
function distance = getDist(obj)
    distance = brick.UltrasonicDist(1);
end


    
    

        
