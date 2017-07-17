#! /usr/bin/env lua
if arg[1] then io.input(arg[1]) end
CLUSTER_HOSTS=12 
dofile("stats.lua")
WATT_STOP_CLOCK=3600 --1 hour
lc=0
start_time=0
last_time=nil
watts_all=0
watts_only_hosts_with_containers=0

for l in io.lines() do
	lc=lc+1
	local t = {}
	local sep = ' '
	for v in l:gmatch('[^'..sep..']+') do
	  t[#t+1] = tonumber(v)
	end	
	--take the last cluster_hosts values out as they are the number of containers
	--running in the host in teh same position, and do not take into account energy 
	--consumptions if the host is not executing containers
	--convoluted code to basically extract a subarray from another array, sometimes I wish Lua came with batteries...
	local containers_per_host={}
	for i=2,CLUSTER_HOSTS+1 do
		containers_per_host[#containers_per_host+1] = table.remove(t,2)		
	end
	local ts = table.remove(t,1) --take out the timestamp, leave only the power values, 
	
	if lc==1 then
		start_time=ts
	end
	
	assert(#t,containers_per_host, "Not same number of entries") --safety check	
	--now check if there are hosts that at this time are not running containers
	if (ts-start_time)<WATT_STOP_CLOCK then
		for k,v in pairs(t) do
			watts_all=watts_all+v
		end
	end
    local to_remove={}
	for k,v in pairs(containers_per_host) do
		if v==0 then table.insert(to_remove,k) end
	end
	table.sort(to_remove,function(a,b) return a<b end)
	for k,v in pairs(to_remove) do
		table.remove(t,v)
	end
	if (ts-start_time)<WATT_STOP_CLOCK then	
		for k,v in pairs(t) do
			watts_only_hosts_with_containers=watts_only_hosts_with_containers+v
		end
	end
	local percentiles = table.concat(percentiles({1,25,50,75,99},t)," ")
	print(ts, percentiles)	
	last_time=ts
end

print("mWatts (all):", watts_all)
print("mWatts (run):", watts_only_hosts_with_containers)
print("Diff:", watts_all - watts_only_hosts_with_containers)
Watts=  watts_only_hosts_with_containers/1000
Watts_all= watts_all/1000
print("Watts: ", Watts)
print("Watts_all:", Watts_all)
dur=WATT_STOP_CLOCK --last_time-start_time
print("Duration:",dur)
print("Joules:",Watts*dur)
print("Joules_all:",Watts_all*dur)