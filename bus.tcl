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
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]
set n5 [$ns node]
set n6 [$ns node]
set n7 [$ns node]
set n8 [$ns node]
set n9 [$ns node]
set n10 [$ns node]

$ns duplex-link $n0 $n5 5Mb 20ms DropTail
$ns duplex-link $n1 $n6 5Mb 20ms DropTail
$ns duplex-link $n2 $n7 5Mb 20ms DropTail
$ns duplex-link $n3 $n8 5Mb 20ms DropTail
$ns duplex-link $n4 $n9 5Mb 20ms DropTail
$ns duplex-link $n5 $n6 0.5Mb 100ms DropTail
$ns duplex-link $n6 $n7 0.5Mb 100ms DropTail
$ns duplex-link $n7 $n8 0.5Mb 100ms DropTail
$ns duplex-link $n8 $n9 0.5Mb 100ms DropTail
$ns duplex-link $n9 $n10 0.5Mb 100ms DropTail

$ns duplex-link-op $n0 $n5 orient down
$ns duplex-link-op $n1 $n6 orient down
$ns duplex-link-op $n2 $n7 orient down
$ns duplex-link-op $n3 $n8 orient down
$ns duplex-link-op $n4 $n9 orient down
$ns duplex-link-op $n5 $n6 orient right
$ns duplex-link-op $n6 $n7 orient right
$ns duplex-link-op $n7 $n8 orient right
$ns duplex-link-op $n8 $n9 orient right
$ns duplex-link-op $n9 $n10 orient right

set tcp0 [new Agent/TCP]
$ns attach-agent $n0 $tcp0
set ftp1 [new Application/FTP]
$ftp1 set packetSize_ 500
$ftp1 set interval_ 0.005
$ftp1 attach-agent $tcp0
set sink1 [new Agent/TCPSink]
$ns attach-agent $n10 $sink1
$ns connect $tcp0 $sink1

set tcp1 [new Agent/TCP]
$ns attach-agent $n1 $tcp1
set ftp2 [new Application/FTP]
$ftp2 set packetSize_ 500
$ftp2 set interval_ 0.005
$ftp2 attach-agent $tcp1
set sink2 [new Agent/TCPSink]
$ns attach-agent $n10 $sink2
$ns connect $tcp1 $sink2

set tcp2 [new Agent/TCP]
$ns attach-agent $n2 $tcp2
set ftp3 [new Application/FTP]
$ftp3 set packetSize_ 500
$ftp3 set interval_ 0.005
$ftp3 attach-agent $tcp2
set sink3 [new Agent/TCPSink]
$ns attach-agent $n10 $sink3
$ns connect $tcp2 $sink3

set tcp3 [new Agent/TCP]
$ns attach-agent $n3 $tcp3
set ftp4 [new Application/FTP]
$ftp4 set packetSize_ 500
$ftp4 set interval_ 0.005
$ftp4 attach-agent $tcp3
set sink4 [new Agent/TCPSink]
$ns attach-agent $n10 $sink4
$ns connect $tcp3 $sink4

set tcp4 [new Agent/TCP]
$ns attach-agent $n4 $tcp4
set ftp5 [new Application/FTP]
$ftp5 set packetSize_ 500
$ftp5 set interval_ 0.005
$ftp5 attach-agent $tcp4
set sink5 [new Agent/TCPSink]
$ns attach-agent $n10 $sink5
$ns connect $tcp4 $sink5
$tcp0 set fid_ 2
$ns color 2 Red
$tcp1 set fid_ 3
$ns color 3 Blue
$tcp2 set fid_ 4
$ns color 4 Green
$tcp3 set fid_ 5
$ns color 5 Black
$tcp4 set fid_ 6
$ns color 6 Violet

$ns at 0.2 "$ftp1 start"
$ns at 4.5 "$ftp1 stop"
$ns at 0.2 "$ftp2 start"
$ns at 4.5 "$ftp2 stop"
$ns at 0.2 "$ftp3 start"
$ns at 4.5 "$ftp3 stop"
$ns at 0.2 "$ftp4 start"
$ns at 4.5 "$ftp4 stop"
$ns at 0.2 "$ftp5 start"
$ns at 4.5 "$ftp5 stop"
$ns at 5.0 "finish"
$ns run
