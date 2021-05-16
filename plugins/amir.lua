-- @source_hut
function run(msg, matches)
	if matches[1]:lower() == 'ping' then
		tdcli.sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, 'data/bot.mp4', msg_caption, dl_cb, nil)
	end
	if matches[1]:lower() == 'پینگ' then
		tdcli.sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, 'data/bot.mp4', msg_caption, dl_cb, nil)
	end
	if matches[1]:lower() == 'amir' then
		tdcli.sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, 'data/sa.mp4', msg_caption, dl_cb, nil)
	end
	return
end
--------------------------------
return {
patterns = {
"^([Pp][Ii][Nn][][Gg])$",
"^(پینگ)$",
"^([Aa][Mm][Ii][Rr])$",
},
run = run,
}
--channel: @source_hut
