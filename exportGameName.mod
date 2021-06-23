
 �
 576b8cd9316640b1b7a279cf441b64b6 f517bc8999ee44ad81995015f3829cdc0codeblock://08c39556-104f-424f-a7ea-dcdd1ebf21f4"x-mod/codeblock2��{
  "CoreVersion": {
    "Major": 0,
    "Minor": 2
  },
  "ScriptVersion": {
    "Major": 1,
    "Minor": 0
  },
  "Description": "",
  "Id": "08c39556-104f-424f-a7ea-dcdd1ebf21f4",
  "Language": 1,
  "Name": "StateBattleGoalRaiseEvent",
  "Type": 1,
  "Source": 0,
  "Target": null,
  "Properties": [],
  "Methods": [],
  "EventEmitters": [],
  "EventHandlers": [],
  "EntityEventHandlers": [
    {
      "Name": "HandleButtonClickEvent",
      "EventName": "ButtonClickEvent",
      "Target": "self",
      "Code": "-- Parameters\n--local Entity = event.Entity\n--------------------------------------------------------\nlocal entity = _EntityService:GetEntityByPath(\"/ui/UIBattleGoal\")\nentity.UIGroupComponent.DefaultShow = false\nentity.Enable = false\nentity.Visible = false"
    }
  ]
}8���ڻ��J e89317815b9742f4b6fe27abf25986e8�
 cd32873b27bd4422977def667d0f2426 f517bc8999ee44ad81995015f3829cdc0codeblock://1eb8b78a-3bfa-4de6-b3a5-0d228abb3b16"x-mod/codeblock2��{
  "CoreVersion": {
    "Major": 0,
    "Minor": 2
  },
  "ScriptVersion": {
    "Major": 1,
    "Minor": 0
  },
  "Description": "",
  "Id": "1eb8b78a-3bfa-4de6-b3a5-0d228abb3b16",
  "Language": 1,
  "Name": "StateTitleStartIntro",
  "Type": 1,
  "Source": 0,
  "Target": null,
  "Properties": [],
  "Methods": [],
  "EventEmitters": [],
  "EventHandlers": [],
  "EntityEventHandlers": [
    {
      "Name": "HandleButtonClickEvent",
      "EventName": "ButtonClickEvent",
      "Target": "self",
      "Code": "local state_manager = _EntityService:GetEntityByPath(\"/common/StateManager\")\n\nstate_manager.StateManager:OnStateChanged(\"Intro\")"
    }
  ]
}8���ڻ��J fea330e6fd8041dbb242022aee88345a�

 ae27b995997a430fa1f3372603dd47b6 f517bc8999ee44ad81995015f3829cdc0codeblock://47484a98-2392-4c6d-9014-1b6211dd2331"x-mod/codeblock2�	�	{
  "CoreVersion": {
    "Major": 0,
    "Minor": 2
  },
  "ScriptVersion": {
    "Major": 1,
    "Minor": 0
  },
  "Description": "",
  "Id": "47484a98-2392-4c6d-9014-1b6211dd2331",
  "Language": 1,
  "Name": "CameraCtrlRaiseEvent",
  "Type": 1,
  "Source": 0,
  "Target": null,
  "Properties": [],
  "Methods": [
    {
      "Name": "OnBeginPlay",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": null,
      "Code": "--self.Entity.Enable = false\n\nself.Entity.ImageComponent.Color = Color(0,0,0,0)",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 2
    }
  ],
  "EventEmitters": [],
  "EventHandlers": [],
  "EntityEventHandlers": [
    {
      "Name": "HandleButtonClickEvent",
      "EventName": "ButtonClickEvent",
      "Target": "self",
      "Code": "-- Parameters\nlocal Entity = event.Entity\n--------------------------------------------------------\nlocal entity = _EntityService:GetEntityByPath(\"/common/CameraManager\")\nentity.CameraManager:OnButtonClicked(Entity.Name)"
    }
  ]
}8���ڻ��J 8d0d26059abb488d8ccd7128fe87a2c2�
 0bd1317970894b499c5e48ff98d72c07 f517bc8999ee44ad81995015f3829cdc0codeblock://822b30d5-a192-44e0-8971-89d5a0b7cbd1"x-mod/codeblock2��{
  "CoreVersion": {
    "Major": 0,
    "Minor": 2
  },
  "ScriptVersion": {
    "Major": 1,
    "Minor": 0
  },
  "Description": "",
  "Id": "822b30d5-a192-44e0-8971-89d5a0b7cbd1",
  "Language": 1,
  "Name": "StateManager",
  "Type": 1,
  "Source": 0,
  "Target": null,
  "Properties": [
    {
      "Name": "States",
      "Type": "array",
      "DefaultValue": "Entity",
      "Description": null,
      "SyncDirection": 3
    }
  ],
  "Methods": [
    {
      "Name": "OnBeginPlay",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": null,
      "Code": "local entity = _EntityService:GetEntityByPath(\"/common/StateTitle\")\nentity.StateTitle:OnStateEntered()\n-- debug purpose\n--local entity = _EntityService:GetEntityByPath(\"/common/StateGame01\")\n--entity.StateGame01:OnStateEntered()\nentity.Visible = true\n\ntable.insert(self.States, entity)",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 2
    },
    {
      "Name": "OnStateChanged",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [
        {
          "Name": "state",
          "Type": "string",
          "DefaultValue": "\"\"",
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "local entity = table.remove(self.States, 1)\n\nif entity.Name == \"StateTitle\" then\n\tentity.StateTitle:OnStateLeft()\nelseif entity.Name == \"StateIntro\" then\n\tentity.StateIntro:OnStateLeft()\nelseif entity.Name == \"StateGame01\" then\n\tentity.StateGame01:OnStateLeft()\nend\n\nentity.Enable = false\n\nif state == \"Title\" then\n\tentity = _EntityService:GetEntityByPath(\"/common/StateTitle\")\t\n\tentity.StateTitle:OnStateEntered()\nelseif state == \"Intro\" then\n\tentity = _EntityService:GetEntityByPath(\"/common/StateIntro\")\t\n\tentity.StateIntro:OnStateEntered()\nelseif state == \"Game01\" then\n\tentity = _EntityService:GetEntityByPath(\"/common/StateGame01\")\t\n\tentity.StateGame01:OnStateEntered()\nend\n\nentity.Enable = true\n\ntable.insert(self.States, entity)\n\nlog(\"OnStateChanged:\", state)",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "OnStatePushed",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": null,
      "Code": "",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "OnStatePoped",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": null,
      "Code": "local entity = table.remove(self.States, 1)\n\nif entity ~= nil then\n\tif entity.Name == \"StateCameraCtrl\" then\n\t\tentity.StateCameraCtrl:OnStateLeft()\n\telseif entity.Name == \"StateEnemyCtrl\" then\n\t\tentity.StateEnemyCtrl:OnStateLeft()\n\telseif entity.Name == \"StateAllyCtrl\" then\n\t\tentity.StateEnemyCtrl:OnStateLeft()\n\telse\n\t\tlog(\"error\")\n\tend\nend\n\n",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    }
  ],
  "EventEmitters": [],
  "EventHandlers": [],
  "EntityEventHandlers": []
}8���ڻ��J 3b9af2c1ffa84f55ab0510651a5f4df9�
 4be03dc69a084cdaaa0975ae0cfd8fb8 f517bc8999ee44ad81995015f3829cdc0codeblock://884fc48a-0766-46ad-aa47-2dcbe3e7bd51"x-mod/codeblock2��{
  "CoreVersion": {
    "Major": 0,
    "Minor": 2
  },
  "ScriptVersion": {
    "Major": 1,
    "Minor": 0
  },
  "Description": "",
  "Id": "884fc48a-0766-46ad-aa47-2dcbe3e7bd51",
  "Language": 1,
  "Name": "TileMovable",
  "Type": 1,
  "Source": 0,
  "Target": null,
  "Properties": [
    {
      "Name": "EntityID",
      "Type": "string",
      "DefaultValue": "\"\"",
      "Description": null,
      "SyncDirection": 0
    },
    {
      "Name": "turn_mgr",
      "Type": "Entity",
      "DefaultValue": "nil",
      "Description": null,
      "SyncDirection": 0
    },
    {
      "Name": "MapPos",
      "Type": "Vector2",
      "DefaultValue": "Vector2(0,0)",
      "Description": null,
      "SyncDirection": 0
    }
  ],
  "Methods": [
    {
      "Name": "OnTouch",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": null,
      "Code": "self.turn_mgr.TurnManager:MoveUnit(self.EntityID, self.MapPos)",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 2
    },
    {
      "Name": "OnBeginPlay",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": null,
      "Code": "self.turn_mgr = _EntityService:GetEntityByPath(\"/common/TurnManager\")\nself.Entity.TransformComponent.Scale = Vector3(1.5, 2, 1)\nself.Entity.TransformComponent.Position = Vector3(0, -3, 0)",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 2
    }
  ],
  "EventEmitters": [],
  "EventHandlers": [],
  "EntityEventHandlers": []
}8��������J a033abbac95849c0a6a74bae83e65e45�
 c49215bded6d41eaa26ca2a27a240c5d f517bc8999ee44ad81995015f3829cdc0codeblock://8a3ede71-c68f-4f95-8e52-d7b6d2198831"x-mod/codeblock2��{
  "CoreVersion": {
    "Major": 0,
    "Minor": 2
  },
  "ScriptVersion": {
    "Major": 1,
    "Minor": 0
  },
  "Description": "",
  "Id": "8a3ede71-c68f-4f95-8e52-d7b6d2198831",
  "Language": 1,
  "Name": "TileAttackable",
  "Type": 1,
  "Source": 0,
  "Target": null,
  "Properties": [
    {
      "Name": "__properties",
      "Type": "table",
      "DefaultValue": "{}",
      "Description": null,
      "SyncDirection": 0
    },
    {
      "Name": "EntityID",
      "Type": "string",
      "DefaultValue": "\"\"",
      "Description": null,
      "SyncDirection": 0
    },
    {
      "Name": "RelPos",
      "Type": "Vector2",
      "DefaultValue": "Vector2(0,0)",
      "Description": null,
      "SyncDirection": 0
    }
  ],
  "Methods": [
    {
      "Name": "OnBeginPlay",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": null,
      "Code": "self.__properties.turn_manager = _EntityService:GetEntityByPath(\"/common/TurnManager\")\nself.Entity.TransformComponent.Scale = Vector3(1.5, 2, 1)\nself.Entity.TransformComponent.Position = Vector3(0, -3, 0)",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 2
    },
    {
      "Name": "OnTouch",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": null,
      "Code": "self.__properties.turn_manager.TurnManager:AttackUnit(self.RelPos, self.EntityID)",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 2
    }
  ],
  "EventEmitters": [],
  "EventHandlers": [],
  "EntityEventHandlers": []
}8��������J f21963d6b47541598ff95bcfa669fbad�
 fe5dc0f89e74499f9a4c58d02cea2a4d f517bc8999ee44ad81995015f3829cdc0codeblock://afc2b09f-0667-4ded-8ca9-fc4fc07170b5"x-mod/codeblock2��{
  "CoreVersion": {
    "Major": 0,
    "Minor": 2
  },
  "ScriptVersion": {
    "Major": 1,
    "Minor": 0
  },
  "Description": "",
  "Id": "afc2b09f-0667-4ded-8ca9-fc4fc07170b5",
  "Language": 1,
  "Name": "StateIntroNextDialog",
  "Type": 1,
  "Source": 0,
  "Target": null,
  "Properties": [],
  "Methods": [],
  "EventEmitters": [],
  "EventHandlers": [],
  "EntityEventHandlers": [
    {
      "Name": "HandleButtonClickEvent",
      "EventName": "ButtonClickEvent",
      "Target": "self",
      "Code": "local entity = _EntityService:GetEntityByPath(\"/common/StateIntro\")\nentity.StateIntro:OnNextDialogSubmit()"
    }
  ]
}8���ڻ��J 4a1914b8691046d095feac9be42362d2�
 fca5c56286744a048888c9df3beb9b52 f517bc8999ee44ad81995015f3829cdc0codeblock://bc6f3987-5781-4852-b5c0-b282741d5c68"x-mod/codeblock2٪ժ{
  "CoreVersion": {
    "Major": 0,
    "Minor": 2
  },
  "ScriptVersion": {
    "Major": 1,
    "Minor": 0
  },
  "Description": "",
  "Id": "bc6f3987-5781-4852-b5c0-b282741d5c68",
  "Language": 1,
  "Name": "TurnManager",
  "Type": 1,
  "Source": 0,
  "Target": null,
  "Properties": [
    {
      "Name": "battle_info_ui",
      "Type": "any",
      "DefaultValue": "nil",
      "Description": null,
      "SyncDirection": 0
    },
    {
      "Name": "camera_mgr",
      "Type": "any",
      "DefaultValue": "nil",
      "Description": null,
      "SyncDirection": 0
    },
    {
      "Name": "battle_ui",
      "Type": "any",
      "DefaultValue": "nil",
      "Description": null,
      "SyncDirection": 0
    },
    {
      "Name": "movable_tile",
      "Type": "Entity",
      "DefaultValue": "nil",
      "Description": null,
      "SyncDirection": 0
    },
    {
      "Name": "cloned_movable_tiles",
      "Type": "table",
      "DefaultValue": "{}",
      "Description": null,
      "SyncDirection": 0
    },
    {
      "Name": "Map",
      "Type": "table",
      "DefaultValue": "{}",
      "Description": null,
      "SyncDirection": 0
    },
    {
      "Name": "MapSize",
      "Type": "Vector2",
      "DefaultValue": "Vector2(0,0)",
      "Description": null,
      "SyncDirection": 0
    },
    {
      "Name": "GridSize",
      "Type": "Vector2",
      "DefaultValue": "Vector2(0,0)",
      "Description": null,
      "SyncDirection": 0
    },
    {
      "Name": "Allies",
      "Type": "table",
      "DefaultValue": "{}",
      "Description": null,
      "SyncDirection": 0
    },
    {
      "Name": "Enemies",
      "Type": "table",
      "DefaultValue": "{}",
      "Description": null,
      "SyncDirection": 0
    },
    {
      "Name": "enable_color",
      "Type": "any",
      "DefaultValue": "nil",
      "Description": null,
      "SyncDirection": 0
    },
    {
      "Name": "disable_color",
      "Type": "any",
      "DefaultValue": "nil",
      "Description": null,
      "SyncDirection": 0
    },
    {
      "Name": "entity_ids",
      "Type": "table",
      "DefaultValue": "{}",
      "Description": null,
      "SyncDirection": 0
    },
    {
      "Name": "__properties",
      "Type": "table",
      "DefaultValue": "{}",
      "Description": null,
      "SyncDirection": 0
    }
  ],
  "Methods": [
    {
      "Name": "OnBeginPlay",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [],
      "Code": "self.Entity.Enable = false\n\nself.battle_info_ui = _EntityService:GetEntityByPath(\"/ui/UIBattleInfo\")\nself.battle_ui = _EntityService:GetEntityByPath(\"/ui/UIBattle\")\nself.camera_mgr = _EntityService:GetEntityByPath(\"/common/CameraManager\")\n\nself.movable_tile = _EntityService:GetEntityByPath(\"/common/TileMovable\")\nself.movable_tile.Enable = false\n\nself.__properties.attackable_tile = _EntityService:GetEntityByPath(\"/common/TileAttackable\")\nself.__properties.attackable_tile.Enable = false\n\nself.disable_color = Color(0.5, 0.5, 0.5, 1)\nself.enable_color = Color(1, 1, 1, 1)\n\nself.Allies = {}\nself.Enemies = {}\n\n--self.__properties.removing_entity_ids = {}\nself.__properties.__move_tiles = {}\nself.__properties.__hit_tiles = {}\n\n--self:InitializeUnits()",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 2
    },
    {
      "Name": "StartAlly",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [],
      "Code": "self.camera_mgr.CameraManager:Start()\n\nself:ActivateUnits(self.Allies, true)\n\n--self.battle_ui.Enable = true\n--self.battle_ui.Visible = true",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "StartEnemy",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [],
      "Code": "--self:RemoveMovableTiles()\n\nlocal remain_turn_txt = _EntityService:GetEntityByPath(\"/ui/UIBattleInfo/UIBattleRemainTurnTxt\")\nlocal remain_turn = math.tointeger(remain_turn_txt.TextComponent.Text)\n\nif remain_turn <= 0 then\n\tlog(\"go to game over state\")\nend\n\nremain_turn_txt.TextComponent.Text = tostring(remain_turn - 1)\n\nself:ActivateUnits(self.Enemies, false)\n\nlocal entity_ids = {}\n\nfor i=1, #self.Enemies do\n\tlocal entity = self.Enemies[i]\n\t\n\tif entity ~= nil then\n\t\ttable.insert(entity_ids, entity.Id)\n\tend\nend\n\nself.entity_ids = entity_ids\n\n_TimerService:SetTimerOnce(function()\n\tself:_WorkEnemy()\nend, 0.1)",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "Start",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [],
      "Code": "self.battle_info_ui.Visible = true\nself.battle_info_ui.Enable = true\n\n--self:StartAlly()",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "End",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [],
      "Code": "self.battle_info_ui.Visible = false\nself.battle_info_ui.Enable = false\n\nself.battle_info_ui.Visible = false\nself.battle_info_ui.Enable  = false\n\nfor i=1, #self.Allies do\n\tlocal entity = table.remove(self.Allies, 1)\n\tentity:Destroy()\nend\n\nfor i=1, #self.Enemies do\n\tlocal entity = table.remove(self.Enemies, 1)\n\tentity:Destroy()\nend\n\nself.camera_mgr.End()",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "InitializeUnits",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [],
      "Code": "--[[\n-- Tuntra\nlocal size = 3\nlocal movables = {\n\t1, 1, 1,\n\t1, 0, 1,\n\t1, 1, 1\n}\n\nlocal entity = _EntityService:GetEntityByPath(\"/maps/map01/UnitTuntra\")\nentity.UnitCommon.MovableAreas = movables\nentity.UnitCommon.MovableAreaSize = size;\n]]--",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "OnMapEnter",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [
        {
          "Name": "enteredMap",
          "Type": "any",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 1
    },
    {
      "Name": "MoveEntity",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [
        {
          "Name": "entity_id",
          "Type": "string",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "pos",
          "Type": "Vector3",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "local entity = _EntityService:GetEntity(entity_id)\n\nif entity == nil then\n\treturn\nend\n\nentity.TransformComponent.WorldPosition = pos\n\nfor i=1, #self.cloned_movable_tiles do\n\tlocal entity = table.remove(self.cloned_movable_tiles, i)\n\tentity:Destroy()\nend",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "SelectUnit",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [
        {
          "Name": "entity",
          "Type": "Entity",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "if entity.UnitCommon.Done then\n\treturn\nend\n\nself.battle_ui.Visible = true\nself.battle_ui.Enable = true\t\n\t\n--if entity.UnitCommon.Moved then\n--\treturn\n--end\n\nlocal btn0 = _EntityService:GetEntityByPath(\"/ui/UIBattle/DefBtn\")\nbtn0.UIBattleControl.EntityID = entity.Id\n\n_UserService.LocalPlayer.TransformComponent.WorldPosition = entity.TransformComponent.WorldPosition\n\n-- put attack range\nif entity.UnitCommon.Moved == false then\n\tself:__remove_tiles(true, true)\n\t\n\tself.__properties.__move_tiles = self:_ShowTiles(\n\t\tentity, \n\t\tentity.UnitCommon.MovableAreas, \n\t\tentity.UnitCommon.MovableAreaSize, \n\t\tColor(0, 0, 0, 0.5),\n\t\ttrue)\nelse\n\tself:__remove_tiles(false, true)\nend\n\nself.__properties.__hit_tiles = self:_ShowTiles(\n\tentity, \n\tentity.UnitCommon.AttackAreas, \n\tentity.UnitCommon.AttackAreaSize, \n\tColor(1, 0, 0, 1),\n\tfalse)\n\n--for _, tile in ipairs(tiles) do\n--\ttable.insert(self.cloned_movable_tiles, tile)\n--end",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "MoveUnit",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [
        {
          "Name": "entity_id",
          "Type": "string",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "map_pos",
          "Type": "Vector2",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "local entity = _EntityService:GetEntity(entity_id)\n\nif entity == nil then\n\treturn\nelseif entity.UnitCommon.LocationAtMap == map_pos then\n\treturn\nend\n\nentity.UnitCommon.Moved = true\n--entity.Enable = false\n\nlocal map_idx = self:_GetMapIndex(entity.UnitCommon.LocationAtMap.x, entity.UnitCommon.LocationAtMap.y)\n--local other_entity_id = self.Map[map_idx] \nself.Map[map_idx] = 0\n\n-- move unit\nlocal x = self.GridSize.x * map_pos.x\nlocal y = self.GridSize.y * -map_pos.y\nlocal pos = Vector3(x, y, entity.TransformComponent.WorldPosition.z)\nentity.TransformComponent.WorldPosition = pos\n\nentity.UnitCommon.LocationAtMap = map_pos\n\nmap_idx = self:_GetMapIndex(map_pos.x, map_pos.y)\nself.Map[map_idx] = entity.Id\n\nif entity.UnitCommon:IsEnemy() == false then\n\tself:SelectUnit(entity)\nend\n\n--_UserService.LocalPlayer.TransformComponent.WorldPosition = pos\n\n-- show command ui\n--self.battle_ui.Enable = true\n--self.battle_ui.Visible = true",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "__remove_tiles",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [
        {
          "Name": "is_move_tile",
          "Type": "boolean",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "is_hit_tile",
          "Type": "boolean",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "local remove_tiles = function(tiles) \n\tfor i=1, #tiles do\n\t\tlocal entity = table.remove(tiles, 1)\n\t\tentity:Destroy()\n\tend\nend\n\nif is_move_tile then\n\tremove_tiles(self.__properties.__move_tiles)\nend\n\nif is_hit_tile then\n\tremove_tiles(self.__properties.__hit_tiles)\nend",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "ActUnit",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [
        {
          "Name": "entity_id",
          "Type": "string",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "control_name",
          "Type": "string",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "--self:__remove_tiles(true, true)\n\nlocal entity = _EntityService:GetEntity(entity_id)\n\nif entity == nil then\n\treturn\nend\n\nif control_name == \"DefBtn\" then\n\tentity.UnitCommon.Done = true\n\tentity.SpriteRendererComponent.Color = self.disable_color\n\t\n\tself.battle_ui.Visible = false\n\tself.battle_ui.Enable = false\n\t\n\tself:CheckNextTurnEnabled(entity.UnitCommon:IsEnemy())\nend",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "CheckNextTurnEnabled",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [
        {
          "Name": "is_enemy",
          "Type": "boolean",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "self:__remove_tiles(true, true)\n\nlocal entities = nil\nlocal wait_second = 3\n\nif is_enemy == true then\n\tfor i=1, #self.Enemies do\n\t\tlocal entity = self.Enemies[i]\n\t\t\n\t\tif entity.UnitCommon.Done == false then\t\t\t\n\t\t\treturn\n\t\tend\n\tend\n\t\n\t_TimerService:SetTimerOnce(function() self:StartAlly() end, wait_second)\nelse\n\tfor i=1, #self.Allies do\n\t\tlocal entity = self.Allies[i]\n\t\t\n\t\tif entity.UnitCommon.Done == false then\n\t\t\t--_UserService.LocalPlayer.TransformComponent.WorldPosition = entity.TransformComponent.WorldPosition\n\t\t\tself:SelectUnit(entity)\n\t\t\treturn\n\t\tend\n\tend\n\t\n\t_TimerService:SetTimerOnce(function() self:StartEnemy() end, wait_second)\nend",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "_ShowTiles",
      "Return": {
        "Name": null,
        "Type": "table",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [
        {
          "Name": "entity",
          "Type": "Entity",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "areas",
          "Type": "table",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "row_count",
          "Type": "number",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "tile_color",
          "Type": "any",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "is_movable",
          "Type": "boolean",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "local tiles = {}\nlocal center = math.floor(row_count / 2)\nlocal width = 0.7\nlocal height = 1\nlocal locationAtMap = entity.UnitCommon.LocationAtMap\n\nfor i=0, #areas - 1 do\n\tlocal index = self:_GetIndexOfMap(areas, row_count, i, locationAtMap)\n\t\n\tif index == nil then\n\t\tgoto skip_next\n\tend\n\t\n\tlocal rel_pos = Vector2(index.x, index.y)\n\tlocal map_index = self:_GetMapIndex(index.z, index.w)\n\tlocal other_entity_id = self.Map[map_index]\n\t\n\tif is_movable then\n\t\tif other_entity_id ~= 0 and other_entity_id ~= entity.Id then\n\t\t\tgoto skip_next\n\t\tend\n\telse\n\t\tif other_entity_id == 0 then\n\t\t\tgoto skip_next\n\t\telse\n\t\t\tlocal other_entity = _EntityService:GetEntity(other_entity_id)\n\t\t\t\n\t\t\tif other_entity then\n\t\t\t\tif false == entity.UnitCommon:CheckEnemy(other_entity.UnitCommon.UnitType) then\n\t\t\t\t\tgoto skip_next\n\t\t\t\tend\n\t\t\telse\n\t\t\t\tlog_error(\"Map has an invalid entity id\")\n\t\t\tend\n\t\tend\n\tend\n\n\tlocal pos = Vector3(0,0,0)\n\tpos.x = rel_pos.x * width\n\tpos.y = rel_pos.y * -height\n\t\n\tpos = pos + entity.TransformComponent.WorldPosition\n\n\tlocal tile = nil\n\t\n\tif is_movable then\t\t\n\t\ttile = self.movable_tile:Clone()\n\t\ttile.TileMovable.EntityID = entity.Id\n\t\ttile.TileMovable.MapPos = rel_pos + locationAtMap\n\t\t\n\t\tlocal bias = Vector3(0, 0.5, 0)\n\t\tpos = pos + bias\n\telse\n\t\ttile = self.__properties.attackable_tile:Clone()\n\t\ttile.TileAttackable.EntityID = entity.Id\n\t\ttile.TileAttackable.RelPos = rel_pos\t\t\n\tend\n\t\n\ttable.insert(tiles, tile)\n\t\n\ttile.TransformComponent.WorldPosition = pos\n\ttile.Enable = true\t\n\ttile.SpriteRendererComponent.Color = tile_color\t\n\t\n\t::skip_next::\nend\n\nreturn tiles",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "ActivateUnits",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [
        {
          "Name": "entities",
          "Type": "table",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "auto_select",
          "Type": "boolean",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "local focused = false\n\nfor i=1, #entities do\n\tlocal entity = entities[i]\n\tentity.UnitCommon.Moved = false\n\tentity.UnitCommon.Done = false\n\tentity.SpriteRendererComponent.Color = self.enable_color\n\t\n\tif focused == false then\n\t\tfocused = true\n\t\t\n\t\tif auto_select then\n\t\t\tself:SelectUnit(entity)\n\t\telse\n\t\t\t_UserService.LocalPlayer.TransformComponent.WorldPosition = entity.TransformComponent.WorldPosition\n\t\tend\n\tend\nend",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "_WorkEnemy",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [],
      "Code": "local entity_ids = self.entity_ids\nlocal entity_id = table.remove(entity_ids, 1)\n\nif entity_id == nil then\n\tself:StartAlly()\n\treturn\nend\n\nlocal entity = _EntityService:GetEntity(entity_id)\n\nif entity then\n\t_UserService.LocalPlayer.TransformComponent.WorldPosition = entity.TransformComponent.WorldPosition\n\tlocal target_entity = self:_FindTarget(entity, self.Allies)\n\t\n\t-- can attack? do it and done\n\tif target_entity then\n\t\tentity.UnitCommon:Attack(target_entity)\n\t\tentity.UnitCommon.Done = true\n\t\t\t\n\t\tentity.SpriteRendererComponent.Color = Color(0.5, 0.5, 0.5, 1)\n\telseif entity.UnitCommon.Moved == false then\t\t\t\n\t\tself:_MoveUnitAutomatically(entity)\n\t\t\n\t\tentity.UnitCommon.Moved = true\n\t\t\t\n\t\ttable.insert(self.entity_ids, entity.Id)\n\telse\n\t\tentity.SpriteRendererComponent.Color = Color(0.5, 0.5, 0.5, 1)\n\tend\nend\t\t\n\n_TimerService:SetTimerOnce(function() self:_WorkEnemy(entity_ids) end, 0.5)",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "_FindTarget",
      "Return": {
        "Name": null,
        "Type": "any",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [
        {
          "Name": "enemy_entity",
          "Type": "Entity",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "allies",
          "Type": "table",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "local areas = enemy_entity.UnitCommon.AttackAreas\nlocal area_size = enemy_entity.UnitCommon.AttackAreaSize\nlocal location_at_map = enemy_entity.UnitCommon.LocationAtMap\n\nfor i=1, #areas do\n\tlocal index = self:_GetIndexOfMap(areas, area_size, i, location_at_map)\n\t\n\tif index == nil then\n\t\tgoto skip_next\n\tend\n\t\n\tlocal attack_location = Vector2(index.z, index.w)\n\t\n\tfor j=1, #allies do\n\t\tlocal ally = allies[j]\n\t\t\n\t\tif ally.UnitCommon.LocationAtMap == attack_location then\n\t\t\treturn ally\n\t\tend\n\tend\n\t\n\t::skip_next::\nend\n\nreturn nil",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "_GetIndexOfMap",
      "Return": {
        "Name": null,
        "Type": "any",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [
        {
          "Name": "areas",
          "Type": "table",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "row_count",
          "Type": "number",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "index_of_area",
          "Type": "number",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "location_of_entity",
          "Type": "Vector2",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "--[[\nnil or Vector4\n\nx: x of relative positon\ny: y of relative position\nz: x axis of self.Map\nw: y axis of self.Map\n]]--\nlocal center = math.floor(row_count / 2)\nlocal area = areas[index_of_area]\n\t\nif area == 0 or area == nil then\n\treturn nil\nend\n\nindex_of_area = index_of_area - 1\nlocal x = index_of_area - math.floor(index_of_area / row_count) * row_count\nlocal y = index_of_area / row_count\ny = math.floor(y)\n\nlocal rel_pos = Vector2(0, 0)\n\nif x <= center then\n\trel_pos.x = center - x\n\trel_pos.x = rel_pos.x * -1\nelse\n\trel_pos.x = x - center\nend\n\nif y <= center then\n\trel_pos.y = center - y\t\t\n\trel_pos.y = rel_pos.y * -1\nelse\n\trel_pos.y = y - center\nend\n\nlocal map_pos = location_of_entity + rel_pos\n\nif map_pos.x >= self.MapSize.x or map_pos.y >= self.MapSize.y then\n\treturn nil\nelseif map_pos.x < 0 or map_pos.y < 0 then\n\treturn nil\nend\n\nreturn Vector4(rel_pos.x, rel_pos.y, map_pos.x, map_pos.y)",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "_GetMapIndex",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [
        {
          "Name": "x",
          "Type": "number",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "y",
          "Type": "number",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "-- convert one dimensional value from x, y\nreturn x + y * self.MapSize.x + 1",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "_MoveUnitAutomatically",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [
        {
          "Name": "entity",
          "Type": "Entity",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "-- seek an ally\nfor i=1, #self.Allies do\n\tlocal target_entity = self.Allies[i]\t\n\tlocal nodes = {}\n\n\tfor j=0, #self.Map - 1 do\n\t\tlocal x = j - math.floor(j / self.MapSize.x) * self.MapSize.x\t\t\n\t\tlocal y = j / self.MapSize.y\n\t\ty = math.floor(y)\n\n        local other_entity_id = self.Map[j+1]\n        local cell = 0\n\n        if other_entity_id ~= 0 then\n            local other_entity = _EntityService:GetEntity(other_entity_id)\n\n            if other_entity then\n                if false == entity.UnitCommon:CheckEnemy(other_entity.UnitCommon.UnitType) then\n                    cell = other_entity.UnitCommon.UnitType\n                end\n            else\n                log_error(\"Map has an invalid entity id\")\n            end\n        end\n\n\t\tlocal node = {}\n\t\tnode.x = x\n\t\tnode.y = y\n\t\tnode.cell = cell\n\t\t\n\t\ttable.insert(nodes, node)\n\tend\t\n\t\n\tlocal start = {}\n\tstart.x = entity.UnitCommon.LocationAtMap.x\n\tstart.y = entity.UnitCommon.LocationAtMap.y\n\t\n\tlocal goal = {}\n\tgoal.x = target_entity.UnitCommon.LocationAtMap.x\n\tgoal.y = target_entity.UnitCommon.LocationAtMap.y\n\t\n\tlocal path = self:_A_star(start, goal, nodes)\n\t\n\tif path then\n\t\t--[[\n\t\tif #path then\n\t\t\tlog(\"paths found\")\n\t\t\tfor i, p in ipairs(path) do\n\t\t\t\tlog(\"p\", i, \":\", p.x, \",\", p.y)\n\t\t\tend\n\t\tend\n\t\t]]--\n\t\tpath = table.remove(path, 1)\n\t\t\n\t\tif path then\n\t\t\tlocal areas = entity.UnitCommon.MovableAreas\n\t\t\tlocal row_count = entity.UnitCommon.MovableAreaSize\n\t\t\tlocal locationAtMap = entity.UnitCommon.LocationAtMap\n\t\t\t\n\t\t\tlocal shortest = self:_dist(path.x, locationAtMap.x, path.y, locationAtMap.y)\n\t\t\tlocal moving_pos = nil\n\t\n\t\t\t-- scan movable areas, and choose shortest path\n\t\t\tfor i=1, #areas do\n\t\t\t\tlocal index = self:_GetIndexOfMap(areas, row_count, i, locationAtMap)\n\t\t\t\t\n\t\t\t\tif index == nil then\n\t\t\t\t\tgoto skip_next\n\t\t\t\tend\n\t\t\t\t\n\t\t\t\t--index = index + locationAtMap\n\t\t\t\t\n\t\t\t\tlocal map_index = self:_GetMapIndex(index.z, index.w)\n\t\t\t\t\n\t\t\t\tif self.Map[map_index] ~= 0 then\n\t\t\t\t\tgoto skip_next\n\t\t\t\tend\n\t\t\t\t\n\t\t\t\tlocal distance = self:_dist(path.x, index.z, path.y, index.w)\n\t\t\t\t\n\t\t\t\tif distance < shortest\t then\n\t\t\t\t\tshortest = distance\n\t\t\t\t\tmoving_pos = Vector2(index.z, index.w)\n\t\t\t\tend\n\t\t\t\t\n\t\t\t\t::skip_next::\n\t\t\tend\n\t\t\t\n\t\t\tif moving_pos then\n\t\t\t\tentity.SpriteRendererComponent.FlipX = start.x < goal.x\n\t\t\t\t\n\t\t\t\tself:MoveUnit(entity.Id, moving_pos)\n\t\t\tend\t\n\t\tend\n\telse\n\t\tlog(\"path is not found\")\n\tend\n\t\n\treturn\nend\n\n-- get direction to the one\n-- move there\t",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "_dist",
      "Return": {
        "Name": null,
        "Type": "any",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [
        {
          "Name": "x1",
          "Type": "any",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "x2",
          "Type": "any",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "y1",
          "Type": "any",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "y2",
          "Type": "any",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "local dx = x2 - x1\nlocal dy = y2 - y1\n-- math.pow is not existed\ndx = dx * dx\ndy = dy * dy\n\nreturn math.sqrt( dx + dy )",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "_lowest_f_score",
      "Return": {
        "Name": null,
        "Type": "any",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [
        {
          "Name": "set",
          "Type": "any",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "f_score",
          "Type": "any",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "local INF = 1/0\nlocal lowest, bestNode = INF, nil\nfor _, node in ipairs( set ) do\n\tlocal score = f_score [ node ]\n\tif score < lowest then\n\t\tlowest, bestNode = score, node\n\tend\nend\nreturn bestNode",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "_is_valid_node",
      "Return": {
        "Name": null,
        "Type": "any",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [
        {
          "Name": "node",
          "Type": "any",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "neighbor",
          "Type": "any",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "local MAX_DIST = 10\n\t\n-- helper function in the a-star module, returns distance between points\nif self:_dist( node.x, node.y, neighbor.x, neighbor.y ) < MAX_DIST then\n\treturn true\nelseif node.cell == 0 then\n\treturn true\nelse\n\treturn false\nend",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "_neighbor_nodes",
      "Return": {
        "Name": null,
        "Type": "any",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [
        {
          "Name": "theNode",
          "Type": "any",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "nodes",
          "Type": "any",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "local neighbors = {}\nfor _, node in ipairs( nodes ) do\n\tif theNode ~= node and self:_is_valid_node( theNode, node ) then\n\t\ttable.insert( neighbors, node )\n\tend\nend\nreturn neighbors",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "_not_in",
      "Return": {
        "Name": null,
        "Type": "any",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [
        {
          "Name": "set",
          "Type": "any",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "theNode",
          "Type": "any",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "for _, node in ipairs( set ) do\n\tif node == theNode then return false end\nend\nreturn true",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "_remove_node",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [
        {
          "Name": "set",
          "Type": "any",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "theNode",
          "Type": "any",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "for i, node in ipairs( set ) do\n\tif node == theNode then \n\t\tset [ i ] = set [ #set ]\n\t\tset [ #set ] = nil\n\t\tbreak\n\tend\nend\t",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "_unwind_path",
      "Return": {
        "Name": null,
        "Type": "any",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [
        {
          "Name": "flat_path",
          "Type": "any",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "map",
          "Type": "any",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "current_node",
          "Type": "any",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "if map [ current_node ] then\n\ttable.insert( flat_path, 1, map [ current_node ] ) \n\treturn self:_unwind_path( flat_path, map, map [ current_node ] )\nelse\n\treturn flat_path\nend",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "_A_star",
      "Return": {
        "Name": null,
        "Type": "any",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [
        {
          "Name": "start",
          "Type": "any",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "goal",
          "Type": "any",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "nodes",
          "Type": "table",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "local INF = 1/0\nlocal closedset = {}\nlocal openset = { start }\nlocal came_from = {}\n\nlocal g_score, f_score = {}, {}\ng_score [ start ] = 0\nf_score [ start ] = self:_dist( start.x, start.y, goal.x, goal.y )\n\nwhile #openset > 0 do\t\n\tlocal current = self:_lowest_f_score( openset, f_score )\n\tif current ~= nil and current.x == goal.x and current.y == goal.y then\n\t\tlocal path = self:_unwind_path( {}, came_from, goal )\n\t\ttable.insert( path, goal )\n\t\treturn path\n\tend\n\n\tself:_remove_node( openset, current )\t\t\n\ttable.insert( closedset, current )\n\t\n\t--local check_count = 10\n\t\n\tlocal neighbors = self:_neighbor_nodes( current, nodes )\n\tfor _, neighbor in ipairs( neighbors ) do \n\t\t--if check_count == 0 then\n\t\t\t--break\n\t\t--end\n\t\t\n\t\t--check_count = check_count - 1\n\t\t\n\t\tif self:_not_in( closedset, neighbor ) then\n\t\t\tlocal tentative_g_score = g_score[ current ] + self:_dist( current.x, current.y, neighbor.x, neighbor.y )\n\t\t\t \n\t\t\tif self:_not_in( openset, neighbor ) or tentative_g_score < g_score [ neighbor ] then \n\t\t\t\tcame_from[ neighbor ] = current\n\t\t\t\tg_score[ neighbor ] = tentative_g_score\n\t\t\t\tf_score[ neighbor ] = g_score[ neighbor ] + self:_dist( neighbor.x, neighbor.y, goal.x, goal.y )\n\t\t\t\tif self:_not_in( openset, neighbor ) then\n\t\t\t\t\ttable.insert( openset, neighbor )\n\t\t\t\tend\n\t\t\tend\n\t\tend\n\tend\nend\nreturn nil\t",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "RemoveEntity",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [
        {
          "Name": "entity",
          "Type": "string",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "local map_index = self:_GetMapIndex(entity.UnitCommon.LocationAtMap.x, entity.UnitCommon.LocationAtMap.y)\nself.Map[map_index] = 0\n\nlocal container = nil\nlocal is_enemy = entity.UnitCommon:IsEnemy()\n\nif is_enemy then\n\tcontainer = self.Enemies\nelse\n\tcontainer = self.Allies\nend\n\nfor i=1, #container do\n\tif container[i].Id == entity.Id then\n\t\ttable.remove(container, i)\n\t\tbreak\n\tend\nend\n\nif #container == 0 then\n\tif is_enemy then\n\t\t-- clear game\n\telse\n\t\t-- failed\n\tend\nend",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "AttackUnit",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [
        {
          "Name": "rel_pos",
          "Type": "Vector2",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "entity_id",
          "Type": "string",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "local entity = _EntityService:GetEntity(entity_id)\n\nif entity then\n\tlocal pos = entity.UnitCommon.LocationAtMap + rel_pos\n\t\n\tfor _, enemy in ipairs(self.Enemies) do\n\t\tif enemy.UnitCommon.LocationAtMap == pos then\t\t\n\t\t\tentity.UnitCommon:Attack(enemy)\t\t\t\n\t\t\tentity.UnitCommon.Done = true\n\t\t\tentity.SpriteRendererComponent.Color = self.disable_color\t\n\t\t\tbreak\n\t\tend\n\tend\n\t\n\tself:CheckNextTurnEnabled(false)\nend",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    }
  ],
  "EventEmitters": [],
  "EventHandlers": [],
  "EntityEventHandlers": []
}8���ɖ����V
 726e7a9e22914723b11c485a1f14f261 f517bc8999ee44ad81995015f3829cdc0codeblock://bf2355b8-2e1b-421d-a6ca-d8ead4f8862f"x-mod/codeblock2�U�U{
  "CoreVersion": {
    "Major": 0,
    "Minor": 2
  },
  "ScriptVersion": {
    "Major": 1,
    "Minor": 0
  },
  "Description": "",
  "Id": "bf2355b8-2e1b-421d-a6ca-d8ead4f8862f",
  "Language": 1,
  "Name": "UnitCommon",
  "Type": 1,
  "Source": 0,
  "Target": null,
  "Properties": [
    {
      "Name": "turn_mgr",
      "Type": "any",
      "DefaultValue": "nil",
      "Description": null,
      "SyncDirection": 0
    },
    {
      "Name": "UnitType",
      "Type": "number",
      "DefaultValue": "0",
      "Description": null,
      "SyncDirection": 0
    },
    {
      "Name": "MovableAreas",
      "Type": "table",
      "DefaultValue": "{}",
      "Description": null,
      "SyncDirection": 0
    },
    {
      "Name": "MovableAreaSize",
      "Type": "number",
      "DefaultValue": "0",
      "Description": null,
      "SyncDirection": 0
    },
    {
      "Name": "LocationAtMap",
      "Type": "Vector2",
      "DefaultValue": "Vector2(0,0)",
      "Description": null,
      "SyncDirection": 0
    },
    {
      "Name": "Moved",
      "Type": "boolean",
      "DefaultValue": "false",
      "Description": null,
      "SyncDirection": 0
    },
    {
      "Name": "Done",
      "Type": "boolean",
      "DefaultValue": "false",
      "Description": null,
      "SyncDirection": 0
    },
    {
      "Name": "AttackAreas",
      "Type": "table",
      "DefaultValue": "{}",
      "Description": null,
      "SyncDirection": 0
    },
    {
      "Name": "AttackAreaSize",
      "Type": "number",
      "DefaultValue": "0",
      "Description": null,
      "SyncDirection": 0
    },
    {
      "Name": "Properties",
      "Type": "table",
      "DefaultValue": "{}",
      "Description": null,
      "SyncDirection": 0
    }
  ],
  "Methods": [
    {
      "Name": "OnTouch",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": null,
      "Code": "if self:IsEnemy() == false then\n\tself.turn_mgr.TurnManager:SelectUnit(self.Entity)\t\nend",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 2
    },
    {
      "Name": "OnBeginPlay",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": null,
      "Code": "self.turn_mgr = _EntityService:GetEntityByPath(\"/common/TurnManager\")\n\nself.MovableAreas = {\t\n\t0, 0, 1, 0, 0,\n\t0, 1, 1, 1, 0,\n\t1, 1, 1, 1, 1,\n\t0, 1, 1, 1, 0,\n\t0, 0, 1, 0, 0,\n}\nself.MovableAreaSize = 5\n\nself.AttackAreas = {\t\n\t1, 1, 1,\n\t1, 0, 1,\n\t1, 1, 1,\n}\nself.AttackAreaSize = 3\n\nself.Entity.ChatBalloonComponent.BallonScale = 1\nself.Entity.ChatBalloonComponent.FontSize = 2\nself.Entity.ChatBalloonComponent.AutoShowEnabled = true\nself.Entity.ChatBalloonComponent.AutoHideBalloonDelay = 0 \nself.Entity.ChatBalloonComponent.AutoShowBalloonDelay = 3",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 2
    },
    {
      "Name": "IsEnemy",
      "Return": {
        "Name": null,
        "Type": "boolean",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": null,
      "Code": "return self:CheckEnemy(self.UnitType)",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "CheckEnemy",
      "Return": {
        "Name": null,
        "Type": "boolean",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [
        {
          "Name": "unit_type",
          "Type": "number",
          "DefaultValue": "0",
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "if unit_type == 1 or unit_type == 2 or unit_type == 4 then\n\treturn false\nend\n\nreturn true",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "Attack",
      "Return": {
        "Name": null,
        "Type": "boolean",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [
        {
          "Name": "target_entity",
          "Type": "Entity",
          "DefaultValue": "nil",
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "local length = 0\n_EffectService:PlayEffectAttached(\"f396262ddb6e4d5581360496bb4e9f86\", target_entity, Vector2(0,0), 0, Vector2(1,1), length)\n\nself:AddChat(\"공격!\")\n\nlocal properties = self.Properties\nlocal other_properties = target_entity.UnitCommon.Properties\n\nlocal is_succeed_to_attack = function() \n\tlocal dd = properties.DEX - other_properties.DEX\n\tlocal dice = math.random(0, 10)\n\t\n\t-- attacker is faster than target\n\tif dd > 0 then\n\t\tlog(\"faster attack: \", dd)\n\t\treturn dice > 1\n\t-- attacker is slower than target\n\telse\t\n\t\tlog(\"slower attack: \", dd)\n\t\t\n\t\treturn dice > 3\n\tend\nend\n\nlocal hurt_target = function()\n\tlocal damage = properties.ATK - other_properties.DEF\n\tlocal damages = { damage }\n\tlocal dex_rate = properties.DEX / other_properties.DEX\t\n\t\n\t-- get more chance to attack when attacker is faster than target\n\tif dex_rate > 0.5 then\n\t\tdamage = math.random(damage / 2, damage)\n\t\ttable.insert(damages, damage)\n\tend\n\t\n\t-- lucky shot\n\tif 90 < math.random(1, 100) then\n\t\tdamage = math.random(damage / 2, damage)\n\t\ttable.insert(damages, damage)\t\t\n\tend\n\t\n\treturn damages\nend\n\n-- check whether it was succeced for attack\nif is_succeed_to_attack() then\n\tlocal damages = hurt_target()\t\n\tlocal critical = false\n\t\n\tif 1 < #damages then\n\t\tcritical = true\n\tend\n\t\t\n\t_DamageSkinService:Play(target_entity, 2, 0, damages, DamageSkinTweenType.Default, critical)\t\n\t\n\tlocal total_damage = 0\n\t\n\tfor _, d in ipairs(damages) do\n\t\ttotal_damage = total_damage + d\n\tend\n\t\n\tother_properties.HP = other_properties.HP - total_damage\n\t\n\tif total_damage >= other_properties.HP then\n\t\ttarget_entity.UnitCommon:Die()\n\t\treturn true\n\tend\nelse\n\tself:AddChat(\"빗나갔다!\")\nend\n\nreturn false",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "HideChat",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": null,
      "Code": "self.Entity.ChatBalloonComponent.Message = \"\"",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "AddChat",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [
        {
          "Name": "text",
          "Type": "string",
          "DefaultValue": "\"\"",
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "if #text == 0 then\n\treturn\nend\n\nself.Entity.ChatBalloonComponent.Message = text\n\nlocal timer_id = self.Properties.__timer_id\n\nif timer_id then\n\t_TimerService:ClearTimerById(timer_id)\nend\n\nself.Properties.__timer_id = _TimerService:SetTimerOnce(function() self:HideChat() end, 3)",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "SetUnitType",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [
        {
          "Name": "unit_type",
          "Type": "number",
          "DefaultValue": "0",
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "self.UnitType = unit_type\n\nlocal props = self.Properties\n\n-- default\nprops.HP = 60\nprops.ATK = 50\nprops.DEF = 50\nprops.DEX = 50\n\n--[[\n1: lee sung kye\n2: tuntra\n3: park wei\n4: militia\n5: rebel\n]]--\nif self.UnitType == 1 then\n\tprops.HP = 200\n\tprops.ATK = 100\n\tprops.DEF = 50\n\tprops.DEX = 100\nelseif self.UnitType == 2 then\n\tprops.HP = 10\n\tprops.ATK = 100\n\tprops.DEF = 50\n\tprops.DEX = 50\nelseif self.UnitType == 3 then\n\tprops.HP = 200\n\tprops.ATK = 100\n\tprops.DEF = 50\n\tprops.DEX = 50\nelseif self.UnitType == 4 then\n\tprops.HP = 200\n\tprops.ATK = 100\n\tprops.DEF = 50\n\tprops.DEX = 50\nelseif self.UnitType == 5 then\n\tprops.HP = 200\n\tprops.ATK = 100\n\tprops.DEF = 50\n\tprops.DEX = 50\t\nend",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "__get_chat",
      "Return": {
        "Name": null,
        "Type": "string",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [
        {
          "Name": "chat_type",
          "Type": "string",
          "DefaultValue": "\"\"",
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "if chat_type == \"die\" then\n\treturn \"으악\"\nend\n\nreturn \"\"",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "Die",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": null,
      "Code": "self:AddChat(self:__get_chat(\"die\"))\n\nself.turn_mgr.TurnManager:RemoveEntity(self.Entity)\n\n_TimerService:SetTimerOnce(function() self:banish() end, 0.1)",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "banish",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": null,
      "Code": "local color = self.Entity.SpriteRendererComponent.Color\n\t\nif color.a > 0 then\n\tself.Entity.SpriteRendererComponent.Color = Color(1, 1, 1, color.a - 0.1)\n\t\n\t_TimerService:SetTimerOnce(function() self:banish() end, 0.1)\nelse\n\tself.Entity:Destroy()\nend",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "OnDestroy",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": null,
      "Code": "log(\"OnDestroy()\", self.Entity.Name)",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 2
    }
  ],
  "EventEmitters": [],
  "EventHandlers": [],
  "EntityEventHandlers": []
}8���ۜ����
 b896144b72cb47538fe971ad0a15fe81 f517bc8999ee44ad81995015f3829cdc0codeblock://d1a85638-13b6-4800-9a0a-dcaae3b0cb08"x-mod/codeblock2��{
  "CoreVersion": {
    "Major": 0,
    "Minor": 2
  },
  "ScriptVersion": {
    "Major": 1,
    "Minor": 0
  },
  "Description": "",
  "Id": "d1a85638-13b6-4800-9a0a-dcaae3b0cb08",
  "Language": 1,
  "Name": "UIBattleControl",
  "Type": 1,
  "Source": 0,
  "Target": null,
  "Properties": [
    {
      "Name": "turn_mgr",
      "Type": "Entity",
      "DefaultValue": "nil",
      "Description": null,
      "SyncDirection": 0
    },
    {
      "Name": "EntityID",
      "Type": "string",
      "DefaultValue": "\"\"",
      "Description": null,
      "SyncDirection": 0
    }
  ],
  "Methods": [
    {
      "Name": "OnBeginPlay",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": null,
      "Code": "self.turn_mgr = _EntityService:GetEntityByPath(\"/common/TurnManager\")",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 2
    }
  ],
  "EventEmitters": [],
  "EventHandlers": [],
  "EntityEventHandlers": [
    {
      "Name": "HandleButtonClickEvent",
      "EventName": "ButtonClickEvent",
      "Target": "self",
      "Code": "-- Parameters\nlocal Entity = event.Entity\n--------------------------------------------------------\nself.turn_mgr.TurnManager:ActUnit(Entity.UIBattleControl.EntityID, Entity.Name)\n"
    }
  ]
}8���ڻ��J 5b079a73bbd94603a324c0083180bc97�
 12fb24160e064332a6197ae1ed25dc82 f517bc8999ee44ad81995015f3829cdc0codeblock://ddc37f89-429c-410e-8476-3e1b9788ba54"x-mod/codeblock2��{
  "CoreVersion": {
    "Major": 0,
    "Minor": 2
  },
  "ScriptVersion": {
    "Major": 1,
    "Minor": 0
  },
  "Description": "",
  "Id": "ddc37f89-429c-410e-8476-3e1b9788ba54",
  "Language": 1,
  "Name": "CameraManager",
  "Type": 1,
  "Source": 0,
  "Target": null,
  "Properties": [
    {
      "Name": "ui",
      "Type": "any",
      "DefaultValue": "nil",
      "Description": null,
      "SyncDirection": 0
    }
  ],
  "Methods": [
    {
      "Name": "OnButtonClicked",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [
        {
          "Name": "entity_name",
          "Type": "string",
          "DefaultValue": "\"\"",
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "local bias = Vector3(0, 0, 0)\n\nif entity_name == \"UICameraCtrlUp\" then\n\tbias = Vector3(0, -1, 0)\t\nelseif entity_name == \"UICameraCtrlRight\" then\n\tbias = Vector3(1, 0, 0)\nelseif entity_name == \"UICameraCtrlDown\" then\n\tbias = Vector3(0, 1, 0)\nelseif entity_name == \"UICameraCtrlLeft\" then\n\tbias = Vector3(-1, 0, 0)\nelseif entity_name == \"UICameraCtrlLeftUp\" then\n\tbias = Vector3(-1, -1, 0)\nelseif entity_name == \"UICameraCtrlLeftDown\" then\n\tbias = Vector3(-1, 1, 0)\nelseif entity_name == \"UICameraCtrlRightUp\" then\n\tbias = Vector3(1, -1, 0)\nelseif entity_name == \"UICameraCtrlRightDown\" then\n\tbias = Vector3(1, 1, 0)\nelse\n\tlog(\"unknown ctrl: \", entity_name)\nend\n\nbias = Vector3(bias.x * 1, bias.y * -1, 0)\n\n_UserService.LocalPlayer.TransformComponent.WorldPosition = _UserService.LocalPlayer.TransformComponent.WorldPosition + bias",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "OnBeginPlay",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": null,
      "Code": "self.ui = _EntityService:GetEntityByPath(\"/ui/UICameraCtrl\")\n\nself.Entity.Enable = false",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 2
    },
    {
      "Name": "Start",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": null,
      "Code": "self.ui.Enable = true\nself.Entity.Enable = true",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "End",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": null,
      "Code": "self.ui.Enable = false\nself.Entity.Enable = false",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    }
  ],
  "EventEmitters": [],
  "EventHandlers": [],
  "EntityEventHandlers": []
}8���ڻ��J e90100165e4046c7a7a5df43fba77dc6�3
 caaa0d9ad08a43b6a8404a3217705ac4 f517bc8999ee44ad81995015f3829cdc0codeblock://eb397a39-c7f0-4b24-b984-8e3098e71009"x-mod/codeblock2�2�2{
  "CoreVersion": {
    "Major": 0,
    "Minor": 2
  },
  "ScriptVersion": {
    "Major": 1,
    "Minor": 0
  },
  "Description": "",
  "Id": "eb397a39-c7f0-4b24-b984-8e3098e71009",
  "Language": 1,
  "Name": "StateGame01",
  "Type": 1,
  "Source": 0,
  "Target": null,
  "Properties": [
    {
      "Name": "entities",
      "Type": "table",
      "DefaultValue": "{}",
      "Description": null,
      "SyncDirection": 0
    },
    {
      "Name": "goal_ui",
      "Type": "any",
      "DefaultValue": "nil",
      "Description": null,
      "SyncDirection": 0
    },
    {
      "Name": "turn_mgr",
      "Type": "any",
      "DefaultValue": "nil",
      "Description": null,
      "SyncDirection": 0
    },
    {
      "Name": "GridSize",
      "Type": "Vector2",
      "DefaultValue": "Vector2(0.7,1)",
      "Description": null,
      "SyncDirection": 3
    }
  ],
  "Methods": [
    {
      "Name": "OnStateEntered",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [],
      "Code": "self:LocateUnits()\n\nself.turn_mgr.TurnManager:Start()\n\n\nself.goal_ui.UIGroupComponent.DefaultShow = true\nself.goal_ui.Enable = true\nself.goal_ui.Visible = true\n\nlocal background = _EntityService:GetEntityByPath(\"/maps/map01/BackGroundTemplate\")\nbackground.Enable = true\nbackground.BackgroundTemplateComponent.MapRUID = \"0b468052186f403a974f9de9fd642a15\"\n\n--log(\"OnStateEntered\")",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "OnStateLeft",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [],
      "Code": "self.turn_mgr.TurnManager:End()\n\nself.goal_ui.UIGroupComponent.DefaultShow = false\nself.goal_ui.Enable = false\nself.goal_ui.Visible = false\n\nself.Entity.Enable = false\n\n-- clear\nfor i=1, #self.entities do\n\tself.entities[i]:Destroy()\n\tself.entities[i] = nil\nend",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "OnBeginPlay",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [],
      "Code": "self.goal_ui = _EntityService:GetEntityByPath(\"/ui/UIBattleGoal\")\nself.turn_mgr = _EntityService:GetEntityByPath(\"/common/TurnManager\")\n\nself.Entity.Enable = false\nself.GridSize = Vector2(0.7, 1)",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 2
    },
    {
      "Name": "LocateUnits",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": null,
      "Code": "\n--[[\n1: lee sung kye\n2: tuntra\n3: park wei\n4: militia\n5: rebel\n]]--\n--[[\nlocal locations = {\t\n\t0, 0, 0, 5, 3, 5, 0, 0, 0, 0,\n\t0, 5, 0, 5, 5, 5, 0, 5, 0, 0,\n\t0, 0, 0, 0, 0, 0, 0, 0, 0, 0,\n\t0, 0, 5, 0, 0, 0, 5, 0, 0, 0,\n\t0, 0, 0, 0, 5, 0, 0, 0, 0, 0,\n\t0, 0, 0, 0, 0, 0, 0, 0, 0, 0,\n\t0, 0, 0, 0, 0, 5, 0, 0, 0, 0,\n\t0, 0, 0, 0, 0, 0, 0, 0, 0, 0,\n\t0, 0, 0, 0, 0, 0, 0, 0, 1, 4,\n\t0, 0, 0, 0, 0, 0, 0, 0, 4, 2,\n}\nlocal row_count = 10\nlocal col_count = 10\n]]--\nlocal locations = {\u000b\t5, 5, 0, 0, 0,\n\t0, 0, 5, 0, 0,\n\t0, 0, 0, 0, 0,\n\t0, 0, 0, 0, 4,\n\t0, 0, 0, 2, 1,\n}\nlocal row_count = 5\nlocal col_count = 5\n\nlocal allies = {}\nlocal enemies = {}\n--local bias = Vector3(0,0,0) -- Vector3(-20, -20, 0) --Vector3(row_count * grid_width, col_count * grid_height, 0)\n\nlocal units_on_map = {}\n\nfor i=0, #locations - 1 do\n\tlocal location = locations[i + 1]\n\tlocal entity = nil\n\tlocal is_enemy = false\n\t\n\tif location == 0 then\n\t\ttable.insert(units_on_map, 0)\n\t\t\n\t\tgoto skip_to_next\t\n\telseif location == 1 then\n\t\tentity = _EntityService:GetEntityByPath(\"/maps/map01/UnitLeeSungKye\")\n\t\tentity.NameTagComponent.Name = \"이성계\"\n\telseif location == 2 then\n\t\tentity = _EntityService:GetEntityByPath(\"/maps/map01/UnitTuntra\")\n\t\tentity.NameTagComponent.Name = \"툰트라\"\n\telseif location == 3 then\n\t\tentity = _EntityService:GetEntityByPath(\"/maps/map01/UnitParkWei\")\n\t\tentity.NameTagComponent.Name = \"박의\"\n\t\tis_enemy = true\n\telseif location == 4 then\n\t\tentity = _EntityService:GetEntityByPath(\"/maps/map01/UnitMilitia0\")\n\t\tentity.NameTagComponent.Name = \"여진족\"\n\telseif location == 5 then\n\t\tentity = _EntityService:GetEntityByPath(\"/maps/map01/UnitRebel0\")\n\t\tentity.NameTagComponent.Name = \"반란군\"\n\t\tis_enemy = true\n\telseif location == nil then\n\t\ttable.insert(units_on_map, 0)\n\n\t\tgoto skip_to_next\n\tend\n\t\n\tentity.Enable = false\n\t\n\tlocal y = i / row_count\n\ty = math.floor(y)\n\t\n\tlocal x = i - math.floor(i / row_count) * row_count\n\t\n\tentity = entity:Clone()\n\ttable.insert(units_on_map, entity.Id)\n\t\n\tlocal entity_pos = Vector3(x * self.GridSize.x, y * -self.GridSize.y, 0) --+ bias\n\tentity.TransformComponent.WorldPosition = entity_pos\n\tentity.UnitCommon.LocationAtMap = Vector2(x, y)\n\tentity.UnitCommon:SetUnitType(location)\n\tentity.UnitCommon.Properties.Stage = \"playing 1\"\n\t\n\t--table.insert(self.entities, entity)\n\t\n\tif is_enemy == true then\n\t\tentity.SpriteRendererComponent.Color = Color(0.5, 0.5, 0.5, 1)\n\t\tentity.SpriteRendererComponent.FlipX = true\n\t\t\n\t\ttable.insert(enemies, entity)\n\telse\n\t\ttable.insert(allies, entity)\n\tend\n\t\n\tif location == 2 then\n\t\t_UserService.LocalPlayer.TransformComponent.WorldPosition = entity_pos\n\tend\n\t\n\t::skip_to_next::\nend\n\nif #units_on_map == #locations then\n\tself.turn_mgr.TurnManager.Allies = allies\n\tself.turn_mgr.TurnManager.Enemies = enemies\n\tself.turn_mgr.TurnManager.Map = units_on_map\n\tself.turn_mgr.TurnManager.MapSize = Vector2(row_count, col_count)\n\tself.turn_mgr.TurnManager.GridSize = self.GridSize\nelse\n\tlog_error(\"Map size must equal to locations\")\nend",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    }
  ],
  "EventEmitters": [],
  "EventHandlers": [],
  "EntityEventHandlers": []
}8�ɖ����
 519ac1f6f3324163aab64d6bec4e9c21 f517bc8999ee44ad81995015f3829cdc0codeblock://ed09ea46-6c2d-4bbe-a652-2b1591215d3b"x-mod/codeblock2��{
  "CoreVersion": {
    "Major": 0,
    "Minor": 2
  },
  "ScriptVersion": {
    "Major": 1,
    "Minor": 0
  },
  "Description": "",
  "Id": "ed09ea46-6c2d-4bbe-a652-2b1591215d3b",
  "Language": 1,
  "Name": "StateIntroSkip",
  "Type": 1,
  "Source": 0,
  "Target": null,
  "Properties": [],
  "Methods": [],
  "EventEmitters": [],
  "EventHandlers": [],
  "EntityEventHandlers": [
    {
      "Name": "HandleButtonClickEvent",
      "EventName": "ButtonClickEvent",
      "Target": "self",
      "Code": "local state_mgr = _EntityService:GetEntityByPath(\"/common/StateManager\")\nstate_mgr.StateManager:OnStateChanged(\"Game01\")"
    }
  ]
}8���ڻ��J ea7b5e2f5b954d2a91081bd74c503955�
 c915ddd3d9ac434fa12c6659fa610a01 f517bc8999ee44ad81995015f3829cdc0codeblock://edca7f76-cf30-470e-85ae-c382d16855f0"x-mod/codeblock2��{
  "CoreVersion": {
    "Major": 0,
    "Minor": 2
  },
  "ScriptVersion": {
    "Major": 1,
    "Minor": 0
  },
  "Description": "",
  "Id": "edca7f76-cf30-470e-85ae-c382d16855f0",
  "Language": 1,
  "Name": "StateIntro",
  "Type": 1,
  "Source": 0,
  "Target": null,
  "Properties": [
    {
      "Name": "line_count",
      "Type": "number",
      "DefaultValue": "1",
      "Description": null,
      "SyncDirection": 0
    },
    {
      "Name": "dialog_table",
      "Type": "any",
      "DefaultValue": "nil",
      "Description": null,
      "SyncDirection": 0
    },
    {
      "Name": "text_ctrl",
      "Type": "any",
      "DefaultValue": "nil",
      "Description": null,
      "SyncDirection": 0
    },
    {
      "Name": "ui",
      "Type": "any",
      "DefaultValue": "nil",
      "Description": null,
      "SyncDirection": 0
    },
    {
      "Name": "background",
      "Type": "any",
      "DefaultValue": "nil",
      "Description": null,
      "SyncDirection": 0
    }
  ],
  "Methods": [
    {
      "Name": "OnStateEntered",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [],
      "Code": "local ui = self.ui\n\n--ui.UIGroupComponent.DefaultShow = true\nui.Visible = true\nui.Enable = true\n\nself.line_count = 0\n\nself:ShowDialog()",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "OnStateLeft",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [],
      "Code": "local ui = self.ui\n\n--ui.UIGroupComponent.DefaultShow = false\nui.Visible = false\nui.Enable = false",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "OnNextDialogSubmit",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": null,
      "Code": "self.line_count = self.line_count + 1\n\nif self:ShowDialog() == true then\n\tlocal state_mgr = _EntityService:GetEntityByPath(\"/common/StateManager\")\n\tstate_mgr.StateManager:OnStateChanged(\"Game01\")\nend",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "OnBeginPlay",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": null,
      "Code": "self.dialog_table = _DataService:GetTable(\"IntroDialog\")\nself.text_ctrl = _EntityService:GetEntityByPath(\"/ui/UIDialog/UiDialogTxt\")\nself.ui = _EntityService:GetEntityByPath(\"/ui/UIDialog\")\n--self.ui.Visible = false\nself.ui.Enable = false\n\nself.Entity.Enable = false",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 2
    },
    {
      "Name": "ShowDialog",
      "Return": {
        "Name": null,
        "Type": "boolean",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": null,
      "Code": "local line_count = self.line_count + 1\nlocal role = self.dialog_table:GetCell(line_count, \"role\")\nlocal text = self.dialog_table:GetCell(line_count, \"dialog\")\n\nif role == nil or text == nil then\n\treturn true\nend\n\nself.text_ctrl.TextComponent.Text = role .. \": \" .. text\nreturn false",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    }
  ],
  "EventEmitters": [],
  "EventHandlers": [],
  "EntityEventHandlers": []
}8���ڻ��J 21052ea41df049eea53460f88bcc60d1�
 3f07faa8ef954d9dabc9699520f89342 f517bc8999ee44ad81995015f3829cdc0codeblock://f08a2228-bf6f-43e5-bf3b-80dd85e99d72"x-mod/codeblock2��{
  "CoreVersion": {
    "Major": 0,
    "Minor": 2
  },
  "ScriptVersion": {
    "Major": 1,
    "Minor": 0
  },
  "Description": "",
  "Id": "f08a2228-bf6f-43e5-bf3b-80dd85e99d72",
  "Language": 1,
  "Name": "StateTitle",
  "Type": 1,
  "Source": 0,
  "Target": null,
  "Properties": [],
  "Methods": [
    {
      "Name": "OnStateEntered",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": null,
      "Code": "--[[\nOnStateEntered is called when StateManager is in OnBeginPlay(). StateTitle component may not be in this state.\nTherefore you should get entity on runtime. Don't get reference on OnBeginPlay().\nBut other states are enabled such things.\n]]--\nlocal ui = _EntityService:GetEntityByPath(\"/ui/UITitle\")\nui.UIGroupComponent.DefaultShow = true\nui.Enable = true\n--ui.Visible = true\n\nlocal background = _EntityService:GetEntityByPath(\"/maps/map01/BackGroundTemplate\")\nbackground.Enable = true\n\nself.Entity.Enable = true\n",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "OnStateLeft",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": null,
      "Code": "local ui = _EntityService:GetEntityByPath(\"/ui/UITitle\")\nui.UIGroupComponent.DefaultShow = false\nui.Enable = false\n\nlocal background = _EntityService:GetEntityByPath(\"/maps/map01/BackGroundTemplate\")\nbackground.Enable = false\n\nself.Entity.Enable = false",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "OnBeginPlay",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": null,
      "Code": "local player = _UserService.LocalPlayer\nplayer.TransformComponent.WorldPosition = player.TransformComponent.WorldPosition + Vector3(100, 0, 0)",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 2
    }
  ],
  "EventEmitters": [],
  "EventHandlers": [],
  "EntityEventHandlers": []
}8���ڻ��J 7883327ac86c4aa4937b51fb6d114426�
 02b331b10a514d46983f37ce4819c34d f517bc8999ee44ad81995015f3829cdc0codeblock://f8c8a9fa-0378-43fa-aab1-b93b28d7e984"x-mod/codeblock2��{
  "CoreVersion": {
    "Major": 0,
    "Minor": 2
  },
  "ScriptVersion": {
    "Major": 1,
    "Minor": 0
  },
  "Description": "",
  "Id": "f8c8a9fa-0378-43fa-aab1-b93b28d7e984",
  "Language": 1,
  "Name": "EventStateChanged",
  "Type": 3,
  "Source": 0,
  "Target": null,
  "Properties": [
    {
      "Name": "State",
      "Type": "string",
      "DefaultValue": "\"\"",
      "Description": null,
      "SyncDirection": 3
    }
  ],
  "Methods": [],
  "EventEmitters": [],
  "EventHandlers": [],
  "EntityEventHandlers": []
}8���ڻ��J 3aa469a171b14a8ca7ee4b03f9a0ec2c�
 886b1c51784245aab015ee9e38dbda98 f517bc8999ee44ad81995015f3829cdc0codeblock://fafbedc4-d0a3-4d9d-9972-b39ce2a9bdd9"x-mod/codeblock2��{
  "CoreVersion": {
    "Major": 0,
    "Minor": 2
  },
  "ScriptVersion": {
    "Major": 1,
    "Minor": 0
  },
  "Description": "",
  "Id": "fafbedc4-d0a3-4d9d-9972-b39ce2a9bdd9",
  "Language": 1,
  "Name": "EventUnitSelected",
  "Type": 3,
  "Source": 0,
  "Target": null,
  "Properties": [
    {
      "Name": "entity",
      "Type": "Entity",
      "DefaultValue": "nil",
      "Description": null,
      "SyncDirection": 3
    }
  ],
  "Methods": [],
  "EventEmitters": [],
  "EventHandlers": [],
  "EntityEventHandlers": []
}8���ڻ��J 08d5ec27adb64408a0c94f6f71f764d2��
 2f8db02383a64282995b42741c1aebfd f517bc8999ee44ad81995015f3829cdc,gamelogic://ea985b77b39e436f92266c9d05932a1e"x-mod/gamelogic2���
$151019e6-987d-4f44-8df5-8d16b8caf87c/common�{
  "name": "common",
  "path": "/common",
  "nameEditable": false,
  "enable": true,
  "visible": true,
  "@components": [],
  "@version": 1
}� 
$5b7768ba-2b06-4cdf-9856-f7a8094daa39/common/TurnManager�{
  "name": "TurnManager",
  "path": "/common/TurnManager",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryNpc$0128a26235c14684ba21c4b9c1035dea",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 4.68236828,
        "y": 2.21064568,
        "z": 3999.989
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.TransformComponent"
    },
    {
      "SpriteRUID": "0d5c8a6c27b0436b90d581ba9ca39c38",
      "LocalPosition": {
        "x": 0.0,
        "y": 0.0
      },
      "LocalRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "LocalScale": {
        "x": 1.0,
        "y": 1.0
      },
      "SlicedSize": {
        "x": 0.0,
        "y": 0.0
      },
      "TiledSize": {
        "x": 1.0,
        "y": 1.0
      },
      "Color": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "FlipX": false,
      "FlipY": false,
      "SortingLayer": "MapLayer0",
      "OrderInLayer": 2,
      "DrawMode": 0,
      "RenderSetting": 2,
      "StartFrameIndex": 0,
      "EndFrameIndex": 2147483647,
      "PlayRate": 0.0,
      "ActionSheet": {
        "stand": "0d5c8a6c27b0436b90d581ba9ca39c38",
        "say": "78717fdd497b43c7acbbf7f64562ed2d",
        "eye": "69f7393f045f4d09b7e881b2bcb8a17b",
        "turn": "ad09e3b95594497098be435a2f1024b1"
      },
      "Enable": true,
      "@type": "MOD.Core.SpriteRendererComponent"
    },
    {
      "isQuaterViewMove": false,
      "QuaterViewAccelX": 1.0,
      "QuaterViewAccelY": 1.0,
      "MoveVelocity": {
        "x": 0.0,
        "y": 0.0
      },
      "realMoveVelocity": {
        "x": 0.0,
        "y": 0.0
      },
      "DownJumpSpeed": 3.3,
      "WalkAcc": 0.5,
      "WalkSpeed": 0.5,
      "WalkDrag": 1000.0,
      "WalkSlant": 0.9,
      "Gravity": 1.0,
      "Mass": 100.0,
      "IsolatedMove": true,
      "IsSwimming": false,
      "WalkJump": 1.0,
      "IsBlockVerticalLine": false,
      "IgnoreMoveBoundary": false,
      "Enable": false,
      "@type": "MOD.Core.RigidbodyComponent"
    },
    {
      "InputSpeed": 1.0,
      "JumpForce": 0.0,
      "Enable": true,
      "@type": "MOD.Core.MonsterMovementComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateComponent"
    },
    {
      "ChatModeEnabled": false,
      "FontColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "ChatBalloonRUID": {
        "DataId": "7b6bd117bd0446a5bacec8ea6831c997"
      },
      "Message": "",
      "Offset": 0,
      "ArrowChat": true,
      "AutoShowEnabled": false,
      "AutoHideBalloonDelay": 5.0,
      "AutoShowBalloonDelay": 5.0,
      "BallonScale": 1.0,
      "FontSize": 1.0,
      "Enable": true,
      "@type": "MOD.Core.ChatBalloonComponent"
    },
    {
      "FontColor": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "NameTagRUID": {
        "DataId": "9bf18287398c44699c20fc5123d1a1ae"
      },
      "Name": "TurnManager",
      "FontSize": 1.0,
      "OffsetY": 0.0,
      "Enable": true,
      "@type": "MOD.Core.NameTagComponent"
    },
    {
      "MapSize": {
        "x": 0.0,
        "y": 0.0
      },
      "GridSize": {
        "x": 0.0,
        "y": 0.0
      },
      "Enable": true,
      "@type": "script.TurnManager"
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.StateComponent,MOD.Core.ChatBalloonComponent,MOD.Core.NameTagComponent,script.TurnManager�
$f2f87168-d18f-4839-a474-9c140aab7476/common/CameraManager�{
  "name": "CameraManager",
  "path": "/common/CameraManager",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryNpc$00c96a0e2cb54372900c214eff2d6047",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 3.3294,
        "y": 0.9587,
        "z": 999.994
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.TransformComponent"
    },
    {
      "SpriteRUID": "027db54a4df74437b57a12d3c10d83ac",
      "LocalPosition": {
        "x": 0.0,
        "y": 0.0
      },
      "LocalRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "LocalScale": {
        "x": 1.0,
        "y": 1.0
      },
      "SlicedSize": {
        "x": 0.0,
        "y": 0.0
      },
      "TiledSize": {
        "x": 1.0,
        "y": 1.0
      },
      "Color": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "FlipX": true,
      "FlipY": false,
      "SortingLayer": "MapLayer0",
      "OrderInLayer": 2,
      "DrawMode": 0,
      "RenderSetting": 2,
      "StartFrameIndex": 0,
      "EndFrameIndex": 2147483647,
      "PlayRate": 0.0,
      "ActionSheet": {
        "stand": "027db54a4df74437b57a12d3c10d83ac",
        "move": "ce3e951818014b33bfb5c4568e9647b5"
      },
      "Enable": true,
      "@type": "MOD.Core.SpriteRendererComponent"
    },
    {
      "isQuaterViewMove": false,
      "QuaterViewAccelX": 1.0,
      "QuaterViewAccelY": 1.0,
      "MoveVelocity": {
        "x": 0.0,
        "y": 0.0
      },
      "realMoveVelocity": {
        "x": 0.0,
        "y": 0.0
      },
      "DownJumpSpeed": 3.3,
      "WalkAcc": 0.5,
      "WalkSpeed": 0.5,
      "WalkDrag": 1000.0,
      "WalkSlant": 0.9,
      "Gravity": 1.0,
      "Mass": 100.0,
      "IsolatedMove": true,
      "IsSwimming": false,
      "WalkJump": 1.0,
      "IsBlockVerticalLine": false,
      "IgnoreMoveBoundary": false,
      "Enable": false,
      "@type": "MOD.Core.RigidbodyComponent"
    },
    {
      "InputSpeed": 1.0,
      "JumpForce": 0.0,
      "Enable": true,
      "@type": "MOD.Core.MonsterMovementComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateComponent"
    },
    {
      "ChatModeEnabled": false,
      "FontColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "ChatBalloonRUID": {
        "DataId": "7b6bd117bd0446a5bacec8ea6831c997"
      },
      "Message": "",
      "Offset": 0,
      "ArrowChat": true,
      "AutoShowEnabled": false,
      "AutoHideBalloonDelay": 5.0,
      "AutoShowBalloonDelay": 5.0,
      "BallonScale": 1.0,
      "FontSize": 1.0,
      "Enable": true,
      "@type": "MOD.Core.ChatBalloonComponent"
    },
    {
      "FontColor": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "NameTagRUID": {
        "DataId": "9bf18287398c44699c20fc5123d1a1ae"
      },
      "Name": "StateCameraCtrl",
      "FontSize": 1.0,
      "OffsetY": 0.0,
      "Enable": true,
      "@type": "MOD.Core.NameTagComponent"
    },
    {
      "Enable": true,
      "@type": "script.CameraManager"
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.StateComponent,MOD.Core.ChatBalloonComponent,MOD.Core.NameTagComponent,script.CameraManager�
$eb3c4cba-bb85-40e0-9c85-48666470d21c/common/StateTitle�{
  "name": "StateTitle",
  "path": "/common/StateTitle",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryNpc$0087ca01ac7b49afa0a87158521fd38f",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 3.35668516,
        "y": 3.52386975,
        "z": 999.998
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.TransformComponent"
    },
    {
      "SpriteRUID": "ef82693043724e26a25f4fe715867c91",
      "LocalPosition": {
        "x": 0.0,
        "y": 0.0
      },
      "LocalRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "LocalScale": {
        "x": 1.0,
        "y": 1.0
      },
      "SlicedSize": {
        "x": 0.0,
        "y": 0.0
      },
      "TiledSize": {
        "x": 1.0,
        "y": 1.0
      },
      "Color": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "FlipX": false,
      "FlipY": false,
      "SortingLayer": "MapLayer0",
      "OrderInLayer": 2,
      "DrawMode": 0,
      "RenderSetting": 2,
      "StartFrameIndex": 0,
      "EndFrameIndex": 2147483647,
      "PlayRate": 0.0,
      "ActionSheet": {
        "stand": "ef82693043724e26a25f4fe715867c91",
        "eye": "b2b40638cc81466c8a7b572d484aeeb7"
      },
      "Enable": true,
      "@type": "MOD.Core.SpriteRendererComponent"
    },
    {
      "isQuaterViewMove": false,
      "QuaterViewAccelX": 1.0,
      "QuaterViewAccelY": 1.0,
      "MoveVelocity": {
        "x": 0.0,
        "y": 0.0
      },
      "realMoveVelocity": {
        "x": 0.0,
        "y": 0.0
      },
      "DownJumpSpeed": 3.3,
      "WalkAcc": 0.5,
      "WalkSpeed": 0.5,
      "WalkDrag": 1000.0,
      "WalkSlant": 0.9,
      "Gravity": 1.0,
      "Mass": 100.0,
      "IsolatedMove": true,
      "IsSwimming": false,
      "WalkJump": 1.0,
      "IsBlockVerticalLine": false,
      "IgnoreMoveBoundary": false,
      "Enable": false,
      "@type": "MOD.Core.RigidbodyComponent"
    },
    {
      "InputSpeed": 1.0,
      "JumpForce": 0.0,
      "Enable": true,
      "@type": "MOD.Core.MonsterMovementComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateComponent"
    },
    {
      "ChatModeEnabled": false,
      "FontColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "ChatBalloonRUID": {
        "DataId": "7b6bd117bd0446a5bacec8ea6831c997"
      },
      "Message": "",
      "Offset": 0,
      "ArrowChat": true,
      "AutoShowEnabled": false,
      "AutoHideBalloonDelay": 5.0,
      "AutoShowBalloonDelay": 5.0,
      "BallonScale": 1.0,
      "FontSize": 1.0,
      "Enable": true,
      "@type": "MOD.Core.ChatBalloonComponent"
    },
    {
      "FontColor": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "NameTagRUID": {
        "DataId": "9bf18287398c44699c20fc5123d1a1ae"
      },
      "Name": "StateTitle",
      "FontSize": 1.0,
      "OffsetY": 0.0,
      "Enable": true,
      "@type": "MOD.Core.NameTagComponent"
    },
    {
      "Enable": true,
      "@type": "script.StateTitle"
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.StateComponent,MOD.Core.ChatBalloonComponent,MOD.Core.NameTagComponent,script.StateTitle�
$07134abe-519a-4cdd-a0f4-c726db8dafe0/common/StateIntro�{
  "name": "StateIntro",
  "path": "/common/StateIntro",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryNpc$00d05bcb44a14e688eeaa3a7548fa45b",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 4.48268557,
        "y": 3.42897,
        "z": 999.997
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.TransformComponent"
    },
    {
      "SpriteRUID": "c7a3e1ef679e44ccbb9d6bf75f56d892",
      "LocalPosition": {
        "x": 0.0,
        "y": 0.0
      },
      "LocalRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "LocalScale": {
        "x": 1.0,
        "y": 1.0
      },
      "SlicedSize": {
        "x": 0.0,
        "y": 0.0
      },
      "TiledSize": {
        "x": 1.0,
        "y": 1.0
      },
      "Color": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "FlipX": false,
      "FlipY": false,
      "SortingLayer": "MapLayer0",
      "OrderInLayer": 2,
      "DrawMode": 0,
      "RenderSetting": 2,
      "StartFrameIndex": 0,
      "EndFrameIndex": 2147483647,
      "PlayRate": 0.0,
      "ActionSheet": {
        "stand": "c7a3e1ef679e44ccbb9d6bf75f56d892",
        "say": "f4357db7e86f4b85aeacc2802eb2b2bb",
        "laugh": "cf5e108519c74bed863599622062d153"
      },
      "Enable": true,
      "@type": "MOD.Core.SpriteRendererComponent"
    },
    {
      "isQuaterViewMove": false,
      "QuaterViewAccelX": 1.0,
      "QuaterViewAccelY": 1.0,
      "MoveVelocity": {
        "x": 0.0,
        "y": 0.0
      },
      "realMoveVelocity": {
        "x": 0.0,
        "y": 0.0
      },
      "DownJumpSpeed": 3.3,
      "WalkAcc": 0.5,
      "WalkSpeed": 0.5,
      "WalkDrag": 1000.0,
      "WalkSlant": 0.9,
      "Gravity": 1.0,
      "Mass": 100.0,
      "IsolatedMove": true,
      "IsSwimming": false,
      "WalkJump": 1.0,
      "IsBlockVerticalLine": false,
      "IgnoreMoveBoundary": false,
      "Enable": false,
      "@type": "MOD.Core.RigidbodyComponent"
    },
    {
      "InputSpeed": 1.0,
      "JumpForce": 0.0,
      "Enable": true,
      "@type": "MOD.Core.MonsterMovementComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateComponent"
    },
    {
      "ChatModeEnabled": false,
      "FontColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "ChatBalloonRUID": {
        "DataId": "7b6bd117bd0446a5bacec8ea6831c997"
      },
      "Message": "",
      "Offset": 0,
      "ArrowChat": true,
      "AutoShowEnabled": false,
      "AutoHideBalloonDelay": 5.0,
      "AutoShowBalloonDelay": 5.0,
      "BallonScale": 1.0,
      "FontSize": 1.0,
      "Enable": true,
      "@type": "MOD.Core.ChatBalloonComponent"
    },
    {
      "FontColor": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "NameTagRUID": {
        "DataId": "9bf18287398c44699c20fc5123d1a1ae"
      },
      "Name": "StateIntro",
      "FontSize": 1.0,
      "OffsetY": 0.0,
      "Enable": true,
      "@type": "MOD.Core.NameTagComponent"
    },
    {
      "line_count": 14.0,
      "Enable": true,
      "@type": "script.StateIntro"
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.StateComponent,MOD.Core.ChatBalloonComponent,MOD.Core.NameTagComponent,script.StateIntro� 
$0828116b-5e82-4e57-80dd-21c75d14c157/common/StateGame01�{
  "name": "StateGame01",
  "path": "/common/StateGame01",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryNpc$003245a8ce3f46f4824aef43968d1413",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 3.773488,
        "y": 2.0735724,
        "z": 999.999
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.TransformComponent"
    },
    {
      "SpriteRUID": "2f7a9b2fdac5490da24243120783e06b",
      "LocalPosition": {
        "x": 0.0,
        "y": 0.0
      },
      "LocalRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "LocalScale": {
        "x": 1.0,
        "y": 1.0
      },
      "SlicedSize": {
        "x": 0.0,
        "y": 0.0
      },
      "TiledSize": {
        "x": 1.0,
        "y": 1.0
      },
      "Color": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "FlipX": false,
      "FlipY": false,
      "SortingLayer": "MapLayer0",
      "OrderInLayer": 2,
      "DrawMode": 0,
      "RenderSetting": 2,
      "StartFrameIndex": 0,
      "EndFrameIndex": 2147483647,
      "PlayRate": 0.0,
      "ActionSheet": {
        "stand": "2f7a9b2fdac5490da24243120783e06b",
        "eye": "f7de3b51fd5c491286661f2be85a6cea",
        "smile": "5a5c1fc2cbc74e50ad90dca73e11cb52",
        "say": "0b4b5f4cb6294d898c57f948b4be2b1a",
        "move": "dcba60f89d07406ea0e095219aadc489"
      },
      "Enable": true,
      "@type": "MOD.Core.SpriteRendererComponent"
    },
    {
      "isQuaterViewMove": false,
      "QuaterViewAccelX": 1.0,
      "QuaterViewAccelY": 1.0,
      "MoveVelocity": {
        "x": 0.0,
        "y": 0.0
      },
      "realMoveVelocity": {
        "x": 0.0,
        "y": 0.0
      },
      "DownJumpSpeed": 3.3,
      "WalkAcc": 0.5,
      "WalkSpeed": 0.5,
      "WalkDrag": 1000.0,
      "WalkSlant": 0.9,
      "Gravity": 1.0,
      "Mass": 100.0,
      "IsolatedMove": true,
      "IsSwimming": false,
      "WalkJump": 1.0,
      "IsBlockVerticalLine": false,
      "IgnoreMoveBoundary": false,
      "Enable": false,
      "@type": "MOD.Core.RigidbodyComponent"
    },
    {
      "InputSpeed": 1.0,
      "JumpForce": 0.0,
      "Enable": true,
      "@type": "MOD.Core.MonsterMovementComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateComponent"
    },
    {
      "ChatModeEnabled": false,
      "FontColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "ChatBalloonRUID": {
        "DataId": "7b6bd117bd0446a5bacec8ea6831c997"
      },
      "Message": "",
      "Offset": 0,
      "ArrowChat": true,
      "AutoShowEnabled": false,
      "AutoHideBalloonDelay": 5.0,
      "AutoShowBalloonDelay": 5.0,
      "BallonScale": 1.0,
      "FontSize": 1.0,
      "Enable": true,
      "@type": "MOD.Core.ChatBalloonComponent"
    },
    {
      "FontColor": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "NameTagRUID": {
        "DataId": "9bf18287398c44699c20fc5123d1a1ae"
      },
      "Name": "StateGame01",
      "FontSize": 1.0,
      "OffsetY": 0.0,
      "Enable": true,
      "@type": "MOD.Core.NameTagComponent"
    },
    {
      "GridSize": {
        "x": 0.0,
        "y": 0.0
      },
      "Enable": true,
      "@type": "script.StateGame01"
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.StateComponent,MOD.Core.ChatBalloonComponent,MOD.Core.NameTagComponent,script.StateGame01�
$bf409efb-e2de-439b-94bc-b8887e1d70e9/common/StateManager�{
  "name": "StateManager",
  "path": "/common/StateManager",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryNpc$763d2d6d0986419b922b59c58bc15e38",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 2.13881969,
        "y": 3.58614659,
        "z": 999.999
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.TransformComponent"
    },
    {
      "SpriteRUID": "fb46d593bfef4942ad6a113f85eddfe2",
      "LocalPosition": {
        "x": 0.0,
        "y": 0.0
      },
      "LocalRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "LocalScale": {
        "x": 1.0,
        "y": 1.0
      },
      "SlicedSize": {
        "x": 0.0,
        "y": 0.0
      },
      "TiledSize": {
        "x": 1.0,
        "y": 1.0
      },
      "Color": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "FlipX": false,
      "FlipY": false,
      "SortingLayer": "MapLayer0",
      "OrderInLayer": 2,
      "DrawMode": 0,
      "RenderSetting": 2,
      "StartFrameIndex": 0,
      "EndFrameIndex": 2147483647,
      "PlayRate": 0.0,
      "ActionSheet": {
        "stand": "fb46d593bfef4942ad6a113f85eddfe2",
        "move": "4aa6b88b72504119afc3bf3a1fdc9ca3",
        "eye": "3a249d6f936148b8b0d52b5ae7aaf230",
        "say": "8fa0334084744727ab91e4c8bba200b5"
      },
      "Enable": true,
      "@type": "MOD.Core.SpriteRendererComponent"
    },
    {
      "isQuaterViewMove": false,
      "QuaterViewAccelX": 1.0,
      "QuaterViewAccelY": 1.0,
      "MoveVelocity": {
        "x": 0.0,
        "y": 0.0
      },
      "realMoveVelocity": {
        "x": 0.0,
        "y": 0.0
      },
      "DownJumpSpeed": 3.3,
      "WalkAcc": 0.5,
      "WalkSpeed": 0.5,
      "WalkDrag": 1000.0,
      "WalkSlant": 0.9,
      "Gravity": 1.0,
      "Mass": 100.0,
      "IsolatedMove": true,
      "IsSwimming": false,
      "WalkJump": 1.0,
      "IsBlockVerticalLine": false,
      "IgnoreMoveBoundary": false,
      "Enable": false,
      "@type": "MOD.Core.RigidbodyComponent"
    },
    {
      "InputSpeed": 1.0,
      "JumpForce": 0.0,
      "Enable": true,
      "@type": "MOD.Core.MonsterMovementComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateComponent"
    },
    {
      "ChatModeEnabled": false,
      "FontColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "ChatBalloonRUID": {
        "DataId": "7b6bd117bd0446a5bacec8ea6831c997"
      },
      "Message": "",
      "Offset": 0,
      "ArrowChat": true,
      "AutoShowEnabled": false,
      "AutoHideBalloonDelay": 5.0,
      "AutoShowBalloonDelay": 5.0,
      "BallonScale": 1.0,
      "FontSize": 1.0,
      "Enable": true,
      "@type": "MOD.Core.ChatBalloonComponent"
    },
    {
      "FontColor": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "NameTagRUID": {
        "DataId": "9bf18287398c44699c20fc5123d1a1ae"
      },
      "Name": "StateManager",
      "FontSize": 1.0,
      "OffsetY": 0.0,
      "Enable": true,
      "@type": "MOD.Core.NameTagComponent"
    },
    {
      "Enable": true,
      "@type": "script.StateManager"
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.StateComponent,MOD.Core.ChatBalloonComponent,MOD.Core.NameTagComponent,script.StateManager�
$71b1f7b1-10fe-486a-8570-58997c2bc218/common/TileAttackable�{
  "name": "TileAttackable",
  "path": "/common/TileAttackable",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMapObject$0671c9339aa8433f89dbb15b854f4ec7",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": -4.596125,
        "y": 1.65346074,
        "z": 999.994
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.TransformComponent"
    },
    {
      "SpriteRUID": "5150d5e7692349f2b73953ff7bb2493f",
      "LocalPosition": {
        "x": 0.0,
        "y": 0.0
      },
      "LocalRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "LocalScale": {
        "x": 1.0,
        "y": 1.0
      },
      "SlicedSize": {
        "x": 0.0,
        "y": 0.0
      },
      "TiledSize": {
        "x": 1.0,
        "y": 1.0
      },
      "Color": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "FlipX": false,
      "FlipY": false,
      "SortingLayer": "MapLayer0",
      "OrderInLayer": 0,
      "DrawMode": 0,
      "RenderSetting": 0,
      "StartFrameIndex": 0,
      "EndFrameIndex": 4,
      "PlayRate": 1.0,
      "ActionSheet": {},
      "Enable": true,
      "@type": "MOD.Core.SpriteRendererComponent"
    },
    {
      "OnTouchEvent": {
        "type": [
          "MODEventEmitter",
          "MOD.Core.TouchEvent"
        ],
        "handlers": []
      },
      "DynamicTouchArea": true,
      "TouchAreaUpdateTime": 1.0,
      "Enable": true,
      "@type": "MOD.Core.TouchReceiveComponent"
    },
    {
      "EntityID": "",
      "RelPos": {
        "x": 0.0,
        "y": 0.0
      },
      "Enable": true,
      "@type": "script.TileAttackable"
    }
  ],
  "@version": 1
}"qMOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.TouchReceiveComponent,script.TileAttackable�
$d5d376dc-85f4-4003-80c3-1a78df49303b/common/TileMovable�{
  "name": "TileMovable",
  "path": "/common/TileMovable",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryTrap$4a7cef45d7374b1d99aa48d2a6899dd8",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 8.449887,
        "y": 9.981269,
        "z": 999.994
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.TransformComponent"
    },
    {
      "SpriteRUID": "fd508c1f701c45c1bc2cb9db995bb731",
      "LocalPosition": {
        "x": 0.0,
        "y": 0.0
      },
      "LocalRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "LocalScale": {
        "x": 1.0,
        "y": 1.0
      },
      "SlicedSize": {
        "x": 0.0,
        "y": 0.0
      },
      "TiledSize": {
        "x": 1.0,
        "y": 1.0
      },
      "Color": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "FlipX": false,
      "FlipY": false,
      "SortingLayer": "MapLayer0",
      "OrderInLayer": 0,
      "DrawMode": 0,
      "RenderSetting": 0,
      "StartFrameIndex": 0,
      "EndFrameIndex": 0,
      "PlayRate": 1.0,
      "ActionSheet": {},
      "Enable": true,
      "@type": "MOD.Core.SpriteRendererComponent"
    },
    {
      "OnTouchEvent": {
        "type": [
          "MODEventEmitter",
          "MOD.Core.TouchEvent"
        ],
        "handlers": []
      },
      "DynamicTouchArea": true,
      "TouchAreaUpdateTime": 1.0,
      "Enable": true,
      "@type": "MOD.Core.TouchReceiveComponent"
    },
    {
      "EntityID": "",
      "MapPos": {
        "x": 0.0,
        "y": 0.0
      },
      "Enable": true,
      "@type": "script.TileMovable"
    }
  ],
  "@version": 1
}"nMOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.TouchReceiveComponent,script.TileMovable8�۟�����
 acaffa42b1954917b18cb99778dea46b f517bc8999ee44ad81995015f3829cdcmap://map01"	x-mod/map2���
 ec7e2380d47b41f2839d7779c19bea03/maps/map01�{
  "name": "map01",
  "path": "/maps/map01",
  "nameEditable": false,
  "enable": true,
  "visible": true,
  "@components": [
    {
      "Enable": true,
      "@type": "MOD.Core.MapComponent"
    },
    {
      "Walk": 1.0,
      "Drag": 1.0,
      "Gravity": 1.0,
      "SpeedMaxFactor": 1.0,
      "MidAirAccelX": 1.0,
      "MidAirDecelX": 1.0,
      "FreeFallingVelocityMaxXFactor": 1.0,
      "Enable": true,
      "@type": "MOD.Core.MapPropertyComponent"
    },
    {
      "footholdsByLayer": {},
      "Enable": true,
      "@type": "MOD.Core.FootholdComponent"
    }
  ],
  "@version": 1
}"NMOD.Core.MapComponent,MOD.Core.MapPropertyComponent,MOD.Core.FootholdComponent�
$0b53bb9a-a08c-411f-9932-37442d90f6c5/maps/map01/BackGroundTemplate�{
  "name": "BackGroundTemplate",
  "path": "/maps/map01/BackGroundTemplate",
  "nameEditable": false,
  "enable": true,
  "visible": true,
  "@components": [
    {
      "backgroundColors": [
        {
          "r": 0.5647059,
          "g": 0.07450981,
          "b": 0.996078432,
          "a": 1.0
        },
        {
          "r": 0.211764708,
          "g": 0.458823532,
          "b": 0.0196078438,
          "a": 1.0
        },
        {
          "r": 0.494117647,
          "g": 0.827451,
          "b": 0.129411772,
          "a": 1.0
        },
        {
          "r": 0.549019635,
          "g": 0.34117648,
          "b": 0.164705887,
          "a": 1.0
        },
        {
          "r": 0.972549,
          "g": 0.905882359,
          "b": 0.109803922,
          "a": 1.0
        },
        {
          "r": 0.9607843,
          "g": 0.65882355,
          "b": 0.156862751,
          "a": 1.0
        },
        {
          "r": 0.8156863,
          "g": 0.003921569,
          "b": 0.105882354,
          "a": 1.0
        }
      ],
      "BackType": 1,
      "MapRUID": "643b5ff2ff2647a18f94b9829898e7d2",
      "SolidColor": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "BackgroundUrl": "ad2caa046bba40de96e65063784f8ec3",
      "Enable": true,
      "@type": "MOD.Core.BackgroundTemplateComponent"
    }
  ],
  "@version": 1
}"$MOD.Core.BackgroundTemplateComponent�
$5b1c09be-6044-4b5b-b1e0-e011d7a6e433/maps/map01/MapleMapLayer�
{
  "name": "MapleMapLayer",
  "path": "/maps/map01/MapleMapLayer",
  "nameEditable": false,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleMapLayer",
    "sub_entity_id": null
  },
  "@components": [
    {
      "thumbnail": "iVBORw0KGgoAAAANSUhEUgAAAMgAAABkCAYAAADDhn8LAAACeUlEQVR4Ae3XzSttURgH4O0YkI/UTTFgwMzAQBm4PupGPgcGysScZCzFTfkPDPwFpjIldTOWgYFu5xooEykZOOUjJnqdczHWObOzenbtWrX2ent/T63W2lnmIUCAAAECBAgQIECAAAECBAgQIECAAAECBAgQIECAAAECBAgQIECAAAECBAgQIECAAAECBAgQIECAAAECBAgQIECAAAECBAgQIECAAAECBAgQIECAAAECBAgQIECAAAECBAgQIECAAAECBAgQIECAAAECBAgQIECAAAECBAgQIECAAAECBAgQIECAAAECBAgQIECAAAECBAgQIECgKgVqqrLrxJqO/OSPrLNj/fWp0FzfHJG9tT5khZvtmq7D28SiikOgfIG4mBg83ssi7j/f2Im4mPpZfiUrCCQoEPlfTX397RGFjw0yNtJTiPOJxgSjVl2kXNV1nGLD9S0DpwejZ29RDFe89B79WbzOGnLDKUaViUBZAsU/jtzyQtvd/9Pj8wQpjdeWeu9Lc2UV8zGBFAUiPzR7tF+8Xn1tkMeZiL9D4ylmlYlARQIvV3O7/04+NsnL3cZuRUUsIpCqQFxO162udD9t/h5+Lo1TzSkXgYoFYivLxd58bcUFLCRAgAABAgQIECBAgAABAgQIECBAgAABAgQIECBAgAABAgQIECBAgAABAgQIECBAgAABAgQIECBAgAABAgQIECBAgAABAgQIECBAgAABAgQIECBAgAABAgQIECBAgAABAgQIECBAgAABAgQIECBAgAABAgQIECBAgAABAgQIECBAgAABAgQIECBAgAABAgQIECBAgAABAgQIECBAgAABAgQIfCvwDhZwblwOK+kyAAAAAElFTkSuQmCC",
      "MapLayerName": "Layer1",
      "LayerSortOrder": 0,
      "Enable": true,
      "@type": "MOD.Core.MapLayerComponent"
    }
  ],
  "@version": 1
}"MOD.Core.MapLayerComponent�#
$656f8d8f-59d5-448b-ac67-41aee412d517/maps/map01/UnitMilitia0� {
  "name": "UnitMilitia0",
  "path": "/maps/map01/UnitMilitia0",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryNpc$02ea4c0111444bd2abb5b97c812b93b7",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 5.921435,
        "y": 3.39468837,
        "z": 999.999
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.TransformComponent"
    },
    {
      "SpriteRUID": "eb2545e6725646b1b964796abdd7281c",
      "LocalPosition": {
        "x": 0.0,
        "y": 0.0
      },
      "LocalRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "LocalScale": {
        "x": 1.0,
        "y": 1.0
      },
      "SlicedSize": {
        "x": 0.0,
        "y": 0.0
      },
      "TiledSize": {
        "x": 1.0,
        "y": 1.0
      },
      "Color": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "FlipX": false,
      "FlipY": false,
      "SortingLayer": "MapLayer0",
      "OrderInLayer": 2,
      "DrawMode": 0,
      "RenderSetting": 2,
      "StartFrameIndex": 0,
      "EndFrameIndex": 2147483647,
      "PlayRate": 0.0,
      "ActionSheet": {
        "stand": "eb2545e6725646b1b964796abdd7281c",
        "say": "6bba1eb8f40f435c80db3dfe2b25479c"
      },
      "Enable": true,
      "@type": "MOD.Core.SpriteRendererComponent"
    },
    {
      "isQuaterViewMove": false,
      "QuaterViewAccelX": 1.0,
      "QuaterViewAccelY": 1.0,
      "MoveVelocity": {
        "x": 0.0,
        "y": 0.0
      },
      "realMoveVelocity": {
        "x": 0.0,
        "y": 0.0
      },
      "DownJumpSpeed": 3.3,
      "WalkAcc": 0.5,
      "WalkSpeed": 0.5,
      "WalkDrag": 1000.0,
      "WalkSlant": 0.9,
      "Gravity": 1.0,
      "Mass": 100.0,
      "IsolatedMove": true,
      "IsSwimming": false,
      "WalkJump": 1.0,
      "IsBlockVerticalLine": false,
      "IgnoreMoveBoundary": false,
      "Enable": false,
      "@type": "MOD.Core.RigidbodyComponent"
    },
    {
      "InputSpeed": 1.0,
      "JumpForce": 0.0,
      "Enable": false,
      "@type": "MOD.Core.MonsterMovementComponent"
    },
    {
      "Enable": false,
      "@type": "MOD.Core.StateComponent"
    },
    {
      "ChatModeEnabled": false,
      "FontColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "ChatBalloonRUID": {
        "DataId": "7b6bd117bd0446a5bacec8ea6831c997"
      },
      "Message": "",
      "Offset": 0,
      "ArrowChat": true,
      "AutoShowEnabled": true,
      "AutoHideBalloonDelay": 5.0,
      "AutoShowBalloonDelay": 5.0,
      "BallonScale": 1.0,
      "FontSize": 1.0,
      "Enable": true,
      "@type": "MOD.Core.ChatBalloonComponent"
    },
    {
      "FontColor": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "NameTagRUID": {
        "DataId": "9bf18287398c44699c20fc5123d1a1ae"
      },
      "Name": "여진족",
      "FontSize": 1.0,
      "OffsetY": 0.0,
      "Enable": true,
      "@type": "MOD.Core.NameTagComponent"
    },
    {
      "UnitType": 0.0,
      "MovableAreaSize": 0.0,
      "LocationAtMap": {
        "x": 0.0,
        "y": 0.0
      },
      "Moved": false,
      "Done": false,
      "AttackAreaSize": 0.0,
      "Enable": true,
      "@type": "script.UnitCommon"
    },
    {
      "OnTouchEvent": {
        "type": [
          "MODEventEmitter",
          "MOD.Core.TouchEvent"
        ],
        "handlers": []
      },
      "DynamicTouchArea": true,
      "TouchAreaUpdateTime": 1.0,
      "Enable": true,
      "@type": "MOD.Core.TouchReceiveComponent"
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.StateComponent,MOD.Core.ChatBalloonComponent,MOD.Core.NameTagComponent,script.UnitCommon,MOD.Core.TouchReceiveComponent�"
$96dc63cb-6116-46fe-b524-17a1a343681f/maps/map01/UnitRebel0� {
  "name": "UnitRebel0",
  "path": "/maps/map01/UnitRebel0",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryNpc$12183fda544d45cbbde14921de927017",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 5.79640436,
        "y": 2.30231071,
        "z": 999.998
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.TransformComponent"
    },
    {
      "SpriteRUID": "395c0d970b3f4c8588e8ec23bb015fd9",
      "LocalPosition": {
        "x": 0.0,
        "y": 0.0
      },
      "LocalRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "LocalScale": {
        "x": 1.0,
        "y": 1.0
      },
      "SlicedSize": {
        "x": 0.0,
        "y": 0.0
      },
      "TiledSize": {
        "x": 1.0,
        "y": 1.0
      },
      "Color": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "FlipX": false,
      "FlipY": false,
      "SortingLayer": "MapLayer0",
      "OrderInLayer": 2,
      "DrawMode": 0,
      "RenderSetting": 2,
      "StartFrameIndex": 0,
      "EndFrameIndex": 2147483647,
      "PlayRate": 0.0,
      "ActionSheet": {
        "stand": "395c0d970b3f4c8588e8ec23bb015fd9"
      },
      "Enable": true,
      "@type": "MOD.Core.SpriteRendererComponent"
    },
    {
      "isQuaterViewMove": false,
      "QuaterViewAccelX": 1.0,
      "QuaterViewAccelY": 1.0,
      "MoveVelocity": {
        "x": 0.0,
        "y": 0.0
      },
      "realMoveVelocity": {
        "x": 0.0,
        "y": 0.0
      },
      "DownJumpSpeed": 3.3,
      "WalkAcc": 0.5,
      "WalkSpeed": 0.5,
      "WalkDrag": 1000.0,
      "WalkSlant": 0.9,
      "Gravity": 1.0,
      "Mass": 100.0,
      "IsolatedMove": true,
      "IsSwimming": false,
      "WalkJump": 1.0,
      "IsBlockVerticalLine": false,
      "IgnoreMoveBoundary": false,
      "Enable": false,
      "@type": "MOD.Core.RigidbodyComponent"
    },
    {
      "InputSpeed": 1.0,
      "JumpForce": 0.0,
      "Enable": false,
      "@type": "MOD.Core.MonsterMovementComponent"
    },
    {
      "Enable": false,
      "@type": "MOD.Core.StateComponent"
    },
    {
      "ChatModeEnabled": false,
      "FontColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "ChatBalloonRUID": {
        "DataId": "7b6bd117bd0446a5bacec8ea6831c997"
      },
      "Message": "",
      "Offset": 0,
      "ArrowChat": true,
      "AutoShowEnabled": true,
      "AutoHideBalloonDelay": 5.0,
      "AutoShowBalloonDelay": 5.0,
      "BallonScale": 1.0,
      "FontSize": 1.0,
      "Enable": true,
      "@type": "MOD.Core.ChatBalloonComponent"
    },
    {
      "FontColor": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "NameTagRUID": {
        "DataId": "9bf18287398c44699c20fc5123d1a1ae"
      },
      "Name": "반란군",
      "FontSize": 1.0,
      "OffsetY": 0.0,
      "Enable": true,
      "@type": "MOD.Core.NameTagComponent"
    },
    {
      "UnitType": 0.0,
      "MovableAreaSize": 0.0,
      "LocationAtMap": {
        "x": 0.0,
        "y": 0.0
      },
      "Moved": false,
      "Done": false,
      "AttackAreaSize": 0.0,
      "Enable": true,
      "@type": "script.UnitCommon"
    },
    {
      "OnTouchEvent": {
        "type": [
          "MODEventEmitter",
          "MOD.Core.TouchEvent"
        ],
        "handlers": []
      },
      "DynamicTouchArea": true,
      "TouchAreaUpdateTime": 1.0,
      "Enable": true,
      "@type": "MOD.Core.TouchReceiveComponent"
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.StateComponent,MOD.Core.ChatBalloonComponent,MOD.Core.NameTagComponent,script.UnitCommon,MOD.Core.TouchReceiveComponent�$
$de3b6b2a-7174-455c-a67b-d4c601b5ea58/maps/map01/UnitLeeSungKye�!{
  "name": "UnitLeeSungKye",
  "path": "/maps/map01/UnitLeeSungKye",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryNpc$1bee4c666a4a494681d227313a2c576a",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 6.838477,
        "y": 3.46979165,
        "z": 999.997
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.TransformComponent"
    },
    {
      "SpriteRUID": "ae63be62f8e14dd1b7e215576fa0597e",
      "LocalPosition": {
        "x": 0.0,
        "y": 0.0
      },
      "LocalRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "LocalScale": {
        "x": 1.0,
        "y": 1.0
      },
      "SlicedSize": {
        "x": 0.0,
        "y": 0.0
      },
      "TiledSize": {
        "x": 1.0,
        "y": 1.0
      },
      "Color": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "FlipX": false,
      "FlipY": false,
      "SortingLayer": "MapLayer0",
      "OrderInLayer": 2,
      "DrawMode": 0,
      "RenderSetting": 2,
      "StartFrameIndex": 0,
      "EndFrameIndex": 2147483647,
      "PlayRate": 0.0,
      "ActionSheet": {
        "stand": "ae63be62f8e14dd1b7e215576fa0597e",
        "say": "a93ab98262704575929bc3be73e66d8f",
        "summon": "675af79c66d04fc6a2570958cad5aaa5",
        "teleportation": "b8ab359f02154bc1b7f14b050720edc1"
      },
      "Enable": true,
      "@type": "MOD.Core.SpriteRendererComponent"
    },
    {
      "isQuaterViewMove": false,
      "QuaterViewAccelX": 1.0,
      "QuaterViewAccelY": 1.0,
      "MoveVelocity": {
        "x": 0.0,
        "y": 0.0
      },
      "realMoveVelocity": {
        "x": 0.0,
        "y": 0.0
      },
      "DownJumpSpeed": 3.3,
      "WalkAcc": 0.5,
      "WalkSpeed": 0.5,
      "WalkDrag": 1000.0,
      "WalkSlant": 0.9,
      "Gravity": 1.0,
      "Mass": 100.0,
      "IsolatedMove": true,
      "IsSwimming": false,
      "WalkJump": 1.0,
      "IsBlockVerticalLine": false,
      "IgnoreMoveBoundary": false,
      "Enable": false,
      "@type": "MOD.Core.RigidbodyComponent"
    },
    {
      "InputSpeed": 1.0,
      "JumpForce": 0.0,
      "Enable": false,
      "@type": "MOD.Core.MonsterMovementComponent"
    },
    {
      "Enable": false,
      "@type": "MOD.Core.StateComponent"
    },
    {
      "ChatModeEnabled": false,
      "FontColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "ChatBalloonRUID": {
        "DataId": "7b6bd117bd0446a5bacec8ea6831c997"
      },
      "Message": "",
      "Offset": 0,
      "ArrowChat": true,
      "AutoShowEnabled": true,
      "AutoHideBalloonDelay": 5.0,
      "AutoShowBalloonDelay": 5.0,
      "BallonScale": 1.0,
      "FontSize": 1.0,
      "Enable": true,
      "@type": "MOD.Core.ChatBalloonComponent"
    },
    {
      "FontColor": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "NameTagRUID": {
        "DataId": "9bf18287398c44699c20fc5123d1a1ae"
      },
      "Name": "이성계",
      "FontSize": 1.0,
      "OffsetY": 0.0,
      "Enable": true,
      "@type": "MOD.Core.NameTagComponent"
    },
    {
      "UnitType": 0.0,
      "MovableAreaSize": 0.0,
      "LocationAtMap": {
        "x": 0.0,
        "y": 0.0
      },
      "Moved": false,
      "Done": false,
      "AttackAreaSize": 0.0,
      "Enable": true,
      "@type": "script.UnitCommon"
    },
    {
      "OnTouchEvent": {
        "type": [
          "MODEventEmitter",
          "MOD.Core.TouchEvent"
        ],
        "handlers": []
      },
      "DynamicTouchArea": true,
      "TouchAreaUpdateTime": 1.0,
      "Enable": true,
      "@type": "MOD.Core.TouchReceiveComponent"
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.StateComponent,MOD.Core.ChatBalloonComponent,MOD.Core.NameTagComponent,script.UnitCommon,MOD.Core.TouchReceiveComponent�	
$8fa18653-f725-480c-bea7-4e4dc43d9893/maps/map01/TileMap�{
  "name": "TileMap",
  "path": "/maps/map01/TileMap",
  "nameEditable": false,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "TileMap",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": -0.225,
        "y": -0.15,
        "z": 1000.0
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.TransformComponent"
    },
    {
      "tileMapVersion": 1,
      "tiles": [],
      "footholdWalk": 1.0,
      "footholdForce": 0.0,
      "footholdDrag": 2.5,
      "TileSetRUID": {
        "DataId": "4507cc77368647cdb4f84c9687275223"
      },
      "IsOddGridPosition": false,
      "SortingLayer": "MapLayer0",
      "OrderInLayer": 1,
      "Enable": true,
      "@type": "MOD.Core.TileMapComponent"
    }
  ],
  "@version": 1
}"5MOD.Core.TransformComponent,MOD.Core.TileMapComponent�#
$b91778d6-95c1-4cbb-8252-886f8d8a896f/maps/map01/UnitTuntra� {
  "name": "UnitTuntra",
  "path": "/maps/map01/UnitTuntra",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryNpc$1bb4386ace714937915c3ddc11dfc8e6",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 6.79976225,
        "y": 2.044384,
        "z": 999.996
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.TransformComponent"
    },
    {
      "SpriteRUID": "8a07663c4c0f4696a40ee998a5eea31c",
      "LocalPosition": {
        "x": 0.0,
        "y": 0.0
      },
      "LocalRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "LocalScale": {
        "x": 1.0,
        "y": 1.0
      },
      "SlicedSize": {
        "x": 0.0,
        "y": 0.0
      },
      "TiledSize": {
        "x": 1.0,
        "y": 1.0
      },
      "Color": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "FlipX": false,
      "FlipY": false,
      "SortingLayer": "MapLayer0",
      "OrderInLayer": 2,
      "DrawMode": 0,
      "RenderSetting": 2,
      "StartFrameIndex": 0,
      "EndFrameIndex": 2147483647,
      "PlayRate": 0.0,
      "ActionSheet": {
        "stand": "8a07663c4c0f4696a40ee998a5eea31c",
        "say": "725cba5149af4a63806022b52738d96d",
        "eye": "56f349a89b954cf7be47fba126f2c83c"
      },
      "Enable": true,
      "@type": "MOD.Core.SpriteRendererComponent"
    },
    {
      "isQuaterViewMove": false,
      "QuaterViewAccelX": 1.0,
      "QuaterViewAccelY": 1.0,
      "MoveVelocity": {
        "x": 0.0,
        "y": 0.0
      },
      "realMoveVelocity": {
        "x": 0.0,
        "y": 0.0
      },
      "DownJumpSpeed": 3.3,
      "WalkAcc": 0.5,
      "WalkSpeed": 0.5,
      "WalkDrag": 1000.0,
      "WalkSlant": 0.9,
      "Gravity": 1.0,
      "Mass": 100.0,
      "IsolatedMove": true,
      "IsSwimming": false,
      "WalkJump": 1.0,
      "IsBlockVerticalLine": false,
      "IgnoreMoveBoundary": false,
      "Enable": false,
      "@type": "MOD.Core.RigidbodyComponent"
    },
    {
      "InputSpeed": 1.0,
      "JumpForce": 0.0,
      "Enable": false,
      "@type": "MOD.Core.MonsterMovementComponent"
    },
    {
      "Enable": false,
      "@type": "MOD.Core.StateComponent"
    },
    {
      "ChatModeEnabled": false,
      "FontColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "ChatBalloonRUID": {
        "DataId": "7b6bd117bd0446a5bacec8ea6831c997"
      },
      "Message": "",
      "Offset": 0,
      "ArrowChat": true,
      "AutoShowEnabled": false,
      "AutoHideBalloonDelay": 5.0,
      "AutoShowBalloonDelay": 5.0,
      "BallonScale": 1.0,
      "FontSize": 1.0,
      "Enable": true,
      "@type": "MOD.Core.ChatBalloonComponent"
    },
    {
      "FontColor": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "NameTagRUID": {
        "DataId": "9bf18287398c44699c20fc5123d1a1ae"
      },
      "Name": "툰트라",
      "FontSize": 1.0,
      "OffsetY": 0.0,
      "Enable": true,
      "@type": "MOD.Core.NameTagComponent"
    },
    {
      "OnTouchEvent": {
        "type": [
          "MODEventEmitter",
          "MOD.Core.TouchEvent"
        ],
        "handlers": []
      },
      "DynamicTouchArea": true,
      "TouchAreaUpdateTime": 1.0,
      "Enable": true,
      "@type": "MOD.Core.TouchReceiveComponent"
    },
    {
      "UnitType": 0.0,
      "MovableAreaSize": 0.0,
      "LocationAtMap": {
        "x": 0.0,
        "y": 0.0
      },
      "Moved": false,
      "Done": false,
      "AttackAreaSize": 0.0,
      "Enable": true,
      "@type": "script.UnitCommon"
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.StateComponent,MOD.Core.ChatBalloonComponent,MOD.Core.NameTagComponent,MOD.Core.TouchReceiveComponent,script.UnitCommon�"
$ad348dc9-87ce-47f8-ab1d-c010e9c853be/maps/map01/UnitParkWei� {
  "name": "UnitParkWei",
  "path": "/maps/map01/UnitParkWei",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryNpc$1d52bf582de2401e9dbbdab47b39c9ae",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 7.746144,
        "y": 3.48693347,
        "z": 999.995
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.TransformComponent"
    },
    {
      "SpriteRUID": "e5f4708fceab42119f1c5ab0591207e4",
      "LocalPosition": {
        "x": 0.0,
        "y": 0.0
      },
      "LocalRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "LocalScale": {
        "x": 1.0,
        "y": 1.0
      },
      "SlicedSize": {
        "x": 0.0,
        "y": 0.0
      },
      "TiledSize": {
        "x": 1.0,
        "y": 1.0
      },
      "Color": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "FlipX": false,
      "FlipY": false,
      "SortingLayer": "MapLayer0",
      "OrderInLayer": 2,
      "DrawMode": 0,
      "RenderSetting": 2,
      "StartFrameIndex": 0,
      "EndFrameIndex": 2147483647,
      "PlayRate": 0.0,
      "ActionSheet": {
        "stand": "e5f4708fceab42119f1c5ab0591207e4"
      },
      "Enable": true,
      "@type": "MOD.Core.SpriteRendererComponent"
    },
    {
      "isQuaterViewMove": false,
      "QuaterViewAccelX": 1.0,
      "QuaterViewAccelY": 1.0,
      "MoveVelocity": {
        "x": 0.0,
        "y": 0.0
      },
      "realMoveVelocity": {
        "x": 0.0,
        "y": 0.0
      },
      "DownJumpSpeed": 3.3,
      "WalkAcc": 0.5,
      "WalkSpeed": 0.5,
      "WalkDrag": 1000.0,
      "WalkSlant": 0.9,
      "Gravity": 1.0,
      "Mass": 100.0,
      "IsolatedMove": true,
      "IsSwimming": false,
      "WalkJump": 1.0,
      "IsBlockVerticalLine": false,
      "IgnoreMoveBoundary": false,
      "Enable": false,
      "@type": "MOD.Core.RigidbodyComponent"
    },
    {
      "InputSpeed": 1.0,
      "JumpForce": 0.0,
      "Enable": false,
      "@type": "MOD.Core.MonsterMovementComponent"
    },
    {
      "Enable": false,
      "@type": "MOD.Core.StateComponent"
    },
    {
      "ChatModeEnabled": false,
      "FontColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "ChatBalloonRUID": {
        "DataId": "7b6bd117bd0446a5bacec8ea6831c997"
      },
      "Message": "",
      "Offset": 0,
      "ArrowChat": true,
      "AutoShowEnabled": true,
      "AutoHideBalloonDelay": 0.0,
      "AutoShowBalloonDelay": 5.0,
      "BallonScale": 1.0,
      "FontSize": 1.0,
      "Enable": true,
      "@type": "MOD.Core.ChatBalloonComponent"
    },
    {
      "FontColor": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "NameTagRUID": {
        "DataId": "9bf18287398c44699c20fc5123d1a1ae"
      },
      "Name": "박의",
      "FontSize": 1.0,
      "OffsetY": 0.0,
      "Enable": true,
      "@type": "MOD.Core.NameTagComponent"
    },
    {
      "UnitType": 0.0,
      "MovableAreaSize": 0.0,
      "LocationAtMap": {
        "x": 0.0,
        "y": 0.0
      },
      "Moved": false,
      "Done": false,
      "AttackAreaSize": 0.0,
      "Enable": true,
      "@type": "script.UnitCommon"
    },
    {
      "OnTouchEvent": {
        "type": [
          "MODEventEmitter",
          "MOD.Core.TouchEvent"
        ],
        "handlers": []
      },
      "DynamicTouchArea": true,
      "TouchAreaUpdateTime": 1.0,
      "Enable": true,
      "@type": "MOD.Core.TouchReceiveComponent"
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.StateComponent,MOD.Core.ChatBalloonComponent,MOD.Core.NameTagComponent,script.UnitCommon,MOD.Core.TouchReceiveComponent�
$a31f3dd5-65d4-4733-9999-2aa04c980d93/maps/map01/MapleMapLayer_1�{
  "name": "MapleMapLayer_1",
  "path": "/maps/map01/MapleMapLayer_1",
  "nameEditable": false,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleMapLayer",
    "sub_entity_id": null
  },
  "@components": [
    {
      "MapLayerName": "Layer2",
      "LayerSortOrder": 1,
      "Enable": true,
      "@type": "MOD.Core.MapLayerComponent"
    }
  ],
  "@version": 1
}"MOD.Core.MapLayerComponent�	
$4a7b10b3-bfd1-4ae0-af9a-6463d53b3039/maps/map01/TileMap_1�{
  "name": "TileMap_1",
  "path": "/maps/map01/TileMap_1",
  "nameEditable": false,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "TileMap",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": -0.225,
        "y": -0.15,
        "z": 999.994
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.TransformComponent"
    },
    {
      "tileMapVersion": 1,
      "tiles": [],
      "footholdWalk": 1.0,
      "footholdForce": 0.0,
      "footholdDrag": 2.5,
      "TileSetRUID": {
        "DataId": "4507cc77368647cdb4f84c9687275223"
      },
      "IsOddGridPosition": false,
      "SortingLayer": "MapLayer1",
      "OrderInLayer": 1,
      "Enable": true,
      "@type": "MOD.Core.TileMapComponent"
    }
  ],
  "@version": 1
}"5MOD.Core.TransformComponent,MOD.Core.TileMapComponent8���ԟ����W
 072960d82f0f4bd9a63c03f5796fa8ce f517bc8999ee44ad81995015f3829cdcmodel://asset/player"x-mod/model2�V�V{
  "Name": "asset/Player",
  "BaseModelId": "model://player",
  "Components": [],
  "Properties": [],
  "Values": [
    {
      "TargetType": null,
      "Name": "speed",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": 1.2
    },
    {
      "TargetType": null,
      "Name": "jumpForce",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": 1.0
    },
    {
      "TargetType": null,
      "Name": "walkAcc",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": 1.0
    },
    {
      "TargetType": null,
      "Name": "gravity",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": 1.0
    },
    {
      "TargetType": null,
      "Name": "cameraDeadZone",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "MOD.Core.MODVector2, MOD.Core, Version=1.0.3.0, Culture=neutral, PublicKeyToken=null"
      },
      "Value": {
        "$type": "MOD.Core.MODVector2, MOD.Core",
        "x": 0.052,
        "y": 0.08
      }
    },
    {
      "TargetType": null,
      "Name": "cameraSoftZone",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "MOD.Core.MODVector2, MOD.Core, Version=1.0.3.0, Culture=neutral, PublicKeyToken=null"
      },
      "Value": {
        "$type": "MOD.Core.MODVector2, MOD.Core",
        "x": 0.268,
        "y": 0.7
      }
    },
    {
      "TargetType": null,
      "Name": "cameraDamping",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "MOD.Core.MODVector2, MOD.Core, Version=1.0.3.0, Culture=neutral, PublicKeyToken=null"
      },
      "Value": {
        "$type": "MOD.Core.MODVector2, MOD.Core",
        "x": 2.5,
        "y": 3.9
      }
    },
    {
      "TargetType": null,
      "Name": "cameraScreen",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "MOD.Core.MODVector2, MOD.Core, Version=1.0.3.0, Culture=neutral, PublicKeyToken=null"
      },
      "Value": {
        "$type": "MOD.Core.MODVector2, MOD.Core",
        "x": 0.5,
        "y": 0.655
      }
    },
    {
      "TargetType": null,
      "Name": "cameraDutch",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": 0.0
    },
    {
      "TargetType": null,
      "Name": "cameraOffset",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "MOD.Core.MODVector2, MOD.Core, Version=1.0.3.0, Culture=neutral, PublicKeyToken=null"
      },
      "Value": {
        "$type": "MOD.Core.MODVector2, MOD.Core",
        "x": 0.0,
        "y": 0.0
      }
    },
    {
      "TargetType": null,
      "Name": "nameTag",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": ""
    },
    {
      "TargetType": null,
      "Name": "damageSkinId",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": 1
    },
    {
      "TargetType": null,
      "Name": "damageDelayPerAttack",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": 0.05
    },
    {
      "TargetType": null,
      "Name": "triggerBodyBoxSize",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "MOD.Core.MODVector2, MOD.Core, Version=1.0.3.0, Culture=neutral, PublicKeyToken=null"
      },
      "Value": {
        "$type": "MOD.Core.MODVector2, MOD.Core",
        "x": 0.66,
        "y": 0.7
      }
    },
    {
      "TargetType": null,
      "Name": "triggerBodyBoxOffset",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "MOD.Core.MODVector2, MOD.Core, Version=1.0.3.0, Culture=neutral, PublicKeyToken=null"
      },
      "Value": {
        "$type": "MOD.Core.MODVector2, MOD.Core",
        "x": 0.0,
        "y": 0.35
      }
    },
    {
      "TargetType": null,
      "Name": "maxHp",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": 1000
    },
    {
      "TargetType": "MOD.Core.TransformComponent",
      "Name": "Scale",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "MOD.Core.MODVector3, MOD.Core, Version=1.0.3.0, Culture=neutral, PublicKeyToken=null"
      },
      "Value": {
        "$type": "MOD.Core.MODVector3, MOD.Core",
        "x": 0.5,
        "y": 0.5,
        "z": 0.5
      }
    },
    {
      "TargetType": "MOD.Core.ChatBalloonComponent",
      "Name": "FontColor",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "MOD.Core.MODColor, MOD.Core, Version=1.0.3.0, Culture=neutral, PublicKeyToken=null"
      },
      "Value": {
        "$type": "MOD.Core.MODColor, MOD.Core",
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      }
    },
    {
      "TargetType": "MOD.Core.NameTagComponent",
      "Name": "FontColor",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "MOD.Core.MODColor, MOD.Core, Version=1.0.3.0, Culture=neutral, PublicKeyToken=null"
      },
      "Value": {
        "$type": "MOD.Core.MODColor, MOD.Core",
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      }
    },
    {
      "TargetType": "MOD.Core.CameraComponent",
      "Name": "ConfineCameraArea",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": false
    },
    {
      "TargetType": "MOD.Core.RigidbodyComponent",
      "Name": "Enable",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": false
    },
    {
      "TargetType": "MOD.Core.MovementComponent",
      "Name": "Enable",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": false
    },
    {
      "TargetType": "MOD.Core.StateComponent",
      "Name": "Enable",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": false
    },
    {
      "TargetType": "MOD.Core.StateStringToAvatarActionComponent",
      "Name": "Enable",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": false
    },
    {
      "TargetType": "MOD.Core.HitComponent",
      "Name": "Enable",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": false
    },
    {
      "TargetType": "MOD.Core.HitEffectSpawnerComponent",
      "Name": "Enable",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": false
    },
    {
      "TargetType": "MOD.Core.DamageSkinSpawnerComponent",
      "Name": "Enable",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": false
    },
    {
      "TargetType": "MOD.Core.PlayerControllerComponent",
      "Name": "Enable",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": false
    },
    {
      "TargetType": "MOD.Core.PlayerComponent",
      "Name": "PVPMode",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": false
    },
    {
      "TargetType": "MOD.Core.DamageSkinSettingComponent",
      "Name": "Enable",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": false
    },
    {
      "TargetType": "MOD.Core.TriggerComponent",
      "Name": "Enable",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": false
    },
    {
      "TargetType": "MOD.Core.InventoryComponent",
      "Name": "Enable",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": false
    },
    {
      "TargetType": "MOD.Core.ChatBalloonComponent",
      "Name": "Enable",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": false
    },
    {
      "TargetType": "MOD.Core.NameTagComponent",
      "Name": "Enable",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": false
    },
    {
      "TargetType": "MOD.Core.CostumeManagerComponent",
      "Name": "Enable",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": false
    }
  ],
  "EventLinks": [],
  "Children": []
}8���ڻ��J 845a10bdd9e242a5a47d5e67513f364d�	
 7ae3cc7b85c54fbc863aecd019b3a968 f517bc8999ee44ad81995015f3829cdc<model://maplestorymapobject$0671c9339aa8433f89dbb15b854f4ec7"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMapObject$0671c9339aa8433f89dbb15b854f4ec7",
  "ModelId": "MapObject",
  "DataSetId": "MapObjectDataSet",
  "DataId": "0671c9339aa8433f89dbb15b854f4ec7",
  "Target": {
    "Name": "MapleStoryMapObject$0671c9339aa8433f89dbb15b854f4ec7",
    "BaseModelId": "model://mapobject",
    "Components": [],
    "Properties": [],
    "Values": [
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "5150d5e7692349f2b73953ff7bb2493f"
      },
      {
        "TargetType": null,
        "Name": "spriteAnimName",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": ""
      }
    ],
    "EventLinks": [],
    "Children": []
  }
}8��������J 14e0953a8b424831b9349463bb50d541�
 787a3d0447514f90b0cf2356284d55e1 f517bc8999ee44ad81995015f3829cdc6model://maplestorynpc$001dccbafcad49ffaadccdcc86ec15cc"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryNpc$001dccbafcad49ffaadccdcc86ec15cc",
  "ModelId": "StaticNPC",
  "DataSetId": "NpcDataSet",
  "DataId": "001dccbafcad49ffaadccdcc86ec15cc",
  "Target": {
    "Name": "MapleStoryNpc$001dccbafcad49ffaadccdcc86ec15cc",
    "BaseModelId": "model://staticnpc",
    "Components": [],
    "Properties": [],
    "Values": [
      {
        "TargetType": null,
        "Name": "name",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "npc-7"
      },
      {
        "TargetType": null,
        "Name": "chatModeEnabled",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": false
      },
      {
        "TargetType": null,
        "Name": "actionSheet",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Collections.Generic.Dictionary`2[[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": {
          "$type": "System.Collections.Generic.Dictionary`2[[System.String, mscorlib],[System.String, mscorlib]], mscorlib",
          "stand": "e54cd6e471df4d62a18fdb756540689c",
          "say": "84f3c011b0c64bf0ad2e66d2d69d43d3",
          "eye": "c54ee43c903b4ad19c2a8e13aeb60148"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "e54cd6e471df4d62a18fdb756540689c"
      },
      {
        "TargetType": null,
        "Name": "renderSetting",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "MOD.Core.eRenderSetting, MOD.Common, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null"
        },
        "Value": 2
      }
    ],
    "EventLinks": [],
    "Children": []
  }
}8���ڻ��J e0e6c33e9a624d5cb391d0aefdd9a999�
 68e35383cc754da38050316b314dd67e f517bc8999ee44ad81995015f3829cdc6model://maplestorynpc$003245a8ce3f46f4824aef43968d1413"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryNpc$003245a8ce3f46f4824aef43968d1413",
  "ModelId": "StaticNPC",
  "DataSetId": "NpcDataSet",
  "DataId": "003245a8ce3f46f4824aef43968d1413",
  "Target": {
    "Name": "MapleStoryNpc$003245a8ce3f46f4824aef43968d1413",
    "BaseModelId": "model://staticnpc",
    "Components": [],
    "Properties": [],
    "Values": [
      {
        "TargetType": null,
        "Name": "name",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "npc-11"
      },
      {
        "TargetType": null,
        "Name": "chatModeEnabled",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": false
      },
      {
        "TargetType": null,
        "Name": "actionSheet",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Collections.Generic.Dictionary`2[[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": {
          "$type": "System.Collections.Generic.Dictionary`2[[System.String, mscorlib],[System.String, mscorlib]], mscorlib",
          "stand": "2f7a9b2fdac5490da24243120783e06b",
          "eye": "f7de3b51fd5c491286661f2be85a6cea",
          "smile": "5a5c1fc2cbc74e50ad90dca73e11cb52",
          "say": "0b4b5f4cb6294d898c57f948b4be2b1a",
          "move": "dcba60f89d07406ea0e095219aadc489"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "2f7a9b2fdac5490da24243120783e06b"
      },
      {
        "TargetType": null,
        "Name": "renderSetting",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "MOD.Core.eRenderSetting, MOD.Common, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null"
        },
        "Value": 2
      }
    ],
    "EventLinks": [],
    "Children": []
  }
}8���ڻ��J d94f9c86ffa348249fd8d209def4697b�
 c9dfcebdfa604af9a93fa1d0372ac213 f517bc8999ee44ad81995015f3829cdc6model://maplestorynpc$007ca10458ba40d3b353b6d793c36a49"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryNpc$007ca10458ba40d3b353b6d793c36a49",
  "ModelId": "StaticNPC",
  "DataSetId": "NpcDataSet",
  "DataId": "007ca10458ba40d3b353b6d793c36a49",
  "Target": {
    "Name": "MapleStoryNpc$007ca10458ba40d3b353b6d793c36a49",
    "BaseModelId": "model://staticnpc",
    "Components": [],
    "Properties": [],
    "Values": [
      {
        "TargetType": null,
        "Name": "name",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "npc-8"
      },
      {
        "TargetType": null,
        "Name": "chatModeEnabled",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": false
      },
      {
        "TargetType": null,
        "Name": "actionSheet",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Collections.Generic.Dictionary`2[[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": {
          "$type": "System.Collections.Generic.Dictionary`2[[System.String, mscorlib],[System.String, mscorlib]], mscorlib",
          "stand": "a6435bb3381244b2abfae4c408f8d6bb",
          "eye": "390cd13745d54987b7acd8674a1863e1",
          "lookaround": "c08e79e5e33144f1a7e95e8b6082f0ce"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "a6435bb3381244b2abfae4c408f8d6bb"
      },
      {
        "TargetType": null,
        "Name": "renderSetting",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "MOD.Core.eRenderSetting, MOD.Common, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null"
        },
        "Value": 2
      }
    ],
    "EventLinks": [],
    "Children": []
  }
}8���ڻ��J 3030578282464261965aaefff95c966a�!
 d7c572042e024a599226ca1e12c3234d f517bc8999ee44ad81995015f3829cdc6model://maplestorynpc$0087ca01ac7b49afa0a87158521fd38f"x-mod/model2� � {
  "Type": "MODLazyModel",
  "Name": "MapleStoryNpc$0087ca01ac7b49afa0a87158521fd38f",
  "ModelId": "StaticNPC",
  "DataSetId": "NpcDataSet",
  "DataId": "0087ca01ac7b49afa0a87158521fd38f",
  "Target": {
    "Name": "MapleStoryNpc$0087ca01ac7b49afa0a87158521fd38f",
    "BaseModelId": "model://staticnpc",
    "Components": [
      "script.StateTitle"
    ],
    "Properties": [],
    "Values": [
      {
        "TargetType": null,
        "Name": "name",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "StateTitle"
      },
      {
        "TargetType": null,
        "Name": "chatModeEnabled",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": false
      },
      {
        "TargetType": null,
        "Name": "actionSheet",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Collections.Generic.Dictionary`2[[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": {
          "$type": "System.Collections.Generic.Dictionary`2[[System.String, mscorlib],[System.String, mscorlib]], mscorlib",
          "stand": "ef82693043724e26a25f4fe715867c91",
          "eye": "b2b40638cc81466c8a7b572d484aeeb7"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "ef82693043724e26a25f4fe715867c91"
      },
      {
        "TargetType": null,
        "Name": "renderSetting",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "MOD.Core.eRenderSetting, MOD.Common, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null"
        },
        "Value": 2
      },
      {
        "TargetType": "MOD.Core.SpriteRendererComponent",
        "Name": "Color",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "MOD.Core.MODColor, MOD.Core, Version=1.0.3.0, Culture=neutral, PublicKeyToken=null"
        },
        "Value": {
          "$type": "MOD.Core.MODColor, MOD.Core",
          "r": 1.0,
          "g": 1.0,
          "b": 1.0,
          "a": 1.0
        }
      },
      {
        "TargetType": "MOD.Core.ChatBalloonComponent",
        "Name": "FontColor",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "MOD.Core.MODColor, MOD.Core, Version=1.0.3.0, Culture=neutral, PublicKeyToken=null"
        },
        "Value": {
          "$type": "MOD.Core.MODColor, MOD.Core",
          "r": 0.0,
          "g": 0.0,
          "b": 0.0,
          "a": 1.0
        }
      },
      {
        "TargetType": "MOD.Core.NameTagComponent",
        "Name": "FontColor",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "MOD.Core.MODColor, MOD.Core, Version=1.0.3.0, Culture=neutral, PublicKeyToken=null"
        },
        "Value": {
          "$type": "MOD.Core.MODColor, MOD.Core",
          "r": 1.0,
          "g": 1.0,
          "b": 1.0,
          "a": 1.0
        }
      },
      {
        "TargetType": "MOD.Core.TransformComponent",
        "Name": "Position",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "MOD.Core.MODVector3, MOD.Core, Version=1.0.3.0, Culture=neutral, PublicKeyToken=null"
        },
        "Value": {
          "$type": "MOD.Core.MODVector3, MOD.Core",
          "x": 0.0,
          "y": 1.0,
          "z": 0.0
        }
      }
    ],
    "EventLinks": [],
    "Children": []
  }
}8���ڻ��J a26c4302f16a43b8858a396cd8b23128�
 6582d40acfb54d6991a69f1affe2ad29 f517bc8999ee44ad81995015f3829cdc6model://maplestorynpc$00c96a0e2cb54372900c214eff2d6047"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryNpc$00c96a0e2cb54372900c214eff2d6047",
  "ModelId": "StaticNPC",
  "DataSetId": "NpcDataSet",
  "DataId": "00c96a0e2cb54372900c214eff2d6047",
  "Target": {
    "Name": "MapleStoryNpc$00c96a0e2cb54372900c214eff2d6047",
    "BaseModelId": "model://staticnpc",
    "Components": [],
    "Properties": [],
    "Values": [
      {
        "TargetType": null,
        "Name": "name",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "npc-12"
      },
      {
        "TargetType": null,
        "Name": "chatModeEnabled",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": false
      },
      {
        "TargetType": null,
        "Name": "actionSheet",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Collections.Generic.Dictionary`2[[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": {
          "$type": "System.Collections.Generic.Dictionary`2[[System.String, mscorlib],[System.String, mscorlib]], mscorlib",
          "stand": "027db54a4df74437b57a12d3c10d83ac",
          "move": "ce3e951818014b33bfb5c4568e9647b5"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "027db54a4df74437b57a12d3c10d83ac"
      },
      {
        "TargetType": null,
        "Name": "renderSetting",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "MOD.Core.eRenderSetting, MOD.Common, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null"
        },
        "Value": 2
      }
    ],
    "EventLinks": [],
    "Children": []
  }
}8���ڻ��J b6ffe52da301449bbfa6ac89c0121f0b�
 61e8e0674c0741c0a5a1e05b0f560ace f517bc8999ee44ad81995015f3829cdc6model://maplestorynpc$00d05bcb44a14e688eeaa3a7548fa45b"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryNpc$00d05bcb44a14e688eeaa3a7548fa45b",
  "ModelId": "StaticNPC",
  "DataSetId": "NpcDataSet",
  "DataId": "00d05bcb44a14e688eeaa3a7548fa45b",
  "Target": {
    "Name": "MapleStoryNpc$00d05bcb44a14e688eeaa3a7548fa45b",
    "BaseModelId": "model://staticnpc",
    "Components": [],
    "Properties": [],
    "Values": [
      {
        "TargetType": null,
        "Name": "name",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "npc-3"
      },
      {
        "TargetType": null,
        "Name": "chatModeEnabled",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": false
      },
      {
        "TargetType": null,
        "Name": "actionSheet",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Collections.Generic.Dictionary`2[[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": {
          "$type": "System.Collections.Generic.Dictionary`2[[System.String, mscorlib],[System.String, mscorlib]], mscorlib",
          "stand": "c7a3e1ef679e44ccbb9d6bf75f56d892",
          "say": "f4357db7e86f4b85aeacc2802eb2b2bb",
          "laugh": "cf5e108519c74bed863599622062d153"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "c7a3e1ef679e44ccbb9d6bf75f56d892"
      },
      {
        "TargetType": null,
        "Name": "renderSetting",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "MOD.Core.eRenderSetting, MOD.Common, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null"
        },
        "Value": 2
      }
    ],
    "EventLinks": [],
    "Children": []
  }
}8���ڻ��J 3b8017aa882040e991770ca369e5c97c�
 d7cd5e5ffcdc407daad0490136d9beb1 f517bc8999ee44ad81995015f3829cdc6model://maplestorynpc$00e48188a8e74421829110fb6e780145"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryNpc$00e48188a8e74421829110fb6e780145",
  "ModelId": "StaticNPC",
  "DataSetId": "NpcDataSet",
  "DataId": "00e48188a8e74421829110fb6e780145",
  "Target": {
    "Name": "MapleStoryNpc$00e48188a8e74421829110fb6e780145",
    "BaseModelId": "model://staticnpc",
    "Components": [],
    "Properties": [],
    "Values": [
      {
        "TargetType": null,
        "Name": "name",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "npc-32"
      },
      {
        "TargetType": null,
        "Name": "chatModeEnabled",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": false
      },
      {
        "TargetType": null,
        "Name": "actionSheet",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Collections.Generic.Dictionary`2[[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": {
          "$type": "System.Collections.Generic.Dictionary`2[[System.String, mscorlib],[System.String, mscorlib]], mscorlib",
          "stand": "e19019670b9d4fa39fc356ace321b784"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "e19019670b9d4fa39fc356ace321b784"
      },
      {
        "TargetType": null,
        "Name": "renderSetting",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "MOD.Core.eRenderSetting, MOD.Common, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null"
        },
        "Value": 2
      }
    ],
    "EventLinks": [],
    "Children": []
  }
}8���ڻ��J 62d11584ef294ae7a7c7b2f94a44fe42�
 79c8fb1af0494a4680d264743931836b f517bc8999ee44ad81995015f3829cdc6model://maplestorynpc$0128a26235c14684ba21c4b9c1035dea"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryNpc$0128a26235c14684ba21c4b9c1035dea",
  "ModelId": "StaticNPC",
  "DataSetId": "NpcDataSet",
  "DataId": "0128a26235c14684ba21c4b9c1035dea",
  "Target": {
    "Name": "MapleStoryNpc$0128a26235c14684ba21c4b9c1035dea",
    "BaseModelId": "model://staticnpc",
    "Components": [],
    "Properties": [],
    "Values": [
      {
        "TargetType": null,
        "Name": "name",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "npc-6"
      },
      {
        "TargetType": null,
        "Name": "chatModeEnabled",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": false
      },
      {
        "TargetType": null,
        "Name": "actionSheet",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Collections.Generic.Dictionary`2[[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": {
          "$type": "System.Collections.Generic.Dictionary`2[[System.String, mscorlib],[System.String, mscorlib]], mscorlib",
          "stand": "0d5c8a6c27b0436b90d581ba9ca39c38",
          "say": "78717fdd497b43c7acbbf7f64562ed2d",
          "eye": "69f7393f045f4d09b7e881b2bcb8a17b",
          "turn": "ad09e3b95594497098be435a2f1024b1"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "0d5c8a6c27b0436b90d581ba9ca39c38"
      },
      {
        "TargetType": null,
        "Name": "renderSetting",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "MOD.Core.eRenderSetting, MOD.Common, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null"
        },
        "Value": 2
      }
    ],
    "EventLinks": [],
    "Children": []
  }
}8���ڻ��J bd398874a3f141d09716a9abc7ed50b9�
 945316d10559428fbdacaed0b3f67fec f517bc8999ee44ad81995015f3829cdc6model://maplestorynpc$02ea4c0111444bd2abb5b97c812b93b7"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryNpc$02ea4c0111444bd2abb5b97c812b93b7",
  "ModelId": "StaticNPC",
  "DataSetId": "NpcDataSet",
  "DataId": "02ea4c0111444bd2abb5b97c812b93b7",
  "Target": {
    "Name": "MapleStoryNpc$02ea4c0111444bd2abb5b97c812b93b7",
    "BaseModelId": "model://staticnpc",
    "Components": [],
    "Properties": [],
    "Values": [
      {
        "TargetType": null,
        "Name": "name",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "npc-105"
      },
      {
        "TargetType": null,
        "Name": "chatModeEnabled",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": false
      },
      {
        "TargetType": null,
        "Name": "actionSheet",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Collections.Generic.Dictionary`2[[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": {
          "$type": "System.Collections.Generic.Dictionary`2[[System.String, mscorlib],[System.String, mscorlib]], mscorlib",
          "stand": "eb2545e6725646b1b964796abdd7281c",
          "say": "6bba1eb8f40f435c80db3dfe2b25479c"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "eb2545e6725646b1b964796abdd7281c"
      },
      {
        "TargetType": null,
        "Name": "renderSetting",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "MOD.Core.eRenderSetting, MOD.Common, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null"
        },
        "Value": 2
      }
    ],
    "EventLinks": [],
    "Children": []
  }
}8���ڻ��J 99f518ab86c7409c9b66d2ed6bb7ac19�
 1b9961a96a694247a65dd4de4ed1432b f517bc8999ee44ad81995015f3829cdc6model://maplestorynpc$12183fda544d45cbbde14921de927017"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryNpc$12183fda544d45cbbde14921de927017",
  "ModelId": "StaticNPC",
  "DataSetId": "NpcDataSet",
  "DataId": "12183fda544d45cbbde14921de927017",
  "Target": {
    "Name": "MapleStoryNpc$12183fda544d45cbbde14921de927017",
    "BaseModelId": "model://staticnpc",
    "Components": [],
    "Properties": [],
    "Values": [
      {
        "TargetType": null,
        "Name": "name",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "npc-481"
      },
      {
        "TargetType": null,
        "Name": "chatModeEnabled",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": false
      },
      {
        "TargetType": null,
        "Name": "actionSheet",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Collections.Generic.Dictionary`2[[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": {
          "$type": "System.Collections.Generic.Dictionary`2[[System.String, mscorlib],[System.String, mscorlib]], mscorlib",
          "stand": "395c0d970b3f4c8588e8ec23bb015fd9"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "395c0d970b3f4c8588e8ec23bb015fd9"
      },
      {
        "TargetType": null,
        "Name": "renderSetting",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "MOD.Core.eRenderSetting, MOD.Common, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null"
        },
        "Value": 2
      }
    ],
    "EventLinks": [],
    "Children": []
  }
}8���ڻ��J b09a9c2b501149e498a6e8dbff588a3a�
 da93fce16e7a4808acb826d6521f06ab f517bc8999ee44ad81995015f3829cdc6model://maplestorynpc$1bb4386ace714937915c3ddc11dfc8e6"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryNpc$1bb4386ace714937915c3ddc11dfc8e6",
  "ModelId": "StaticNPC",
  "DataSetId": "NpcDataSet",
  "DataId": "1bb4386ace714937915c3ddc11dfc8e6",
  "Target": {
    "Name": "MapleStoryNpc$1bb4386ace714937915c3ddc11dfc8e6",
    "BaseModelId": "model://staticnpc",
    "Components": [],
    "Properties": [],
    "Values": [
      {
        "TargetType": null,
        "Name": "name",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "npc-675"
      },
      {
        "TargetType": null,
        "Name": "chatModeEnabled",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": false
      },
      {
        "TargetType": null,
        "Name": "actionSheet",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Collections.Generic.Dictionary`2[[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": {
          "$type": "System.Collections.Generic.Dictionary`2[[System.String, mscorlib],[System.String, mscorlib]], mscorlib",
          "stand": "8a07663c4c0f4696a40ee998a5eea31c",
          "say": "725cba5149af4a63806022b52738d96d",
          "eye": "56f349a89b954cf7be47fba126f2c83c"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "8a07663c4c0f4696a40ee998a5eea31c"
      },
      {
        "TargetType": null,
        "Name": "renderSetting",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "MOD.Core.eRenderSetting, MOD.Common, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null"
        },
        "Value": 2
      }
    ],
    "EventLinks": [],
    "Children": []
  }
}8���ڻ��J a7ae6fecbb034bb2b71fdf0c5e9fdb5e�
 31669c838cf743ac907755ae96ff7ad4 f517bc8999ee44ad81995015f3829cdc6model://maplestorynpc$1bee4c666a4a494681d227313a2c576a"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryNpc$1bee4c666a4a494681d227313a2c576a",
  "ModelId": "StaticNPC",
  "DataSetId": "NpcDataSet",
  "DataId": "1bee4c666a4a494681d227313a2c576a",
  "Target": {
    "Name": "MapleStoryNpc$1bee4c666a4a494681d227313a2c576a",
    "BaseModelId": "model://staticnpc",
    "Components": [],
    "Properties": [],
    "Values": [
      {
        "TargetType": null,
        "Name": "name",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "npc-677"
      },
      {
        "TargetType": null,
        "Name": "chatModeEnabled",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": false
      },
      {
        "TargetType": null,
        "Name": "actionSheet",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Collections.Generic.Dictionary`2[[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": {
          "$type": "System.Collections.Generic.Dictionary`2[[System.String, mscorlib],[System.String, mscorlib]], mscorlib",
          "stand": "ae63be62f8e14dd1b7e215576fa0597e",
          "say": "a93ab98262704575929bc3be73e66d8f",
          "summon": "675af79c66d04fc6a2570958cad5aaa5",
          "teleportation": "b8ab359f02154bc1b7f14b050720edc1"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "ae63be62f8e14dd1b7e215576fa0597e"
      },
      {
        "TargetType": null,
        "Name": "renderSetting",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "MOD.Core.eRenderSetting, MOD.Common, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null"
        },
        "Value": 2
      }
    ],
    "EventLinks": [],
    "Children": []
  }
}8���ڻ��J 645abd4b1f8c49b595eac7b281ca18e9�
 4fac85f171824751be219215e3893fd4 f517bc8999ee44ad81995015f3829cdc6model://maplestorynpc$1d52bf582de2401e9dbbdab47b39c9ae"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryNpc$1d52bf582de2401e9dbbdab47b39c9ae",
  "ModelId": "StaticNPC",
  "DataSetId": "NpcDataSet",
  "DataId": "1d52bf582de2401e9dbbdab47b39c9ae",
  "Target": {
    "Name": "MapleStoryNpc$1d52bf582de2401e9dbbdab47b39c9ae",
    "BaseModelId": "model://staticnpc",
    "Components": [],
    "Properties": [],
    "Values": [
      {
        "TargetType": null,
        "Name": "name",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "npc-725"
      },
      {
        "TargetType": null,
        "Name": "chatModeEnabled",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": false
      },
      {
        "TargetType": null,
        "Name": "actionSheet",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Collections.Generic.Dictionary`2[[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": {
          "$type": "System.Collections.Generic.Dictionary`2[[System.String, mscorlib],[System.String, mscorlib]], mscorlib",
          "stand": "e5f4708fceab42119f1c5ab0591207e4"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "e5f4708fceab42119f1c5ab0591207e4"
      },
      {
        "TargetType": null,
        "Name": "renderSetting",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "MOD.Core.eRenderSetting, MOD.Common, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null"
        },
        "Value": 2
      }
    ],
    "EventLinks": [],
    "Children": []
  }
}8���ڻ��J 51d9383b6084432682a946699e4f2aca�
 795f160a894143e789e6d66abd1ffe1d f517bc8999ee44ad81995015f3829cdc6model://maplestorynpc$763d2d6d0986419b922b59c58bc15e38"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryNpc$763d2d6d0986419b922b59c58bc15e38",
  "ModelId": "StaticNPC",
  "DataSetId": "NpcDataSet",
  "DataId": "763d2d6d0986419b922b59c58bc15e38",
  "Target": {
    "Name": "MapleStoryNpc$763d2d6d0986419b922b59c58bc15e38",
    "BaseModelId": "model://staticnpc",
    "Components": [],
    "Properties": [],
    "Values": [
      {
        "TargetType": null,
        "Name": "name",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "npc-1"
      },
      {
        "TargetType": null,
        "Name": "chatModeEnabled",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": false
      },
      {
        "TargetType": null,
        "Name": "actionSheet",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Collections.Generic.Dictionary`2[[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": {
          "$type": "System.Collections.Generic.Dictionary`2[[System.String, mscorlib],[System.String, mscorlib]], mscorlib",
          "stand": "fb46d593bfef4942ad6a113f85eddfe2",
          "move": "4aa6b88b72504119afc3bf3a1fdc9ca3",
          "eye": "3a249d6f936148b8b0d52b5ae7aaf230",
          "say": "8fa0334084744727ab91e4c8bba200b5"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "fb46d593bfef4942ad6a113f85eddfe2"
      },
      {
        "TargetType": null,
        "Name": "renderSetting",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "MOD.Core.eRenderSetting, MOD.Common, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null"
        },
        "Value": 2
      },
      {
        "TargetType": "MOD.Core.SpriteRendererComponent",
        "Name": "Color",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "MOD.Core.MODColor, MOD.Core, Version=1.0.3.0, Culture=neutral, PublicKeyToken=null"
        },
        "Value": {
          "$type": "MOD.Core.MODColor, MOD.Core",
          "r": 1.0,
          "g": 1.0,
          "b": 1.0,
          "a": 1.0
        }
      },
      {
        "TargetType": "MOD.Core.ChatBalloonComponent",
        "Name": "FontColor",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "MOD.Core.MODColor, MOD.Core, Version=1.0.3.0, Culture=neutral, PublicKeyToken=null"
        },
        "Value": {
          "$type": "MOD.Core.MODColor, MOD.Core",
          "r": 0.0,
          "g": 0.0,
          "b": 0.0,
          "a": 1.0
        }
      },
      {
        "TargetType": "MOD.Core.NameTagComponent",
        "Name": "FontColor",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "MOD.Core.MODColor, MOD.Core, Version=1.0.3.0, Culture=neutral, PublicKeyToken=null"
        },
        "Value": {
          "$type": "MOD.Core.MODColor, MOD.Core",
          "r": 1.0,
          "g": 1.0,
          "b": 1.0,
          "a": 1.0
        }
      }
    ],
    "EventLinks": [],
    "Children": []
  }
}8���ڻ��J fc9e5cf47144424d9fc3b74a7e71fc7a�	
 e732e6b3451b441db996f62989c71db5 f517bc8999ee44ad81995015f3829cdc7model://maplestorytrap$4a7cef45d7374b1d99aa48d2a6899dd8"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryTrap$4a7cef45d7374b1d99aa48d2a6899dd8",
  "ModelId": "StaticMonster",
  "DataSetId": "TrapDataSet",
  "DataId": "4a7cef45d7374b1d99aa48d2a6899dd8",
  "Target": {
    "Name": "MapleStoryTrap$4a7cef45d7374b1d99aa48d2a6899dd8",
    "BaseModelId": "model://staticmonster",
    "Components": [],
    "Properties": [],
    "Values": [
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "fd508c1f701c45c1bc2cb9db995bb731"
      },
      {
        "TargetType": null,
        "Name": "spriteName",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": null
      }
    ],
    "EventLinks": [],
    "Children": []
  }
}8���ڻ��J e5950558da22421082ba77f0c2611300��
 a300b73ef0404aacaf176feb2e78a735 f517bc8999ee44ad81995015f3829cdcmodel://npc-2_1_model0"x-mod/model2����{
  "Name": "npc-2_1_model0",
  "BaseModelId": "model://maplestorynpc$0087ca01ac7b49afa0a87158521fd38f",
  "Components": [],
  "Properties": [],
  "Values": [
    {
      "TargetType": "MOD.Core.TransformComponent",
      "Name": "Position",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "MOD.Core.MODVector3, MOD.Core, Version=1.0.3.0, Culture=neutral, PublicKeyToken=null"
      },
      "Value": {
        "$type": "MOD.Core.MODVector3, MOD.Core",
        "x": 5.574537,
        "y": 1.87621,
        "z": 999.998
      }
    },
    {
      "TargetType": "MOD.Core.TransformComponent",
      "Name": "QuaternionRotation",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "MOD.Core.MODQuaternion, MOD.Core, Version=1.0.3.0, Culture=neutral, PublicKeyToken=null"
      },
      "Value": {
        "$type": "MOD.Core.MODQuaternion, MOD.Core",
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      }
    },
    {
      "TargetType": "MOD.Core.TransformComponent",
      "Name": "Rotation",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "MOD.Core.MODVector3, MOD.Core, Version=1.0.3.0, Culture=neutral, PublicKeyToken=null"
      },
      "Value": {
        "$type": "MOD.Core.MODVector3, MOD.Core",
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      }
    },
    {
      "TargetType": "MOD.Core.TransformComponent",
      "Name": "Scale",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "MOD.Core.MODVector3, MOD.Core, Version=1.0.3.0, Culture=neutral, PublicKeyToken=null"
      },
      "Value": {
        "$type": "MOD.Core.MODVector3, MOD.Core",
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      }
    },
    {
      "TargetType": "MOD.Core.TransformComponent",
      "Name": "Enable",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": true
    },
    {
      "TargetType": "MOD.Core.SpriteRendererComponent",
      "Name": "SpriteRUID",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": "ef82693043724e26a25f4fe715867c91"
    },
    {
      "TargetType": "MOD.Core.SpriteRendererComponent",
      "Name": "LocalPosition",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "MOD.Core.MODVector2, MOD.Core, Version=1.0.3.0, Culture=neutral, PublicKeyToken=null"
      },
      "Value": {
        "$type": "MOD.Core.MODVector2, MOD.Core",
        "x": 0.0,
        "y": 0.0
      }
    },
    {
      "TargetType": "MOD.Core.SpriteRendererComponent",
      "Name": "LocalRotation",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "MOD.Core.MODQuaternion, MOD.Core, Version=1.0.3.0, Culture=neutral, PublicKeyToken=null"
      },
      "Value": {
        "$type": "MOD.Core.MODQuaternion, MOD.Core",
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      }
    },
    {
      "TargetType": "MOD.Core.SpriteRendererComponent",
      "Name": "LocalScale",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "MOD.Core.MODVector2, MOD.Core, Version=1.0.3.0, Culture=neutral, PublicKeyToken=null"
      },
      "Value": {
        "$type": "MOD.Core.MODVector2, MOD.Core",
        "x": 1.0,
        "y": 1.0
      }
    },
    {
      "TargetType": "MOD.Core.SpriteRendererComponent",
      "Name": "SlicedSize",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "MOD.Core.MODVector2, MOD.Core, Version=1.0.3.0, Culture=neutral, PublicKeyToken=null"
      },
      "Value": {
        "$type": "MOD.Core.MODVector2, MOD.Core",
        "x": 0.0,
        "y": 0.0
      }
    },
    {
      "TargetType": "MOD.Core.SpriteRendererComponent",
      "Name": "TiledSize",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "MOD.Core.MODVector2, MOD.Core, Version=1.0.3.0, Culture=neutral, PublicKeyToken=null"
      },
      "Value": {
        "$type": "MOD.Core.MODVector2, MOD.Core",
        "x": 1.0,
        "y": 1.0
      }
    },
    {
      "TargetType": "MOD.Core.SpriteRendererComponent",
      "Name": "Color",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "MOD.Core.MODColor, MOD.Core, Version=1.0.3.0, Culture=neutral, PublicKeyToken=null"
      },
      "Value": {
        "$type": "MOD.Core.MODColor, MOD.Core",
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      }
    },
    {
      "TargetType": "MOD.Core.SpriteRendererComponent",
      "Name": "FlipX",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": false
    },
    {
      "TargetType": "MOD.Core.SpriteRendererComponent",
      "Name": "FlipY",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": false
    },
    {
      "TargetType": "MOD.Core.SpriteRendererComponent",
      "Name": "SortingLayer",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": "MapLayer0"
    },
    {
      "TargetType": "MOD.Core.SpriteRendererComponent",
      "Name": "OrderInLayer",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": 2
    },
    {
      "TargetType": "MOD.Core.SpriteRendererComponent",
      "Name": "DrawMode",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "MOD.Core.MODSpriteDrawMode, MOD.Common, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null"
      },
      "Value": 0
    },
    {
      "TargetType": "MOD.Core.SpriteRendererComponent",
      "Name": "RenderSetting",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "MOD.Core.eRenderSetting, MOD.Common, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null"
      },
      "Value": 2
    },
    {
      "TargetType": "MOD.Core.SpriteRendererComponent",
      "Name": "StartFrameIndex",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": 0
    },
    {
      "TargetType": "MOD.Core.SpriteRendererComponent",
      "Name": "EndFrameIndex",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": 2147483647
    },
    {
      "TargetType": "MOD.Core.SpriteRendererComponent",
      "Name": "PlayRate",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": 0.0
    },
    {
      "TargetType": "MOD.Core.SpriteRendererComponent",
      "Name": "ActionSheet",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Collections.Generic.Dictionary`2[[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": {
        "$type": "System.Collections.Generic.Dictionary`2[[System.String, mscorlib],[System.String, mscorlib]], mscorlib",
        "stand": "ef82693043724e26a25f4fe715867c91",
        "eye": "b2b40638cc81466c8a7b572d484aeeb7"
      }
    },
    {
      "TargetType": "MOD.Core.SpriteRendererComponent",
      "Name": "Enable",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": true
    },
    {
      "TargetType": "MOD.Core.RigidbodyComponent",
      "Name": "isQuaterViewMove",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": false
    },
    {
      "TargetType": "MOD.Core.RigidbodyComponent",
      "Name": "QuaterViewAccelX",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": 1.0
    },
    {
      "TargetType": "MOD.Core.RigidbodyComponent",
      "Name": "QuaterViewAccelY",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": 1.0
    },
    {
      "TargetType": "MOD.Core.RigidbodyComponent",
      "Name": "MoveVelocity",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "MOD.Core.MODVector2, MOD.Core, Version=1.0.3.0, Culture=neutral, PublicKeyToken=null"
      },
      "Value": {
        "$type": "MOD.Core.MODVector2, MOD.Core",
        "x": 0.0,
        "y": 0.0
      }
    },
    {
      "TargetType": "MOD.Core.RigidbodyComponent",
      "Name": "realMoveVelocity",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "MOD.Core.MODVector2, MOD.Core, Version=1.0.3.0, Culture=neutral, PublicKeyToken=null"
      },
      "Value": {
        "$type": "MOD.Core.MODVector2, MOD.Core",
        "x": 0.0,
        "y": 0.0
      }
    },
    {
      "TargetType": "MOD.Core.RigidbodyComponent",
      "Name": "DownJumpSpeed",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": 3.3
    },
    {
      "TargetType": "MOD.Core.RigidbodyComponent",
      "Name": "WalkAcc",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": 0.5
    },
    {
      "TargetType": "MOD.Core.RigidbodyComponent",
      "Name": "WalkSpeed",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": 0.5
    },
    {
      "TargetType": "MOD.Core.RigidbodyComponent",
      "Name": "WalkDrag",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": 1000.0
    },
    {
      "TargetType": "MOD.Core.RigidbodyComponent",
      "Name": "WalkSlant",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": 0.9
    },
    {
      "TargetType": "MOD.Core.RigidbodyComponent",
      "Name": "Gravity",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": 1.0
    },
    {
      "TargetType": "MOD.Core.RigidbodyComponent",
      "Name": "Mass",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": 100.0
    },
    {
      "TargetType": "MOD.Core.RigidbodyComponent",
      "Name": "IsolatedMove",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": true
    },
    {
      "TargetType": "MOD.Core.RigidbodyComponent",
      "Name": "IsSwimming",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": false
    },
    {
      "TargetType": "MOD.Core.RigidbodyComponent",
      "Name": "WalkJump",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": 1.0
    },
    {
      "TargetType": "MOD.Core.RigidbodyComponent",
      "Name": "IsBlockVerticalLine",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": false
    },
    {
      "TargetType": "MOD.Core.RigidbodyComponent",
      "Name": "IgnoreMoveBoundary",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": false
    },
    {
      "TargetType": "MOD.Core.RigidbodyComponent",
      "Name": "Enable",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": true
    },
    {
      "TargetType": "MOD.Core.MonsterMovementComponent",
      "Name": "InputSpeed",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": 1.0
    },
    {
      "TargetType": "MOD.Core.MonsterMovementComponent",
      "Name": "JumpForce",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": 0.0
    },
    {
      "TargetType": "MOD.Core.MonsterMovementComponent",
      "Name": "Enable",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": true
    },
    {
      "TargetType": "MOD.Core.StateComponent",
      "Name": "Enable",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": true
    },
    {
      "TargetType": "MOD.Core.ChatBalloonComponent",
      "Name": "ChatModeEnabled",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": false
    },
    {
      "TargetType": "MOD.Core.ChatBalloonComponent",
      "Name": "FontColor",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "MOD.Core.MODColor, MOD.Core, Version=1.0.3.0, Culture=neutral, PublicKeyToken=null"
      },
      "Value": {
        "$type": "MOD.Core.MODColor, MOD.Core",
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      }
    },
    {
      "TargetType": "MOD.Core.ChatBalloonComponent",
      "Name": "ChatBalloonRUID",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "MOD.Core.MODDataRef, MOD.Core, Version=1.0.3.0, Culture=neutral, PublicKeyToken=null"
      },
      "Value": {
        "$type": "MOD.Core.MODDataRef, MOD.Core",
        "DataId": "7b6bd117bd0446a5bacec8ea6831c997"
      }
    },
    {
      "TargetType": "MOD.Core.ChatBalloonComponent",
      "Name": "Message",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": ""
    },
    {
      "TargetType": "MOD.Core.ChatBalloonComponent",
      "Name": "Offset",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": 0
    },
    {
      "TargetType": "MOD.Core.ChatBalloonComponent",
      "Name": "ArrowChat",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": true
    },
    {
      "TargetType": "MOD.Core.ChatBalloonComponent",
      "Name": "AutoShowEnabled",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": false
    },
    {
      "TargetType": "MOD.Core.ChatBalloonComponent",
      "Name": "AutoHideBalloonDelay",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": 5.0
    },
    {
      "TargetType": "MOD.Core.ChatBalloonComponent",
      "Name": "AutoShowBalloonDelay",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": 5.0
    },
    {
      "TargetType": "MOD.Core.ChatBalloonComponent",
      "Name": "BallonScale",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": 1.0
    },
    {
      "TargetType": "MOD.Core.ChatBalloonComponent",
      "Name": "FontSize",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": 1.0
    },
    {
      "TargetType": "MOD.Core.ChatBalloonComponent",
      "Name": "Enable",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": true
    },
    {
      "TargetType": "MOD.Core.NameTagComponent",
      "Name": "FontColor",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "MOD.Core.MODColor, MOD.Core, Version=1.0.3.0, Culture=neutral, PublicKeyToken=null"
      },
      "Value": {
        "$type": "MOD.Core.MODColor, MOD.Core",
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      }
    },
    {
      "TargetType": "MOD.Core.NameTagComponent",
      "Name": "NameTagRUID",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "MOD.Core.MODDataRef, MOD.Core, Version=1.0.3.0, Culture=neutral, PublicKeyToken=null"
      },
      "Value": {
        "$type": "MOD.Core.MODDataRef, MOD.Core",
        "DataId": "9bf18287398c44699c20fc5123d1a1ae"
      }
    },
    {
      "TargetType": "MOD.Core.NameTagComponent",
      "Name": "Name",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": "npc-2"
    },
    {
      "TargetType": "MOD.Core.NameTagComponent",
      "Name": "FontSize",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": 1.0
    },
    {
      "TargetType": "MOD.Core.NameTagComponent",
      "Name": "OffsetY",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": 0.0
    },
    {
      "TargetType": "MOD.Core.NameTagComponent",
      "Name": "Enable",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
      },
      "Value": true
    }
  ],
  "EventLinks": [],
  "Children": [],
  "thumbnail_keyname": "resource_earlyaccess/f5/17/f517bc8999ee44ad81995015f3829cdc/model/npc-2_1_model0/thumbnail/637595165263224523",
  "thumbnail_hash": "DCB357040B1E02FCA3EEA30964F38C1E0E215BC22CB47CB7BE5766C74DF3DDC7"
}8���ڻ��J 25755dbe83ef4d9c8011482d9b96a6cd�
 4740ec7b4c5d4031bbc7a550a54da360 f517bc8999ee44ad81995015f3829cdc)sprite://ad2caa046bba40de96e65063784f8ec3"x-mod/sprite2��{
  "upload_keyname": "resource_earlyaccess/f5/17/f517bc8999ee44ad81995015f3829cdc/sprite/ad2caa046bba40de96e65063784f8ec3/637595834484527465",
  "upload_hash": "FEC9016389EFA6908328A1C4489AD9D72EEEC783D6F5ECBEDB38D420600FA6D1",
  "name": "map",
  "resource_guid": "ad2caa046bba40de96e65063784f8ec3",
  "resource_version": "1"
}8���ڻ��J 179fc1afc50941daa4c2c73d995afdd8�p
 d39688edced04d2ea92ccc8f5f9fad98 f517bc8999ee44ad81995015f3829cdc)ui://0838e430-d613-4438-a610-7a19b29d0a24"x-mod/ui2�o�
