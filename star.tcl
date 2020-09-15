set ns [new Simulator]
set nr [open a2.tr w]
$ns trace-all $nr
set nf [open a2.nam w]
$ns namtrace-all $nf
proc finish {} {
global ns nr nf
$ns flush-trace
close $nr
close $nf
exec nam a2.nam &
exit 0
}
set n0 [$ns node]
$n0 color Blue ;# sets color of node
$n0 shape square ;# sets shape of node
$n0 label switch ;# sets label on node
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]

$ns duplex-link $n0 $n1 5Mb 20ms DropTail
$ns duplex-link $n0 $n2 5Mb 20ms DropTail
$ns duplex-link $n0 $n3 5Mb 20ms DropTail
$ns duplex-link $n0 $n4 5Mb 20ms DropTail

$ns duplex-link-op $n0 $n1 orient down
$ns duplex-link-op $n0 $n2 orient right
$ns duplex-link-op $n0 $n3 orient up
$ns duplex-link-op $n0 $n4 orient left

set tcp01 [new Agent/TCP]
$ns attach-agent $n0 $tcp01

set tcp02 [new Agent/TCP]
$ns attach-agent $n0 $tcp02

set tcp03 [new Agent/TCP]
$ns attach-agent $n0 $tcp03

set tcp04 [new Agent/TCP]
$ns attach-agent $n0 $tcp04


set tcp1 [new Agent/TCP]
$ns attach-agent $n1 $tcp1

set tcp2 [new Agent/TCP]
$ns attach-agent $n2 $tcp2

set tcp3 [new Agent/TCP]
$ns attach-agent $n3 $tcp3

set tcp4 [new Agent/TCP]
$ns attach-agent $n4 $tcp4


set ftp1 [new Application/FTP]
$ftp1 set packetSize_ 500
$ftp1 set interval_ 0.005
$ftp1 attach-agent $tcp1
set sink1 [new Agent/TCPSink]
$ns attach-agent $n0 $sink1
$ns connect $tcp1 $sink1

set ftp2 [new Application/FTP]
$ftp2 set packetSize_ 500
$ftp2 set interval_ 0.005
$ftp2 attach-agent $tcp2
set sink2 [new Agent/TCPSink]
$ns attach-agent $n0 $sink2
$ns connect $tcp2 $sink2

set ftp3 [new Application/FTP]
$ftp3 set packetSize_ 500
$ftp3 set interval_ 0.005
$ftp3 attach-agent $tcp3
set sink3 [new Agent/TCPSink]
$ns attach-agent $n0 $sink3
$ns connect $tcp3 $sink3

set ftp4 [new Application/FTP]
$ftp4 set packetSize_ 500
$ftp4 set interval_ 0.005
$ftp4 attach-agent $tcp4
set sink4 [new Agent/TCPSink]
$ns attach-agent $n0 $sink4
$ns connect $tcp4 $sink4

set ftp01 [new Application/FTP]
$ftp01 set packetSize_ 500
$ftp01 set interval_ 0.005
$ftp01 attach-agent $tcp01
set sink10 [new Agent/TCPSink]
$ns attach-agent $n1 $sink10
$ns connect $tcp01 $sink10

set ftp02 [new Application/FTP]
$ftp02 set packetSize_ 500
$ftp02 set interval_ 0.005
$ftp02 attach-agent $tcp02
set sink20 [new Agent/TCPSink]
$ns attach-agent $n2 $sink20
$ns connect $tcp02 $sink20

set ftp03 [new Application/FTP]
$ftp03 set packetSize_ 500
$ftp03 set interval_ 0.005
$ftp03 attach-agent $tcp03
set sink30 [new Agent/TCPSink]
$ns attach-agent $n3 $sink30
$ns connect $tcp03 $sink30

set ftp04 [new Application/FTP]
$ftp04 set packetSize_ 500
$ftp04 set interval_ 0.005
$ftp04 attach-agent $tcp04
set sink40 [new Agent/TCPSink]
$ns attach-agent $n4 $sink40
$ns connect $tcp04 $sink40


$tcp1 set fid_ 3
$ns color 3 Red
$tcp2 set fid_ 4
$ns color 4 Red
$tcp3 set fid_ 5
$ns color 5 Red
$tcp4 set fid_ 6
$ns color 6 Red

$ns at 0.1 "$ftp1 start"
$ns at 1.0 "$ftp1 stop"
$ns at 0.2 "$ftp02 start"
$ns at 1.2 "$ftp02 stop"

$ns at 1.5 "$ftp2 start"
$ns at 2.5 "$ftp2 stop"
$ns at 1.6 "$ftp01 start"
$ns at 2.6 "$ftp01 stop"

$ns at 2.8 "$ftp3 start"
$ns at 3.8 "$ftp3 stop"
$ns at 2.9 "$ftp04 start"
$ns at 3.9 "$ftp04 stop"

$ns at 4.1 "$ftp4 start"
$ns at 5.1 "$ftp4 stop"
$ns at 4.2 "$ftp01 start"
$ns at 5.2 "$ftp01 stop"

$ns at 5.5 "finish"
$ns run

