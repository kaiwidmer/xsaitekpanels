 --[[
*****************************************************************************************
* Program Script Name	:	A330JD.opencockpitscdu
*
* Author Name			:	Widmer 1.0.0
*
*   Revisions:
*   -- DATE --	--- REV NO ---		--- DESCRIPTION ---
*   
*
*
*
*
*****************************************************************************************
--]]



--*************************************************************************************--
--** 					              XLUA GLOBALS              				     **--
--*************************************************************************************--


--*************************************************************************************--
--** 				              FIND CUSTOM DATAREFS             			    	 **--
--*************************************************************************************--

-- buttons
hdg_push_bat = find_dataref("sim/custom/xap/fcu/hdg_push_bat")
hdg_pull_bat = find_dataref("sim/custom/xap/fcu/hdg_pull_bat")
hdg_displayed = find_dataref("sim/cockpit/autopilot/heading_mag")

alt_mode = find_dataref("sim/custom/xap/fcu/100_1000")
alt_hundred = find_dataref("sim/custom/xap/fcu/alt100x")
alt_thousend = find_dataref("sim/custom/xap/fcu/alt1000x")
alt_pull_bat = find_dataref("sim/custom/xap/fcu/alt_pull_bat")
alt_displayed = find_dataref("bgood/xsaitekpanels/sharedata/float1")

vertical_speed_pull_bat = find_dataref("sim/custom/xap/fcu/vvi_pull_bat")

spd_pull_bat = find_dataref("sim/custom/xap/fcu/spd_pull_bat")
spd_push_bat = find_dataref("sim/custom/xap/fcu/spd_push_bat")
spd_managed = find_dataref("sim/custom/xap/ap/spdmanaged")

function heading_push_handler(phase, duration)
	if phase == 0 then
		hdg_push_bat = 1
	end
end
function heading_up_handler(phase, duration)
	if phase == 0 then
		hdg_displayed = math.floor(hdg_displayed + 1)
	end
end
function heading_down_handler(phase, duration)
	if phase == 0 then
		hdg_displayed = math.floor(hdg_displayed - 1)
	end
end

function nav_push_handler(phase, duration)
	if phase == 0 then
		hdg_pull_bat = 1
	end
end

function alt_up_handler(phase, duration)
	if phase == 0 then
		if alt_mode == 1 then
			alt_thousend = alt_thousend + 1
		else 
			alt_hundred = alt_hundred + 1
		end
		alt_displayed = alt_hundred * 100
	end
end
function alt_down_handler(phase, duration)
	if phase == 0 then
		if alt_mode == 1 then
			alt_thousend = alt_thousend - 1
		else 
			alt_hundred = alt_hundred - 1
		end
		alt_displayed = alt_hundred * 100
	end
end
function alt_push_handler(phase, duration)
	if phase == 0 then
		alt_pull_bat = 1
	end
end

function vs_push_handler(phase, duration)
	if phase == 0 then
		vertical_speed_pull_bat = 1
	end
end

function ias_push_handler(phase, duration)
	if phase == 0 then
		if spd_managed == 1 then
			spd_pull_bat = 1
		else 
			spd_push_bat = 1
		end
	end
end

create_command("sim/custom/a330/xsaitekpanels/heading_push","heading_push", heading_push_handler)
create_command("sim/custom/a330/xsaitekpanels/heading_up", "heading_up", heading_up_handler)
create_command("sim/custom/a330/xsaitekpanels/heading_down", "heading_down", heading_down_handler)

create_command("sim/custom/a330/xsaitekpanels/nav_push","nav_push", nav_push_handler)

create_command("sim/custom/a330/xsaitekpanels/alt_up","alt_up", alt_up_handler)
create_command("sim/custom/a330/xsaitekpanels/alt_down", "alt_down", alt_down_handler)
create_command("sim/custom/a330/xsaitekpanels/alt_push", "alt_push", alt_push_handler)

create_command("sim/custom/a330/xsaitekpanels/vs_push", "vs_push", vs_push_handler)

create_command("sim/custom/a330/xsaitekpanels/ias_push", "ias_push", ias_push_handler)


--*************************************************************************************--
--** 				                 SYSTEM FUNCTIONS           	    			 **--
--*************************************************************************************--


--*************************************************************************************--
--** 				               XLUA EVENT CALLBACKS       	        			 **--
--*************************************************************************************--

function aircraft_load()
	alt_displayed = alt_hundred * 100
end

--function aircraft_unload() end

--function flight_start()

--end

--function flight_crash() end

--function before_physics() end

--function after_physics()

--end

--function after_replay() end




--*************************************************************************************--
--** 				               SUB-MODULE PROCESSING       	        			 **--
--*************************************************************************************--

-- dofile("")