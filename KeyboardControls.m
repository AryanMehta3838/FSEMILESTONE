global key
InitKeyboard();
while 1
    pause(0.1);
    switch key
        case 'uparrow'
            moveForward(100,1);
        case 'downarrow'
            moveBackward(100,1);
        case 'rightarrow'
            turnRight();
        case 'leftarrow'
            turnLeft();
        case 'q'
            break;
        case 0
            disp("Press key to control");
    end
end
CloseKeyboard();

function move = moveForward(Speed, Time)
    brick.MoveMotor('A', Speed);
    brick.MoveMotor('B', Speed);
    pause(Time);
    Stop();
    move = 1;
end
function move = moveBackward(Speed,time)
    brick.MoveMotor('A',-1*Speed);
    brick.MoveMotor('B',-1*Speed);
    pause(time);
    Stop();
    move = 1;
end
function stop = Stop()
    brick.StopAllMotors();
    stop = 1;
end
function turn = turnRight()
    brick.MoveMotor('A',50);
    pause(0.1);
    brick.StopMotor('A');
    turn = 1;
end
function turn = turnLeft()
    brick.MoveMotor('B',50);
    pause(0.1);
    brick.StopMotor('B');
    turn = 1;
end

        
