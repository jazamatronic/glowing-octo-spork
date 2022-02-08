# Pmod I2S2 Arty A7-35

How to make the Digilent Pmod I2S2 Arty A7 35 example work with symbiflow.

Clone the Digilent [Pmod-I2S2 Repo](https://github.com/Digilent/Pmod-I2S2) and follow the directions found in the README.md.
Be sure to download and unzip the Vivado project from the release page as described in the docs.

- Make a directory to work in - this is where you will run symbiflow.
- Copy the XDC constraints found in arty-a7-35/src/constraints/Arty-A7-35-Master.xdc from the Pmod-I2S2 Repo to your work directory
    - Edit this file and simplify the create\_clock statement to "create_clock -period 10.00 [get_ports { clk }];"
- Copy shared/src/hdl/\*.v from the Pmod-I2S2 Repo to your work directory
- Copy vivado\_proj/Pmod-I2S2-Arty-A7-35.srcs/sources\_1/ip/clk\_wiz\_0/clk\_wiz\_0\_clk\_wiz.v from the Pmod-I2S2 Repo to your work directory
    - Edit clk\_wiz\_0\_clk\_wiz.v and rename the module to clk\_wiz\_0
- Copy and update the symbiflow Makefile to include all the .v files as sources and point to the .xdc file
- make and download following the standard symbiflow, err, flow.
