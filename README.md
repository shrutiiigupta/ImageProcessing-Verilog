# ImageProcessing-Verilog

General Image operations on a Grayscale Image using Verilog

The design module is able to perform following operations on a grayscale image :- 
 1. Increase Brightness
 2. Decrease Brightness
 3. Image Thresholding
 4. Image inversion

**The Working process of the code is as follows:-**

- The "main.py" file is used to create a .txt file which contains pixel values of an image in 8-bit binary format.<br />
- The obtained text file is then passed into the simulation source file of verilog i.e. "Desssign1.v".<br />
- The simulation source returns a text file with the processed image in similar format as the input file.<br />
- Then "jpg_to_txt.py" file is used to create .jpg file from the text file obtained after simulation.<br />


The amount of brightness to be increased or decreased and the threshold value of pixel can be changed in the testbench which is included in the verilog design file: "Desssign1.v".<br />
The operation to be carried can also be changed by changing the variable "select" in testbench acc. to the following description :- <br />
2’b00           Increase Brightness <br />
2’b01           Decrease Brightness <br />
2’b10           Image Thresholding <br />
2’b11           Image Inversion <br />