$0838e430-d613-4438-a610-7a19b29d0a24/ui/UIBattle�{
  "name": "UIBattle",
  "path": "/ui/UIBattle",
  "nameEditable": true,
  "enable": false,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "UIGroup",
    "sub_entity_id": null
  },
  "@components": [
    {
      "MobileOnly": false,
      "anchoredPosition": {
        "x": 0.0,
        "y": 0.0
      },
      "RectSize": {
        "x": 100.0,
        "y": 100.0
      },
      "OffsetMin": {
        "x": 0.0,
        "y": 0.0
      },
      "OffsetMax": {
        "x": 0.0,
        "y": 0.0
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 15,
      "AnchorsMin": {
        "x": 0.0,
        "y": 0.0
      },
      "AnchorsMax": {
        "x": 1.0,
        "y": 1.0
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.UITransformComponent"
    },
    {
      "thumnail": "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",
      "DefaultShow": false,
      "GroupType": 2,
      "GroupOrder": 6,
      "Enable": true,
      "@type": "MOD.Core.UIGroupComponent"
    },
    {
      "GroupAapha": 1.0,
      "Interactable": true,
      "BlocksRaycasts": true,
      "Enable": true,
      "@type": "MOD.Core.CanvasGroupComponent"
    }
  ],
  "@version": 1
}"UMOD.Core.UITransformComponent,MOD.Core.UIGroupComponent,MOD.Core.CanvasGroupComponent�
$768755bc-51fd-487a-842b-64c71dc5adac/ui/UIBattle/DefBtn�{
  "name": "DefBtn",
  "path": "/ui/UIBattle/DefBtn",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MODButton",
    "sub_entity_id": null
  },
  "@components": [
    {
      "MobileOnly": false,
      "anchoredPosition": {
        "x": 713.715942,
        "y": 263.28833
      },
      "RectSize": {
        "x": 245.339172,
        "y": 103.043739
      },
      "OffsetMin": {
        "x": 591.0464,
        "y": 211.766464
      },
      "OffsetMax": {
        "x": 836.3855,
        "y": 314.8102
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 0,
      "AnchorsMin": {
        "x": 0.5,
        "y": 0.5
      },
      "AnchorsMax": {
        "x": 0.5,
        "y": 0.5
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": 1792.28931,
        "y": 1077.42883,
        "z": 0.0
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.UITransformComponent"
    },
    {
      "ImageRUID": {
        "DataId": "0c80d52cfe5626b4ca1bb5067c0c6938"
      },
      "Color": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "FlipX": false,
      "FlipY": false,
      "RaycastTarget": true,
      "Type": 1,
      "PreserveAspect": true,
      "FillCenter": true,
      "FillAmount": 1.0,
      "FillMethod": 0,
      "FillOrigin": 0,
      "FillClockWise": true,
      "Outline": false,
      "OutlineColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "OutlineWidth": 3.0,
      "DropShadow": false,
      "DropShadowColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 0.72
      },
      "DropShadowDistance": 32.0,
      "DropShadowAngle": 30.0,
      "FrameColumn": 1,
      "FrameRow": 1,
      "FrameRate": 0,
      "Enable": true,
      "@type": "MOD.Core.ImageComponent"
    },
    {
      "KeyCode": 0,
      "Enable": true,
      "@type": "MOD.Core.ButtonComponent"
    },
    {
      "Text": "대기",
      "FontSize": 30,
      "FontColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "AlignmentOptions": 4,
      "Padding": {
        "left": 0,
        "right": 0,
        "top": 0,
        "bottom": 0
      },
      "SizeFit": false,
      "Overflow": 0,
      "UseOutLine": false,
      "OutlineColor": {
        "r": 0.7,
        "g": 0.7,
        "b": 0.7,
        "a": 1.0
      },
      "OutlineDistance": {
        "x": 1.0,
        "y": -1.0
      },
      "Font": 0,
      "Enable": true,
      "@type": "MOD.Core.TextComponent"
    },
    {
      "EntityID": "",
      "Enable": true,
      "@type": "script.UIBattleControl"
    }
  ],
  "@version": 1
}"|MOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.ButtonComponent,MOD.Core.TextComponent,script.UIBattleControl�
$05df5a9c-334e-4835-bb8d-65b3b2ec1f43/ui/UIBattle/Skl1Btn�{
  "name": "Skl1Btn",
  "path": "/ui/UIBattle/Skl1Btn",
  "nameEditable": true,
  "enable": true,
  "visible": false,
  "origin": {
    "type": "Model",
    "entry_id": "MODButton",
    "sub_entity_id": null
  },
  "@components": [
    {
      "MobileOnly": false,
      "anchoredPosition": {
        "x": 718.722046,
        "y": -40.2321167
      },
      "RectSize": {
        "x": 245.339325,
        "y": 103.043739
      },
      "OffsetMin": {
        "x": 596.052368,
        "y": -91.75398
      },
      "OffsetMax": {
        "x": 841.3917,
        "y": 11.289753
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 0,
      "AnchorsMin": {
        "x": 0.5,
        "y": 0.5
      },
      "AnchorsMax": {
        "x": 0.5,
        "y": 0.5
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": 1796.72437,
        "y": 808.5306,
        "z": 0.0
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.UITransformComponent"
    },
    {
      "ImageRUID": {
        "DataId": "0c80d52cfe5626b4ca1bb5067c0c6938"
      },
      "Color": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "FlipX": false,
      "FlipY": false,
      "RaycastTarget": true,
      "Type": 1,
      "PreserveAspect": true,
      "FillCenter": true,
      "FillAmount": 1.0,
      "FillMethod": 0,
      "FillOrigin": 0,
      "FillClockWise": true,
      "Outline": false,
      "OutlineColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "OutlineWidth": 3.0,
      "DropShadow": false,
      "DropShadowColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 0.72
      },
      "DropShadowDistance": 32.0,
      "DropShadowAngle": 30.0,
      "FrameColumn": 1,
      "FrameRow": 1,
      "FrameRate": 0,
      "Enable": true,
      "@type": "MOD.Core.ImageComponent"
    },
    {
      "KeyCode": 0,
      "Enable": true,
      "@type": "MOD.Core.ButtonComponent"
    },
    {
      "Text": "기술1",
      "FontSize": 30,
      "FontColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "AlignmentOptions": 4,
      "Padding": {
        "left": 0,
        "right": 0,
        "top": 0,
        "bottom": 0
      },
      "SizeFit": false,
      "Overflow": 0,
      "UseOutLine": false,
      "OutlineColor": {
        "r": 0.7,
        "g": 0.7,
        "b": 0.7,
        "a": 1.0
      },
      "OutlineDistance": {
        "x": 1.0,
        "y": -1.0
      },
      "Font": 0,
      "Enable": true,
      "@type": "MOD.Core.TextComponent"
    },
    {
      "Enable": true,
      "@type": "script.StateIntroNextDialog"
    }
  ],
  "@version": 1
}"�MOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.ButtonComponent,MOD.Core.TextComponent,script.StateIntroNextDialog�
$72c05964-e97e-44b0-bf55-0f6dbc2d505a/ui/UIBattle/Skl2Btn�{
  "name": "Skl2Btn",
  "path": "/ui/UIBattle/Skl2Btn",
  "nameEditable": true,
  "enable": true,
  "visible": false,
  "origin": {
    "type": "Model",
    "entry_id": "MODButton",
    "sub_entity_id": null
  },
  "@components": [
    {
      "MobileOnly": false,
      "anchoredPosition": {
        "x": 719.7189,
        "y": -143.275879
      },
      "RectSize": {
        "x": 245.339539,
        "y": 103.043739
      },
      "OffsetMin": {
        "x": 597.0491,
        "y": -194.797745
      },
      "OffsetMax": {
        "x": 842.3887,
        "y": -91.75401
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 0,
      "AnchorsMin": {
        "x": 0.5,
        "y": 0.5
      },
      "AnchorsMax": {
        "x": 0.5,
        "y": 0.5
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": 1797.60742,
        "y": 717.2408,
        "z": 0.0
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.UITransformComponent"
    },
    {
      "ImageRUID": {
        "DataId": "0c80d52cfe5626b4ca1bb5067c0c6938"
      },
      "Color": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "FlipX": false,
      "FlipY": false,
      "RaycastTarget": true,
      "Type": 1,
      "PreserveAspect": true,
      "FillCenter": true,
      "FillAmount": 1.0,
      "FillMethod": 0,
      "FillOrigin": 0,
      "FillClockWise": true,
      "Outline": false,
      "OutlineColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "OutlineWidth": 3.0,
      "DropShadow": false,
      "DropShadowColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 0.72
      },
      "DropShadowDistance": 32.0,
      "DropShadowAngle": 30.0,
      "FrameColumn": 1,
      "FrameRow": 1,
      "FrameRate": 0,
      "Enable": true,
      "@type": "MOD.Core.ImageComponent"
    },
    {
      "KeyCode": 0,
      "Enable": true,
      "@type": "MOD.Core.ButtonComponent"
    },
    {
      "Text": "기술2",
      "FontSize": 30,
      "FontColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "AlignmentOptions": 4,
      "Padding": {
        "left": 0,
        "right": 0,
        "top": 0,
        "bottom": 0
      },
      "SizeFit": false,
      "Overflow": 0,
      "UseOutLine": false,
      "OutlineColor": {
        "r": 0.7,
        "g": 0.7,
        "b": 0.7,
        "a": 1.0
      },
      "OutlineDistance": {
        "x": 1.0,
        "y": -1.0
      },
      "Font": 0,
      "Enable": true,
      "@type": "MOD.Core.TextComponent"
    },
    {
      "Enable": true,
      "@type": "script.StateIntroNextDialog"
    }
  ],
  "@version": 1
}"�MOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.ButtonComponent,MOD.Core.TextComponent,script.StateIntroNextDialog8���՟�����
 710c98fe53c04a599a45fe219cfb4608 f517bc8999ee44ad81995015f3829cdc)ui://420a49b1-aca8-4a7f-aa6e-9c98f7c7e614"x-mod/ui2���
$420a49b1-aca8-4a7f-aa6e-9c98f7c7e614/ui/UICameraCtrl�{
  "name": "UICameraCtrl",
  "path": "/ui/UICameraCtrl",
  "nameEditable": true,
  "enable": false,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "UIGroup",
    "sub_entity_id": null
  },
  "@components": [
    {
      "MobileOnly": false,
      "anchoredPosition": {
        "x": 0.0,
        "y": 0.0
      },
      "RectSize": {
        "x": 100.0,
        "y": 100.0
      },
      "OffsetMin": {
        "x": 0.0,
        "y": 0.0
      },
      "OffsetMax": {
        "x": 0.0,
        "y": 0.0
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 15,
      "AnchorsMin": {
        "x": 0.0,
        "y": 0.0
      },
      "AnchorsMax": {
        "x": 1.0,
        "y": 1.0
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.UITransformComponent"
    },
    {
      "thumnail": "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",
      "DefaultShow": false,
      "GroupType": 2,
      "GroupOrder": 5,
      "Enable": true,
      "@type": "MOD.Core.UIGroupComponent"
    },
    {
      "GroupAapha": 1.0,
      "Interactable": true,
      "BlocksRaycasts": true,
      "Enable": true,
      "@type": "MOD.Core.CanvasGroupComponent"
    }
  ],
  "@version": 1
}"UMOD.Core.UITransformComponent,MOD.Core.UIGroupComponent,MOD.Core.CanvasGroupComponent�
$495d272b-2328-4032-b43e-7a1c0f856808/ui/UICameraCtrl/UICameraCtrlUp�{
  "name": "UICameraCtrlUp",
  "path": "/ui/UICameraCtrl/UICameraCtrlUp",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MODButton",
    "sub_entity_id": null
  },
  "@components": [
    {
      "MobileOnly": false,
      "anchoredPosition": {
        "x": -3.33283615,
        "y": 431.229645
      },
      "RectSize": {
        "x": 1177.98914,
        "y": 220.810822
      },
      "OffsetMin": {
        "x": -592.3274,
        "y": 320.824219
      },
      "OffsetMax": {
        "x": 585.661743,
        "y": 541.6351
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 0,
      "AnchorsMin": {
        "x": 0.5,
        "y": 0.5
      },
      "AnchorsMax": {
        "x": 0.5,
        "y": 0.5
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": 1220.67712,
        "y": 1212.21326,
        "z": 0.0
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.UITransformComponent"
    },
    {
      "Color": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "FlipX": false,
      "FlipY": false,
      "RaycastTarget": true,
      "Type": 1,
      "PreserveAspect": true,
      "FillCenter": true,
      "FillAmount": 1.0,
      "FillMethod": 0,
      "FillOrigin": 0,
      "FillClockWise": true,
      "Outline": false,
      "OutlineColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "OutlineWidth": 3.0,
      "DropShadow": false,
      "DropShadowColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 0.72
      },
      "DropShadowDistance": 32.0,
      "DropShadowAngle": 30.0,
      "FrameColumn": 1,
      "FrameRow": 1,
      "FrameRate": 0,
      "Enable": true,
      "@type": "MOD.Core.ImageComponent"
    },
    {
      "KeyCode": 0,
      "Enable": true,
      "@type": "MOD.Core.ButtonComponent"
    },
    {
      "Enable": true,
      "@type": "script.CameraCtrlRaiseEvent"
    }
  ],
  "@version": 1
}"jMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.ButtonComponent,script.CameraCtrlRaiseEvent�
$eb7b14e0-65b2-4b32-aef8-406b2b9d7c51"/ui/UICameraCtrl/UICameraCtrlRight�{
  "name": "UICameraCtrlRight",
  "path": "/ui/UICameraCtrl/UICameraCtrlRight",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MODButton",
    "sub_entity_id": null
  },
  "@components": [
    {
      "MobileOnly": false,
      "anchoredPosition": {
        "x": 732.463257,
        "y": -3.153513
      },
      "RectSize": {
        "x": 252.3252,
        "y": 587.2813
      },
      "OffsetMin": {
        "x": 606.300659,
        "y": -296.794159
      },
      "OffsetMax": {
        "x": 858.625854,
        "y": 290.487152
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 0,
      "AnchorsMin": {
        "x": 0.5,
        "y": 0.5
      },
      "AnchorsMax": {
        "x": 0.5,
        "y": 0.5
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": 1872.542,
        "y": 827.3796,
        "z": 0.0
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.UITransformComponent"
    },
    {
      "Color": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "FlipX": false,
      "FlipY": false,
      "RaycastTarget": true,
      "Type": 1,
      "PreserveAspect": true,
      "FillCenter": true,
      "FillAmount": 1.0,
      "FillMethod": 0,
      "FillOrigin": 0,
      "FillClockWise": true,
      "Outline": false,
      "OutlineColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "OutlineWidth": 3.0,
      "DropShadow": false,
      "DropShadowColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 0.72
      },
      "DropShadowDistance": 32.0,
      "DropShadowAngle": 30.0,
      "FrameColumn": 1,
      "FrameRow": 1,
      "FrameRate": 0,
      "Enable": true,
      "@type": "MOD.Core.ImageComponent"
    },
    {
      "KeyCode": 0,
      "Enable": true,
      "@type": "MOD.Core.ButtonComponent"
    },
    {
      "Enable": true,
      "@type": "script.CameraCtrlRaiseEvent"
    }
  ],
  "@version": 1
}"jMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.ButtonComponent,script.CameraCtrlRaiseEvent�
$0ddc2a23-f28d-4919-baae-c7ef87e38669!/ui/UICameraCtrl/UICameraCtrlDown�{
  "name": "UICameraCtrlDown",
  "path": "/ui/UICameraCtrl/UICameraCtrlDown",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MODButton",
    "sub_entity_id": null
  },
  "@components": [
    {
      "MobileOnly": false,
      "anchoredPosition": {
        "x": -1.56881142,
        "y": -430.4869
      },
      "RectSize": {
        "x": 1179.51135,
        "y": 220.810822
      },
      "OffsetMin": {
        "x": -591.324463,
        "y": -540.892334
      },
      "OffsetMax": {
        "x": 588.1869,
        "y": -320.081482
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 0,
      "AnchorsMin": {
        "x": 0.5,
        "y": 0.5
      },
      "AnchorsMax": {
        "x": 0.5,
        "y": 0.5
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": 1222.23987,
        "y": 448.7915,
        "z": 0.0
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.UITransformComponent"
    },
    {
      "Color": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "FlipX": false,
      "FlipY": false,
      "RaycastTarget": true,
      "Type": 1,
      "PreserveAspect": true,
      "FillCenter": true,
      "FillAmount": 1.0,
      "FillMethod": 0,
      "FillOrigin": 0,
      "FillClockWise": true,
      "Outline": false,
      "OutlineColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "OutlineWidth": 3.0,
      "DropShadow": false,
      "DropShadowColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 0.72
      },
      "DropShadowDistance": 32.0,
      "DropShadowAngle": 30.0,
      "FrameColumn": 1,
      "FrameRow": 1,
      "FrameRate": 0,
      "Enable": true,
      "@type": "MOD.Core.ImageComponent"
    },
    {
      "KeyCode": 0,
      "Enable": true,
      "@type": "MOD.Core.ButtonComponent"
    },
    {
      "Enable": true,
      "@type": "script.CameraCtrlRaiseEvent"
    }
  ],
  "@version": 1
}"jMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.ButtonComponent,script.CameraCtrlRaiseEvent�
$b6dc0f85-0233-4172-a1d8-f236808426e3!/ui/UICameraCtrl/UICameraCtrlLeft�{
  "name": "UICameraCtrlLeft",
  "path": "/ui/UICameraCtrl/UICameraCtrlLeft",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MODButton",
    "sub_entity_id": null
  },
  "@components": [
    {
      "MobileOnly": false,
      "anchoredPosition": {
        "x": -731.5074,
        "y": 4.74784327
      },
      "RectSize": {
        "x": 252.32518,
        "y": 597.934448
      },
      "OffsetMin": {
        "x": -857.67,
        "y": -294.2194
      },
      "OffsetMax": {
        "x": -605.3448,
        "y": 303.715057
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 0,
      "AnchorsMin": {
        "x": 0.5,
        "y": 0.5
      },
      "AnchorsMax": {
        "x": 0.5,
        "y": 0.5
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": 575.5644,
        "y": 834.3796,
        "z": 0.0
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.UITransformComponent"
    },
    {
      "Color": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "FlipX": false,
      "FlipY": false,
      "RaycastTarget": true,
      "Type": 1,
      "PreserveAspect": true,
      "FillCenter": true,
      "FillAmount": 1.0,
      "FillMethod": 0,
      "FillOrigin": 0,
      "FillClockWise": true,
      "Outline": false,
      "OutlineColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "OutlineWidth": 3.0,
      "DropShadow": false,
      "DropShadowColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 0.72
      },
      "DropShadowDistance": 32.0,
      "DropShadowAngle": 30.0,
      "FrameColumn": 1,
      "FrameRow": 1,
      "FrameRate": 0,
      "Enable": true,
      "@type": "MOD.Core.ImageComponent"
    },
    {
      "KeyCode": 0,
      "Enable": true,
      "@type": "MOD.Core.ButtonComponent"
    },
    {
      "Enable": true,
      "@type": "script.CameraCtrlRaiseEvent"
    }
  ],
  "@version": 1
}"jMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.ButtonComponent,script.CameraCtrlRaiseEvent�
$697fd5ab-f7c6-4336-8615-3dc524e7f3f8#/ui/UICameraCtrl/UICameraCtrlLeftUp�{
  "name": "UICameraCtrlLeftUp",
  "path": "/ui/UICameraCtrl/UICameraCtrlLeftUp",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MODButton",
    "sub_entity_id": null
  },
  "@components": [
    {
      "MobileOnly": false,
      "anchoredPosition": {
        "x": -728.4213,
        "y": 426.981384
      },
      "RectSize": {
        "x": 247.297226,
        "y": 234.361252
      },
      "OffsetMin": {
        "x": -852.069946,
        "y": 309.800751
      },
      "OffsetMax": {
        "x": -604.7727,
        "y": 544.162
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 0,
      "AnchorsMin": {
        "x": 0.5,
        "y": 0.5
      },
      "AnchorsMax": {
        "x": 0.5,
        "y": 0.5
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": 578.2984,
        "y": 1208.44958,
        "z": 0.0
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.UITransformComponent"
    },
    {
      "Color": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "FlipX": false,
      "FlipY": false,
      "RaycastTarget": true,
      "Type": 1,
      "PreserveAspect": true,
      "FillCenter": true,
      "FillAmount": 1.0,
      "FillMethod": 0,
      "FillOrigin": 0,
      "FillClockWise": true,
      "Outline": false,
      "OutlineColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "OutlineWidth": 3.0,
      "DropShadow": false,
      "DropShadowColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 0.72
      },
      "DropShadowDistance": 32.0,
      "DropShadowAngle": 30.0,
      "FrameColumn": 1,
      "FrameRow": 1,
      "FrameRate": 0,
      "Enable": true,
      "@type": "MOD.Core.ImageComponent"
    },
    {
      "KeyCode": 0,
      "Enable": true,
      "@type": "MOD.Core.ButtonComponent"
    },
    {
      "Enable": true,
      "@type": "script.CameraCtrlRaiseEvent"
    }
  ],
  "@version": 1
}"jMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.ButtonComponent,script.CameraCtrlRaiseEvent�
$c7ad6aec-2082-441c-986f-4c555f78f8cb%/ui/UICameraCtrl/UICameraCtrlLeftDown�{
  "name": "UICameraCtrlLeftDown",
  "path": "/ui/UICameraCtrl/UICameraCtrlLeftDown",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MODButton",
    "sub_entity_id": null
  },
  "@components": [
    {
      "MobileOnly": false,
      "anchoredPosition": {
        "x": -728.993347,
        "y": -423.71167
      },
      "RectSize": {
        "x": 247.297226,
        "y": 234.361252
      },
      "OffsetMin": {
        "x": -852.641968,
        "y": -540.8923
      },
      "OffsetMax": {
        "x": -605.3447,
        "y": -306.531036
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 0,
      "AnchorsMin": {
        "x": 0.5,
        "y": 0.5
      },
      "AnchorsMax": {
        "x": 0.5,
        "y": 0.5
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": 577.7917,
        "y": 454.7939,
        "z": 0.0
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.UITransformComponent"
    },
    {
      "Color": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "FlipX": false,
      "FlipY": false,
      "RaycastTarget": true,
      "Type": 1,
      "PreserveAspect": true,
      "FillCenter": true,
      "FillAmount": 1.0,
      "FillMethod": 0,
      "FillOrigin": 0,
      "FillClockWise": true,
      "Outline": false,
      "OutlineColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "OutlineWidth": 3.0,
      "DropShadow": false,
      "DropShadowColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 0.72
      },
      "DropShadowDistance": 32.0,
      "DropShadowAngle": 30.0,
      "FrameColumn": 1,
      "FrameRow": 1,
      "FrameRate": 0,
      "Enable": true,
      "@type": "MOD.Core.ImageComponent"
    },
    {
      "KeyCode": 0,
      "Enable": true,
      "@type": "MOD.Core.ButtonComponent"
    },
    {
      "Enable": true,
      "@type": "script.CameraCtrlRaiseEvent"
    }
  ],
  "@version": 1
}"jMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.ButtonComponent,script.CameraCtrlRaiseEvent�
$9916f524-69b7-4cbb-a1a4-cde728ec0dd9$/ui/UICameraCtrl/UICameraCtrlRightUp�{
  "name": "UICameraCtrlRightUp",
  "path": "/ui/UICameraCtrl/UICameraCtrlRightUp",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MODButton",
    "sub_entity_id": null
  },
  "@components": [
    {
      "MobileOnly": false,
      "anchoredPosition": {
        "x": 734.977051,
        "y": 420.8956
      },
      "RectSize": {
        "x": 247.29718,
        "y": 234.361267
      },
      "OffsetMin": {
        "x": 611.3285,
        "y": 303.714966
      },
      "OffsetMax": {
        "x": 858.6256,
        "y": 538.076233
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 0,
      "AnchorsMin": {
        "x": 0.5,
        "y": 0.5
      },
      "AnchorsMax": {
        "x": 0.5,
        "y": 0.5
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": 1874.769,
        "y": 1203.058,
        "z": 0.0
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.UITransformComponent"
    },
    {
      "Color": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "FlipX": false,
      "FlipY": false,
      "RaycastTarget": true,
      "Type": 1,
      "PreserveAspect": true,
      "FillCenter": true,
      "FillAmount": 1.0,
      "FillMethod": 0,
      "FillOrigin": 0,
      "FillClockWise": true,
      "Outline": false,
      "OutlineColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "OutlineWidth": 3.0,
      "DropShadow": false,
      "DropShadowColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 0.72
      },
      "DropShadowDistance": 32.0,
      "DropShadowAngle": 30.0,
      "FrameColumn": 1,
      "FrameRow": 1,
      "FrameRate": 0,
      "Enable": true,
      "@type": "MOD.Core.ImageComponent"
    },
    {
      "KeyCode": 0,
      "Enable": true,
      "@type": "MOD.Core.ButtonComponent"
    },
    {
      "Enable": true,
      "@type": "script.CameraCtrlRaiseEvent"
    }
  ],
  "@version": 1
}"jMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.ButtonComponent,script.CameraCtrlRaiseEvent�
$a0fdd266-4cf9-4c42-bf85-6144437733e1&/ui/UICameraCtrl/UICameraCtrlRightDown�{
  "name": "UICameraCtrlRightDown",
  "path": "/ui/UICameraCtrl/UICameraCtrlRightDown",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MODButton",
    "sub_entity_id": null
  },
  "@components": [
    {
      "MobileOnly": false,
      "anchoredPosition": {
        "x": 734.976868,
        "y": -423.9748
      },
      "RectSize": {
        "x": 247.29718,
        "y": 234.361267
      },
      "OffsetMin": {
        "x": 611.328247,
        "y": -541.1554
      },
      "OffsetMax": {
        "x": 858.6255,
        "y": -306.794159
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 0,
      "AnchorsMin": {
        "x": 0.5,
        "y": 0.5
      },
      "AnchorsMax": {
        "x": 0.5,
        "y": 0.5
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": 1874.7688,
        "y": 454.5608,
        "z": 0.0
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.UITransformComponent"
    },
    {
      "Color": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "FlipX": false,
      "FlipY": false,
      "RaycastTarget": true,
      "Type": 1,
      "PreserveAspect": true,
      "FillCenter": true,
      "FillAmount": 1.0,
      "FillMethod": 0,
      "FillOrigin": 0,
      "FillClockWise": true,
      "Outline": false,
      "OutlineColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "OutlineWidth": 3.0,
      "DropShadow": false,
      "DropShadowColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 0.72
      },
      "DropShadowDistance": 32.0,
      "DropShadowAngle": 30.0,
      "FrameColumn": 1,
      "FrameRow": 1,
      "FrameRate": 0,
      "Enable": true,
      "@type": "MOD.Core.ImageComponent"
    },
    {
      "KeyCode": 0,
      "Enable": true,
      "@type": "MOD.Core.ButtonComponent"
    },
    {
      "Enable": true,
      "@type": "script.CameraCtrlRaiseEvent"
    }
  ],
  "@version": 1
}"jMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.ButtonComponent,script.CameraCtrlRaiseEvent8���֟����
 cfd66d6d412246debdac3576db1e6c0e f517bc8999ee44ad81995015f3829cdc)ui://623343df-4eb2-48b8-abb5-8659ac31bc7e"x-mod/ui2߈�>
