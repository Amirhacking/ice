#!/bin/bash


memTotal_b=`free -b |grep Mem |awk '{print $2}'`
memFree_b=`free -b |grep Mem |awk '{print $4}'`
memBuffer_b=`free -b |grep Mem |awk '{print $6}'`
memCache_b=`free -b |grep Mem |awk '{print $7}'`

memTotal_m=`free -m |grep Mem |awk '{print $2}'`
memFree_m=`free -m |grep Mem |awk '{print $4}'`
memBuffer_m=`free -m |grep Mem |awk '{print $6}'`
memCache_m=`free -m |grep Mem |awk '{print $7}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
hdd=`df -lh | awk '{if ($6 == "/") { print $5 }}' | head -1 | cut -d'%' -f1`
uptime=`uptime`
ProcessCnt=`ps -A | wc -l`
memUsed_b=$(($memTotal_b-$memFree_b-$memBuffer_b-$memCache_b))
memUsed_m=$(($memTotal_m-$memFree_m-$memBuffer_m-$memCache_m))

memUsedPrc=$((($memUsed_b*100)/$memTotal_b))

echo "🔱 اطلاعات سرور ربات آمبرلا:"
echo "➖➖➖➖"
echo "✅ حجم رم: $memUsed_m MB (4GB) \n💠 $memUsedPrc% used !"
echo "➖➖"
echo '✅ زم مصرفی : '"$CPUPer"'%'
echo "➖➖"
echo '✅ درصد CPU مصرف شده : '"$hdd"'%'
echo "➖➖"
echo '✅ فرایند ها : '"$ProcessCnt"
echo "➖➖"
echo '✅ آپتایم : '"$uptime"
echo '✅ اتولانچ : '"فعال"
echo '✅  کداتولانچ : '"2569"
echo '✅ یوزر آیدی : '"$CPUPer"''
echo "➖➖➖➖"