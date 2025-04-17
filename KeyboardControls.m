global key;
InitKeyboard();
global USport;
USport = 1;
global colorPort;
colorPort = 4;
global touchPort;
touchPort = 3;
global turnIncrement;
turnIncrement = .7;

% the ultrasonic should be port 1, and the color sensor should be 4, the
% algorithm should hug the closest left wall, and traverse the whole thing
% that way. Requires ultrasonic sensor to be facing left and the touch
% sensor extended with a stick facing forward motor B turns left
brick.SetColorMode(colorPort,2);
while 1
    traverse(brick, touchPort,USport,colorPort,turnIncrement);
end
function traverse(brick, touchPort,USport,colorPort,turnIncrement)
    while 1
        pause(.1);
        try
            thing = getDist(brick, USport);
        catch
            thing = getDist(brick, USport);
        end
        colorCheck(brick,colorPort);
        if thing < 6
            brick.MoveMotor('AB',-20)
            pause(.8)
            brick.StopAllMotors()
            brick.MoveMotor('A',20)
            pause(.6)
            brick.StopAllMotors()
            brick.MoveMotor('A', 50);
            brick.MoveMotor('B', 50);
            pause(1);            
            brick.StopAllMotors();
        elseif brick.TouchPressed(2) && ~brick.TouchPressed(touchPort)
            brick.MoveMotor('AB',-20)
            pause(.8)
            brick.StopAllMotors()
            brick.MoveMotor('B',20)
            pause(1)
            brick.StopAllMotors()
            brick.MoveMotor('A', 30);
            brick.MoveMotor('B', 34);
            pause(1);            
            brick.StopAllMotors();
        elseif ~brick.TouchPressed(touchPort) && ~brick.TouchPressed(2) && thing < 70
            brick.MoveMotor('A', 50);
            brick.MoveMotor('B', 55);
        elseif (brick.TouchPressed(touchPort) || brick.TouchPressed(2))
            brick.StopAllMotors();
            brick.MoveMotor('A',-50);
            brick.MoveMotor('B',-50);
            pause(.6);
            brick.StopAllMotors()
            brick.MoveMotor('A',30);
            pause(1.72);
            brick.StopMotor('A');
            brick.MoveMotor('A', 50);
            brick.MoveMotor('B', 55);
            pause(1.4);            
            brick.StopAllMotors();
          elseif thing > 70
            pause(.2)
            brick.StopAllMotors()
            brick.MoveMotor('B',30);
            pause(2.1);
            brick.StopMotor('B');
            brick.MoveMotor('A',50);
            brick.MoveMotor('B',55);
            pause(1.2);
            brick.StopAllMotors()
        end
    end
end
function colorCheck(brick,colorPort)
    code = brick.ColorCode(colorPort);
    if code == 4 || code == 2 || code == 3
        manualMode(brick);
        brick.beep(1);
        brick.beep(1);
    end
    if code == 5
        brick.StopAllMotors();
        pause(2);
    end
    clear code;
end
function manualMode(brick)
brick.StopAllMotors();
global key;
InitKeyboard();
    while 1
        pause(.1);
        switch key
            case 'uparrow'
                brick.MoveMotor('A', 50);
                brick.MoveMotor('B', 50);
                pause(.4);
                brick.StopAllMotors();
            case 'downarrow'
                brick.MoveMotor('A',-50);
                brick.MoveMotor('B',-50);
                pause(.4);
                brick.StopAllMotors();
            case 'rightarrow'
                brick.MoveMotor('A',30);
                pause(.1);
                brick.StopMotor('A');
            case 'leftarrow'
                brick.MoveMotor('B',30);
                pause(.1);
                brick.StopMotor('B');
            case 'q'
                brick.StopAllMotors();
                CloseKeyboard();
                brick.MoveMotor('A', 50);
                brick.MoveMotor('B', 50);
                pause(1);
                brick.StopAllMotors();
                break;
            case 'u'
                brick.MoveMotorAngleRel('C', 8, 20, 'Brake');
                brick.WaitForMotor('C'); % Wait for motor to complete motion
            case 'd'
                brick.MoveMotorAngleRel('C', 8, -20, 'Brake');
                brick.WaitForMotor('C'); % Wait for motor to complete motion
            case 0
                disp("Press key to control");
        end
    end
end
function distance = getDist(brick, USport)
    distance = brick.UltrasonicDist(USport);
end


    
    

        
