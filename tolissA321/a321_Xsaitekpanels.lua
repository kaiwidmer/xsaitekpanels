 --[[
*****************************************************************************************
*
* 	Author Name			:	Widmer Kai
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
hdg_push_cmd = find_command("AirbusFBW/PushHDGSel")
hdg_pull_cmd = find_command("AirbusFBW/PullHDGSel")
hdg_managed = find_dataref("AirbusFBW/HDGmanaged")

alt_managed = find_dataref("AirbusFBW/ALTmanaged")
alt_pull_cmd = find_command("AirbusFBW/PullAltitude")
alt_push_cmd = find_command("AirbusFBW/PushAltitude")

spd_pull_cmd = find_command("AirbusFBW/PullSPDSel")
spd_push_cmd = find_command("AirbusFBW/PushSPDSel")
spd_managed = find_dataref("AirbusFBW/SPDmanaged")

function heading_push_handler(phase, duration)
	if phase == 0 then
		if hdg_managed == 1 then
			hdg_pull_cmd:once()
		else
			hdg_push_cmd:once()
		end
	end
end

function alt_push_handler(phase, duration)
	if phase == 0 then
		if alt_managed == 1 then
			alt_pull_cmd:once()
		else 
			alt_push_cmd:once()
		end
	end
end

function ias_push_handler(phase, duration)
	if phase == 0 then
		if spd_managed == 1 then
			spd_pull_cmd:once()
		else 
			spd_push_cmd:once()
		end
	end
end

create_command("sim/custom/a321/xsaitekpanels/heading_push","heading_push", heading_push_handler)

create_command("sim/custom/a321/xsaitekpanels/alt_push", "alt_push", alt_push_handler)

create_command("sim/custom/a321/xsaitekpanels/ias_push", "ias_push", ias_push_handler)


--*************************************************************************************--
--** 				                 SYSTEM FUNCTIONS           	    			 **--
--*************************************************************************************--


--*************************************************************************************--
--** 				               XLUA EVENT CALLBACKS       	        			 **--
--*************************************************************************************--

--function aircraft_load() end

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