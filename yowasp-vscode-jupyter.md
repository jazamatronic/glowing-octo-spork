source oss-cad-suite/activate
then codium . in the working dir

TerosHDL prerequisites - in the oss-cad-suite venv:
./py3bin/pip3 install vunit-hdl edalize yowasp-yosys cocotb

for jupyter
source oss-cad-suite/activate to enter the venv
./py3bin/pip3 install jupyter ipykernel
./py3bin/python3 -m ipykernel install --user --name=oss-cad-suite
This seems broken due to some dependency problems with libzmq and the libc provided by oss-cad-suite


lets try yowasp

python3 -m venv --system-site-packages --prompt "yowasp" yowasp
cd yowasp/
source bin/activate
pip3 install vunit-hdl edalize yowasp-yosys cocotb yowasp-nextpnr-ice40
python3 -m ipykernel install --user --name=yowasp

There is also a yowasp-yosys extension, but I'm not sure how that handles jupyter/amaranth

amaranth:
pip3 install --user --upgrade amaranth
mv ~/.local/bin/amaranth-rpc $VIRTUAL_ENV/bin/

in vscodium:
install ms-python, jupyter, vaporview and TerosHDL extensions