$623343df-4eb2-48b8-abb5-8659ac31bc7e/ui/UIBattleGoal�={
  "name": "UIBattleGoal",
  "path": "/ui/UIBattleGoal",
  "nameEditable": true,
  "enable": false,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "UIGroup",
    "sub_entity_id": null
  },
  "@components": [
    {
      "MobileOnly": false,
      "anchoredPosition": {
        "x": 0.0,
        "y": 0.0
      },
      "RectSize": {
        "x": 100.0,
        "y": 100.0
      },
      "OffsetMin": {
        "x": 0.0,
        "y": 0.0
      },
      "OffsetMax": {
        "x": 0.0,
        "y": 0.0
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 15,
      "AnchorsMin": {
        "x": 0.0,
        "y": 0.0
      },
      "AnchorsMax": {
        "x": 1.0,
        "y": 1.0
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.UITransformComponent"
    },
    {
      "thumnail": "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",
      "DefaultShow": false,
      "GroupType": 2,
      "GroupOrder": 4,
      "Enable": true,
      "@type": "MOD.Core.UIGroupComponent"
    },
    {
      "GroupAapha": 1.0,
      "Interactable": true,
      "BlocksRaycasts": true,
      "Enable": true,
      "@type": "MOD.Core.CanvasGroupComponent"
    }
  ],
  "@version": 1
}"UMOD.Core.UITransformComponent,MOD.Core.UIGroupComponent,MOD.Core.CanvasGroupComponent�
$a0d65f5a-0744-44f1-8b04-0be28d21b400 /ui/UIBattleGoal/UIBattleGoalBtn�{
  "name": "UIBattleGoalBtn",
  "path": "/ui/UIBattleGoal/UIBattleGoalBtn",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MODButton",
    "sub_entity_id": null
  },
  "@components": [
    {
      "MobileOnly": false,
      "anchoredPosition": {
        "x": -873.125732,
        "y": -556.0932
      },
      "RectSize": {
        "x": 1729.2439,
        "y": 1161.87036
      },
      "OffsetMin": {
        "x": -1737.74768,
        "y": -1137.02832
      },
      "OffsetMax": {
        "x": -8.503784,
        "y": 24.84198
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 5,
      "AnchorsMin": {
        "x": 1.0,
        "y": 1.0
      },
      "AnchorsMax": {
        "x": 1.0,
        "y": 1.0
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": 1207.90027,
        "y": 815.916,
        "z": 0.0
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.UITransformComponent"
    },
    {
      "Color": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 0.5
      },
      "FlipX": false,
      "FlipY": false,
      "RaycastTarget": true,
      "Type": 1,
      "PreserveAspect": true,
      "FillCenter": true,
      "FillAmount": 1.0,
      "FillMethod": 0,
      "FillOrigin": 0,
      "FillClockWise": true,
      "Outline": false,
      "OutlineColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "OutlineWidth": 3.0,
      "DropShadow": false,
      "DropShadowColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 0.72
      },
      "DropShadowDistance": 32.0,
      "DropShadowAngle": 30.0,
      "FrameColumn": 1,
      "FrameRow": 1,
      "FrameRate": 0,
      "Enable": true,
      "@type": "MOD.Core.ImageComponent"
    },
    {
      "KeyCode": 0,
      "Enable": true,
      "@type": "MOD.Core.ButtonComponent"
    },
    {
      "Enable": true,
      "@type": "script.StateBattleGoalRaiseEvent"
    }
  ],
  "@version": 1
}"oMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.ButtonComponent,script.StateBattleGoalRaiseEvent�
$46f5853d-3a29-451c-bae4-f62bebe0ddc8"/ui/UIBattleGoal/UIBattleGoalTitle�{
  "name": "UIBattleGoalTitle",
  "path": "/ui/UIBattleGoal/UIBattleGoalTitle",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MODText",
    "sub_entity_id": null
  },
  "@components": [
    {
      "MobileOnly": false,
      "anchoredPosition": {
        "x": -5.40061569,
        "y": 113.196838
      },
      "RectSize": {
        "x": 1753.95264,
        "y": 579.824341
      },
      "OffsetMin": {
        "x": -882.376953,
        "y": -176.715332
      },
      "OffsetMax": {
        "x": 871.5757,
        "y": 403.109
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 0,
      "AnchorsMin": {
        "x": 0.5,
        "y": 0.5
      },
      "AnchorsMax": {
        "x": 0.5,
        "y": 0.5
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": 1218.84521,
        "y": 930.458,
        "z": 0.0
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.UITransformComponent"
    },
    {
      "ImageRUID": {
        "DataId": "eb25237c9c3d2f642a84bfb3c0cfd830"
      },
      "Color": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "FlipX": false,
      "FlipY": false,
      "RaycastTarget": true,
      "Type": 1,
      "PreserveAspect": true,
      "FillCenter": true,
      "FillAmount": 1.0,
      "FillMethod": 0,
      "FillOrigin": 0,
      "FillClockWise": true,
      "Outline": false,
      "OutlineColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "OutlineWidth": 3.0,
      "DropShadow": false,
      "DropShadowColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 0.72
      },
      "DropShadowDistance": 32.0,
      "DropShadowAngle": 30.0,
      "FrameColumn": 1,
      "FrameRow": 1,
      "FrameRate": 0,
      "Enable": false,
      "@type": "MOD.Core.ImageComponent"
    },
    {
      "Text": "반란군을 격파하라!",
      "FontSize": 100,
      "FontColor": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "AlignmentOptions": 4,
      "Padding": {
        "left": 0,
        "right": 0,
        "top": 0,
        "bottom": 0
      },
      "SizeFit": false,
      "Overflow": 0,
      "UseOutLine": false,
      "OutlineColor": {
        "r": 0.7,
        "g": 0.7,
        "b": 0.7,
        "a": 1.0
      },
      "OutlineDistance": {
        "x": 1.0,
        "y": -1.0
      },
      "Font": 0,
      "Enable": true,
      "@type": "MOD.Core.TextComponent"
    }
  ],
  "@version": 1
}"LMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.TextComponent�
$fa30b3b6-a8b8-40cb-bcd1-6ec2c76eea75!/ui/UIBattleGoal/UIBattleGoalDesc�{
  "name": "UIBattleGoalDesc",
  "path": "/ui/UIBattleGoal/UIBattleGoalDesc",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MODText",
    "sub_entity_id": null
  },
  "@components": [
    {
      "MobileOnly": false,
      "anchoredPosition": {
        "x": 13.2115879,
        "y": -63.89302
      },
      "RectSize": {
        "x": 1716.72815,
        "y": 213.874451
      },
      "OffsetMin": {
        "x": -845.152466,
        "y": -170.830246
      },
      "OffsetMax": {
        "x": 871.5757,
        "y": 43.0442047
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 0,
      "AnchorsMin": {
        "x": 0.5,
        "y": 0.5
      },
      "AnchorsMax": {
        "x": 0.5,
        "y": 0.5
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": 1235.33435,
        "y": 773.5685,
        "z": 0.0
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.UITransformComponent"
    },
    {
      "Color": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "FlipX": false,
      "FlipY": false,
      "RaycastTarget": true,
      "Type": 1,
      "PreserveAspect": true,
      "FillCenter": true,
      "FillAmount": 1.0,
      "FillMethod": 0,
      "FillOrigin": 0,
      "FillClockWise": true,
      "Outline": false,
      "OutlineColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "OutlineWidth": 3.0,
      "DropShadow": false,
      "DropShadowColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 0.72
      },
      "DropShadowDistance": 32.0,
      "DropShadowAngle": 30.0,
      "FrameColumn": 1,
      "FrameRow": 1,
      "FrameRate": 0,
      "Enable": false,
      "@type": "MOD.Core.ImageComponent"
    },
    {
      "Text": "고려 시중 박의는 흔들리는 고려 왕실을 버리고 스스로 제후로 일컫기로 했다. 이를 방치할 경우 지방을 필두로 연쇄적인 반란과 독립이라는 절체절명의 상황에 부딪힌다. 고려 왕실은 동북면 영주인 이성계에게 지원을 요청한다.",
      "FontSize": 30,
      "FontColor": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "AlignmentOptions": 4,
      "Padding": {
        "left": 0,
        "right": 0,
        "top": 0,
        "bottom": 0
      },
      "SizeFit": false,
      "Overflow": 0,
      "UseOutLine": false,
      "OutlineColor": {
        "r": 0.7,
        "g": 0.7,
        "b": 0.7,
        "a": 1.0
      },
      "OutlineDistance": {
        "x": 1.0,
        "y": -1.0
      },
      "Font": 0,
      "Enable": true,
      "@type": "MOD.Core.TextComponent"
    }
  ],
  "@version": 1
}"LMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.TextComponent8���ן����R
 768e6fa4b33c41c98bae57ff73bba37c f517bc8999ee44ad81995015f3829cdc)ui://7fdaf72c-34e8-494c-ae54-c6c5e09031c4"x-mod/ui2�Q�
