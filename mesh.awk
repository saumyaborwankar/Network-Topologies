BEGIN {
rec=0;
send=0;
send1=0;
send2=0;
send3=0;
send4=0;
s=0;
pr=0;
}
{
if($1=="+" && $5=="tcp" && $3==0)
send++;
if($1=="+" && $5=="tcp" && $3==1)
send1++;
if($1=="+" && $5=="tcp" && $3==2)
send2++;
if($1=="+" && $5=="tcp" && $3==3)
send3++;
if($1=="+" && $5=="tcp" && $3==4)
send4++;
s=send+send1+send2+send3+send4;
if($1=="r" && $5=="tcp" && $4==5)
rec++;
if($1=="r" && $4=="5" && $5=="tcp")
{
t=t+$6;
tr=t*8/$2/1000000;
}
}
END {
pr=rec/s;
printf("Number of packets send to node 5 = %d\n",s);
printf("Number of packets received at node 5 = %d\n",rec);
printf("Packet delivery ratio at node 5 is %f\n",pr);
printf("Throughput of tcp connection to node 5 = %f\n",tr);}
