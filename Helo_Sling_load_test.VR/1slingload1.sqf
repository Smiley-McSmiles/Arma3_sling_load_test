//1slingload1.sqf;
//VARIABLE PASSAGE;
params[ 
    [ "_player", player, [ objNull ] ], 
	[ "_slingLoadhelo", objNull, [ objNull ] ], 
    [ "_slingLoadGroup", grpNull, [ grpNull ] ], 
    [ "_trashLoc", objNull, [ objNull ] ], 
    [ "_slingLoadHeloRTB", objNull, [ objNull ] ], 
    [ "_vehicleSupplyLoc", objNull, [ objNull ] ], 
    [ "_supplyLoc", objNull, [ objNull ] ], 
    [ "_cargoNetLoc", objNull, [ objNull ] ], 
    [ "_technicalLoc", objNull, [ objNull ] ], 
    [ "_truckLoc", objNull, [ objNull ] ], 
    [ "_repairLoc", objNull, [ objNull ] ]
];

//variable define for schedule task
_myVariables =  [_player,_slingLoadhelo,_slingLoadGroup,_trashLoc,_slingLoadHeloRTB,_vehicleSupplyLoc,_supplyLoc,_cargoNetLoc,_technicalLoc,_truckLoc,_repairLoc];

//start action menu
_activate = false;

