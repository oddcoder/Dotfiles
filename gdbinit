#python from ~/projects/shadow/gdb_driver.py import *
python from libheap import *
source ~/.gdbinit-gef.py
#source ~/.peda/peda.py
gef config context.ignore_registers "$cs $ss $ds $es $fs $gs"
gef config context.show_registers_raw False
set disassembly-flavor intel
set pagination off
set confirm off
set breakpoint pending on
add-auto-load-safe-path /home/oddcoder/projects/gecko-dev/.gdbinit