$7fdaf72c-34e8-494c-ae54-c6c5e09031c4/ui/UIBattleInfo�{
  "name": "UIBattleInfo",
  "path": "/ui/UIBattleInfo",
  "nameEditable": true,
  "enable": false,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "UIGroup",
    "sub_entity_id": null
  },
  "@components": [
    {
      "MobileOnly": false,
      "anchoredPosition": {
        "x": 0.0,
        "y": 0.0
      },
      "RectSize": {
        "x": 100.0,
        "y": 100.0
      },
      "OffsetMin": {
        "x": 0.0,
        "y": 0.0
      },
      "OffsetMax": {
        "x": 0.0,
        "y": 0.0
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 15,
      "AnchorsMin": {
        "x": 0.0,
        "y": 0.0
      },
      "AnchorsMax": {
        "x": 1.0,
        "y": 1.0
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.UITransformComponent"
    },
    {
      "thumnail": "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",
      "DefaultShow": false,
      "GroupType": 2,
      "GroupOrder": 3,
      "Enable": true,
      "@type": "MOD.Core.UIGroupComponent"
    },
    {
      "GroupAapha": 1.0,
      "Interactable": true,
      "BlocksRaycasts": true,
      "Enable": true,
      "@type": "MOD.Core.CanvasGroupComponent"
    }
  ],
  "@version": 1
}"UMOD.Core.UITransformComponent,MOD.Core.UIGroupComponent,MOD.Core.CanvasGroupComponent�
$8202d79b-ca07-4f8a-b556-c9c73497c694(/ui/UIBattleInfo/UIBattleRemainTurnFrame�{
  "name": "UIBattleRemainTurnFrame",
  "path": "/ui/UIBattleInfo/UIBattleRemainTurnFrame",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MODText",
    "sub_entity_id": null
  },
  "@components": [
    {
      "MobileOnly": false,
      "anchoredPosition": {
        "x": -11.718008,
        "y": 462.0617
      },
      "RectSize": {
        "x": 478.104919,
        "y": 300.989929
      },
      "OffsetMin": {
        "x": -250.770462,
        "y": 311.566742
      },
      "OffsetMax": {
        "x": 227.334457,
        "y": 612.556641
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 0,
      "AnchorsMin": {
        "x": 0.5,
        "y": 0.5
      },
      "AnchorsMax": {
        "x": 0.5,
        "y": 0.5
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": 1213.59448,
        "y": 1225.88318,
        "z": 0.0
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.UITransformComponent"
    },
    {
      "ImageRUID": {
        "DataId": "e363fe71863482e40954b62b58bf4ac8"
      },
      "Color": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "FlipX": false,
      "FlipY": false,
      "RaycastTarget": true,
      "Type": 1,
      "PreserveAspect": true,
      "FillCenter": true,
      "FillAmount": 1.0,
      "FillMethod": 0,
      "FillOrigin": 0,
      "FillClockWise": true,
      "Outline": false,
      "OutlineColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "OutlineWidth": 3.0,
      "DropShadow": false,
      "DropShadowColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 0.72
      },
      "DropShadowDistance": 32.0,
      "DropShadowAngle": 30.0,
      "FrameColumn": 1,
      "FrameRow": 1,
      "FrameRate": 0,
      "Enable": true,
      "@type": "MOD.Core.ImageComponent"
    },
    {
      "Text": "   턴 남음",
      "FontSize": 60,
      "FontColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "AlignmentOptions": 4,
      "Padding": {
        "left": 0,
        "right": 0,
        "top": 0,
        "bottom": 0
      },
      "SizeFit": false,
      "Overflow": 0,
      "UseOutLine": false,
      "OutlineColor": {
        "r": 0.7,
        "g": 0.7,
        "b": 0.7,
        "a": 1.0
      },
      "OutlineDistance": {
        "x": 1.0,
        "y": -1.0
      },
      "Font": 0,
      "Enable": true,
      "@type": "MOD.Core.TextComponent"
    }
  ],
  "@version": 1
}"LMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.TextComponent�
$fed2e680-3002-442e-a2b0-ab1dee03a546&/ui/UIBattleInfo/UIBattleRemainTurnTxt�{
  "name": "UIBattleRemainTurnTxt",
  "path": "/ui/UIBattleInfo/UIBattleRemainTurnTxt",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MODText",
    "sub_entity_id": null
  },
  "@components": [
    {
      "MobileOnly": false,
      "anchoredPosition": {
        "x": -117.973038,
        "y": 454.415039
      },
      "RectSize": {
        "x": 100.0,
        "y": 100.0
      },
      "OffsetMin": {
        "x": -167.973038,
        "y": 404.415039
      },
      "OffsetMax": {
        "x": -67.97304,
        "y": 504.415039
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 0,
      "AnchorsMin": {
        "x": 0.5,
        "y": 0.5
      },
      "AnchorsMax": {
        "x": 0.5,
        "y": 0.5
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": 1077.62988,
        "y": 1324.17334,
        "z": 0.0
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.UITransformComponent"
    },
    {
      "Color": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "FlipX": false,
      "FlipY": false,
      "RaycastTarget": true,
      "Type": 1,
      "PreserveAspect": true,
      "FillCenter": true,
      "FillAmount": 1.0,
      "FillMethod": 0,
      "FillOrigin": 0,
      "FillClockWise": true,
      "Outline": false,
      "OutlineColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "OutlineWidth": 3.0,
      "DropShadow": false,
      "DropShadowColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 0.72
      },
      "DropShadowDistance": 32.0,
      "DropShadowAngle": 30.0,
      "FrameColumn": 1,
      "FrameRow": 1,
      "FrameRate": 0,
      "Enable": false,
      "@type": "MOD.Core.ImageComponent"
    },
    {
      "Text": "5",
      "FontSize": 100,
      "FontColor": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "AlignmentOptions": 4,
      "Padding": {
        "left": 0,
        "right": 0,
        "top": 0,
        "bottom": 0
      },
      "SizeFit": false,
      "Overflow": 0,
      "UseOutLine": false,
      "OutlineColor": {
        "r": 0.7,
        "g": 0.7,
        "b": 0.7,
        "a": 1.0
      },
      "OutlineDistance": {
        "x": 1.0,
        "y": -1.0
      },
      "Font": 3,
      "Enable": true,
      "@type": "MOD.Core.TextComponent"
    }
  ],
  "@version": 1
}"LMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.TextComponent8��؟����
 0f94b2a9b994441c8aa247524a7cd5da f517bc8999ee44ad81995015f3829cdc)ui://d669cade-6d27-49cc-b5c9-308fadbe2a67"x-mod/ui2��'
$d669cade-6d27-49cc-b5c9-308fadbe2a67/ui/DefaultGroup�%{
  "name": "DefaultGroup",
  "path": "/ui/DefaultGroup",
  "nameEditable": true,
  "enable": false,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "DefaultGroup",
    "sub_entity_id": null
  },
  "@components": [
    {
      "MobileOnly": false,
      "anchoredPosition": {
        "x": 0.0,
        "y": 0.0
      },
      "RectSize": {
        "x": 100.0,
        "y": 100.0
      },
      "OffsetMin": {
        "x": 0.0,
        "y": 0.0
      },
      "OffsetMax": {
        "x": 0.0,
        "y": 0.0
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 15,
      "AnchorsMin": {
        "x": 0.0,
        "y": 0.0
      },
      "AnchorsMax": {
        "x": 1.0,
        "y": 1.0
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.UITransformComponent"
    },
    {
      "thumnail": "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",
      "DefaultShow": false,
      "GroupType": 1,
      "GroupOrder": 0,
      "Enable": true,
      "@type": "MOD.Core.UIGroupComponent"
    },
    {
      "GroupAapha": 1.0,
      "Interactable": true,
      "BlocksRaycasts": true,
      "Enable": true,
      "@type": "MOD.Core.CanvasGroupComponent"
    }
  ],
  "@version": 1
}"UMOD.Core.UITransformComponent,MOD.Core.UIGroupComponent,MOD.Core.CanvasGroupComponent�
$a3f9934c-63ab-4887-8337-b529c126be86/ui/DefaultGroup/Button_Attack�{
  "name": "Button_Attack",
  "path": "/ui/DefaultGroup/Button_Attack",
  "nameEditable": false,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MODButton",
    "sub_entity_id": null
  },
  "@components": [
    {
      "MobileOnly": true,
      "anchoredPosition": {
        "x": -174.9,
        "y": 332.0
      },
      "RectSize": {
        "x": 204.0,
        "y": 204.0
      },
      "OffsetMin": {
        "x": -276.9,
        "y": 230.0
      },
      "OffsetMax": {
        "x": -72.8999939,
        "y": 434.0
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 8,
      "AnchorsMin": {
        "x": 1.0,
        "y": 0.0
      },
      "AnchorsMax": {
        "x": 1.0,
        "y": 0.0
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": -1.6695,
        "y": -1.67399991,
        "z": 0.0
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.UITransformComponent"
    },
    {
      "ImageRUID": {
        "DataId": "cd0560c4fc7f3b14994b90a502f00a21"
      },
      "Color": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "FlipX": false,
      "FlipY": false,
      "RaycastTarget": true,
      "Type": 0,
      "PreserveAspect": true,
      "FillCenter": true,
      "FillAmount": 1.0,
      "FillMethod": 0,
      "FillOrigin": 0,
      "FillClockWise": true,
      "Outline": false,
      "OutlineColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "OutlineWidth": 3.0,
      "DropShadow": false,
      "DropShadowColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 0.72
      },
      "DropShadowDistance": 32.0,
      "DropShadowAngle": 30.0,
      "FrameColumn": 1,
      "FrameRow": 1,
      "FrameRate": 0,
      "Enable": true,
      "@type": "MOD.Core.ImageComponent"
    },
    {
      "KeyCode": 306,
      "Enable": true,
      "@type": "MOD.Core.ButtonComponent"
    }
  ],
  "@version": 1
}"NMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.ButtonComponent�
$3062b459-a464-4e1f-b508-6b3c05d2a8f7)/ui/DefaultGroup/Button_Attack/MODPanel_2�{
  "name": "MODPanel_2",
  "path": "/ui/DefaultGroup/Button_Attack/MODPanel_2",
  "nameEditable": false,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MODImage",
    "sub_entity_id": null
  },
  "@components": [
    {
      "MobileOnly": false,
      "anchoredPosition": {
        "x": -2.0,
        "y": -1.0
      },
      "RectSize": {
        "x": 108.0,
        "y": 109.0
      },
      "OffsetMin": {
        "x": -56.0,
        "y": -55.5
      },
      "OffsetMax": {
        "x": 52.0,
        "y": 53.5
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 0,
      "AnchorsMin": {
        "x": 0.5,
        "y": 0.5
      },
      "AnchorsMax": {
        "x": 0.5,
        "y": 0.5
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": -2.0,
        "y": -1.0,
        "z": 0.0
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.UITransformComponent"
    },
    {
      "ImageRUID": {
        "DataId": "cc55ed79f099cc94fae152e754984ddd"
      },
      "Color": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "FlipX": false,
      "FlipY": false,
      "RaycastTarget": true,
      "Type": 0,
      "PreserveAspect": true,
      "FillCenter": true,
      "FillAmount": 1.0,
      "FillMethod": 0,
      "FillOrigin": 0,
      "FillClockWise": true,
      "Outline": false,
      "OutlineColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "OutlineWidth": 3.0,
      "DropShadow": false,
      "DropShadowColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 0.72
      },
      "DropShadowDistance": 32.0,
      "DropShadowAngle": 30.0,
      "FrameColumn": 1,
      "FrameRow": 1,
      "FrameRate": 0,
      "Enable": true,
      "@type": "MOD.Core.ImageComponent"
    }
  ],
  "@version": 1
}"5MOD.Core.UITransformComponent,MOD.Core.ImageComponent�
$62c513bf-7435-4f05-aea7-635bfcb2442b/ui/DefaultGroup/Button_Jump�{
  "name": "Button_Jump",
  "path": "/ui/DefaultGroup/Button_Jump",
  "nameEditable": false,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MODButton",
    "sub_entity_id": null
  },
  "@components": [
    {
      "MobileOnly": true,
      "anchoredPosition": {
        "x": -392.0,
        "y": 193.57
      },
      "RectSize": {
        "x": 204.0,
        "y": 204.0
      },
      "OffsetMin": {
        "x": -494.0,
        "y": 91.57001
      },
      "OffsetMax": {
        "x": -290.0,
        "y": 295.57
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 8,
      "AnchorsMin": {
        "x": 1.0,
        "y": 0.0
      },
      "AnchorsMax": {
        "x": 1.0,
        "y": 0.0
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": -0.8595,
        "y": -1.67399991,
        "z": 0.0
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.UITransformComponent"
    },
    {
      "ImageRUID": {
        "DataId": "cd0560c4fc7f3b14994b90a502f00a21"
      },
      "Color": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "FlipX": false,
      "FlipY": false,
      "RaycastTarget": true,
      "Type": 0,
      "PreserveAspect": true,
      "FillCenter": true,
      "FillAmount": 1.0,
      "FillMethod": 0,
      "FillOrigin": 0,
      "FillClockWise": true,
      "Outline": false,
      "OutlineColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "OutlineWidth": 3.0,
      "DropShadow": false,
      "DropShadowColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 0.72
      },
      "DropShadowDistance": 32.0,
      "DropShadowAngle": 30.0,
      "FrameColumn": 1,
      "FrameRow": 1,
      "FrameRate": 0,
      "Enable": true,
      "@type": "MOD.Core.ImageComponent"
    },
    {
      "KeyCode": 32,
      "Enable": true,
      "@type": "MOD.Core.ButtonComponent"
    }
  ],
  "@version": 1
}"NMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.ButtonComponent�
$5d9b0eec-e53e-4d14-86d3-727760be6816'/ui/DefaultGroup/Button_Jump/MODPanel_2�{
  "name": "MODPanel_2",
  "path": "/ui/DefaultGroup/Button_Jump/MODPanel_2",
  "nameEditable": false,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MODImage",
    "sub_entity_id": null
  },
  "@components": [
    {
      "MobileOnly": false,
      "anchoredPosition": {
        "x": -5.0,
        "y": 1.0
      },
      "RectSize": {
        "x": 153.0,
        "y": 134.0
      },
      "OffsetMin": {
        "x": -81.5,
        "y": -66.0
      },
      "OffsetMax": {
        "x": 71.5,
        "y": 68.0
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 0,
      "AnchorsMin": {
        "x": 0.5,
        "y": 0.5
      },
      "AnchorsMax": {
        "x": 0.5,
        "y": 0.5
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": -5.0,
        "y": 1.0,
        "z": 0.0
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.UITransformComponent"
    },
    {
      "ImageRUID": {
        "DataId": "b44742a7c3de2604ba4999a54ae0b4ed"
      },
      "Color": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "FlipX": false,
      "FlipY": false,
      "RaycastTarget": true,
      "Type": 0,
      "PreserveAspect": true,
      "FillCenter": true,
      "FillAmount": 1.0,
      "FillMethod": 0,
      "FillOrigin": 0,
      "FillClockWise": true,
      "Outline": false,
      "OutlineColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "OutlineWidth": 3.0,
      "DropShadow": false,
      "DropShadowColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 0.72
      },
      "DropShadowDistance": 32.0,
      "DropShadowAngle": 30.0,
      "FrameColumn": 1,
      "FrameRow": 1,
      "FrameRate": 0,
      "Enable": true,
      "@type": "MOD.Core.ImageComponent"
    }
  ],
  "@version": 1
}"5MOD.Core.UITransformComponent,MOD.Core.ImageComponent�
$e225c4e3-7c87-4a3b-bd6a-21abdc42cd94/ui/DefaultGroup/MODJoystick�{
  "name": "MODJoystick",
  "path": "/ui/DefaultGroup/MODJoystick",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MODImage",
    "sub_entity_id": null
  },
  "@components": [
    {
      "MobileOnly": true,
      "anchoredPosition": {
        "x": 310.0,
        "y": 230.0
      },
      "RectSize": {
        "x": 200.0,
        "y": 200.0002
      },
      "OffsetMin": {
        "x": 210.0,
        "y": 129.999908
      },
      "OffsetMax": {
        "x": 410.0,
        "y": 330.0001
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 7,
      "AnchorsMin": {
        "x": 0.0,
        "y": 0.0
      },
      "AnchorsMax": {
        "x": 0.0,
        "y": 0.0
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": 310.0,
        "y": 230.0,
        "z": 0.0
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.UITransformComponent"
    },
    {
      "ImageRUID": {
        "DataId": ""
      },
      "Color": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 0.0
      },
      "FlipX": false,
      "FlipY": false,
      "RaycastTarget": false,
      "Type": 1,
      "PreserveAspect": true,
      "FillCenter": true,
      "FillAmount": 1.0,
      "FillMethod": 0,
      "FillOrigin": 0,
      "FillClockWise": true,
      "Outline": false,
      "OutlineColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "OutlineWidth": 3.0,
      "DropShadow": false,
      "DropShadowColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 0.72
      },
      "DropShadowDistance": 32.0,
      "DropShadowAngle": 30.0,
      "FrameColumn": 1,
      "FrameRow": 1,
      "FrameRate": 0,
      "Enable": true,
      "@type": "MOD.Core.ImageComponent"
    },
    {
      "DynamicStick": true,
      "Enable": true,
      "@type": "MOD.Core.JoystickComponent"
    }
  ],
  "@version": 1
}"PMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.JoystickComponent�
$6367cc9f-99bb-4d58-b8c1-3840f9ce8e8e/ui/DefaultGroup/MODChat�{
  "name": "MODChat",
  "path": "/ui/DefaultGroup/MODChat",
  "nameEditable": false,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MODChat",
    "sub_entity_id": null
  },
  "@components": [
    {
      "MobileOnly": false,
      "anchoredPosition": {
        "x": 429.4,
        "y": -248.0
      },
      "RectSize": {
        "x": 808.0,
        "y": 485.0
      },
      "OffsetMin": {
        "x": 25.3999939,
        "y": -490.5
      },
      "OffsetMax": {
        "x": 833.4,
        "y": -5.5
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 4,
      "AnchorsMin": {
        "x": 0.0,
        "y": 1.0
      },
      "AnchorsMax": {
        "x": 0.0,
        "y": 1.0
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": 2.07,
        "y": -1.1025,
        "z": 0.0
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.UITransformComponent"
    },
    {
      "ImageRUID": {
        "DataId": ""
      },
      "Color": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 0.0
      },
      "FlipX": false,
      "FlipY": false,
      "RaycastTarget": false,
      "Type": 1,
      "PreserveAspect": true,
      "FillCenter": true,
      "FillAmount": 1.0,
      "FillMethod": 0,
      "FillOrigin": 0,
      "FillClockWise": true,
      "Outline": false,
      "OutlineColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "OutlineWidth": 3.0,
      "DropShadow": false,
      "DropShadowColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 0.72
      },
      "DropShadowDistance": 32.0,
      "DropShadowAngle": 30.0,
      "FrameColumn": 1,
      "FrameRow": 1,
      "FrameRate": 0,
      "Enable": true,
      "@type": "MOD.Core.ImageComponent"
    },
    {
      "ChatBalloonEnabled": true,
      "Enable": true,
      "@type": "MOD.Core.ChatComponent"
    }
  ],
  "@version": 1
}"LMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.ChatComponent8���ٟ�����
 9ff6d61196a54fb49439464e1b546009 f517bc8999ee44ad81995015f3829cdc)ui://e62ed24c-6b00-4670-82eb-779e1bcb5e2a"x-mod/ui2���J
