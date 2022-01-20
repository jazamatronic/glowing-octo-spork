# How to program the XVA1 image to the Digilent Cmod A7 35T from Linux

The [XVA1](https://www.futur3soundz.com/) synthesizer is based on the Digilent [Cmod A7](https://digilent.com/shop/cmod-a7-breadboardable-artix-7-fpga-module/).
There are two steps to programming the FPGA.  The first step is to install a bitloader via jtag using the digilent tools.  
The second is to use the provided XLoad.exe to write the synthesizer image file to the Cmod's flash this will be done using wine.

The Cmod A7 includes an FTDI FT2232HQ USB-UART bridge. Using wine to run XLoad.exe requires FTD2XX.dll.so - instructions to build and install this are provided below.

1. Build the FTD2XX.dll for wine
    1. Get the [wineftd2xx](https://github.com/brentr/wineftd2xx) package from here
    2. Install some needed libs
        - install gcc-multilib
        - install libwine-dev:i386
        - other libs may be required
    3. Follow the instructions in the wineftd2xx repo to build and install 
        - Make sure the -m32 flag is used during to create the correct format

2. Plug in the Cmod A7 and use the digilent tools to install the bitloader
    1. Download the runtime and utilities packages for Linux from [here](https://digilent.com/reference/software/adept/start)
    2. Follow the instructions under the heading "Loading the Bit File" found [here](https://digilent.com/reference/test-and-measurement/analog-discovery-pro-3x50/programming-an-fpga)
    3. Specifically: djtgcfg enum, djtgcfg init -d \<DeviceName\> and djtgcfg prog -d \<DeviceName\> -i \<index\> -f \<FileName\>
        - CMOD\_A7\_Loader.bit is the FileName to use here

3. Use wine to run XLoad.exe
    1. First, remove the linux native ftdi drivers with "sudo rmmod ftdi\_sio usbserial"
    2. wineconsole --backend=curses XLoad.exe -img XVA1\_CMOD\_A7.bin
    3. Follow the rest of the instructions in the XVA1 installation guide

 
