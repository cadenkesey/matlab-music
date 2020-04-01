function[y]=panning(sound)
%Original algorithm by Vinay Kumar Tadepalli
%Reading a mono-audio input which is of type N X 1 (columns represent number of channels)

left_input = sound;
right_input=left_input;
% Dividing the sample length into uniform blocks of smaller size.
range=(length(left_input)/400):(length(left_input)/400):length(left_input);
pan=-1;  % Initialization of "pan" value.
i=1;
j=1;
while(i<=length(left_input)) 
    while(pan<1)
        while(i<=range(j))
            % Code to create panning effect.
            left_input(i)=left_input(i)-(pan*left_input(i));
            right_input(i)=right_input(i)+(pan*right_input(i));
            
            i=i+1;
        end
        j=j+1;
        
        % Changing the "pan" value in uniform steps.
        pan=pan+0.2;
    end
    while(pan>-1)
        while(i<=range(j))
            
            % Code to create panning effect.
            left_input(i)=left_input(i)-(pan*left_input(i));
            right_input(i)=right_input(i)+(pan*right_input(i));
            
            i=i+1;
        end
        j=j+1;
        
        % Changing the "pan" value in uniform steps.
        pan=pan-0.2;
    end
end
% Combining the left_input and right_input to make a stereo signal of type
% N X 2 matrix (2 channels)
final_out=[left_input; right_input];
clear left_input right_input;
% playing the stereo output to the PC audio speaker.
y = final_out;