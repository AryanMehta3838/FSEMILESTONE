global key
InitKeyboard();
while 1
    pause(0.1);
    switch key
        case 'uparrow'
            moveForward(100);
        case 'downarrow'
            moveBackward(100);
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

function move = moveForward(Speed)
    brick.MoveMotor('A', Speed);
    brick.MoveMotor('B', Speed);
    move = 1;
end
function move = moveBackward(Speed)
    brick.MoveMotor('A',-1*Speed);
    brick.MoveMotor('B',-1*Speed);
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

        
