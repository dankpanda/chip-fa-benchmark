# chip-fa-benchmark
A ROM created specifically to benchmark the Chip-Fa emulator. This benchmark aims to ensure the emulator functions properly by performing a screen check, button tests and audio test.

Installation and instructions on how to run this ROM can be found over at https://github.com/raveltan/chip-fa

## Graphics
Sprites are drawn in the emulator by storing them as fonts in a hexadecimal format. These fonts are then loaded into a 16 bit register 'I' using the opcode ANNN where NNN is the address of the font. Once loaded, sprites can be displayed through the opcode DXYN where X and Y represents the location of the sprite and N denotes the height of the sprite.

![image](https://user-images.githubusercontent.com/33013694/115140461-a5de1900-a061-11eb-8381-a44e87a6dd81.png)

## Screen test
In the benchmark screen test, a checkerboard pattern sprite is loaded into register I prior to issuing the display command. During the drawing process, a loop is used to check whether the current X position is equivalent to the border of the screen or not. If it is at the border of the screen, the Y value is incremented and the X value is set back to 0, else the X value is incremented. When the Y value and X value is equal to the border of the screen, this means that the whole checkerboard pattern has been drawn across the whole screen and the second part of the screen test will begin whereby it reverses the checkerboard pattern before moving on to the button test.

![image](https://user-images.githubusercontent.com/33013694/115140472-af678100-a061-11eb-8fcc-d751671c4161.png)

## Button test
In the benchmark button test, a desired button input will firstly be stored in a register. Next, the program will wait for that specific button to be pressed by the user. This is done by checking whether the input button pressed is equal to the previously assigned register through the opcode EX9E where X denotes the register number. A sprite is drawn on the screen to inform the user what button the ROM is currently expecting.

![image](https://user-images.githubusercontent.com/33013694/115140496-c73f0500-a061-11eb-88e4-9845748ca399.png)

## Audio test
In the benchmark audio test, a value is stored into a register to act as a delay before using the audio delay timer through the opcode FX18 where X denotes the register number. When the delay reaches 0, an audio will be played in the form of a short beep.

![image](https://user-images.githubusercontent.com/33013694/115140507-dc1b9880-a061-11eb-9242-8c8cfe93c2a1.png)
