local database = 'http://vip.opload.ir/vipdl/94/11/amirhmz/'
local function run(msg)
	local res = http.request(database.."joke.db")
	local joke = res:split(",")
	return joke[math.random(#joke)]
end
--Joke Plugin v1.0 By @source_hut
return {
	description = "500 Persian Joke",
	usage = "!joke : send random joke",
	patterns = {
		"^[/!]joke$",
		"^(joke)$"
		},
	run = run
}