global key
InitKeyboard();
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
            pause(1);
            brick.StopMotor('A');
        case 'leftarrow'
            brick.MoveMotor('B',50);
            pause(1);
            brick.StopMotor('B');
        case 'q'
            brick.StopAllMotors();
            break;
        case 0
            disp("Press key to control");
    end
end
CloseKeyboard();
    
    

        

