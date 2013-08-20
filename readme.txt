This is a basic encryptor program built based on the JumpstartLab tutorial found at:
http://tutorials.jumpstartlab.com/projects/encryptor.html

It works based on a triple ROT encryption scheme. When you want to encode a message, you can supply three numbers between 1 and 91 to set the rotations. If you do not, the program will select three for you. You can also decode messages with a given set of rotations (if there is less than one in use, just set the second and third rotations to '0').

The default password is 'thundercats'. It is recommended that you change that when you first run the program by using the 'p' command.

** DIRECTIONS **

From the source directory run: bin/ruby encryptor
