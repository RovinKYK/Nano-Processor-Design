# Nano Processor with VHDL in Vivado

![Nano Processor](Image.jpg)

## Overview

This repository contains the VHDL code for a Nano Processor implemented in Vivado. The processor includes multiplexers, adders, address decoders, instruction decoders, and various other components. It is capable of decoding basic machine language programs and executing them. 

## MicroProcessor Operation Instructions

### Mapping

- **Reset Button** - U18
- **LED Signals**:
  - Register 7 - U16, E19, U19, V19
  - Zero - P1
  - Overflow - L1
- **7-Segment Display** - W4

### Behavior

After powering up, the board should display the digits 0, 3, 5, 6 in-order on both the 7-segment display and LEDs.

The final result of the program (6) should be displayed at the end, which is the sum of all integers between 1 and 3.

It is normal to observe the zero and overflow indicators light up during operation.

If the reset button is pressed for at least one slow clock cycle, the program restarts.

## Sample Machine Learning Code

[Provide a brief description of the sample machine learning code included in the repository.]

## Getting Started

[Include instructions on how to set up and run the Nano Processor on your hardware.]

## Contributing

[Explain how others can contribute to this project, if applicable.]

## License

[Specify the license under which the project is distributed.]

## Acknowledgements

[Give credit to any resources, libraries, or individuals who contributed to this project.]

---

Feel free to customize and expand upon this template to provide comprehensive information about your Nano Processor project. Add specific details about your VHDL implementation, any special setup instructions, and any other relevant information. Good luck with your project!
