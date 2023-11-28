connect -url tcp:127.0.0.1:3121
targets -set -filter {jtag_cable_name =~ "Digilent Nexys4DDR 210292A6EFB1A" && level==0 && jtag_device_ctx=="jsn-Nexys4DDR-210292A6EFB1A-13631093-0"}
fpga -file C:/Users/alise/Desktop/VIVADO/PROJECTS/NEXYS_ESP/PS/ESP_APP/_ide/bitstream/design_1_wrapper.bit
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
loadhw -hw C:/Users/alise/Desktop/VIVADO/PROJECTS/NEXYS_ESP/PS/design_1_wrapper/export/design_1_wrapper/hw/design_1_wrapper.xsa -regs
configparams mdm-detect-bscan-mask 2
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
rst -system
after 3000
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
dow C:/Users/alise/Desktop/VIVADO/PROJECTS/NEXYS_ESP/PS/ESP_APP/Debug/ESP_APP.elf
bpadd -addr &main
