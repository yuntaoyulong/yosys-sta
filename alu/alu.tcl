
read_verilog /home/aotianzhihuo/ysyx-workbench/npc-chisel/generated/ALU.v

hierarchy -check -top ALU


proc; opt; fsm; opt; memory; opt


techmap; opt


stat -width -tech cmos


write_verilog synth_alu.v


show -format pdf -prefix alu_synth