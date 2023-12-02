set_property SRC_FILE_INFO {cfile:c:/Users/alise/Desktop/VIVADO/PROJECTS/NEXYS_ESP/NEXYS_ESP.srcs/sources_1/bd/design_1/ip/design_1_clk_wiz_1_0/design_1_clk_wiz_1_0/design_1_clk_wiz_1_0_in_context.xdc rfile:../../../NEXYS_ESP.srcs/sources_1/bd/design_1/ip/design_1_clk_wiz_1_0/design_1_clk_wiz_1_0/design_1_clk_wiz_1_0_in_context.xdc id:1 order:EARLY scoped_inst:design_1_i/clk_wiz_1} [current_design]
set_property SRC_FILE_INFO {cfile:c:/Users/alise/Desktop/VIVADO/PROJECTS/NEXYS_ESP/NEXYS_ESP.srcs/sources_1/bd/design_1/ip/design_1_mdm_1_0/design_1_mdm_1_0/design_1_mdm_1_0_in_context.xdc rfile:../../../NEXYS_ESP.srcs/sources_1/bd/design_1/ip/design_1_mdm_1_0/design_1_mdm_1_0/design_1_mdm_1_0_in_context.xdc id:2 order:EARLY scoped_inst:design_1_i/mdm_1} [current_design]
set_property SRC_FILE_INFO {cfile:c:/Users/alise/Desktop/VIVADO/PROJECTS/NEXYS_ESP/NEXYS_ESP.srcs/sources_1/bd/design_1/ip/design_1_dlmb_bram_if_cntlr_0/design_1_dlmb_bram_if_cntlr_0/design_1_dlmb_bram_if_cntlr_0_in_context.xdc rfile:../../../NEXYS_ESP.srcs/sources_1/bd/design_1/ip/design_1_dlmb_bram_if_cntlr_0/design_1_dlmb_bram_if_cntlr_0/design_1_dlmb_bram_if_cntlr_0_in_context.xdc id:3 order:EARLY scoped_inst:design_1_i/microblaze_0_local_memory/dlmb_bram_if_cntlr} [current_design]
set_property SRC_FILE_INFO {cfile:c:/Users/alise/Desktop/VIVADO/PROJECTS/NEXYS_ESP/NEXYS_ESP.srcs/sources_1/bd/design_1/ip/design_1_ilmb_bram_if_cntlr_0/design_1_ilmb_bram_if_cntlr_0/design_1_dlmb_bram_if_cntlr_0_in_context.xdc rfile:../../../NEXYS_ESP.srcs/sources_1/bd/design_1/ip/design_1_ilmb_bram_if_cntlr_0/design_1_ilmb_bram_if_cntlr_0/design_1_dlmb_bram_if_cntlr_0_in_context.xdc id:4 order:EARLY scoped_inst:design_1_i/microblaze_0_local_memory/ilmb_bram_if_cntlr} [current_design]
set_property SRC_FILE_INFO {cfile:c:/Users/alise/Desktop/VIVADO/PROJECTS/NEXYS_ESP/NEXYS_ESP.srcs/sources_1/bd/design_1/ip/design_1_mig_7series_0_0/design_1_mig_7series_0_0/design_1_mig_7series_0_0_in_context.xdc rfile:../../../NEXYS_ESP.srcs/sources_1/bd/design_1/ip/design_1_mig_7series_0_0/design_1_mig_7series_0_0/design_1_mig_7series_0_0_in_context.xdc id:5 order:EARLY scoped_inst:design_1_i/mig_7series_0} [current_design]
set_property SRC_FILE_INFO {cfile:C:/Users/alise/Desktop/VIVADO/PROJECTS/NEXYS_ESP/NEXYS_ESP.srcs/constrs_1/new/cns.xdc rfile:../../../NEXYS_ESP.srcs/constrs_1/new/cns.xdc id:6} [current_design]
current_instance design_1_i/clk_wiz_1
set_property src_info {type:SCOPED_XDC file:1 line:1 export:INPUT save:INPUT read:READ} [current_design]
create_clock -period 10.000 [get_ports -no_traverse {}]
set_property src_info {type:SCOPED_XDC file:1 line:4 export:INPUT save:INPUT read:READ} [current_design]
create_generated_clock -source [get_ports clk_in1] -edges {1 2 3} -edge_shift {0.000 0.000 0.000} [get_ports {}]
current_instance
current_instance design_1_i/mdm_1
set_property src_info {type:SCOPED_XDC file:2 line:2 export:INPUT save:INPUT read:READ} [current_design]
create_clock -period 33.333 [get_ports {}]
set_property src_info {type:SCOPED_XDC file:2 line:4 export:INPUT save:INPUT read:READ} [current_design]
create_clock -period 33.333 [get_ports {}]
current_instance
current_instance design_1_i/microblaze_0_local_memory/dlmb_bram_if_cntlr
set_property src_info {type:SCOPED_XDC file:3 line:2 export:INPUT save:INPUT read:READ} [current_design]
create_clock -period 10.000 [get_ports {}]
current_instance
current_instance design_1_i/microblaze_0_local_memory/ilmb_bram_if_cntlr
set_property src_info {type:SCOPED_XDC file:4 line:2 export:INPUT save:INPUT read:READ} [current_design]
create_clock -period 10.000 [get_ports {}]
current_instance
current_instance design_1_i/mig_7series_0
set_property src_info {type:SCOPED_XDC file:5 line:2 export:INPUT save:INPUT read:READ} [current_design]
create_clock -period 10.549 [get_ports {}]
set_property src_info {type:SCOPED_XDC file:5 line:4 export:INPUT save:INPUT read:READ} [current_design]
create_clock -period 12.308 [get_ports {}]
set_property src_info {type:SCOPED_XDC file:5 line:6 export:INPUT save:INPUT read:READ} [current_design]
create_clock -period 12.308 [get_ports {}]
set_property src_info {type:SCOPED_XDC file:5 line:8 export:INPUT save:INPUT read:READ} [current_design]
create_clock -period 12.308 [get_ports {}]
set_property src_info {type:SCOPED_XDC file:5 line:10 export:INPUT save:INPUT read:READ} [current_design]
create_clock -period 12.308 [get_ports {}]
set_property src_info {type:SCOPED_XDC file:5 line:12 export:INPUT save:INPUT read:READ} [current_design]
create_clock -period 12.308 [get_ports {}]
current_instance
set_property src_info {type:XDC file:6 line:1 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN C17 [get_ports uart_rtl_rxd]
set_property src_info {type:XDC file:6 line:2 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN D18 [get_ports uart_rtl_txd]