slingloadmain = _player addAction 
[
    "SUPPORTS", 
    {
	_activate = false;
	params ["_target","_caller","_actionID","_myPassedVariables"];
	_myPassedVariables params ["_player","_slingLoadhelo","_slingLoadGroup","_trashLoc","_slingLoadHeloRTB","_vehicleSupplyLoc","_supplyLoc","_cargoNetLoc","_technicalLoc","_truckLoc","_repairLoc"];
	
//Begin sub-menu;
		//Back action;
		slingloadback = _player addAction [
			"...BACK", 
				{
				params ["_target","_caller","_actionID","_myPassedVariables"];
				_myPassedVariables params ["_player","_slingLoadhelo","_slingLoadGroup","_trashLoc","_slingLoadHeloRTB","_vehicleSupplyLoc","_supplyLoc","_cargoNetLoc","_technicalLoc","_truckLoc","_repairLoc"];
				_player removeaction vehiclesupplyaction;
				_player removeaction supplyaction;
				_player removeaction cargonetaction;
				_player removeaction technicalaction;
				_player removeaction truckaction;
				_player removeaction repairaction;
				_player removeaction slingloadback;
				nul = [_player,_slingLoadhelo,_slingLoadGroup,_trashLoc,_slingLoadHeloRTB,_vehicleSupplyLoc,_supplyLoc,_cargoNetLoc,_technicalLoc,_truckLoc,_repairLoc] execVM "1slingload1.sqf";
				},
			_myPassedVariables,
			10, 
			false, 
			true, 
			"",
			"true",
			3,
			false,
			"",
			""
		];

		//vehicle supply sling load;
		vehiclesupplyaction = _player addAction [
		"REQUEST VEHICLE REARM", 
		{
			params ["_target","_caller","_actionID","_myPassedVariables"];
			_myPassedVariables params ["_player","_slingLoadhelo","_slingLoadGroup","_trashLoc","_slingLoadHeloRTB","_vehicleSupplyLoc","_supplyLoc","_cargoNetLoc","_technicalLoc","_truckLoc","_repairLoc"];
			deleteWaypoint [_slingLoadGroup, 0];
			deleteWaypoint [_slingLoadGroup, 1];
			deleteWaypoint [_slingLoadGroup, 2];
			deleteWaypoint [_slingLoadGroup, 3];
			_slingLoadGroup setCurrentWaypoint [_slingLoadGroup, 0];
			{_x hideObjectGlobal false;_x enableSimulationGlobal true;} foreach units _slingLoadGroup;
			_slingLoadhelo hideObjectGlobal false;
			_slingLoadHelo enableSimulationGlobal true;
			unhookwaypoint = _slingLoadGroup addWaypoint [position _trashLoc, 0,0];
			unhookwaypoint setWaypointType "UNHOOK";
			vehiclesupplyget = _slingLoadGroup addWaypoint [position _vehicleSupplyLoc, 0,1];
			vehiclesupplyget setWaypointType "HOOK";
			vehiclesupplydrop = _slingLoadGroup addWaypoint [position _player, 0,2];
			vehiclesupplydrop setWaypointType "UNHOOK";
			vehiclesupplyrtb = _slingLoadGroup addWaypoint [position _slingLoadHeloRTB, 0,3];
			vehiclesupplyrtb setWaypointType "TR UNLOAD";
			systemChat "(RADIO) : Roger that, vehicle rearm box on the way.";
		},
			_myPassedVariables,
			10, 
			false, 
			true, 
			"",
			"true",
			3,
			false,
			"",
			""
		];

	//supplies sling load;
	supplyaction = _player addAction [
		"REQUEST SUPPLY BOX", 
		{
			params ["_target","_caller","_actionID","_myPassedVariables"];
			_myPassedVariables params ["_player","_slingLoadhelo","_slingLoadGroup","_trashLoc","_slingLoadHeloRTB","_vehicleSupplyLoc","_supplyLoc","_cargoNetLoc","_technicalLoc","_truckLoc","_repairLoc"];
			deleteWaypoint [_slingLoadGroup, 0];
			deleteWaypoint [_slingLoadGroup, 1];
			deleteWaypoint [_slingLoadGroup, 2];
			deleteWaypoint [_slingLoadGroup, 3];
			_slingLoadGroup setCurrentWaypoint [_slingLoadGroup, 0];
			{_x hideObjectGlobal false;_x enableSimulationGlobal true;} foreach units _slingLoadGroup;
			_slingLoadhelo hideObjectGlobal false;
			_slingLoadHelo enableSimulationGlobal true;
			unhookwaypoint = _slingLoadGroup addWaypoint [position _trashLoc, 0,0];
			unhookwaypoint setWaypointType "UNHOOK";
			supplyget = _slingLoadGroup addWaypoint [position _supplyLoc, 0,1];
			supplyget setWaypointType "HOOK";
			supplydrop = _slingLoadGroup addWaypoint [position _player, 0,2];
			supplydrop setWaypointType "UNHOOK";
			supplyrtb = _slingLoadGroup addWaypoint [position _slingLoadHeloRTB, 0,3];
			supplyrtb setWaypointType "TR UNLOAD";
			systemChat "(RADIO) : Roger that, general supply box on the way.";
			},
			_myPassedVariables,
			10, 
			false, 
			true, 
			"",
			"true",
			3,
			false,
			"",
			""
		];

	//weapon cargo net sling load;
	cargonetaction = _player addAction [
		"REQUEST ARSENAL BOX", 
		{
			params ["_target","_caller","_actionID","_myPassedVariables"];
			_myPassedVariables params ["_player","_slingLoadhelo","_slingLoadGroup","_trashLoc","_slingLoadHeloRTB","_vehicleSupplyLoc","_supplyLoc","_cargoNetLoc","_technicalLoc","_truckLoc","_repairLoc"];
			deleteWaypoint [_slingLoadGroup, 0];
			deleteWaypoint [_slingLoadGroup, 1];
			deleteWaypoint [_slingLoadGroup, 2];
			deleteWaypoint [_slingLoadGroup, 3];
			_slingLoadGroup setCurrentWaypoint [_slingLoadGroup, 0];
			{_x hideObjectGlobal false;_x enableSimulationGlobal true;} foreach units _slingLoadGroup;
			_slingLoadhelo hideObjectGlobal false;
			_slingLoadHelo enableSimulationGlobal true;
			unhookwaypoint = _slingLoadGroup addWaypoint [position _trashLoc, 0,0];
			unhookwaypoint setWaypointType "UNHOOK";
			cargonetget = _slingLoadGroup addWaypoint [position _cargoNetLoc, 0,1];
			cargonetget setWaypointType "HOOK";
			cargonetdrop = _slingLoadGroup addWaypoint [position _player, 0,2];
			cargonetdrop setWaypointType "UNHOOK";
			cargonetrtb = _slingLoadGroup addWaypoint [position _slingLoadHeloRTB, 0,3];
			cargonetrtb setWaypointType "TR UNLOAD";
			systemChat "(RADIO) : Roger that, infantry arsenal box on the way.";
			},
			_myPassedVariables,
			10, 
			false, 
			true, 
			"",
			"true",
			3,
			false,
			"",
			""
		];

	//technical sling load;
	technicalaction = _player addAction [
		"REQUEST OFFROAD HMG", 
		{
			params ["_target","_caller","_actionID","_myPassedVariables"];
			_myPassedVariables params ["_player","_slingLoadhelo","_slingLoadGroup","_trashLoc","_slingLoadHeloRTB","_vehicleSupplyLoc","_supplyLoc","_cargoNetLoc","_technicalLoc","_truckLoc","_repairLoc"];
			deleteWaypoint [_slingLoadGroup, 0];
			deleteWaypoint [_slingLoadGroup, 1];
			deleteWaypoint [_slingLoadGroup, 2];
			deleteWaypoint [_slingLoadGroup, 3];
			_slingLoadGroup setCurrentWaypoint [_slingLoadGroup, 0];
			{_x hideObjectGlobal false;_x enableSimulationGlobal true;} foreach units _slingLoadGroup;
			_slingLoadhelo hideObjectGlobal false;
			_slingLoadHelo enableSimulationGlobal true;
			unhookwaypoint = _slingLoadGroup addWaypoint [position _trashLoc, 0,0];
			unhookwaypoint setWaypointType "UNHOOK";
			technicalget = _slingLoadGroup addWaypoint [position _technicalLoc, 0,1];
			technicalget setWaypointType "HOOK";
			technicaldrop = _slingLoadGroup addWaypoint [position _player, 0,2];
			technicaldrop setWaypointType "UNHOOK";
			technicalrtb = _slingLoadGroup addWaypoint [position _slingLoadHeloRTB, 0,3];
			technicalrtb setWaypointType "TR UNLOAD";
			systemChat "(RADIO) : Roger that, HMG Offroad on the way.";
			},
			_myPassedVariables,
			10, 
			false, 
			true, 
			"",
			"true",
			3,
			false,
			"",
			""
		];

	//truck sling load;
	truckaction = _player addAction [
		"REQUEST OFFROAD", 
		{
			params ["_target","_caller","_actionID","_myPassedVariables"];
			_myPassedVariables params ["_player","_slingLoadhelo","_slingLoadGroup","_trashLoc","_slingLoadHeloRTB","_vehicleSupplyLoc","_supplyLoc","_cargoNetLoc","_technicalLoc","_truckLoc","_repairLoc"];
			deleteWaypoint [_slingLoadGroup, 0];
			deleteWaypoint [_slingLoadGroup, 1];
			deleteWaypoint [_slingLoadGroup, 2];
			deleteWaypoint [_slingLoadGroup, 3];
			_slingLoadGroup setCurrentWaypoint [_slingLoadGroup, 0];
			{_x hideObjectGlobal false;_x enableSimulationGlobal true;} foreach units _slingLoadGroup;
			_slingLoadhelo hideObjectGlobal false;
			_slingLoadHelo enableSimulationGlobal true;
			unhookwaypoint = _slingLoadGroup addWaypoint [position _trashLoc, 0,0];
			unhookwaypoint setWaypointType "UNHOOK";
			truckget = _slingLoadGroup addWaypoint [position _truckLoc, 0,1];
			truckget setWaypointType "HOOK";
			truckdrop = _slingLoadGroup addWaypoint [position _player, 0,2];
			truckdrop setWaypointType "UNHOOK";
			truckrtb = _slingLoadGroup addWaypoint [position _slingLoadHeloRTB, 0,3];
			truckrtb setWaypointType "TR UNLOAD";
			systemChat "(RADIO) : Roger that, Offroad on the way.";
			},
			_myPassedVariables,
			10, 
			false, 
			true, 
			"",
			"true",
			3,
			false,
			"",
			""
		];

	//repair sling load;
	repairaction = _player addAction [
		"REQUEST REPAIR OFFROAD", 
		{
			params ["_target","_caller","_actionID","_myPassedVariables"];
			_myPassedVariables params ["_player","_slingLoadhelo","_slingLoadGroup","_trashLoc","_slingLoadHeloRTB","_vehicleSupplyLoc","_supplyLoc","_cargoNetLoc","_technicalLoc","_truckLoc","_repairLoc"];
			deleteWaypoint [_slingLoadGroup, 0];
			deleteWaypoint [_slingLoadGroup, 1];
			deleteWaypoint [_slingLoadGroup, 2];
			deleteWaypoint [_slingLoadGroup, 3];
			_slingLoadGroup setCurrentWaypoint [_slingLoadGroup, 0];
			{_x hideObjectGlobal false;_x enableSimulationGlobal true;} foreach units _slingLoadGroup;
			_slingLoadhelo hideObjectGlobal false;
			_slingLoadHelo enableSimulationGlobal true;
			unhookwaypoint = _slingLoadGroup addWaypoint [position _trashLoc, 0,0];
			unhookwaypoint setWaypointType "UNHOOK";
			repairget = _slingLoadGroup addWaypoint [position _repairLoc, 0,1];
			repairget setWaypointType "HOOK";
			repairdrop = _slingLoadGroup addWaypoint [position _player, 0,2];
			repairdrop setWaypointType "UNHOOK";
			repairrtb = _slingLoadGroup addWaypoint [position _slingLoadHeloRTB, 0,3];
			repairrtb setWaypointType "TR UNLOAD";
			systemChat "(RADIO) : Roger that, Repair Offroad on the way.";
			},
			_myPassedVariables,
			10, 
			false, 
			true, 
			"",
			"true",
			3,
			false,
			"",
			""
		];

	_player removeaction slingloadmain;
	},
	_myVariables,
	10, 
    false, 
    true, 
    "",
    "true",
    3,
    false,
    "",
    ""
];