$e62ed24c-6b00-4670-82eb-779e1bcb5e2a/ui/UITitle�I{
  "name": "UITitle",
  "path": "/ui/UITitle",
  "nameEditable": true,
  "enable": false,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "UIGroup",
    "sub_entity_id": null
  },
  "@components": [
    {
      "MobileOnly": false,
      "anchoredPosition": {
        "x": 0.0,
        "y": 0.0
      },
      "RectSize": {
        "x": 100.0,
        "y": 100.0
      },
      "OffsetMin": {
        "x": 0.0,
        "y": 0.0
      },
      "OffsetMax": {
        "x": 0.0,
        "y": 0.0
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 15,
      "AnchorsMin": {
        "x": 0.0,
        "y": 0.0
      },
      "AnchorsMax": {
        "x": 1.0,
        "y": 1.0
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.UITransformComponent"
    },
    {
      "thumnail": "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",
      "DefaultShow": false,
      "GroupType": 2,
      "GroupOrder": 1,
      "Enable": true,
      "@type": "MOD.Core.UIGroupComponent"
    },
    {
      "GroupAapha": 1.0,
      "Interactable": true,
      "BlocksRaycasts": true,
      "Enable": true,
      "@type": "MOD.Core.CanvasGroupComponent"
    }
  ],
  "@version": 1
}"UMOD.Core.UITransformComponent,MOD.Core.UIGroupComponent,MOD.Core.CanvasGroupComponent�
$35f8ba03-5511-4615-af8d-2ef5734a072f/ui/UITitle/UiTitleTxt�{
  "name": "UiTitleTxt",
  "path": "/ui/UITitle/UiTitleTxt",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MODText",
    "sub_entity_id": null
  },
  "@components": [
    {
      "MobileOnly": false,
      "anchoredPosition": {
        "x": 1.94341111,
        "y": 151.125946
      },
      "RectSize": {
        "x": 1882.08142,
        "y": 279.962158
      },
      "OffsetMin": {
        "x": -532.2354,
        "y": -145.754211
      },
      "OffsetMax": {
        "x": 536.122253,
        "y": 448.0061
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 0,
      "AnchorsMin": {
        "x": 0.5,
        "y": 0.5
      },
      "AnchorsMax": {
        "x": 0.5,
        "y": 0.5
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": 915.5792,
        "y": 660.6876,
        "z": 0.0
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.UITransformComponent"
    },
    {
      "Color": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "FlipX": false,
      "FlipY": true,
      "RaycastTarget": true,
      "Type": 1,
      "PreserveAspect": true,
      "FillCenter": false,
      "FillAmount": 1.0,
      "FillMethod": 0,
      "FillOrigin": 0,
      "FillClockWise": false,
      "Outline": false,
      "OutlineColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 0.0
      },
      "OutlineWidth": 3.0,
      "DropShadow": false,
      "DropShadowColor": {
        "r": 1.0,
        "g": 0.0,
        "b": 0.0,
        "a": 0.72
      },
      "DropShadowDistance": 22.0,
      "DropShadowAngle": 22.0,
      "FrameColumn": 1,
      "FrameRow": 1,
      "FrameRate": 0,
      "Enable": false,
      "@type": "MOD.Core.ImageComponent"
    },
    {
      "Text": "maple\\nstrategy",
      "FontSize": 280,
      "FontColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "AlignmentOptions": 4,
      "Padding": {
        "left": 0,
        "right": 0,
        "top": 0,
        "bottom": 0
      },
      "SizeFit": true,
      "Overflow": 0,
      "UseOutLine": false,
      "OutlineColor": {
        "r": 0.7,
        "g": 0.7,
        "b": 0.7,
        "a": 1.0
      },
      "OutlineDistance": {
        "x": 1.0,
        "y": -1.0
      },
      "Font": 3,
      "Enable": true,
      "@type": "MOD.Core.TextComponent"
    }
  ],
  "@version": 1
}"LMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.TextComponent�
$7c355b85-13ac-4f5f-a780-74511c111399#/ui/UITitle/UiTitleTxt/UiTitleTxt_1�{
  "name": "UiTitleTxt_1",
  "path": "/ui/UITitle/UiTitleTxt/UiTitleTxt_1",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MODText",
    "sub_entity_id": null
  },
  "@components": [
    {
      "MobileOnly": false,
      "anchoredPosition": {
        "x": -19.5266571,
        "y": 15.0
      },
      "RectSize": {
        "x": 1882.08142,
        "y": 279.962158
      },
      "OffsetMin": {
        "x": -553.7055,
        "y": -281.880157
      },
      "OffsetMax": {
        "x": 514.652161,
        "y": 311.880157
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 0,
      "AnchorsMin": {
        "x": 0.5,
        "y": 0.5
      },
      "AnchorsMax": {
        "x": 0.5,
        "y": 0.5
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": -11.0,
        "y": 8.4501,
        "z": 0.0
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.UITransformComponent"
    },
    {
      "Color": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "FlipX": false,
      "FlipY": true,
      "RaycastTarget": true,
      "Type": 1,
      "PreserveAspect": true,
      "FillCenter": false,
      "FillAmount": 1.0,
      "FillMethod": 0,
      "FillOrigin": 0,
      "FillClockWise": false,
      "Outline": false,
      "OutlineColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 0.0
      },
      "OutlineWidth": 3.0,
      "DropShadow": true,
      "DropShadowColor": {
        "r": 1.0,
        "g": 0.8496094,
        "b": 0.9316406,
        "a": 1.0
      },
      "DropShadowDistance": 22.0,
      "DropShadowAngle": 22.0,
      "FrameColumn": 1,
      "FrameRow": 1,
      "FrameRate": 0,
      "Enable": false,
      "@type": "MOD.Core.ImageComponent"
    },
    {
      "Text": "maple\\nstrategy",
      "FontSize": 280,
      "FontColor": {
        "r": 1.0,
        "g": 0.94921875,
        "b": 0.0,
        "a": 1.0
      },
      "AlignmentOptions": 4,
      "Padding": {
        "left": 0,
        "right": 0,
        "top": 0,
        "bottom": 0
      },
      "SizeFit": true,
      "Overflow": 0,
      "UseOutLine": false,
      "OutlineColor": {
        "r": 0.7,
        "g": 0.7,
        "b": 0.7,
        "a": 1.0
      },
      "OutlineDistance": {
        "x": 1.0,
        "y": -1.0
      },
      "Font": 3,
      "Enable": true,
      "@type": "MOD.Core.TextComponent"
    }
  ],
  "@version": 1
}"LMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.TextComponent�
$403911d1-dd42-452f-84df-6c38b6d6c4c6/ui/UITitle/UiTitleStartBtn�{
  "name": "UiTitleStartBtn",
  "path": "/ui/UITitle/UiTitleStartBtn",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MODText",
    "sub_entity_id": null
  },
  "@components": [
    {
      "MobileOnly": false,
      "anchoredPosition": {
        "x": 316.7239,
        "y": -407.35144
      },
      "RectSize": {
        "x": 371.298828,
        "y": 130.269379
      },
      "OffsetMin": {
        "x": 131.0745,
        "y": -472.486145
      },
      "OffsetMax": {
        "x": 502.373322,
        "y": -342.216736
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 0,
      "AnchorsMin": {
        "x": 0.5,
        "y": 0.5
      },
      "AnchorsMax": {
        "x": 0.5,
        "y": 0.5
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": 1135.55774,
        "y": 354.2429,
        "z": 0.0
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.UITransformComponent"
    },
    {
      "ImageRUID": {
        "DataId": "0c80d52cfe5626b4ca1bb5067c0c6938"
      },
      "Color": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "FlipX": false,
      "FlipY": false,
      "RaycastTarget": true,
      "Type": 1,
      "PreserveAspect": true,
      "FillCenter": true,
      "FillAmount": 1.0,
      "FillMethod": 0,
      "FillOrigin": 0,
      "FillClockWise": true,
      "Outline": false,
      "OutlineColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "OutlineWidth": 3.0,
      "DropShadow": false,
      "DropShadowColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 0.72
      },
      "DropShadowDistance": 32.0,
      "DropShadowAngle": 30.0,
      "FrameColumn": 1,
      "FrameRow": 1,
      "FrameRate": 0,
      "Enable": true,
      "@type": "MOD.Core.ImageComponent"
    },
    {
      "Text": "시작하기",
      "FontSize": 50,
      "FontColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "AlignmentOptions": 4,
      "Padding": {
        "left": 0,
        "right": 0,
        "top": 0,
        "bottom": 0
      },
      "SizeFit": false,
      "Overflow": 0,
      "UseOutLine": false,
      "OutlineColor": {
        "r": 0.7,
        "g": 0.7,
        "b": 0.7,
        "a": 1.0
      },
      "OutlineDistance": {
        "x": 1.0,
        "y": -1.0
      },
      "Font": 0,
      "Enable": true,
      "@type": "MOD.Core.TextComponent"
    },
    {
      "KeyCode": 0,
      "Enable": true,
      "@type": "MOD.Core.ButtonComponent"
    },
    {
      "Enable": true,
      "@type": "script.StateTitleStartIntro"
    }
  ],
  "@version": 1
}"�MOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.TextComponent,MOD.Core.ButtonComponent,script.StateTitleStartIntro�
$35dae06e-d3c6-4fa4-a513-cc3621d9fc29/ui/UITitle/UiTitleGoOnBtn�{
  "name": "UiTitleGoOnBtn",
  "path": "/ui/UITitle/UiTitleGoOnBtn",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MODText",
    "sub_entity_id": null
  },
  "@components": [
    {
      "MobileOnly": false,
      "anchoredPosition": {
        "x": -379.8348,
        "y": -405.8462
      },
      "RectSize": {
        "x": 378.207642,
        "y": 133.279922
      },
      "OffsetMin": {
        "x": -568.9386,
        "y": -472.486145
      },
      "OffsetMax": {
        "x": -190.730988,
        "y": -339.206238
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 0,
      "AnchorsMin": {
        "x": 0.5,
        "y": 0.5
      },
      "AnchorsMax": {
        "x": 0.5,
        "y": 0.5
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": 700.5109,
        "y": 346.9266,
        "z": 0.0
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.UITransformComponent"
    },
    {
      "ImageRUID": {
        "DataId": "0c80d52cfe5626b4ca1bb5067c0c6938"
      },
      "Color": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "FlipX": false,
      "FlipY": false,
      "RaycastTarget": true,
      "Type": 1,
      "PreserveAspect": true,
      "FillCenter": true,
      "FillAmount": 1.0,
      "FillMethod": 0,
      "FillOrigin": 0,
      "FillClockWise": true,
      "Outline": false,
      "OutlineColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "OutlineWidth": 3.0,
      "DropShadow": false,
      "DropShadowColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 0.72
      },
      "DropShadowDistance": 32.0,
      "DropShadowAngle": 30.0,
      "FrameColumn": 1,
      "FrameRow": 1,
      "FrameRate": 0,
      "Enable": true,
      "@type": "MOD.Core.ImageComponent"
    },
    {
      "Text": "이어하기",
      "FontSize": 50,
      "FontColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "AlignmentOptions": 4,
      "Padding": {
        "left": 0,
        "right": 0,
        "top": 0,
        "bottom": 0
      },
      "SizeFit": false,
      "Overflow": 0,
      "UseOutLine": false,
      "OutlineColor": {
        "r": 0.7,
        "g": 0.7,
        "b": 0.7,
        "a": 1.0
      },
      "OutlineDistance": {
        "x": 1.0,
        "y": -1.0
      },
      "Font": 0,
      "Enable": true,
      "@type": "MOD.Core.TextComponent"
    },
    {
      "KeyCode": 0,
      "Enable": true,
      "@type": "MOD.Core.ButtonComponent"
    }
  ],
  "@version": 1
}"eMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.TextComponent,MOD.Core.ButtonComponent�
$62c5b75a-289f-4a10-bfd7-9d14706edbf6/ui/UITitle/MODText_1�{
  "name": "MODText_1",
  "path": "/ui/UITitle/MODText_1",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MODText",
    "sub_entity_id": null
  },
  "@components": [
    {
      "MobileOnly": false,
      "anchoredPosition": {
        "x": 363.8811,
        "y": 126.711929
      },
      "RectSize": {
        "x": 344.482178,
        "y": 100.0
      },
      "OffsetMin": {
        "x": 191.640015,
        "y": 76.71193
      },
      "OffsetMax": {
        "x": 536.1222,
        "y": 176.711929
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 0,
      "AnchorsMin": {
        "x": 0.5,
        "y": 0.5
      },
      "AnchorsMax": {
        "x": 0.5,
        "y": 0.5
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": 1518.74927,
        "y": 1024.17346,
        "z": 0.0
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.UITransformComponent"
    },
    {
      "Color": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "FlipX": false,
      "FlipY": false,
      "RaycastTarget": true,
      "Type": 1,
      "PreserveAspect": true,
      "FillCenter": true,
      "FillAmount": 1.0,
      "FillMethod": 0,
      "FillOrigin": 0,
      "FillClockWise": true,
      "Outline": false,
      "OutlineColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "OutlineWidth": 3.0,
      "DropShadow": false,
      "DropShadowColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 0.72
      },
      "DropShadowDistance": 32.0,
      "DropShadowAngle": 30.0,
      "FrameColumn": 1,
      "FrameRow": 1,
      "FrameRate": 0,
      "Enable": false,
      "@type": "MOD.Core.ImageComponent"
    },
    {
      "Text": "전략 메이플",
      "FontSize": 60,
      "FontColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "AlignmentOptions": 4,
      "Padding": {
        "left": 0,
        "right": 0,
        "top": 0,
        "bottom": 0
      },
      "SizeFit": false,
      "Overflow": 0,
      "UseOutLine": true,
      "OutlineColor": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "OutlineDistance": {
        "x": 1.0,
        "y": -1.0
      },
      "Font": 0,
      "Enable": true,
      "@type": "MOD.Core.TextComponent"
    }
  ],
  "@version": 1
}"LMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.TextComponent8���ٟ�����
 e139313075c344328c04f2f2e7a16b2d f517bc8999ee44ad81995015f3829cdc)ui://ed5a3331-eae7-42cb-99ad-eda8925f0fbb"x-mod/ui2��
