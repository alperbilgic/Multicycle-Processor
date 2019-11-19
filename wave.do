onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /test_fourthData/rst
add wave -noupdate /test_fourthData/reset
add wave -noupdate /test_fourthData/clk
add wave -noupdate /test_fourthData/RegWrite
add wave -noupdate /test_fourthData/LRWrite
add wave -noupdate /test_fourthData/MemWrite
add wave -noupdate /test_fourthData/IRWrite
add wave -noupdate /test_fourthData/ALUSrcA
add wave -noupdate /test_fourthData/FlagUp
add wave -noupdate /test_fourthData/PC_Sel
add wave -noupdate /test_fourthData/AdrSrc
add wave -noupdate /test_fourthData/ALUControl
add wave -noupdate /test_fourthData/ALUSrcB
add wave -noupdate /test_fourthData/ImmSrc
add wave -noupdate /test_fourthData/PCWrite
add wave -noupdate /test_fourthData/RegSrc
add wave -noupdate /test_fourthData/ResultSrc
add wave -noupdate /test_fourthData/ShftDcd
add wave -noupdate /test_fourthData/PCWr
add wave -noupdate /test_fourthData/Z
add wave -noupdate /test_fourthData/N
add wave -noupdate /test_fourthData/C_out
add wave -noupdate /test_fourthData/OVF
add wave -noupdate /test_fourthData/flags
add wave -noupdate -radix hexadecimal /test_fourthData/instructi
add wave -noupdate /test_fourthData/PCout
add wave -noupdate /test_fourthData/RD1
add wave -noupdate /test_fourthData/RD2
add wave -noupdate /test_fourthData/WD
add wave -noupdate /test_fourthData/ALU
add wave -noupdate -radix hexadecimal /test_fourthData/ram_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {296 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {31 ps} {346 ps}
