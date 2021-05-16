--- @source_hut
local function run(msg, matches)
	if matches[1]:lower() == 'پاکسازی ربات ها' then
  function clbot(arg, data)
    for k, v in pairs(data.members_) do
      kick_user(v.user_id_, msg.to.id)
	end
    tdcli.sendMessage(msg.to.id, msg.id, 1, '_تمامی ربات های گروه مسدود شده اند و گروه پاکسازی شد_', 1, 'md')
  end
  tdcli.getChannelMembers(msg.to.id, 0, 'Bots', 200, clbot, nil)
  end
end

return { 

patterns ={ 

  "^[!/#](cleanbot)$",
 "^(پاکسازی ربات ها)$",
 },
  run = run
}