$ed5a3331-eae7-42cb-99ad-eda8925f0fbb/ui/UIDialog�{
  "name": "UIDialog",
  "path": "/ui/UIDialog",
  "nameEditable": true,
  "enable": false,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "UIGroup",
    "sub_entity_id": null
  },
  "@components": [
    {
      "MobileOnly": false,
      "anchoredPosition": {
        "x": 0.0,
        "y": 0.0
      },
      "RectSize": {
        "x": 100.0,
        "y": 100.0
      },
      "OffsetMin": {
        "x": 0.0,
        "y": 0.0
      },
      "OffsetMax": {
        "x": 0.0,
        "y": 0.0
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 15,
      "AnchorsMin": {
        "x": 0.0,
        "y": 0.0
      },
      "AnchorsMax": {
        "x": 1.0,
        "y": 1.0
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.UITransformComponent"
    },
    {
      "thumnail": "/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRwhMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCABkAMgDASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwDw+iiitjAO9FHeigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAEbpT2k3uXMjLu5YYzyc5x/nvTaKGhp2E4JYgYB6D0qZbgC2SLlWSTeGAz61FR2pWC4rSPLIzucsepopKKYgooooAO9FFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABR2oooAKKKKACiiigAoo70UAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFHagAooooAKKKKADvRR3ooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKO1FHagAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKWgBKKKKACiiigAooooAKKKKACiiigAooooAseXbf89pf+/Q/+Ko8u2/57S/9+h/8VUVFTdl2RL5dt/z2l/79D/4qjy7b/ntL/wB+h/8AFVFRRdhZEvl23/PaX/v0P/iqPLtv+e0v/fof/FVFRRdhZEvl23/PaX/v0P8A4qjy7b/ntL/36H/xVRUUXYWRL5dt/wA9pf8Av0P/AIqjy7b/AJ7S/wDfof8AxVRUUrsLIl8u2/57S/8Afof/ABVHl23/AD2l/wC/Q/8Aiqiop3YWRL5dt/z2l/79D/4qjy7b/ntL/wB+h/8AFVFRSuwsiXy7b/ntL/36H/xVHl23/PaX/v0P/iqiop3YWRL5dt/z2l/79D/4qjy7b/ntL/36H/xVRUUXYWRL5dt/z2l/79D/AOKo8u2/57S/9+h/8VUVFF2FkS+Xbf8APaX/AL9D/wCKo8u2/wCe0v8A36H/AMVUVFF2FkS+Xbf89pf+/Q/+Ko8u2/57S/8Afof/ABVRUUXYWRL5dt/z2l/79D/4qioqKLsLIKKKKQwooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigD/2Q==",
      "DefaultShow": false,
      "GroupType": 2,
      "GroupOrder": 2,
      "Enable": true,
      "@type": "MOD.Core.UIGroupComponent"
    },
    {
      "GroupAapha": 1.0,
      "Interactable": true,
      "BlocksRaycasts": true,
      "Enable": true,
      "@type": "MOD.Core.CanvasGroupComponent"
    }
  ],
  "@version": 1
}"UMOD.Core.UITransformComponent,MOD.Core.UIGroupComponent,MOD.Core.CanvasGroupComponent�
$1b5552f9-52b4-4718-9b1b-38ab6ee3d468/ui/UIDialog/UIDialogBkgr�{
  "name": "UIDialogBkgr",
  "path": "/ui/UIDialog/UIDialogBkgr",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MODImage",
    "sub_entity_id": null
  },
  "@components": [
    {
      "MobileOnly": false,
      "anchoredPosition": {
        "x": 0.0,
        "y": -6.10351563E-05
      },
      "RectSize": {
        "x": 2000.0,
        "y": 2000.0
      },
      "OffsetMin": {
        "x": -1000.0,
        "y": -1000.00006
      },
      "OffsetMax": {
        "x": 1000.0,
        "y": 999.999939
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 0,
      "AnchorsMin": {
        "x": 0.5,
        "y": 0.5
      },
      "AnchorsMax": {
        "x": 0.5,
        "y": 0.5
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": 963.4844,
        "y": 575.5533,
        "z": 0.0
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.UITransformComponent"
    },
    {
      "Color": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 0.8
      },
      "FlipX": false,
      "FlipY": false,
      "RaycastTarget": true,
      "Type": 1,
      "PreserveAspect": true,
      "FillCenter": true,
      "FillAmount": 1.0,
      "FillMethod": 0,
      "FillOrigin": 0,
      "FillClockWise": true,
      "Outline": false,
      "OutlineColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "OutlineWidth": 3.0,
      "DropShadow": false,
      "DropShadowColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 0.72
      },
      "DropShadowDistance": 32.0,
      "DropShadowAngle": 30.0,
      "FrameColumn": 1,
      "FrameRow": 1,
      "FrameRate": 0,
      "Enable": true,
      "@type": "MOD.Core.ImageComponent"
    }
  ],
  "@version": 1
}"5MOD.Core.UITransformComponent,MOD.Core.ImageComponent�
$f9e5ad59-a88e-443f-a6e5-93c8bbb18a44/ui/UIDialog/UiDialogTxt�{
  "name": "UiDialogTxt",
  "path": "/ui/UIDialog/UiDialogTxt",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MODText",
    "sub_entity_id": null
  },
  "@components": [
    {
      "MobileOnly": false,
      "anchoredPosition": {
        "x": -2.267303,
        "y": -339.788
      },
      "RectSize": {
        "x": 1617.697,
        "y": 316.379578
      },
      "OffsetMin": {
        "x": -811.1158,
        "y": -497.977783
      },
      "OffsetMax": {
        "x": 806.581238,
        "y": -181.5982
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 0,
      "AnchorsMin": {
        "x": 0.5,
        "y": 0.5
      },
      "AnchorsMax": {
        "x": 0.5,
        "y": 0.5
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": 1221.62134,
        "y": 601.1779,
        "z": 0.0
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.UITransformComponent"
    },
    {
      "ImageRUID": {
        "DataId": "8122dd6f67f3d9b4db8a3152172f9063"
      },
      "Color": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "FlipX": false,
      "FlipY": false,
      "RaycastTarget": true,
      "Type": 1,
      "PreserveAspect": true,
      "FillCenter": true,
      "FillAmount": 1.0,
      "FillMethod": 0,
      "FillOrigin": 0,
      "FillClockWise": true,
      "Outline": false,
      "OutlineColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "OutlineWidth": 3.0,
      "DropShadow": false,
      "DropShadowColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 0.72
      },
      "DropShadowDistance": 32.0,
      "DropShadowAngle": 30.0,
      "FrameColumn": 1,
      "FrameRow": 1,
      "FrameRate": 0,
      "Enable": true,
      "@type": "MOD.Core.ImageComponent"
    },
    {
      "Text": "안녕하세요",
      "FontSize": 30,
      "FontColor": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "AlignmentOptions": 0,
      "Padding": {
        "left": 30,
        "right": 30,
        "top": 30,
        "bottom": 30
      },
      "SizeFit": false,
      "Overflow": 0,
      "UseOutLine": false,
      "OutlineColor": {
        "r": 0.7,
        "g": 0.7,
        "b": 0.7,
        "a": 1.0
      },
      "OutlineDistance": {
        "x": 1.0,
        "y": -1.0
      },
      "Font": 0,
      "Enable": true,
      "@type": "MOD.Core.TextComponent"
    }
  ],
  "@version": 1
}"LMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.TextComponent�
$902a6342-e578-4b10-aa75-77920ea67f18/ui/UIDialog/UiDialogNext�{
  "name": "UiDialogNext",
  "path": "/ui/UIDialog/UiDialogNext",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MODButton",
    "sub_entity_id": null
  },
  "@components": [
    {
      "MobileOnly": false,
      "anchoredPosition": {
        "x": 657.5728,
        "y": -479.774567
      },
      "RectSize": {
        "x": 245.3392,
        "y": 103.043777
      },
      "OffsetMin": {
        "x": 534.9032,
        "y": -531.296448
      },
      "OffsetMax": {
        "x": 780.242432,
        "y": -428.2527
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 0,
      "AnchorsMin": {
        "x": 0.5,
        "y": 0.5
      },
      "AnchorsMax": {
        "x": 0.5,
        "y": 0.5
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": 1806.12964,
        "y": 477.1731,
        "z": 0.0
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.UITransformComponent"
    },
    {
      "ImageRUID": {
        "DataId": "0c80d52cfe5626b4ca1bb5067c0c6938"
      },
      "Color": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "FlipX": false,
      "FlipY": false,
      "RaycastTarget": true,
      "Type": 1,
      "PreserveAspect": true,
      "FillCenter": true,
      "FillAmount": 1.0,
      "FillMethod": 0,
      "FillOrigin": 0,
      "FillClockWise": true,
      "Outline": false,
      "OutlineColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "OutlineWidth": 3.0,
      "DropShadow": false,
      "DropShadowColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 0.72
      },
      "DropShadowDistance": 32.0,
      "DropShadowAngle": 30.0,
      "FrameColumn": 1,
      "FrameRow": 1,
      "FrameRate": 0,
      "Enable": true,
      "@type": "MOD.Core.ImageComponent"
    },
    {
      "KeyCode": 0,
      "Enable": true,
      "@type": "MOD.Core.ButtonComponent"
    },
    {
      "Text": "다음",
      "FontSize": 30,
      "FontColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "AlignmentOptions": 4,
      "Padding": {
        "left": 0,
        "right": 0,
        "top": 0,
        "bottom": 0
      },
      "SizeFit": false,
      "Overflow": 0,
      "UseOutLine": false,
      "OutlineColor": {
        "r": 0.7,
        "g": 0.7,
        "b": 0.7,
        "a": 1.0
      },
      "OutlineDistance": {
        "x": 1.0,
        "y": -1.0
      },
      "Font": 0,
      "Enable": true,
      "@type": "MOD.Core.TextComponent"
    },
    {
      "Enable": true,
      "@type": "script.StateIntroNextDialog"
    }
  ],
  "@version": 1
}"�MOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.ButtonComponent,MOD.Core.TextComponent,script.StateIntroNextDialog�
$dce003ef-2b4c-4650-bb09-e65ff3e96cbe/ui/UIDialog/UiDialogSkip�{
  "name": "UiDialogSkip",
  "path": "/ui/UIDialog/UiDialogSkip",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MODButton",
    "sub_entity_id": null
  },
  "@components": [
    {
      "MobileOnly": false,
      "anchoredPosition": {
        "x": 657.5728,
        "y": 452.201141
      },
      "RectSize": {
        "x": 245.3392,
        "y": 103.043777
      },
      "OffsetMin": {
        "x": 534.9032,
        "y": 400.67926
      },
      "OffsetMax": {
        "x": 780.242432,
        "y": 503.723022
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 0,
      "AnchorsMin": {
        "x": 0.5,
        "y": 0.5
      },
      "AnchorsMax": {
        "x": 0.5,
        "y": 0.5
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": 1806.12964,
        "y": 1302.74817,
        "z": 0.0
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Scale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.UITransformComponent"
    },
    {
      "ImageRUID": {
        "DataId": "0c80d52cfe5626b4ca1bb5067c0c6938"
      },
      "Color": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "FlipX": false,
      "FlipY": false,
      "RaycastTarget": true,
      "Type": 1,
      "PreserveAspect": true,
      "FillCenter": true,
      "FillAmount": 1.0,
      "FillMethod": 0,
      "FillOrigin": 0,
      "FillClockWise": true,
      "Outline": false,
      "OutlineColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "OutlineWidth": 3.0,
      "DropShadow": false,
      "DropShadowColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 0.72
      },
      "DropShadowDistance": 32.0,
      "DropShadowAngle": 30.0,
      "FrameColumn": 1,
      "FrameRow": 1,
      "FrameRate": 0,
      "Enable": true,
      "@type": "MOD.Core.ImageComponent"
    },
    {
      "KeyCode": 0,
      "Enable": true,
      "@type": "MOD.Core.ButtonComponent"
    },
    {
      "Text": "건너뛰기",
      "FontSize": 30,
      "FontColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "AlignmentOptions": 4,
      "Padding": {
        "left": 0,
        "right": 0,
        "top": 0,
        "bottom": 0
      },
      "SizeFit": false,
      "Overflow": 0,
      "UseOutLine": false,
      "OutlineColor": {
        "r": 0.7,
        "g": 0.7,
        "b": 0.7,
        "a": 1.0
      },
      "OutlineDistance": {
        "x": 1.0,
        "y": -1.0
      },
      "Font": 0,
      "Enable": true,
      "@type": "MOD.Core.TextComponent"
    },
    {
      "Enable": true,
      "@type": "script.StateIntroSkip"
    }
  ],
  "@version": 1
}"{MOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.ButtonComponent,MOD.Core.TextComponent,script.StateIntroSkip8ń�ڟ����
 e9cf3790234348cabd6610db2408f342 f517bc8999ee44ad81995015f3829cdcuserdataset://introdialog"x-mod/userdataset2��{
  "name": "IntroDialog",
  "columns": [
    {
      "Name": "id",
      "DisplayName": "id",
      "Type": "System.String"
    },
    {
      "Name": "role",
      "DisplayName": "role",
      "Type": "System.String"
    },
    {
      "Name": "dialog",
      "DisplayName": "dialog",
      "Type": "System.String"
    },
    {
      "Name": "reserve",
      "DisplayName": "reserve",
      "Type": "System.String"
    }
  ],
  "datas": [
    {
      "id": "1",
      "state": "Intro",
      "role": "툰트라",
      "dialog": "(왜지? 아무것도 보이지 않아)​"
    },
    {
      "id": "2",
      "state": "Intro",
      "role": "툰트라​",
      "dialog": "(말을 타고 가다 화살을 맞고 떨어졌는데 ... 내 눈이 다칠걸까?)​"
    },
    {
      "id": "3",
      "role": "남자 1",
      "dialog": "여기 이상한 옷차림의 녀석이 쓰러져있군. 살펴봐라!"
    },
    {
      "id": "4",
      "role": "남자 2",
      "dialog": "기절했습니다. 어떡하죠?"
    },
    {
      "role": "툰트라",
      "dialog": "(당연하지. 난 쉽게 죽지 않는다고...)",
      "id": "5"
    },
    {
      "role": "남자 1",
      "dialog": "여진인 같지 않은데... 어쨌든 데려가라!",
      "id": "6"
    },
    {
      "id": "7",
      "role": "툰트라",
      "dialog": "(여진? 무슨 말이야...)"
    },
    {
      "id": "8",
      "role": "남자 2",
      "dialog": "알겠습니다. 이봐! 도와<u>줘</u>​"
    },
    {
      "id": "",
      "role": "남자 1",
      "dialog": "이런! 반군 녀석들이다!"
    },
    {}
  ]
}8���ڻ��J 8ac304c343ee493fb325a719fc698a4e0
      },
      "SizeFit": false,
      "Overflow": 0,
      "UseOutLine": false,
      "OutlineColor": {
        "r": 0.7,
        "g": 0.7,
        "b": 0.7,
        "a": 1.0
      },
      "OutlineDistance": {
        "x": 1.0,
        "y": -1.0
      },
      "Font": 0,
      "Enable": true,
      "@type": "MOD.Core.TextComponent"
    },
    {
      "Enable": true,
      "@type": "script.StateIntroSkip"
    }
  ],
  "@version": 1
}"{MOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.ButtonComponent,MOD.Core.TextComponent,script.StateIntroSkip8ꊛ������
 e9cf3790234348cabd6610db2408f342 f517bc8999ee44ad81995015f3829cdcuserdataset://introdialog"x-mod/userdataset2��{
  "name": "IntroDialog",
  "columns": [
    {
      "Name": "id",
      "DisplayName": "id",
      "Type": "System.String"
    },
    {
      "Name": "role",
      "DisplayName": "role",
      "Type": "System.String"
    },
    {
      "Name": "dialog",
      "DisplayName": "dialog",
      "Type": "System.String"
    },
    {
      "Name": "reserve",
      "DisplayName": "reserve",
      "Type": "System.String"
    }
  ],
  "datas": [
    {
      "id": "1",
      "state": "Intro",
      "role": "툰트라",
      "dialog": "(왜지? 아무것도 보이지 않아)​"
    },
    {
      "id": "2",
      "state": "Intro",
      "role": "툰트라​",
      "dialog": "(말을 타고 가다 화살을 맞고 떨어졌는데 ... 내 눈이 다칠걸까?)​"
    },
    {
      "id": "3",
      "role": "남자 1",
      "dialog": "여기 이상한 옷차림의 녀석이 쓰러져있군. 살펴봐라!"
    },
    {
      "id": "4",
      "role": "남자 2",
      "dialog": "기절했습니다. 어떡하죠?"
    },
    {
      "role": "툰트라",
      "dialog": "(당연하지. 난 쉽게 죽지 않는다고...)",
      "id": "5"
    },
    {
      "role": "남자 1",
      "dialog": "여진인 같지 않은데... 어쨌든 데려가라!",
      "id": "6"
    },
    {
      "id": "7",
      "role": "툰트라",
      "dialog": "(여진? 무슨 말이야...)"
    },
    {
      "id": "8",
      "role": "남자 2",
      "dialog": "알겠습니다. 이봐! 도와<u>줘</u>​"
    },
    {
      "id": "",
      "role": "남자 1",
      "dialog": "이런! 반군 녀석들이다!"
    },
    {}
  ]
}8���ڻ��J 8ac304c343ee493fb325a719fc698a4e