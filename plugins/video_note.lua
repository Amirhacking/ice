# @source_hut
local function pre_process(msg)
 if msg.content_.ID == "MessageUnsupported" and redis:get("mute-video-not"..msg.to.id) then
 tdcli.deleteMessages(msg.chat_id_, {[0] = tonumber(msg.id_)} , dl_cb , nil) 
 end
end
local function run(msg, matches)
 if (matches[1] == "lock video-note" or matches[1] == "بیصدا سلفی") and not redis:get("mute-video-not"..msg.to.id) and is_mod(msg) then
  hash = "mute-video-not"..msg.to.id
  redis:set(hash , true)
  tdcli.sendMessage(msg.to.id,msg.id_ ,0, "بیصدا کردن فیلم سلفی فعال شد", 0, "md")
 elseif (matches[1] == "lock video-note" or matches[1] == "بیصدا سلفی") and redis:get("mute-video-not"..msg.to.id) and is_mod(msg) then
  tdcli.sendMessage(msg.to.id,msg.id_ ,0, "بیصدا کردن فیلم سلفی از قبل فعال بود", 0, "md")
 elseif matches[1] == "unlock video-note" or matches[1] == "باصدا سلفی" and not redis:get("mute-video-not"..msg.to.id) and is_mod(msg) then
  tdcli.sendMessage(msg.to.id,msg.id_ ,0, "بیصدا کردن فیلم سلفی از قبل فعال نبود", 0, "md")
 elseif matches[1] == "unlock video-note" or matches[1] == "باصدا سلفی" and redis:get("mute-video-not"..msg.to.id) and is_mod(msg) then
  redis:del("mute-video-not"..msg.to.id)
  tdcli.sendMessage(msg.to.id,msg.id_ ,0, "بیصدا کردن فیلم سلفی غیر فعال شد", 0, "md")
 end
end

return {
   patterns = {
      '^[/!#](lock vidoe-note)$',
      '^[/!#](unlock video-note)$',
	  '^(بیصدا سلفی)$',
	  '^(باصدا سلفی)$',
 },
  run = run,
  pre_process = pre_process
}