#!/bin/bash
COUNTER=1
while(true) do
./umbrella.sh
curl "https://api.telegram.org/bot1846248575:AAESnYnWZC2cnhMGL9ammmUqL5BoeLoXTm4/sendmessage" -F "chat_id=-1001446901020" -F "text=ربات ایس (2) با موفقیت لانچ و اجرا گردید⚙️-${COUNTER}-بار"
let COUNTER=COUNTER+1 
done