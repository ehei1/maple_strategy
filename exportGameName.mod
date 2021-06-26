
 �
 3ec1a4c642c841f98aae60f9891835c4 f517bc8999ee44ad81995015f3829cdc0codeblock://08c39556-104f-424f-a7ea-dcdd1ebf21f4"x-mod/codeblock2��{
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
  "Name": "CommonButtonAction",
  "Type": 1,
  "Source": 0,
  "Target": null,
  "Properties": [
    {
      "Name": "CurrentStage",
      "Type": "Entity",
      "DefaultValue": "nil",
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
      "Code": "log(\"OnTouch\")\nlocal entity = _EntityService:GetEntityByPath(\"/ui/UIBattleGoal\")\nentity.UIGroupComponent.DefaultShow = false\nentity.Enable = false\nentity.Visible = false\n\n",
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
      "Code": "if self.Entity.Name == \"RemoveButton\" then\n\tlocal entity = _EntityService:GetEntityByPath(\"/ui/UIBattleGoal\")\n\t\n\tentity.UIGroupComponent.DefaultShow = false\n\tentity.Visible = false\n\tentity.Enable = false\nelseif self.Entity.Name == \"buttonContinue\" then\n\tlocal entity = _EntityService:GetEntityByPath(\"/ui/UIBattleResult\")\n\t\n\tentity.UIGroupComponent.DefaultShow = false\n\tentity.Visible = false\n\tentity.Enable = false\n\t\n\tif self.CurrentStage then\n\t\tself.CurrentStage.StateGameCommon:GoOn()\n\t\tself.CurrentStage = nil\n\telse\n\t\tlog_error(\"You need to set self.CurrentStageEntity before using /ui/UIBattleResult/buttonContinue\")\n\tend\nelseif self.Entity.Name==\"buttonSkip\" then\n\tif self.CurrentStage then\n\t\tlocal ui=_EntityService:GetEntityByPath(\"/ui/UIGameIntro\")\n\t\tui.Visible=false\n\t\tui.Enable=false\n\t\t\n\t\tself.CurrentStage.StateGameCommon:EndIntro()\n\telse\n\t\tlog_error(\"You need to set self.CurrentStageEntity before using /ui/UIGameIntroSkip/buttonSkip\")\n\tend\nend"
    }
  ]
}8���ϕ���
 2f9b9142c69442e58231dc2097375562 f517bc8999ee44ad81995015f3829cdc0codeblock://1eb8b78a-3bfa-4de6-b3a5-0d228abb3b16"x-mod/codeblock2��{
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
}8���ϕ���

 301be1b29d9c427f85d957d8bd0b8492 f517bc8999ee44ad81995015f3829cdc0codeblock://47484a98-2392-4c6d-9014-1b6211dd2331"x-mod/codeblock2�	�	{
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
}8����ϕ���T
 754e64d958bb43fa9b48227ac39c71d7 f517bc8999ee44ad81995015f3829cdc0codeblock://6c4fc364-6aa8-467a-80ee-bacfd03090d7"x-mod/codeblock2�S�S{
  "CoreVersion": {
    "Major": 0,
    "Minor": 2
  },
  "ScriptVersion": {
    "Major": 1,
    "Minor": 0
  },
  "Description": "",
  "Id": "6c4fc364-6aa8-467a-80ee-bacfd03090d7",
  "Language": 1,
  "Name": "StateGameCommon",
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
      "Name": "StateGame",
      "Type": "Entity",
      "DefaultValue": "nil",
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
    }
  ],
  "Methods": [
    {
      "Name": "StartGame",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [],
      "Code": "--[[\n-4: bush0\n-3: flower0\n-2: tree0\n-1: stone0\n1: lee sung kye\n2: tuntra\n3: park wei\n4: militia\n5: rebel\n]]--\nlocal allies = {}\nlocal enemies = {}\nlocal blocks = {}\nlocal grid_size = self.__properties.grid_size\nlocal units_on_map = {}\nlocal map=self.Map\nlocal map_size=self.MapSize\n\nfor i=0, #map - 1 do\n\tlocal location = map[i + 1]\n\tlocal entity = nil\n\tlocal entity_type = \"\"\n\t\n\tif location == 0 then\n\t\ttable.insert(units_on_map, 0)\n\t\t\n\t\tgoto skip_to_next\t\n\telseif location == 1 then\n\t\tentity = _EntityService:GetEntityByPath(\"/maps/map01/UnitLeeSungKye\")\n\t\tentity.NameTagComponent.Name = \"이성계\"\n\t\tentity_type=\"friendly\"\n\telseif location == 2 then\n\t\tentity = _EntityService:GetEntityByPath(\"/maps/map01/UnitTuntra\")\n\t\tentity.NameTagComponent.Name = \"툰트라\"\n\t\tentity_type=\"friendly\"\n\telseif location == 3 then\n\t\tentity = _EntityService:GetEntityByPath(\"/maps/map01/UnitParkWei\")\n\t\tentity.NameTagComponent.Name = \"박의\"\n\t\tentity_type=\"enemy\"\n\telseif location == 4 then\n\t\tentity = _EntityService:GetEntityByPath(\"/maps/map01/UnitMilitia0\")\n\t\tentity.NameTagComponent.Name = \"여진족\"\n\t\tentity_type=\"friendly\"\n\telseif location == 5 then\n\t\tentity = _EntityService:GetEntityByPath(\"/maps/map01/UnitRebel0\")\n\t\tentity.NameTagComponent.Name = \"반란군\"\n\t\tentity_type=\"enemy\"\n\t-- -1 stone0\n\telseif location==-1 then\n\t\tentity = _EntityService:GetEntityByPath(\"/maps/map01/UnitStone1\")\n\t\tentity_type=\"wall\"\n\t-- -2 tree0\n\telseif location==-2 then\n\t\tentity = _EntityService:GetEntityByPath(\"/maps/map01/UnitTree0\")\n\t\tentity_type=\"wall\"\n\t-- -3 flower0\n\telseif location==-3 then\n\t\tentity = _EntityService:GetEntityByPath(\"/maps/map01/UnitFlower0\")\n\t\tentity_type=\"wall\"\n\t-- -4 bush\n\telseif location==-4 then\n\t\tentity = _EntityService:GetEntityByPath(\"/maps/map01/UnitBush0\")\n\t\tentity_type=\"wall\"\n\telseif location == nil then\n\t\ttable.insert(units_on_map, 0)\n\n\t\tgoto skip_to_next\n\tend\n\t\n\tif entity == nil then\n\t\tlocal i = 0\n\tend\n\t\n\tentity.Enable = false\n\t\n\tlocal y = i / map_size.x\n\ty = math.floor(y)\n\t\n\tlocal x = i - math.floor(i / map_size.x) * map_size.x\n\t\n\tentity = entity:Clone()\n\ttable.insert(units_on_map, entity.Id)\n\t\n\tlocal entity_pos = Vector3(x * grid_size.x, y * -grid_size.y, 0) --+ bias\n\tentity.TransformComponent.WorldPosition = entity_pos\n\tentity.SpriteRendererComponent.OrderInLayer = y\n\t\n\tif entity.UnitCommon then\n\t\tentity.UnitCommon.LocationAtMap = Vector2(x, y)\n\t\tentity.UnitCommon:SetUnitType(location)\n\t\tentity.UnitCommon.Properties.Stage = \"playing 1\"\n\tend\n\t\n\tif entity_type==\"enemy\" then\n\t\tentity.SpriteRendererComponent.Color = Color(0.5, 0.5, 0.5, 1)\n\t\tentity.SpriteRendererComponent.FlipX = true\n\t\t\n\t\ttable.insert(enemies, entity)\t\n\telseif entity_type==\"friendly\" then\n\t\ttable.insert(allies, entity)\n\telseif entity_type==\"wall\" then\n\t\ttable.insert(blocks,nil)\n\telse\n\t\tlog_error(\"It is unspecified type\")\n\tend\n\t\n\tif location == 2 then\n\t\t_UserService.LocalPlayer.TransformComponent.WorldPosition = entity_pos\n\tend\n\t\n\t::skip_to_next::\nend\n\nif #units_on_map == #map then\n\tlocal tm = self.__properties.turn_manager.TurnManager\n\t\n\ttm.Allies = allies\n\ttm.Enemies = enemies\n\ttm.Blocks=blocks\n\ttm.Map = units_on_map\n\ttm.MapSize = map_size\n\ttm.GridSize = grid_size\n\ttm.StateGame = self.Entity\n\t\n\ttm:Start()\n\t\n\tlocal ui = self.__properties.battle_goal_ui\n\tui.UIGroupComponent.DefaultShow = true\n\tui.Enable = true\n\tui.Visible = true\n\t\n\tlocal background = _EntityService:GetEntityByPath(\"/maps/map01/BackGroundTemplate\")\n\tbackground.BackgroundTemplateComponent.SolidColor = Color(0.1, 0.5, 0.3, 1)else\n\tlog_error(\"Map size must equal to locations\")\nend\t",
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
      "Code": "self.__properties.battle_goal_ui = _EntityService:GetEntityByPath(\"/ui/UIBattleGoal\")\nself.__properties.turn_manager = _EntityService:GetEntityByPath(\"/common/TurnManager\")\nself.__properties.grid_size = Vector2(0.7, 1)\n\nself.Entity.Enable = false",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 2
    },
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
      "Code": "--[[\n--self:__put_units()\n--self.__properties.turn_manager.TurnManager:Start()\nself.__properties.turn_manager.TurnManager.StateGame = self.Entity\n\nlocal ui = self.__properties.battle_goal_ui\nui.UIGroupComponent.DefaultShow = true\nui.Enable = true\nui.Visible = true\n\nlocal background = _EntityService:GetEntityByPath(\"/maps/map01/BackGroundTemplate\")\nbackground.BackgroundTemplateComponent.SolidColor = Color(0.1, 0.5, 0.3, 1)\n--self.__properties.background_map_ruid = background.BackgroundTemplateComponent.MapRUID\n\n--background.Enable = true\n--background.BackgroundTemplateComponent.MapRUID = \"0b468052186f403a974f9de9fd642a15\"\n\n--background.Enable = true\n--background.Visible = true\n]]--\n\ndo\n\tlocal ui = _EntityService:GetEntityByPath(\"/ui/UIGameIntro\")\n\tui.Visible=true\n\tui.Enable=true\nend\n\ndo\n\tlocal ui = _EntityService:GetEntityByPath(\"/ui/UIGameIntro/buttonSkip\")\n\tui.CommonButtonAction.CurrentStage=self.Entity\nend\n\nself:StartIntro()",
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
      "Code": "self.__properties.turn_manager.TurnManager:End()\n\nlocal ui = self.__properties.battle_goal_ui\nui.UIGroupComponent.DefaultShow = false\nui.Enable = false\nui.Visible = false\n\nself.Entity.Enable = false\nself.StateGame = nil\n\nlocal background = _EntityService:GetEntityByPath(\"/maps/map01/BackGroundTemplate\")\n--background.Enable = true\nbackground.BackgroundTemplateComponent.MapRUID = self.__properties.background_map_ruid",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "GoOn",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": null,
      "Code": "-- goto next stage\n-- maybe I can run it loadstring()\nself:GetGameStateComponent():GoOn()",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "Finish",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [
        {
          "Name": "is_victory",
          "Type": "boolean",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "local entity = _EntityService:GetEntityByPath(\"/ui/UIBattleResult\")\nentity.Enable = true\nentity.Visible = true\n\nlocal button = _EntityService:GetEntityByPath(\"/ui/UIBattleResult/buttonContinue\")\nbutton.CommonButtonAction.CurrentStage = self.StateGame\n\nlocal score = _EntityService:GetEntityByPath(\"/ui/UIBattleResult/textScore\")\nscore.TextComponent.Text = \"666\"\n\nlocal result = _EntityService:GetEntityByPath(\"/ui/UIBattleResult/textResult\")\nresult.TextComponent.Text = is_victory and \"승리\" or \"패배\"",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "StartIntro",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": null,
      "Code": "self:GetGameStateComponent():StartIntro()",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "GetGameStateComponent",
      "Return": {
        "Name": null,
        "Type": "any",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": null,
      "Code": "if self.StateGame then\n\tif self.StateGame.Name == \"StateGame01\" then\n\t\treturn self.StateGame.StateGame01\n\telseif self.StateGame.Name == \"StateGame02\" then\n\t\treturn self.StateGame.StateGame02\n\tend\nend\n\nlog_error(\"StateGame is nil\")\nreturn nil",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "EndIntro",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": null,
      "Code": "self:GetGameStateComponent():EndIntro()",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    }
  ],
  "EventEmitters": [],
  "EventHandlers": [],
  "EntityEventHandlers": []
}8���ϕ���
 3b8333842b2941de95756317c923f558 f517bc8999ee44ad81995015f3829cdc0codeblock://78ffd4ed-670c-435a-877a-4055c143b1e7"x-mod/codeblock2��{
  "CoreVersion": {
    "Major": 0,
    "Minor": 2
  },
  "ScriptVersion": {
    "Major": 1,
    "Minor": 0
  },
  "Description": "",
  "Id": "78ffd4ed-670c-435a-877a-4055c143b1e7",
  "Language": 1,
  "Name": "StateGame02",
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
    }
  ],
  "Methods": [
    {
      "Name": "GoOn",
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
      "Name": "OnStateEntered",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": null,
      "Code": "--[[\n1: lee sung kye\n2: tuntra\n3: park wei\n4: militia\n5: rebel\n]]--\nlocal map = {\t\n\t0, 0, 0, 5, 3, 5, 0, 0, 0, 0,\n\t0, 5, 0, 5, 5, 5, 0, 5, 0, 0,\n\t0, 0, 0, 0, 0, 0, 0, 0, 0, 0,\n\t0, 0, 5, 0, 0, 0, 5, 0, 0, 0,\n\t0, 0, 0, 0, 5, 0, 0, 0, 0, 0,\n\t0, 0, 0, 0, 0, 0, 0, 0, 0, 0,\n\t0, 0, 0, 0, 0, 5, 0, 0, 0, 0,\n\t0, 0, 0, 0, 0, 0, 0, 0, 0, 0,\n\t0, 0, 0, 0, 0, 0, 0, 0, 1, 4,\n\t0, 0, 0, 0, 0, 0, 0, 0, 4, 2,\n}\nlocal map_size = Vector2(10,10)\n\nself.Entity.StateGameCommon:PutUnits(map,map_size)\nself.Entity.StateGameCommon:OnStateEntered()\nself.Entity.StateGameCommon.StateGame = self.Entity",
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
      "Code": "self.Entity.StateGameCommon:OnStateLeft()",
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
      "Code": "self.Entity.Enable = false",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 2
    }
  ],
  "EventEmitters": [],
  "EventHandlers": [],
  "EntityEventHandlers": []
}8�Ț�ϕ���
 2f7b0b62103347a58a631785cb526364 f517bc8999ee44ad81995015f3829cdc0codeblock://822b30d5-a192-44e0-8971-89d5a0b7cbd1"x-mod/codeblock2��{
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
      "Code": "local entity = table.remove(self.States, 1)\n\nif entity.Name == \"StateTitle\" then\n\tentity.StateTitle:OnStateLeft()\nelseif entity.Name == \"StateIntro\" then\n\tentity.StateIntro:OnStateLeft()\nelseif entity.Name == \"StateGame01\" then\n\tentity.StateGame01:OnStateLeft()\nelseif entity.Name == \"StateGame02\" then\n\tentity.StateGame02:OnStateLeft()\nend\n\nentity.Enable = false\n\nif state == \"Title\" then\n\tentity = _EntityService:GetEntityByPath(\"/common/StateTitle\")\t\n\tentity.StateTitle:OnStateEntered()\nelseif state == \"Intro\" then\n\tentity = _EntityService:GetEntityByPath(\"/common/StateIntro\")\t\n\tentity.StateIntro:OnStateEntered()\nelseif state == \"Game01\" then\n\tentity = _EntityService:GetEntityByPath(\"/common/StateGame01\")\t\n\tentity.StateGame01:OnStateEntered()\nelseif state == \"Game02\" then\n\tentity = _EntityService:GetEntityByPath(\"/common/StateGame02\")\t\n\tentity.StateGame02:OnStateEntered()\nend\n\nentity.Enable = true\n\ntable.insert(self.States, entity)\n\nlog(\"OnStateChanged:\", state)",
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
}8����ϕ���
 d81a5e82feee4e9e8796b15886cf7236 f517bc8999ee44ad81995015f3829cdc0codeblock://884fc48a-0766-46ad-aa47-2dcbe3e7bd51"x-mod/codeblock2��{
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
}8����ϕ���
 191f7bfca2a9478b974d213859b68165 f517bc8999ee44ad81995015f3829cdc0codeblock://8a3ede71-c68f-4f95-8e52-d7b6d2198831"x-mod/codeblock2��{
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
}8���ϕ���
 98656a99365a44c9a2035cc0a578d979 f517bc8999ee44ad81995015f3829cdc0codeblock://afc2b09f-0667-4ded-8ca9-fc4fc07170b5"x-mod/codeblock2��{
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
}8�ٔ�ϕ����
 85c905e92de745f2b7724e30d205e0ee f517bc8999ee44ad81995015f3829cdc0codeblock://bc6f3987-5781-4852-b5c0-b282741d5c68"x-mod/codeblock2��{
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
    },
    {
      "Name": "StateGame",
      "Type": "Entity",
      "DefaultValue": "nil",
      "Description": null,
      "SyncDirection": 0
    },
    {
      "Name": "Blocks",
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
      "Code": "self.Entity.Enable = false\n\nself.battle_info_ui = _EntityService:GetEntityByPath(\"/ui/UIBattleInfo\")\nself.battle_ui = _EntityService:GetEntityByPath(\"/ui/UIBattle\")\nself.__properties.battle_result_ui = _EntityService:GetEntitiesByPath(\"/ui/UIBattleResult\")\n\nself.camera_mgr = _EntityService:GetEntityByPath(\"/common/CameraManager\")\n\nself.movable_tile = _EntityService:GetEntityByPath(\"/common/TileMovable\")\nself.movable_tile.Enable = false\n\nself.__properties.attackable_tile = _EntityService:GetEntityByPath(\"/common/TileAttackable\")\nself.__properties.attackable_tile.Enable = false\n\nself.disable_color = Color(0.5, 0.5, 0.5, 1)\nself.enable_color = Color(1, 1, 1, 1)\n\nself.Allies = {}\nself.Enemies = {}\n\n--self.__properties.removing_entity_ids = {}\nself.__properties.__move_tiles = {}\nself.__properties.__hit_tiles = {}\n\n--self:InitializeUnits()",
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
      "Code": "self.battle_ui.Visible = false\nself.battle_ui.Enable = false\n\nlocal remain_turn_txt = _EntityService:GetEntityByPath(\"/ui/UIBattleInfo/UIBattleRemainTurnTxt\")\nlocal remain_turn = math.tointeger(remain_turn_txt.TextComponent.Text)\n\nif remain_turn <= 0 then\n\tself.StateGame.StateGameCommon:Finish(false)\n\treturn\nend\n\nremain_turn_txt.TextComponent.Text = tostring(remain_turn - 1)\n\nself:ActivateUnits(self.Enemies, false)\n\nlocal entity_ids = {}\n\nfor i=1, #self.Enemies do\n\tlocal entity = self.Enemies[i]\n\t\n\tif entity ~= nil then\n\t\ttable.insert(entity_ids, entity.Id)\n\tend\nend\n\nself.entity_ids = entity_ids\n\nself:_WorkEnemy()",
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
      "Code": "self.battle_info_ui.Visible = false\nself.battle_info_ui.Enable = false\n\nself.battle_ui.Visible = false\nself.battle_ui.Enable  = false\n\nfor i=1, #self.Allies do\n\tlocal entity = table.remove(self.Allies, 1)\n\tentity:Destroy()\nend\n\nfor i=1, #self.Enemies do\n\tlocal entity = table.remove(self.Enemies, 1)\n\tentity:Destroy()\nend\n\nfor i=1, #self.Blocks do\n\tlocal entity = table.remove(self.Blocks, 1)\n\tentity:Destroy()\nend\n\nself.camera_mgr.CameraManager:End()",
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
      "Code": "if entity.UnitCommon.Done then\n\treturn\nend\n\nentity.UnitCommon:Select()\n\nself.battle_ui.Visible = true\nself.battle_ui.Enable = true\t\n\t\n--if entity.UnitCommon.Moved then\n--\treturn\n--end\n\nlocal btn0 = _EntityService:GetEntityByPath(\"/ui/UIBattle/DefBtn\")\nbtn0.UIBattleControl.EntityID = entity.Id\n\n_UserService.LocalPlayer.TransformComponent.WorldPosition = entity.TransformComponent.WorldPosition\n\n-- put attack range\nif entity.UnitCommon.Moved == false then\n\tentity.UnitCommon.LocationAtMapMoving = entity.UnitCommon.LocationAtMap\nend\n\t\t\nself:__remove_tiles(true, true)\n\nself.__properties.__move_tiles = self:_ShowTiles(\n\tentity, \n\tentity.UnitCommon.MovableAreas, \n\tentity.UnitCommon.MovableAreaSize, \n\tColor(0, 0, 0, 0.5),\n\ttrue)\nself.__properties.__hit_tiles = self:_ShowTiles(\n\tentity, \n\tentity.UnitCommon.AttackAreas, \n\tentity.UnitCommon.AttackAreaSize, \n\tColor(1, 0, 0, 1),\n\tfalse)",
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
      "Code": "local entity = _EntityService:GetEntity(entity_id)\n\nif entity == nil then\n\treturn\nelseif entity.UnitCommon.LocationAtMap == map_pos then\n\treturn\nend\n\nif entity.UnitCommon.LocationAtMap.x > map_pos.x then\n\tentity.SpriteRendererComponent.FlipX = false\nelseif entity.UnitCommon.LocationAtMap.x < map_pos.x then\n\tentity.SpriteRendererComponent.FlipX = true\nend\n\nentity.UnitCommon.Moved = true\n--entity.Enable = false\n\nlocal map_idx = self:_GetMapIndex(entity.UnitCommon.LocationAtMap.x, entity.UnitCommon.LocationAtMap.y)\n--local other_entity_id = self.Map[map_idx] \nself.Map[map_idx] = 0\n\n-- move unit\nlocal x = self.GridSize.x * map_pos.x\nlocal y = self.GridSize.y * -map_pos.y\nlocal pos = Vector3(x, y, entity.TransformComponent.WorldPosition.z)\nentity.TransformComponent.WorldPosition = pos\n\nentity.UnitCommon.LocationAtMap = map_pos\nentity.SpriteRendererComponent.OrderInLayer = -y\n\nmap_idx = self:_GetMapIndex(map_pos.x, map_pos.y)\nself.Map[map_idx] = entity.Id\n\nif entity.UnitCommon:IsEnemy() == false then\n\tself:SelectUnit(entity)\nend\n\n--_UserService.LocalPlayer.TransformComponent.WorldPosition = pos\n\n-- show command ui\n--self.battle_ui.Enable = true\n--self.battle_ui.Visible = true",
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
      "Code": "self:__remove_tiles(true, true)\n\nif self.StateGame then\n\tif #self.Enemies == 0 then\n\t\tself.StateGame.StateGameCommon:Finish(true)\n\t\tself.StateGame = nil\n\t\treturn\n\telseif #self.Allies == 0 then\n\t\tself.StateGame.StateGameCommon:Finish(false)\n\t\tself.StateGame = nil\n\t\treturn\n\tend\nelse\n\tlog_error(\"self.StateGame is nil\")\nend\n\nlocal entities = nil\nlocal wait_second = 3\n\nif is_enemy == true then\n\tfor i=1, #self.Enemies do\n\t\tlocal entity = self.Enemies[i]\n\t\t\n\t\tif entity.UnitCommon.Done == false then\t\t\t\n\t\t\treturn\n\t\tend\n\tend\n\t\n\t_TimerService:SetTimerOnce(function() self:StartEnemy() end, wait_second)\nelse\n\t--local selected = false\n\t\n\tfor i=1, #self.Allies do\n\t\tlocal entity = self.Allies[i]\n\t\t\n\t\tif entity.UnitCommon.Done == false then\n\t\t\t--entity.Enable = true\n\t\t\t\n\t\t\tif select then\n\t\t\t\t--select = true\n\t\t\t\t--_UserService.LocalPlayer.TransformComponent.WorldPosition = entity.TransformComponent.WorldPosition\n\t\t\t\tself:SelectUnit(entity)\n\t\t\t\treturn\n\t\t\tend\n\t\tend\n\tend\n\t\n\t_TimerService:SetTimerOnce(function() self:StartEnemy() end, wait_second)\nend",
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
      "Code": "local locationAtMap = entity.UnitCommon.LocationAtMap\n\nif is_movable and entity.UnitCommon.Moved then\n\tlocationAtMap = entity.UnitCommon.LocationAtMapMoving\nend\n\nlocal tiles = {}\nlocal center = math.floor(row_count / 2)\nlocal width = 0.7\nlocal height = 1\nlocal entity_pos = Vector3(locationAtMap.x * self.GridSize.x, -locationAtMap.y * self.GridSize.y, 0)\n\nfor i=1, #areas do\n\tlocal index = self:_GetIndexOfMap(areas, row_count, i, locationAtMap)\n\t\n\tif index == nil then\n\t\tgoto skip_next\n\tend\n\t\n\tlocal rel_pos = Vector2(index.x, index.y)\n\tlocal map_index = self:_GetMapIndex(index.z, index.w)\n\tlocal other_entity_id = self.Map[map_index]\n\t\n\tif other_entity_id == nil then\n\t\tgoto skip_next\n\telseif is_movable then\n\t\tif other_entity_id ~= 0 and other_entity_id ~= entity.Id then\n\t\t\tgoto skip_next\n\t\tend\n\telse\n\t\tif other_entity_id == 0 then\n\t\t\tgoto skip_next\n\t\telse\n\t\t\tlocal other_entity = _EntityService:GetEntity(other_entity_id)\n\t\t\t\n\t\t\tif other_entity then\n\t\t\t\tif other_entity.UnitCommon then\n\t\t\t\t\tif false == entity.UnitCommon:CheckEnemy(other_entity.UnitCommon.UnitType) then\n\t\t\t\t\t\tgoto skip_next\n\t\t\t\t\tend\n\t\t\t\telse\n\t\t\t\t\tgoto skip_next\n\t\t\t\tend\n\t\t\telse\n\t\t\t\tlog_error(\"Map has an invalid entity id\")\n\t\t\tend\n\t\tend\n\tend\n\n\tlocal pos = Vector3(0,0,0)\n\tpos.x = rel_pos.x * width\n\tpos.y = rel_pos.y * -height\n\t\n\tpos = pos + entity_pos\n\n\tlocal tile = nil\n\t\n\tif is_movable then\t\t\n\t\ttile = self.movable_tile:Clone()\n\t\ttile.TileMovable.EntityID = entity.Id\n\t\ttile.TileMovable.MapPos = rel_pos + locationAtMap\n\t\t\n\t\tlocal bias = Vector3(0, 0.5, 0)\n\t\tpos = pos + bias\n\telse\n\t\ttile = self.__properties.attackable_tile:Clone()\n\t\ttile.TileAttackable.EntityID = entity.Id\n\t\ttile.TileAttackable.RelPos = rel_pos\t\t\n\tend\n\t\n\ttable.insert(tiles, tile)\n\t\n\ttile.TransformComponent.WorldPosition = pos\n\ttile.Enable = true\t\n\ttile.SpriteRendererComponent.Color = tile_color\t\n\t\n\t::skip_next::\nend\n\nreturn tiles",
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
      "Code": "-- seek an ally\nfor i=1, #self.Allies do\n\tlocal target_entity = self.Allies[i]\t\n\tlocal nodes = {}\n\n\tfor j=0, #self.Map - 1 do\n\t\tlocal x = j - math.floor(j / self.MapSize.x) * self.MapSize.x\t\t\n\t\tlocal y = j / self.MapSize.y\n\t\ty = math.floor(y)\n\n        local other_entity_id = self.Map[j+1]\n        local cell = 0\n\n        if other_entity_id ~= 0 then\n            local other_entity = _EntityService:GetEntity(other_entity_id)\n\n            if other_entity and other_entity.UnitCommon then\n                if false == entity.UnitCommon:CheckEnemy(other_entity.UnitCommon.UnitType) then\n                    cell = other_entity.UnitCommon.UnitType\n                end\n            else\n                log_error(\"Map has an invalid entity id\")\n            end\n        end\n\n\t\tlocal node = {}\n\t\tnode.x = x\n\t\tnode.y = y\n\t\tnode.cell = cell\n\t\t\n\t\ttable.insert(nodes, node)\n\tend\t\n\t\n\tlocal start = {}\n\tstart.x = entity.UnitCommon.LocationAtMap.x\n\tstart.y = entity.UnitCommon.LocationAtMap.y\n\t\n\tlocal goal = {}\n\tgoal.x = target_entity.UnitCommon.LocationAtMap.x\n\tgoal.y = target_entity.UnitCommon.LocationAtMap.y\n\t\n\tlocal path = self:_A_star(start, goal, nodes)\n\t\n\tif path then\n\t\t--[[\n\t\tif #path then\n\t\t\tlog(\"paths found\")\n\t\t\tfor i, p in ipairs(path) do\n\t\t\t\tlog(\"p\", i, \":\", p.x, \",\", p.y)\n\t\t\tend\n\t\tend\n\t\t]]--\n\t\tpath = table.remove(path, 1)\n\t\t\n\t\tif path then\n\t\t\tlocal areas = entity.UnitCommon.MovableAreas\n\t\t\tlocal row_count = entity.UnitCommon.MovableAreaSize\n\t\t\tlocal locationAtMap = entity.UnitCommon.LocationAtMap\n\t\t\t\n\t\t\tlocal shortest = self:_dist(path.x, locationAtMap.x, path.y, locationAtMap.y)\n\t\t\tlocal moving_pos = nil\n\t\n\t\t\t-- scan movable areas, and choose shortest path\n\t\t\tfor i=1, #areas do\n\t\t\t\tlocal index = self:_GetIndexOfMap(areas, row_count, i, locationAtMap)\n\t\t\t\t\n\t\t\t\tif index == nil then\n\t\t\t\t\tgoto skip_next\n\t\t\t\tend\n\t\t\t\t\n\t\t\t\t--index = index + locationAtMap\n\t\t\t\t\n\t\t\t\tlocal map_index = self:_GetMapIndex(index.z, index.w)\n\t\t\t\t\n\t\t\t\tif self.Map[map_index] ~= 0 then\n\t\t\t\t\tgoto skip_next\n\t\t\t\tend\n\t\t\t\t\n\t\t\t\tlocal distance = self:_dist(path.x, index.z, path.y, index.w)\n\t\t\t\t\n\t\t\t\tif distance < shortest\t then\n\t\t\t\t\tshortest = distance\n\t\t\t\t\tmoving_pos = Vector2(index.z, index.w)\n\t\t\t\tend\n\t\t\t\t\n\t\t\t\t::skip_next::\n\t\t\tend\n\t\t\t\n\t\t\tif moving_pos then\n\t\t\t\t--entity.SpriteRendererComponent.FlipX = start.x < goal.x\n\t\t\t\t\n\t\t\t\tself:MoveUnit(entity.Id, moving_pos)\n\t\t\tend\t\n\t\tend\n\telse\n\t\tlog(\"path is not found\")\n\tend\n\t\n\treturn\nend\n\n-- get direction to the one\n-- move there\t",
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
}8��������_
 814c2a6cdf80476fa3be48de03e4ad0c f517bc8999ee44ad81995015f3829cdc0codeblock://bf2355b8-2e1b-421d-a6ca-d8ead4f8862f"x-mod/codeblock2�^�^{
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
    },
    {
      "Name": "LocationAtMapMoving",
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
      "Code": "if self.Entity.UnitCommon.LocationAtMap.x > target_entity.UnitCommon.LocationAtMap.x then\n\tself.Entity.SpriteRendererComponent.FlipX = false\n\ttarget_entity.SpriteRendererComponent.FlipX = true\nelseif self.Entity.UnitCommon.LocationAtMap.x < target_entity.UnitCommon.LocationAtMap.x then\n\tself.Entity.SpriteRendererComponent.FlipX = true\n\ttarget_entity.SpriteRendererComponent.FlipX = false\nend\n\n--self.Entity.SpriteRendererComponent:CommitPropertiesForced()\n--self.Entity.SpriteRendererComponent:CommitPropertiesForcedForAnim()\n--self.Entity.SpriteRendererComponent:RegisterUpdate()\n\nlocal length = 0\n_EffectService:PlayEffectAttached(\"f396262ddb6e4d5581360496bb4e9f86\", target_entity, Vector2(0,0), 0, Vector2(1,1), length)\n\nself:AddChat(\"공격!\")\n\nlocal properties = self.Properties\nlocal other_properties = target_entity.UnitCommon.Properties\n\nlocal is_succeed_to_attack = function() \n\tlocal dd = properties.DEX - other_properties.DEX\n\tlocal dice = math.random(0, 10)\n\t\n\t-- attacker is faster than target\n\tif dd > 0 then\n\t\tlog(\"faster attack: \", dd)\n\t\treturn dice > 1\n\t-- attacker is slower than target\n\telse\t\n\t\tlog(\"slower attack: \", dd)\n\t\t\n\t\treturn dice > 3\n\tend\nend\n\nlocal hurt_target = function()\n\tlocal damage = properties.ATK - other_properties.DEF\n\tlocal damages = { damage }\n\tlocal dex_rate = properties.DEX / other_properties.DEX\t\n\t\n\t-- get more chance to attack when attacker is faster than target\n\tif dex_rate > 0.5 then\n\t\tdamage = math.random(damage / 2, damage)\n\t\ttable.insert(damages, damage)\n\tend\n\t\n\t-- lucky shot\n\tif 90 < math.random(1, 100) then\n\t\tdamage = math.random(damage / 2, damage)\n\t\ttable.insert(damages, damage)\t\t\n\tend\n\t\n\treturn damages\nend\n\n-- check whether it was succeced for attack\nif is_succeed_to_attack() then\n\tlocal damages = hurt_target()\t\n\tlocal critical = false\n\t\n\tif 1 < #damages then\n\t\tcritical = true\n\tend\n\t\t\n\t_DamageSkinService:Play(target_entity, 2, 0, damages, DamageSkinTweenType.Default, critical)\t\n\t\n\tlocal total_damage = 0\n\t\n\tfor _, d in ipairs(damages) do\n\t\ttotal_damage = total_damage + d\n\tend\n\t\n\tother_properties.HP = other_properties.HP - total_damage\n\t\n\tif total_damage >= other_properties.HP then\n\t\ttarget_entity.UnitCommon:Die()\n\t\treturn true\n\tend\nelse\n\tself:AddChat(\"빗나갔다!\")\nend\n\nreturn false",
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
    },
    {
      "Name": "Select",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": null,
      "Code": "self:AddChat(\"맡겨줘!\")",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    }
  ],
  "EventEmitters": [],
  "EventHandlers": [],
  "EntityEventHandlers": []
}8����ϕ���
 1dd84d3cfffa47269563ae99efea1b95 f517bc8999ee44ad81995015f3829cdc0codeblock://d1a85638-13b6-4800-9a0a-dcaae3b0cb08"x-mod/codeblock2��{
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
}8��°ϕ���
 93a47ee449c2405288d8db0f9e219c87 f517bc8999ee44ad81995015f3829cdc0codeblock://ddc37f89-429c-410e-8476-3e1b9788ba54"x-mod/codeblock2��{
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
}8�݄�ϕ���M
 ab9993a8dfdd4095ba726f73af4a9a3e f517bc8999ee44ad81995015f3829cdc0codeblock://eb397a39-c7f0-4b24-b984-8e3098e71009"x-mod/codeblock2�L�L{
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
    },
    {
      "Name": "introEntites",
      "Type": "table",
      "DefaultValue": "{}",
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
      "Code": "--[[\n-4: bush0\n-3: flower0\n-2: tree0\n-1: stone0\n1: lee sung kye\n2: tuntra\n3: park wei\n4: militia\n5: rebel\n]]--\nlocal map = {\t\n\t-1,-3,-2,-3,-1,-1,-2,-2, 0, 0,\n\t-2, 5,-2, 5, 5, 5, 0, 5, 0, 0,\n\t-2, 0, 0, 0, 0, 0, 0, 0, 0, 0,\n\t0, 0, 5, 0, 0, 0, 5, 0, 0, 0,\n\t0, 0, 0, 0, 5, 0, 0, 0, 0, 0,\n   \t-1, 0, 0, 0, 0, 0, 0, 0, 0, 0,\n\t0, 0, 0, 0, 0, 0, 0, 0, 0, 0,\n\t0, 0, 0, 0, 0,-4,-4, 0, 0, 0,\n\t0, 0, 0, 0, 0, 0, 0, 0, 1, 4,\n\t0, 0, 0, 0, 0, 0, 0, 0, 4, 2,\n}\nlocal map_size = Vector2(10,10)\n--[[\nlocal map = {\t\n\t-4,0, 0, 0, 0, 0,-1,\n\t-4,0, 0, 0, 0, 0,-1,\n\t-4,0, 0, 0, 1, 0,-1,\n\t-1,0, 0,-1, 2, 4,-2,\n\t-1,0, 0, 0,-2, 5,-3,\n}\nlocal map_size=Vector2(7,5)\n]]--\nself.Entity.StateGameCommon.Map = map\nself.Entity.StateGameCommon.MapSize = map_size\nself.Entity.StateGameCommon.StateGame = self.Entity\n\n--self.Entity.StateGameCommon:PutUnits(map,map_size)\nself.Entity.StateGameCommon:OnStateEntered()",
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
      "Code": "self.Entity.StateGameCommon:OnStateLeft()\n--[[\nself.turn_mgr.TurnManager:End()\n\nself.goal_ui.UIGroupComponent.DefaultShow = false\nself.goal_ui.Enable = false\nself.goal_ui.Visible = false\n\nself.Entity.Enable = false\n\n-- clear\nfor i=1, #self.entities do\n\tself.entities[i]:Destroy()\n\tself.entities[i] = nil\nend\n]]--",
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
      "Code": "--self.goal_ui = _EntityService:GetEntityByPath(\"/ui/UIBattleGoal\")\n--self.turn_mgr = _EntityService:GetEntityByPath(\"/common/TurnManager\")\n\nself.Entity.Enable = false\n--self.GridSize = Vector2(0.7, 1)",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 2
    },
    {
      "Name": "GoOn",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": null,
      "Code": "local state_mgr = _EntityService:GetEntityByPath(\"/common/StateManager\")\nstate_mgr.StateManager:OnStateChanged(\"Game02\")",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "StartIntro",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": null,
      "Code": "local tuntra = _EntityService:GetEntityByPath(\"/maps/map01/UnitTuntra\"):Clone()\ntuntra.Visible = false\nlocal general = _EntityService:GetEntityByPath(\"/maps/map01/UnitLeeSungKye\"):Clone()\ngeneral.Visible = false\nlocal s0 = _EntityService:GetEntityByPath(\"/maps/map01/UnitMilitia0\"):Clone()\nlocal s1=s0:Clone()\ns0.Visible=false\ns1.Visible=false\n\nself.introEntites={tuntra,general,s0,s1}\n\nlocal scene_final=function()\n\ttuntra:Destroy()\n\tgeneral:Destroy()\n\ts0:Destroy()\n\ts1:Destroy()\n\n\tself.Entity.StateGameCommon:StartGame()\nend\n\nlocal scene13=function()\n\ts0.Visible=false\n\ts1.Visible=false\n\tgeneral.Visible=false\n\ttuntra.UnitCommon:AddChat(\"좋아...\")\n\ttuntra.ChatBalloonComponent.BallonScale=2\n\t_TimerService:SetTimerOnce(function() scene_final() end, 1)\nend\n\nlocal scene12=function()\n\ts0.UnitCommon:AddChat(\"넵!\")\n\ts0.ChatBalloonComponent.BallonScale = 1\n\ts1.UnitCommon:AddChat(\"넵!\")\n\ts1.ChatBalloonComponent.BallonScale = 1\n\t_TimerService:SetTimerOnce(function() scene13() end, 1)\nend\n\nlocal scene11=function()\n\tgeneral.UnitCommon:AddChat(\"가자!\")\n\tgeneral.ChatBalloonComponent.BallonScale = 1\n\t_TimerService:SetTimerOnce(function() scene12() end, 1)\nend\n\nlocal scene10=function()\n\tgeneral.UnitCommon:AddChat(\"퉁두란 도와줘!\")\n\tgeneral.ChatBalloonComponent.BallonScale = 3\n\t_TimerService:SetTimerOnce(function() scene11() end, 1)\nend\n\nlocal scene09=function()\n\tgeneral.UnitCommon:AddChat(\"이런 나중에!\")\n\tgeneral.ChatBalloonComponent.BallonScale = 2\n\t_TimerService:SetTimerOnce(function() scene10() end, 2)\nend\n\nlocal scene08=function()\n\ts1.UnitCommon:AddChat(\"매복입니다!\")\n\ts1.ChatBalloonComponent.BallonScale = 2\n\ts1.TransformComponent.WorldPosition = tuntra.TransformComponent.WorldPosition + Vector3(4,1,0)\n\ts1.Visible=true\n\t_TimerService:SetTimerOnce(function() scene09() end, 2)\nend\n\nlocal scene07=function()\n\ts0.UnitCommon:AddChat(\"장군님!\")\n\ts0.ChatBalloonComponent.BallonScale = 2\n\ts0.TransformComponent.WorldPosition = tuntra.TransformComponent.WorldPosition + Vector3(3,0,0)\n\ts0.Visible=true\n\t_TimerService:SetTimerOnce(function() scene08() end, 1)\nend\n\nlocal scene06=function()\n\tgeneral.UnitCommon:AddChat(\"그럼 어디서 온거지?\")\n\tgeneral.ChatBalloonComponent.BallonScale = 3\n\t_TimerService:SetTimerOnce(function() scene07() end, 2)\nend\n\nlocal scene05=function()\n\tgeneral.UnitCommon:AddChat(\"여기? 음... 여기라...\")\n\tgeneral.ChatBalloonComponent.BallonScale = 3\n\t_TimerService:SetTimerOnce(function() scene06() end, 2)\nend\n\nlocal scene04=function()\n\ttuntra.UnitCommon:AddChat(\"난 퉁두란. 여긴... 어디지?\")\n\ttuntra.ChatBalloonComponent.BallonScale = 3\n\t_TimerService:SetTimerOnce(function() scene05() end, 2)\nend\n\nlocal scene03 = function()\n\tgeneral.TransformComponent.WorldPosition = tuntra.TransformComponent.WorldPosition + Vector3(-2,-1,0)\t\n\tgeneral.SpriteRendererComponent.FlipX = true\n\tgeneral.Visible = true\n\tgeneral.UnitCommon:AddChat(\"넌 누구지? 이름을 밝혀라.\")\n\tgeneral.ChatBalloonComponent.BallonScale = 3\n\n\t_TimerService:SetTimerOnce(function() scene04() end, 2)\nend\n\nlocal scene02_1 = function()\n\ttuntra.UnitCommon:AddChat(\"...!\")\n\ttuntra.ChatBalloonComponent.BallonScale = 1\n\t_TimerService:SetTimerOnce(function() scene03() end, 2)\nend\n\nlocal scene02 = function()\n\ttuntra.UnitCommon:AddChat(\"그 다음이 기억이 안 나...\")\n\ttuntra.ChatBalloonComponent.BallonScale = 3\n\t_TimerService:SetTimerOnce(function() scene02_1() end, 2)\nend\n\nlocal scene01_2 = function()\n\ttuntra.UnitCommon:AddChat(\"말에서 떨어지고...\")\n\ttuntra.ChatBalloonComponent.BallonScale = 3\n\t_TimerService:SetTimerOnce(function() scene02() end, 2)\nend\n\nlocal scene01_1 = function()\n\ttuntra.UnitCommon:AddChat(\"왜 내가 여기에 있지...?\")\n\ttuntra.ChatBalloonComponent.BallonScale = 3\n\t_TimerService:SetTimerOnce(function() scene01_2() end, 2)\nend\n\nlocal scene01 = function() \n\t_UserService.LocalPlayer.TransformComponent.WorldPosition = tuntra.TransformComponent.WorldPosition\n\tlocal text = \"으윽...\"\n\ttuntra.UnitCommon:AddChat(text)\n\ttuntra.ChatBalloonComponent.BallonScale = 2\n\ttuntra.Visible = true\n\t_TimerService:SetTimerOnce(function() scene01_1() end, 2)\nend\n\nscene01()\n\n--tuntra locate\n\n--she said \"Why I'm here? When I dropped from my horse. But I can't remember after that...\"\n--put message\n--lee sungkye is commong to her\n--he asked \"who are you?\"\n--she said \"I'm ... But tell me your name first\"\n--he answered \"I'm Lee sungkye. Tell me your name\"\n--she said \"I'm Tuntra.\"\n--he said \"Tuntura? It is strange name. However...\"\n--Milisha came on and said \"General! Enemies are in our sight\"\n--he said \"Ok Go now! Tuntura, come with me!\"\n--she said \"Oh... I'm\"",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "EndIntro",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": null,
      "Code": "self.Entity.StateGameCommon:StartGame()\n\nfor i=1,#self.introEntites do\n\tlocal entity=table.remove(self.introEntites,1)\n\tentity:Destroy()\nend",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    }
  ],
  "EventEmitters": [],
  "EventHandlers": [],
  "EntityEventHandlers": []
}8�ǅ�ڕ���
 442748b3ecbc4d5f97081ca759a2eb5a f517bc8999ee44ad81995015f3829cdc0codeblock://ed09ea46-6c2d-4bbe-a652-2b1591215d3b"x-mod/codeblock2��{
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
}8���ϕ��� 
 3915952a78c64822a2350ee5b366bcfe f517bc8999ee44ad81995015f3829cdc0codeblock://edca7f76-cf30-470e-85ae-c382d16855f0"x-mod/codeblock2��{
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
      "Code": "local ui = self.ui\n\nlocal background = _EntityService:GetEntityByPath(\"/maps/map01/BackGroundTemplate\")\nbackground.BackgroundTemplateComponent.SolidColor = Color(0, 0, 0, 1)\n\n--ui.UIGroupComponent.DefaultShow = true\nui.Visible = true\nui.Enable = true\n\nself.line_count = 0\n\nself:ShowDialog()",
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
}8�ϕ���
 ea6c3f9ba13f4833a02be6bbf4eb2aba f517bc8999ee44ad81995015f3829cdc0codeblock://f08a2228-bf6f-43e5-bf3b-80dd85e99d72"x-mod/codeblock2��{
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
      "Code": "--[[\nOnStateEntered is called when StateManager is in OnBeginPlay(). StateTitle component may not be in this state.\nTherefore you should get entity on runtime. Don't get reference on OnBeginPlay().\nBut other states are enabled such things.\n]]--\nlocal ui = _EntityService:GetEntityByPath(\"/ui/UITitle\")\nui.UIGroupComponent.DefaultShow = true\nui.Enable = true\n--ui.Visible = true\n\n--local background = _EntityService:GetEntityByPath(\"/maps/map01/BackGroundTemplate\")\n--background.Enable = true\n\nself.Entity.Enable = true\n",
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
      "Code": "local ui = _EntityService:GetEntityByPath(\"/ui/UITitle\")\nui.UIGroupComponent.DefaultShow = false\nui.Enable = false\n\n--local background = _EntityService:GetEntityByPath(\"/maps/map01/BackGroundTemplate\")\n--background.Enable = false\n\nself.Entity.Enable = false",
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
      "Code": "local player = _UserService.LocalPlayer\nplayer.TransformComponent.WorldPosition = player.TransformComponent.WorldPosition + Vector3(100, 0, 0)\n\ndo\n\tlocal entities=_EntityService:GetEntitiesByPath(\"/maps/map01\")\n\tlocal entity=entities[1]\n\t\n\tfor _,v in ipairs(entity.Children) do\n\t\tif \"Unit\"==string.sub(v.Name,1,4) then\n\t\t\tv.Visible=false\n\t\tend\n\tend\nend\n\t\ndo\n\tlocal entities=_EntityService:GetEntitiesByPath(\"/common\")\n\tlocal entity=entities[1]\n\t\n\tfor _,v in ipairs(entity.Children) do\n\t\tv.Visible = false\n\tend\nend",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 2
    }
  ],
  "EventEmitters": [],
  "EventHandlers": [],
  "EntityEventHandlers": []
}8�½�ϕ���
 d33a0fceaf7c413b9f98a5016922b580 f517bc8999ee44ad81995015f3829cdc0codeblock://f8c8a9fa-0378-43fa-aab1-b93b28d7e984"x-mod/codeblock2��{
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
}8��ϕ���
 1741441697ba4d219e56b587c6149c7b f517bc8999ee44ad81995015f3829cdc0codeblock://fafbedc4-d0a3-4d9d-9972-b39ce2a9bdd9"x-mod/codeblock2��{
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
}8����ϕ����
 b5fd09ec790d418fb5f4bf84acbad58a f517bc8999ee44ad81995015f3829cdc,gamelogic://ea985b77b39e436f92266c9d05932a1e"x-mod/gamelogic2���
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
      "Enable": false,
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
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.StateComponent,MOD.Core.ChatBalloonComponent,MOD.Core.NameTagComponent,script.StateIntro�!
$0828116b-5e82-4e57-80dd-21c75d14c157/common/StateGame01�{
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
      "Enable": false,
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
    },
    {
      "MapSize": {
        "x": 0.0,
        "y": 0.0
      },
      "Enable": true,
      "@type": "script.StateGameCommon"
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.StateComponent,MOD.Core.ChatBalloonComponent,MOD.Core.NameTagComponent,script.StateGame01,script.StateGameCommon� 
$0552a19c-8306-4406-b3cb-b842bc50a79f/common/StateGame02�{
  "name": "StateGame02",
  "path": "/common/StateGame02",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryNpc$00934434f4bb44c99183af2bf12af2a0",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 3.056094,
        "y": 2.08988643,
        "z": 999.993
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
      "SpriteRUID": "08f54cd7cacc46f0b5b0b4dc911a4b25",
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
        "stand": "08f54cd7cacc46f0b5b0b4dc911a4b25",
        "tea": "0181f791842e40f0ba1001367b017c21"
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
      "Enable": false,
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
      "Name": "StateGame02",
      "FontSize": 1.0,
      "OffsetY": 0.0,
      "Enable": true,
      "@type": "MOD.Core.NameTagComponent"
    },
    {
      "Enable": true,
      "@type": "script.StateGame02"
    },
    {
      "MapSize": {
        "x": 0.0,
        "y": 0.0
      },
      "Enable": true,
      "@type": "script.StateGameCommon"
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.StateComponent,MOD.Core.ChatBalloonComponent,MOD.Core.NameTagComponent,script.StateGame02,script.StateGameCommon�
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
}"nMOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.TouchReceiveComponent,script.TileMovable8�ˈ�����Չ
 5fc5f24504334e4d8e523150cc7e7d9c f517bc8999ee44ad81995015f3829cdcmap://map01"	x-mod/map2��
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
      "BackType": 2,
      "MapRUID": "643b5ff2ff2647a18f94b9829898e7d2",
      "SolidColor": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "BackgroundUrl": "",
      "Enable": true,
      "@type": "MOD.Core.BackgroundTemplateComponent"
    }
  ],
  "@version": 1
}"$MOD.Core.BackgroundTemplateComponent�V
$5b1c09be-6044-4b5b-b1e0-e011d7a6e433/maps/map01/MapleMapLayer�U{
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
      "thumbnail": "iVBORw0KGgoAAAANSUhEUgAAAMgAAABkCAYAAADDhn8LAAAebklEQVR4Ae2dB3hUxdrH/7ub7ZvNphCSACkQEgIEQghSQlFQUBDpiKDoVVEUBREV9eoFy2e5oveioF4ERZqKgEiTjvReQoIhJIT0hCSb7KZt3/neEww13awCzjzP7p6dc847M78zc2bmnXdmAO44AU6AE+AEOAFOgBPgBDgBToAT4AQ4AU6AE+AEOAFOgBPgBDgBToAT4AQ4AU6AE+AEOAFOgBPgBDgBToAT4AQ4AU6AE+AEOAFOgBPgBDgBToAT4AQ4AU6AE+AEOAFOgBPgBDgBToAT4AQ4AU6AE+AEOAFOgBPgBDgBToAT4AQ4AU6AE+AEOAFOgBPgBDgBToAT4AQ4AU6AE+AEOAFOgBPgBDgBToAT4AQ4AU7gdiTgcTsmiqeJE/ijBIYDGl+ZQvHtHxXE7+cEXE3AzdUBVCNf66tTXcw35IuqOce9OIG/NwEvnVcBEfD7e1Pgqb9VCIj/7Ig6mEijUCpXULhr/+yweXicwE1BQKPRNKspIrrWvszNQz2wpvPcnxO47QlERkUyD4mKeet0Dp3Om6mkaiYkWi6V/8ddp6s8vu0h8ATeFgRc0sTKzsh+2d3HBy0CWolFNiekahm0Gq3Fs5n3C06zqfy2IMcT8bcg4DJNUpeYLsxa4UBFWSlKSkpgMtkgFltZmckcTWRP/S3o8kTe8gRcUoMIVNJT0/PEIglUXiowNynEsIEKhxAeLxy3fLb5+ySgyQqIxkPT/2psRUVF/kxsh6jMDTKRGCKZHAootl19DT/mBG52Ak1WQMqMZTtb+LfIuzrBYiaCWAaIlVJIJBIwsCYL7+pw+DEn4CoCTZphs3Oz/Vq3bSdoqSr7Nnq9/qJYKYJWQbWHQgmJWnJNLeOqRDWZ3NBQeZPJqoeg0Pvuqwxv8oyXWEBAmE/VLYMHj4m6dDxbPHr043HCcXjs4+5V5/mv6wg0ualJavLZ5mHhHZ0KlQoOazksZQ4kp5yHf/NWsFfYXZeSJpas8PD439gRI586kRxflJCUOASJaYeaOIgbxD143wDzz6ZSdOzXBaFdgwsWzFmEcydOijo9MOSkHhL0ubctmD0SI9U+7NiuA143COAeTU7AZVosIabuGs1qX1/fkRdz86HWamExUoFxq5hmKrN92uQpaWKB7Xr3YXf06omM4hycOnVqoeFowqQmDuIGcR2iu+156LkH+yScSUGZTYrgYH8whRYKNwU1VZUQ2cSQMhnMZkBhVyAvMxdbfvoCWWnHXfocb4jo38ijSZtY13MrLSsbpfX0hZKaVzabGW5SN1ignPv7dSKJRGG7/p6b4X/Puwez/3t7Nrp2iQAjTZxOre7n6nh5NPM7eO/Dw/pk5efD6iDtH/Xd8koqUFJaDolIBlFeOfQF5bBZKCZUQpQ+CjpQ8sLh4gfj0gIixD3h9PHnvZvpoFaqAQlptMqtgjaLqVQqp9SBg38kfS+9+UbO0WPxLC41lW0/epDdPWYkGzx25OU+UGNlp+alvj5//qfs503rkZ9ZgNZhHdsq2jU/FNgp4kJjZdZ1n4/WZ2xRSTmyU6m2VUpgyLdCq/SAtdAOq8WMrKISmPVGSKmXklNswP61v+Lw9pUIbNk5py7Z/HzjCTR5H+T6qNhstnlyjeozmVQFk70ATqkEEqeTXoImvROs7/XX1/f/2l/3sNIKIyQ6NRxmJ1QKDcTMCQkpBO4aMSh+109bOtZX1vXXkeZt67DRQ98zUIbNt9hQbjLD3fux7vmFmVCEKNi5n0/W1aQRTXui7a/N/Vp0TU3KL1y46rfg68O4+v/9j05nGl8N0s8UwY3U4dk0qFpeYERm6mGo3Mk/KRsKdwWkDilKDCZknMlCmTHNonZTZmdkxbW5WhY/bloCLq9BhOiKxCJIlGLo6GGrVApQwYDTyRr9YFOLi5m/vw80ChWMRQZAJoHFakeptQSFJXpUWCzbG4NJ6uEx6cMv5+7d+MOaY31ieoG0cDi6+yg2LF2Nw79sReLJxEqx3mH+tY7njBmsbh7eWdPXXJalbhFkCaqKi9Jb2aJd98CuVf+rftMSU47bTG4oLiwmiwOG8mwjtFp/tI+JgpSaV2q1Ck6zA3Z6AeSmpcO7rTeUUrH8dPxPjWZYFTb/rZ2Ay2sQIXgbZV6ZVAq5XEqDhlKYBWWWGE9QSfmk9ujdePap6dMMYoMDnlovpGfk4uDpQyRbibXrf4C8DJAGe0Jssk2lO1+48e5afUTe3j7j6NN70fKllRdu2v4rKRo84RcYACtjsOVnUea1QX8u957aJN0/ISbXmB4PqUSL0wfsqt+vFT/y0B1ZC+btvqH2yToXf7ex8OI+epVEFP5mEvtFRiLrfAo8yUzHr1UgirIuUi1mgVdzDfTZ2VBrtCivsGLouH8yL58Wzm/nPSupLT78XOMJ/CkFRCwSWR2MySrKTAC9Bd2o0661iz8ucVYINdichkT/+ede8jA6S4AKwO60Y9fWnSgsyoOHUguxtxIepPGxu4tFPe+9a8DBzbt2NEA2e+K5J/tpPd0REuiNHzfvxdDhQyF102LPvj3ISk4mURLkZ6UdCe/bKSRpz+ka+yNpBxPZuVSr2SkyK388mOc27/3OhrhMq8e69UlUhG90BkOagblZTj/5+pSgcmuJZveqE6QSd6AgzYyinAIUZqfBr20Ykvadg4WaXymWk3ATmxAzsC++ee+dxTdK5D5NReCGt1lTCb5aTnRMV6fD7hTp0/Kh8JGjpLgCpYYiiN3lKDeUNigOp86nMnd3BiNltXPnL+DTue9hyN33Ye+RA4Abg7vCnWooG6wlZmxZtbZO2cGRnd+6d8i9D8u1Ch9fL0+txeFEhbEUOaRNMpZYINe4o1PnjjBRX8RsL4NJRoWcXPzx/Tj41eZa5U+b1LpbVLTHEZTnQeLeAUcTEnw/+yxPmFFZrbtr1Eh2Pi4XUoUCptIyNGvdGhcTz9MAqxomswUq+rXbnZBRJ8lsuEjNMHdIZe5IPLup1nhUGxj3rBeBP6UGIRMTkZhCEmuk9EZWwt1TTqpMMyrsVA00zKkC/fxhsJohY0Zk5aRh1hvvIKBZADZt/wVy0pRZSDVWQepRN1H9kiZyOierNRpfK+lPWwcHIzwojAqCGdnUlDGQxm3Lnn24kJ6CzNx06gdIYZAWwNvbF+VGa40ZvSpJc79KPfrjl1EsUa9zlqQlSz6bl1cw7onutn2/ZsZlnc+Jqbpu8GPTmH/rVjh/JA4lhaXQ+sioj+aG9JNnoPbyhRv12QSlroX6RA5SO0t0HlDrfFBmLnsrL3XT7Co5/LfpCdQvF/2BcBU63V1OuwNiiZRM38tRmJOBoDbh1D6nphC95cnl0se/PkGcSU4tz6EXsNqLrCxEIjCbCW3CQ3Fk/xFqtl1KitxNggp6n0ro0/3+vm0Pb9gjtI1qdAERHUYP6NV5j7uHluRq6c1swOYdVBuRizubgoycVGQnJUNGA512sZi6TWakGU/AkJLnW6NQ4YSbYqNcJXthzORT4pg7gsqkCpl6xluDGaj/lXX+8OXCIVx6csfOfnLFyN3pZ3MhkjjhYBI4xDZSaChhMeRA4uUBz5ZByEtLQFBkD2Qc2weZriWUMtGLdPtsQQZ3riHg8gIS0SZ0p5PZqNlSIeiuYJfKwKTCUIUDWsqUKBX7meE8SG/tnnUlkcy6UEoyTMXUB6ECMmrUw7AaSzBv0TzIyaSeOjjURrfTFQ6IlG7QunkdJU9dbXJ9vbRs28FT+k7hEd7lcSkgbTGy9bnIN5Qg5QKpVykcOSkBtO5qyJr7IeMCXRMSghatfFj2rgSK0Y0uoK3/SWcpez0k3OOcmyygLD2lJFEsdcakpOTjwI7MS6XvqttyM+P3bv5WHxjcITpDXaE4KwVrV04vk9bR3WEymmEszkZAUBAkcjXkCg+EduuH9OTzUIrV3B7rKo6uOHRpAYmKjmK2IjPkXnIYSwupSWAV+rnIyymCuwepe402ODQyuJntPYQ3a23u2X++srtcqBkqsz811xhpxaicnaKMYi+zQ+lFBc9JtZSpjBRkdJ4G1FRCbqrD/bRoycTlG1Z751/Mxcpf1sDXvQXySksrC4jQrPFs5Qvf0BYw5OYhK/UCrEWXJkR6RvgiuwbZOcm5XXz8dcfSMxgVLKmmpNgcAxr8K9CXI6a7Xy9PXWu24puDVxcuZjLlZCYey6n0C2ndnQV2bIvc387BWm6C1EOJi9RRL8zOhVyihNlSBgkV2tKLWUNriAL3biICVz+kJhLpGjHJqedtFdRQEzGxyE1L71irk4kqrKKZ/zcTZcUVNCeLzOlFZF9fWTycVJJkUGqljvULvq/xJfDPJcuZwVCM5FNxiIxsg4Qz55CScR7leitC2ofASRojoaZjIicyktNhLitBeaENMh8pvAPVNFMy/7zhWF5odSlu1zWIZlSKceeQZvjlhwy4KZlVJpHKSqlZWJxbarSVW6ut2QJadWUW0vaR1g9KkRJiKvg00IMKerlolarK94jdySCnjnpZYXZckSEhqrrwuV/TELhlCkjTJPeKFP8uXYL82gSklZU6UKQvALNQ7eZwoLzICLHDcU4kZi85RFinVGtoRqQEJn0pWdLSNYKTSvTuXrJT5TkFUyyllqRLnle+1Tp1lNNiDqX2UEupr/sBW05Z0PhJkcs3rEgcDaX8oqnIxGga8pErd1w58mrWmblRIRdTDWumDrvQSZdSrSnUvnK5CNbSCodUq5KIqIosL8wqMxjO8WbWFXxNfvS3LSACSa/Q0JblJY4IS/6FWkfGofZtTiNztJRR2UW6rU7tVWOfkqdn+EcOh62He7Pg3mZ9PkQqKWmwhKEjid1mdvzqkFgjjfozfjpdxzyDIcHPwyO8v9GYtLOx4fH7OAGXEFCFD3zGJYJ/F6rThZH+W1fZBPPw6DRA8Nb5tBM0VtzdrgTSTi1mJ3f8W1Bf6W/1NFrLyoV08KbNrf4g6xF/QeHjaudXfGE1M1WYENqWdPjxi71WL5giZLAmc++89Q5r0arFH5U54YFBPVj3ziFMo5Ttry1yP6xZU9tpfu42IuDyArJlzRu5Turtenp7wO4oQFpKKmlorBg/LOyPZuiqx7Bw9drVyM7MXl7l0Zjf2NjwZVn6izCbKvD6P0f02rD8saaK3zXRmfri1Cq5EyZ/9xbDm12E/3dfc1Edf3bt2UVqYRP7buVPwr0T6rj8+tMTVi76hhWTRXQj7r1e1m3/3+WddFawkeUUSeHllNDCDZ44sXstDmfGk21TBWa8u6XR4Qe0DGAGspcSnjKT0HiD1ptslZRIS01vjMykmOg2YZZiPSLbBYM5TDj020UU03x6Ixl9MSaoj+FVlRuWLlmqf2TiIzTKSeOWDXSnTx5hDmMCzp7Zgt2bj2JhRxqhTyympbwvxbtZs2asoKCgxjT8a0khWzr/XbTxNqAgOw8FxhTkpKUoJRJ3k8NRs12bu0Sy79MRj8eeu3ChMsYJ9OtNlgMLNmZDFs63oqjpMdY4RlDTDQ31z7hQiHSa37Bs/SrEDBqETTsT6MEUwtOn0fOZhCisHN7eG93Hx5LRox65eYUoNjlwjowglXZ3lphRc0apLv69Y4LDZo7qjp92H8eRpDQUkTr3yZFjsOHYUZw6lPwsI0uAqMieepnUgpIyCyY9Pak6MfXy69DGC5YMKay0iEXkk60x+GwCNkpNmHh4PwsNDkXz5s231iQovNtYxjYNReZpO9QtS3FHmAJhz8yicfcOptfujK6xUJE81Rv9R8bmG42XRft5egqGB/htbT6CVLrk9ApD28sn+cFlAi5vYklpoYH8nBK88vFiGoW2oVeHMLjZJYiJ6nQ5Eg09aB+kHSMUiFW7T+DnQ+dwMCUPub+PcIcEtmyoOOw7liZaui8RqTlleO2JUTj8/de4NyaS5n/byGjQ9oUg0Epm+hbSL2hUFfBvoUBgKy+yd2mYe+/VJ9mcWZOxau06+LX0h9OQhTyKd1RIS3w5Z7ZQOIRMPqg6qV36P3ogqDlwJD0PbYOMMDgYnvvkY3jrRCjMJ9Mvmdes6u4T/FaMeabcTNbAhqKiykvMFgtN6yWrappjIoyrNpe7VzvYWZO8v5O/ywtIQOwjcWqVEYnHN9AKHRXYtn8FevbpjS++PkWWs92FFlKDXTRlLl9Sgq7bvh5bd+/BiuX/IdMsAyYOisC7YyMEeYENFRrWrj2GDegFtY8/NLS4xHNzFkLjAO6JDq+MY+fIKHSLGQ+zwxuRUfcLg9sNdimHNqFzlxj4+wVg5bKf8Pmyrbi3Z3s0IxP6FnbBZrNmd3LntwcKctNQ4vTCd8/mYdgdapzZ/xImT/oXPp3QD3Zr0Vs13R1/IRVZuTlkY5aP5OwsZBYWIKtQDzc3N0z/dxi0NGuRu+oJuLyAtAkOCLbQ0jUhLciU49RpjHl4DH5cp0NG9kX8Y0r/6mNVh69Op0BxKb3AyyqtgeGl9YGPRol7YrvQih8GrFv5YXodIq45nXt0PZs2fhwefngi+nTrgWNxSfhm5nNoRsZe2bRYQv/+nUxnz5wGjdYhPz8H8aeqHQS/RmZ1fyy0+ELf2AE4efQMJr0yFx98vgatSHmhoXn0T42pvUaNju4547OJ6ejnZ8fB+ADc3z0MD8S+j9QV/vDQ1f4+oO3uKi3Y5G4yeJJlgPBRqWjeDBmuSGh5WAkZdnJXPQGXF5DzaTm6xCShifVvfLMxCat+TMWj4w9gxbp5sNOkn8a4eRvjRAu/X0+LQ5GVvNUGqSYYH8/5CPrcNES/stPvgbEza2uP3xDk8f0naP6IieZbmSB2VlDzry3i4g7ggfH3YsnC6dDKacWE61xxYcPmsnwzfzbbl1r6REaRHDq/MKz+ail2bNuB7zftw7ffnUS7R7+/LoRr/5bknkRQ7IdYv9eGCY//A5tPhWH4hNlo2XUUCotTPr726mv/iaiGeHPLakhpGaNyMqdRRrfHCz/8D55R1A+0iOBLNl7cVU/A5a8OlnuCjR33MJYsexbH7tmGX3bbsOjbPsj84H28MkZdfazq4Svz6yJ67bFhLPnABkx85mn8sjMOX6zf36CCURXMqBdmfbztP6/OSDMYKbPIUF5ehulf/Yz+0WFYsHQ/mgW0RMLZzXB3l1IfRAE5LRJRajQLWqx6u4T400i/aFsa5FO6qE8PH3gqi/DhnGUYOLA7WnQsgfVM7SulpOSaRSknV7KEM8vIMroE/301BbsPhEAeRmXDbnmptog42/jh9S8W4f3/fohjZ/JQXpYD2p4CtshOUB0/BWtkOPqQ+f7eXdsaxa+2sPm52gnMoNOVhuyC3l34TPzHMLZgzg42sNuDjep/XBWcqjAjhU0f5Mf+MXEMG9C3OzMUpzZKZl5xOevgrWOkvmXJZzNZRw81GzthFIsJ9WVPP/0UCwxozsgo6kiP7j0E+frwkObMzU1yqcd7VYRqOly++CNWfOgDFttaxX76/Elmy93BihP+x6aPj2THFz/OzCkrmJd75SSZmkRc7e/FCuawzPhopvNQsqDujzCxWDr/6guqO57+xmvWUouNbd97ki1Y9hP7YMEP7MU5S9nPCybQ9CxJ49Vy1QXG/RpEoNLadcPGLysLyPy3RzK9Ppdt/XFGozLzVSEHzn17Ntu9YwMbOewBtnH1N2zHuuWNkvnlu1NpqIOxzoF+LEijZnablaXqy9lDTz3Botr5CzK7//45e1X4DTkM3f7BANqKTsReGB/Bsra8xtYtfYztmDuUPT0glKWtmsHOL5lQa9y/fXMkM2QmsrdfDmCZB59gWYfeYXfG9mRh4REsNrY7W96bCnE9XE/vQNbfN4R10gWyoeEx7LUZb7JxQVH1urce4vkljSCQ9Pyj41jnyCDhIQgf85MPPVB13AhxV26Z9/77bPLIh9iy+V+yRfM++yMP+fkpjz3MWimVbGR0CPstOZWtXLVSkPfaldCa5ih+9Qx2euXTbPlLEWzuMwPZ2S1vs1/++4gQVp2qpJ73DWNfvDeE/Tw3hG1+vxdzVysZOzGzMt0LlzzGZJ7BtTLoEtuf3RXYjj0U1oXd1+Mutm3rAfbqy2+wgaERtd7XNCnnUv4KAnf2idCyIT1bbR4d6/uHHrISGP9ir97sAVUzNnlwH+ZNy0S7IEHuz8+6k0X11TLvUDDfdrQMC4Vbdzgtk/r2eZy1pJmGQyPFrJ1KweL2S5lO7c46dqg0VYFV34KZT1e+gGoTN0do5ur1RWzYlBns/sefYVEt/FhESz9XpLW2ePBztyIBlVx1OaMMunvQ5eOmTMvuLXMq5bZppWNvP3Ypc9dTvsJDqyxZsqSyEFBtoxzfrVtln+iyCUw95MzRarWMNjNiHgolU9OvRCpmSrmUSUQil6S3HnHil9wKBBQKBXPX0IJbvzudC7er7uiPjUIwaz4Zezm8qnD5LyfACXACnAAnwAlwApwAJ8AJcAKcACfACXACnAAnwAlwApzATUXATeqSAcebKo23c2Rcbu5+O8OrK22GChsbM/bxui7j529iAryAuPDh3Dfw7hKx3OUzClyYAi6aFxAX5oGD+3YPs9BK7NxxAjcnASmep62ZZv+VkRMWnf89/NlsZQwzzgQrfhns1Y6X/f/K6PGwbwcCcoWauWt1bNyk11nfAWOqMlyNSZsyRcd6xCpYp14yFhAsZYNHtGQRrTR13lclMNxfvpmOhTkgl10zDUavfa3hFsNCAVk+NZgJhUP42Pb2Y2xbG3ZigoKdGMMLyWXAN+nBLdHEGvLIC7jnwSm092ARMmkTm54PT6o1s788dBRC2uho8yoJJgzvjLs6KfDkVJq/Doyuz3NYOcNTWHpH2LqtFX30wTqUF5Rh5/TPG76wu4zW1Rky9RUSQ4vQxdHutKZMmhXjhK7TpQUnJobg0o48dAV3Nx+BW2EO8vh5azcvX7N6PQaNHQW9Qodtn86BIf4wLqSdvyH+Mx+IZneYGJoF+aPD2KGoyC3EtB8+QbzCiDBPDTYuKrnhnuoey9jRw9nSFUthoVVSkmjdrQvJFzD2wbEBdG3t6/NcJSwmKnDbtjVv3C1a+AKy82lnX+qOyGgpIV03wCBsDkfOQTsddpuPesXp0h38+88kcNM/GG+aIvrIkhUYEhGA7zYdxKmFX6PCasVdXqew8ngp9KZrM5f+l/kst8IKe2YuLh4/CdorFOU+dizadRrwtmDdxrLeBHh/XZBpg1Cah66AwWigN34JziXmodBQiCGDh9Sb2YHhYClptF01U6BrrBaH4krhS7tWBajtaEsVmpqW8DJRcYtecG0a6oobP//nEbjpdZB6fcaEvDUbly8iJoVZiTh55gC6t20DnbIUtPoo9mZdC2vV96uhb9UcL02ehM6PToZnRGvEfTwTY1NN2JgpLDNUVmfhoIs0CQdDkXGWdr6VFiHrgg4TJiXBnHZtWHX967UWorlRYOYOvTD83TkYTjd0DInGvx7rgB2HkuB5zo4uveqSws//lQRu+j5IuK94uZfYiN+ObqTNPvNpT3QvHEtKxe44CY5m4dcqeG8+c2nhAQtts6Aw0ZvZmlc5A37aK/0go5USt5/+Ddvjya8ejpX4ln4x2YB9C7OR+msFJrxshIWWtf1kbz1uvu6Sl+KBj+bOoV156QR9EtJO4M5hw3HI5KSNR+Xo9jmvPa5DdlP9velrkKR8p8i2aSU7/M1LKHW4wV6Uhd5TvsWJ/Iq3qJs7u4pml3aXFj979eejb41rnzvrB9qtdtK0GDiOmDF9yRdQ08ryBaX1W/n9P/OfgVfXr/H2o6WY9lkQHlEdQ358bzwUfBj/BISljGpdqK0qTne00S6+686u+PKtoTir74wI1U706hZDTS07encIR74omy61VF3OfzmBP0ag8MRi1lklZ4MGjRO0WJVqqSqJI6PaJ789uu9l7Va/tmr24p0hbMSsEeyjl59marmwaXT9XM4hKdOnR9BCQCNYRaqYpRym1UO2gqV+WKmWrcciC1fC0bhJmKPwKGOlBxgrPsFK9r3P4j8bxdZM68gWTtLVO05XJPKjP5NAvTucf2akqsJa/PVidiHtAmY9ORDiwFjRkIlPMYXOB9JTJ7Fy35Z/OZ3Od6quFX4rMg+wFh3uLCkusXo8NHUSa3UhE6ft2dAO7oaVz39d77Rm/SplzcPtMNPK9AqpE25ZDIYTQDH111vPbHCTSAhXKAiViysIyzHSqsKCI30WruxHUOnFv242AvXONH9RxGN/DzeYfpf3bx/DFB26onj9zzhozhtCfpt+P3/5h1YFnfDh1BHLhg3riMxj6bCnO7HsfCr0LeVYt2BXvdP73oNg0ykEszBcQZ8MGgIxtQBmfoUVb0zC+HsmN7igXI4jP+AEXELg0amzWIf2vVmbNtF1Nk3auSNseNcg9sSIGKbx9o5YuHV8nfe4JNJc6C1N4P8BlN2mvh7EtW4AAAAASUVORK5CYII=",
      "MapLayerName": "Layer1",
      "LayerSortOrder": 0,
      "Enable": true,
      "@type": "MOD.Core.MapLayerComponent"
    }
  ],
  "@version": 1
}"MOD.Core.MapLayerComponent�#
$656f8d8f-59d5-448b-ac67-41aee412d517/maps/map01/UnitMilitia0�!{
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
      "LocationAtMapMoving": {
        "x": 0.0,
        "y": 0.0
      },
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
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.StateComponent,MOD.Core.ChatBalloonComponent,MOD.Core.NameTagComponent,script.UnitCommon,MOD.Core.TouchReceiveComponent�#
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
      "LocationAtMapMoving": {
        "x": 0.0,
        "y": 0.0
      },
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
$de3b6b2a-7174-455c-a67b-d4c601b5ea58/maps/map01/UnitLeeSungKye�"{
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
      "LocationAtMapMoving": {
        "x": 0.0,
        "y": 0.0
      },
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
}"5MOD.Core.TransformComponent,MOD.Core.TileMapComponent�$
$b91778d6-95c1-4cbb-8252-886f8d8a896f/maps/map01/UnitTuntra�!{
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
        "x": 4.85987949,
        "y": 0.8300705,
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
      "Name": "퉁두란",
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
      "LocationAtMapMoving": {
        "x": 0.0,
        "y": 0.0
      },
      "Enable": true,
      "@type": "script.UnitCommon"
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.StateComponent,MOD.Core.ChatBalloonComponent,MOD.Core.NameTagComponent,MOD.Core.TouchReceiveComponent,script.UnitCommon�#
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
      "LocationAtMapMoving": {
        "x": 0.0,
        "y": 0.0
      },
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
}"5MOD.Core.TransformComponent,MOD.Core.TileMapComponent�
$3e6a6dd3-0d79-4a7d-9c00-2942c6517032/maps/map01/UnitFlower0�{
  "name": "UnitFlower0",
  "path": "/maps/map01/UnitFlower0",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMapObject$00035747aedb4111a2058fee63c0e055",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 5.6552496,
        "y": 4.74627256,
        "z": 999.993
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
      "SpriteRUID": "33e6cdf4ca104e63a4d3fab2acadd973",
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
    }
  ],
  "@version": 1
}"<MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent�
$b4879f5c-ff7c-44ff-bfab-cce9619f8821/maps/map01/UnitBush0�{
  "name": "UnitBush0",
  "path": "/maps/map01/UnitBush0",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMapObject$005bc438766d47ebbb8536d0de285aad",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 6.553152,
        "y": 4.713043,
        "z": 999.992
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
        "x": 1.5,
        "y": 1.5,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.TransformComponent"
    },
    {
      "SpriteRUID": "677ed038d106411c88f96e6c05734b21",
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
    }
  ],
  "@version": 1
}"<MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent�
$8860da9c-2e3b-41e8-96d5-a1cf37d14df6!/maps/map01/UnitBush0/UnitBush0_1�{
  "name": "UnitBush0_1",
  "path": "/maps/map01/UnitBush0/UnitBush0_1",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMapObject$005bc438766d47ebbb8536d0de285aad",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": -0.0114,
        "y": 0.1834,
        "z": -0.001
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
      "SpriteRUID": "677ed038d106411c88f96e6c05734b21",
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
    }
  ],
  "@version": 1
}"<MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent�
$fea4cc52-fa17-4920-b9c1-50f815d50b84/maps/map01/UnitStone1�{
  "name": "UnitStone1",
  "path": "/maps/map01/UnitStone1",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMapObject$04696684e03444e5bf05a7ce515168c8",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 4.595242,
        "y": 4.873391,
        "z": 999.991
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
        "x": 2.01116467,
        "y": 2.011165,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.TransformComponent"
    },
    {
      "SpriteRUID": "7b84c196f463424f97356da0c887b1d7",
      "LocalPosition": {
        "x": 0.0,
        "y": 0.1
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
    }
  ],
  "@version": 1
}"<MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent�
$0b3f2c89-4fcb-4a7b-9afd-ea1e24b770b9/maps/map01/UnitStone0�{
  "name": "UnitStone0",
  "path": "/maps/map01/UnitStone0",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMapObject$054916ef342242f09d2c816ba36cc467",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 3.35858536,
        "y": 4.823077,
        "z": 999.99
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
        "x": 0.416891724,
        "y": 0.4168917,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.TransformComponent"
    },
    {
      "SpriteRUID": "a3ac851fd44a4449bd7987b65966c9c2",
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
    }
  ],
  "@version": 1
}"<MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent�
$61099faa-7a20-41f3-b701-f2dca3951bfe/maps/map01/UnitTree0�{
  "name": "UnitTree0",
  "path": "/maps/map01/UnitTree0",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMapObject$0798d50d5182442a9e843279ab5f3a42",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 2.055389,
        "y": 4.80325174,
        "z": 999.989
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
      "SpriteRUID": "486d02ef55f64ce6a4a4fb44cda134ab",
      "LocalPosition": {
        "x": 0.0,
        "y": 0.5
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
    }
  ],
  "@version": 1
}"<MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent8��������� 
 8f33cd53b1f04f9e8a313a89a89d085b f517bc8999ee44ad81995015f3829cdcmap://map02"	x-mod/map2��
 ea3ba5afd43c465386c92dad66b68fdb/maps/map02�{
  "name": "map02",
  "path": "/maps/map02",
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
$8603d913-39f4-4eb7-a128-f151bba2dcdf/maps/map02/BackGroundTemplate�{
  "name": "BackGroundTemplate",
  "path": "/maps/map02/BackGroundTemplate",
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
      "MapRUID": "794ad8421e2543d8a6d2c70307637450",
      "SolidColor": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
        "a": 1.0
      },
      "BackgroundUrl": "",
      "Enable": true,
      "@type": "MOD.Core.BackgroundTemplateComponent"
    }
  ],
  "@version": 1
}"$MOD.Core.BackgroundTemplateComponent�
$826c9903-33a0-44ed-9e41-eea7e7c6420b/maps/map02/MapleMapLayer�{
  "name": "MapleMapLayer",
  "path": "/maps/map02/MapleMapLayer",
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
      "MapLayerName": "Layer1",
      "LayerSortOrder": 0,
      "Enable": true,
      "@type": "MOD.Core.MapLayerComponent"
    }
  ],
  "@version": 1
}"MOD.Core.MapLayerComponent�	
$9d4a3afd-4628-430b-b34f-c183715a995f/maps/map02/TileMap�{
  "name": "TileMap",
  "path": "/maps/map02/TileMap",
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
      "@type": "MOD.Core.TransformComponent"
    },
    {
      "tileMapVersion": 1,
      "tiles": [],
      "footholdWalk": 1.0,
      "footholdForce": 0.0,
      "footholdDrag": 2.5,
      "TileSetRUID": {
        "DataId": ""
      },
      "IsOddGridPosition": false,
      "SortingLayer": "MapLayer0",
      "OrderInLayer": 1,
      "Enable": true,
      "@type": "MOD.Core.TileMapComponent"
    }
  ],
  "@version": 1
}"5MOD.Core.TransformComponent,MOD.Core.TileMapComponent8ǿ��ϕ���W
 1acfede4cb7848d5b2befff2790dc294 f517bc8999ee44ad81995015f3829cdcmodel://asset/player"x-mod/model2�V�V{
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
}8���ϕ���	
 04bf599dcf5946ec98a1e4acc97dec48 f517bc8999ee44ad81995015f3829cdc<model://maplestorymapobject$00035747aedb4111a2058fee63c0e055"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMapObject$00035747aedb4111a2058fee63c0e055",
  "ModelId": "MapObject",
  "DataSetId": "MapObjectDataSet",
  "DataId": "00035747aedb4111a2058fee63c0e055",
  "Target": {
    "Name": "MapleStoryMapObject$00035747aedb4111a2058fee63c0e055",
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
        "Value": "33e6cdf4ca104e63a4d3fab2acadd973"
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
}8����ϕ���	
 9a6d46d23f0c4ce69ce7b6eaf71ff481 f517bc8999ee44ad81995015f3829cdc<model://maplestorymapobject$005bc438766d47ebbb8536d0de285aad"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMapObject$005bc438766d47ebbb8536d0de285aad",
  "ModelId": "MapObject",
  "DataSetId": "MapObjectDataSet",
  "DataId": "005bc438766d47ebbb8536d0de285aad",
  "Target": {
    "Name": "MapleStoryMapObject$005bc438766d47ebbb8536d0de285aad",
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
        "Value": "677ed038d106411c88f96e6c05734b21"
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
}8뇵�ϕ���	
 720953dca3924815bd644949b811acd4 f517bc8999ee44ad81995015f3829cdc<model://maplestorymapobject$04696684e03444e5bf05a7ce515168c8"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMapObject$04696684e03444e5bf05a7ce515168c8",
  "ModelId": "MapObject",
  "DataSetId": "MapObjectDataSet",
  "DataId": "04696684e03444e5bf05a7ce515168c8",
  "Target": {
    "Name": "MapleStoryMapObject$04696684e03444e5bf05a7ce515168c8",
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
        "Value": "7b84c196f463424f97356da0c887b1d7"
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
}8��޵ϕ���	
 11f04c73441146b29880683b754f95a2 f517bc8999ee44ad81995015f3829cdc<model://maplestorymapobject$054916ef342242f09d2c816ba36cc467"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMapObject$054916ef342242f09d2c816ba36cc467",
  "ModelId": "MapObject",
  "DataSetId": "MapObjectDataSet",
  "DataId": "054916ef342242f09d2c816ba36cc467",
  "Target": {
    "Name": "MapleStoryMapObject$054916ef342242f09d2c816ba36cc467",
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
        "Value": "a3ac851fd44a4449bd7987b65966c9c2"
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
}8ᅉ�ϕ���	
 2416a07c85ed45f29b13a0addd0ac832 f517bc8999ee44ad81995015f3829cdc<model://maplestorymapobject$0671c9339aa8433f89dbb15b854f4ec7"x-mod/model2��{
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
}8����ϕ���	
 5682c3546e9649869515ba359d6ff5c8 f517bc8999ee44ad81995015f3829cdc<model://maplestorymapobject$0798d50d5182442a9e843279ab5f3a42"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMapObject$0798d50d5182442a9e843279ab5f3a42",
  "ModelId": "MapObject",
  "DataSetId": "MapObjectDataSet",
  "DataId": "0798d50d5182442a9e843279ab5f3a42",
  "Target": {
    "Name": "MapleStoryMapObject$0798d50d5182442a9e843279ab5f3a42",
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
        "Value": "486d02ef55f64ce6a4a4fb44cda134ab"
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
}8��ضϕ���
 9d2a9b4c5f8a403fba9c70eb0335c9f1 f517bc8999ee44ad81995015f3829cdc6model://maplestorynpc$001dccbafcad49ffaadccdcc86ec15cc"x-mod/model2��{
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
}8����ϕ���
 376a3946ac15430a9775471b85bd5d32 f517bc8999ee44ad81995015f3829cdc6model://maplestorynpc$003245a8ce3f46f4824aef43968d1413"x-mod/model2��{
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
}8�Ǯ�ϕ���
 0413d4f45baa4ad0ae6076cf55c204ac f517bc8999ee44ad81995015f3829cdc6model://maplestorynpc$007ca10458ba40d3b353b6d793c36a49"x-mod/model2��{
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
}8��۷ϕ���!
 ebbeaad9106e48ba81fc3babe0156c29 f517bc8999ee44ad81995015f3829cdc6model://maplestorynpc$0087ca01ac7b49afa0a87158521fd38f"x-mod/model2� � {
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
}8�ʂ�ϕ���
 24b08284668242079e2869199ef814be f517bc8999ee44ad81995015f3829cdc6model://maplestorynpc$00934434f4bb44c99183af2bf12af2a0"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryNpc$00934434f4bb44c99183af2bf12af2a0",
  "ModelId": "StaticNPC",
  "DataSetId": "NpcDataSet",
  "DataId": "00934434f4bb44c99183af2bf12af2a0",
  "Target": {
    "Name": "MapleStoryNpc$00934434f4bb44c99183af2bf12af2a0",
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
        "Value": "npc-13"
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
          "stand": "08f54cd7cacc46f0b5b0b4dc911a4b25",
          "tea": "0181f791842e40f0ba1001367b017c21"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "08f54cd7cacc46f0b5b0b4dc911a4b25"
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
}8�ຸϕ���
 a9de77601fa240ff934396bce5094ab9 f517bc8999ee44ad81995015f3829cdc6model://maplestorynpc$00c96a0e2cb54372900c214eff2d6047"x-mod/model2��{
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
}8��޸ϕ���
 78b58decc0374868b2ad02d4ee921740 f517bc8999ee44ad81995015f3829cdc6model://maplestorynpc$00d05bcb44a14e688eeaa3a7548fa45b"x-mod/model2��{
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
}8􊌹ϕ���
 8ecf345f5f3c43e48e49af23cf55fed6 f517bc8999ee44ad81995015f3829cdc6model://maplestorynpc$00e48188a8e74421829110fb6e780145"x-mod/model2��{
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
}8����ϕ���
 47cbf2f8e7f743c3a26cbd6d168a0587 f517bc8999ee44ad81995015f3829cdc6model://maplestorynpc$0128a26235c14684ba21c4b9c1035dea"x-mod/model2��{
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
}8Ϋܹϕ���
 dbd78ef4c50b46d7b576bf2aedcb4dcd f517bc8999ee44ad81995015f3829cdc6model://maplestorynpc$02ea4c0111444bd2abb5b97c812b93b7"x-mod/model2��{
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
}8�ϕ���
 f3dc721047d149828a12bcf6c1347ed3 f517bc8999ee44ad81995015f3829cdc6model://maplestorynpc$12183fda544d45cbbde14921de927017"x-mod/model2��{
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
}8�ĳ�ϕ���
 38169415a5bb42bf890ea47f5ca41a3b f517bc8999ee44ad81995015f3829cdc6model://maplestorynpc$1bb4386ace714937915c3ddc11dfc8e6"x-mod/model2��{
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
}8ږ�ϕ���
 d613ac2d25164c078e79ce3519cd84d4 f517bc8999ee44ad81995015f3829cdc6model://maplestorynpc$1bee4c666a4a494681d227313a2c576a"x-mod/model2��{
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
}8����ϕ���
 a4b4574f29904d7e8efb14d3343c13d3 f517bc8999ee44ad81995015f3829cdc6model://maplestorynpc$1d52bf582de2401e9dbbdab47b39c9ae"x-mod/model2��{
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
}8����ϕ���
 e25f5a8eaf944d3c9b529868e5261aa0 f517bc8999ee44ad81995015f3829cdc6model://maplestorynpc$763d2d6d0986419b922b59c58bc15e38"x-mod/model2��{
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
}8߮�ϕ���	
 5637633f80e44127a72a6002a3527c81 f517bc8999ee44ad81995015f3829cdc7model://maplestorytrap$4a7cef45d7374b1d99aa48d2a6899dd8"x-mod/model2��{
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
}8����ϕ����
 639760e650314bceb795cb4c871e5136 f517bc8999ee44ad81995015f3829cdcmodel://npc-2_1_model0"x-mod/model2����{
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
}8�ϕ���
 d9686468f9a34d08ae17e64a048bbe68 f517bc8999ee44ad81995015f3829cdc)sprite://ad2caa046bba40de96e65063784f8ec3"x-mod/sprite2��{
  "upload_keyname": "resource_earlyaccess/f5/17/f517bc8999ee44ad81995015f3829cdc/sprite/ad2caa046bba40de96e65063784f8ec3/637595834484527465",
  "upload_hash": "FEC9016389EFA6908328A1C4489AD9D72EEEC783D6F5ECBEDB38D420600FA6D1",
  "name": "map",
  "resource_guid": "ad2caa046bba40de96e65063784f8ec3",
  "resource_version": "1"
}8���ϕ���
 5e82b43b30244d76b401292cc4361baf f517bc8999ee44ad81995015f3829cdc)sprite://eac24df7e6e64686a6f6bf0c904421a2"x-mod/sprite2��{
  "upload_keyname": "resource_earlyaccess/f5/17/f517bc8999ee44ad81995015f3829cdc/sprite/eac24df7e6e64686a6f6bf0c904421a2/637600768816275055",
  "upload_hash": "50839E6EB37A9EF857137E1BD413349E3C02EE4D1202B5110AC270B283475189",
  "name": "MapleStory_logo",
  "resource_guid": "eac24df7e6e64686a6f6bf0c904421a2",
  "resource_version": "1"
}8����ϕ���
 095c1997ec9b4b81aba29e853116c620 f517bc8999ee44ad81995015f3829cdc)sprite://fc3b6b823a3e4b5ea5e99c7b91136b21"x-mod/sprite2��{
  "upload_keyname": "resource_earlyaccess/f5/17/f517bc8999ee44ad81995015f3829cdc/sprite/fc3b6b823a3e4b5ea5e99c7b91136b21/637600768820852949",
  "upload_hash": "834F5F63690EF987478E4BA588EB55F03F4AA4C7041A88E59DB856DF1D83C02E",
  "name": "ms_launcher_logo_-2x",
  "resource_guid": "fc3b6b823a3e4b5ea5e99c7b91136b21",
  "resource_version": "1"
}8皬�ϕ���q
 6528e7a95d314e2eb6839a05f613756c f517bc8999ee44ad81995015f3829cdc)ui://0838e430-d613-4438-a610-7a19b29d0a24"x-mod/ui2�p�
$0838e430-d613-4438-a610-7a19b29d0a24/ui/UIBattle�{
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
      "thumnail": "/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRwhMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCABkAMgDASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwDjqKKK94+cFX7w+tJ2pV+8PrSdqACiiigApewpKXsKAA9TSUp6mkoAKKKKAClPX8P6UlKev4f0oGJRRRQIKKKKAF/u0lL/AHaSgZFcjNuw+n860rx01LUbvUopNPSG7kaWYXAAa3aUuCu3lnCliQyBuAhIB+UUiMjBpuxP7i/lUThzO5pCpyqxHMY5Lm/kheZ4pHZkec5kYEnBYj+L1966mz13Tn8BaVozSwJeWmrC7Zb2F3gdArn5tgJKkkKRjPPpkjmwABgAAUeWm0fIvX0qZUlJJdio1nFt9x91ff2nqlze/Y7Sz83b+4tIvLiXAxwuTjOMn3Jopu0KTgAfSitIrlVjKUuZ3Cil49D+dHHofzpkgPvCk7U4Y3Dg/nSceh/OgYlFLx6H86OPQ/nQISl7Uceh/OjjHQ/nQMD1NJTjjJ4P50nHofzoASil49D+dHHofzoEJTj1/D+lJx6H86U4z0PT+lAxtFLx6H86OPQ/nQAlFLx6H86OPQ/nQIP7tJTuOOD+dJx6H86BiUUvHofzo49D+dAhKX+EfWjj0P50vG0cHr60DEPU0UHGTwfzooASiiigQo+8KTtSr94fWk7UAFFFFABS9qSl7CgAPU0lKeppKBhRRRQIKcev4f0ptKev4f0oGJRRRQIKKKKAF/u0lL/dpKBhRRRQIKX+EfWkpf4R9aAA9TRQepooGJRRRQIVfvD60nalH3hSUAFFFFABS9hSUvagAPU0lKeppKBhRRRQIKU9fw/pSU49fw/pQMbRRRQIKKKKAF/u0lL/AHaSgYUUUUCCl/hH1pKX+EfWgAPU0UHqaKBhx6n8qOPU/lRn6flRn6flQAoxuHJ/Kk49T+VKD8w6flSZ+n5UAHHqfyo49T+VGfp+VGfp+VABx6n8qOMdT+VGfp+VGeO35UAKcZPJ/Kk49T+VKTyen5Umfp+VABx6n8qOPU/lRn6flRn6flQAcep/KlOM9T0/pSZ+n5UpPPbp6e1ACcep/Kjj1P5UZ+n5UZ+n5UAHHqfyo49T+VGfp+VGfp+VAC8ccn8qTj1P5UuenT8qTP0/KgA49T+VHHqfyoz9Pyoz9PyoAOPU/lS8bRyevpSZ+n5UuflHTr6UAIcZPJ/Kignk9PyooASiiigQq/eH1pO1Kv3h9aTtQAUUUUAFL2FJS9hQAHqaSlPU0lABRRRQAUp6/h/SkpT1/D+lAxKKKKBBRRRQAv8AdpKX+7SUDCiiigQUv8I+tJS/wj60AB6mig9TRQAlFFFACr94fWk7UUUAFFFFABS9hRRQAHqaSiigAooooAKU9fw/pRRQMSiiigQUUUUAL/dpKKKBhRRRQIKX+EfWiigAPU0UUUAf/9k=",
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
}"�MOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.ButtonComponent,MOD.Core.TextComponent,script.StateIntroNextDialog8����������
 44acd32f36bc4ede89f0f0e33d9c353c f517bc8999ee44ad81995015f3829cdc)ui://420a49b1-aca8-4a7f-aa6e-9c98f7c7e614"x-mod/ui2���
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
}"jMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.ButtonComponent,script.CameraCtrlRaiseEvent8�Ţ������R
 3a6a6112302144debd7f6fa8111103a4 f517bc8999ee44ad81995015f3829cdc)ui://7fdaf72c-34e8-494c-ae54-c6c5e09031c4"x-mod/ui2�Q�
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
}"LMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.TextComponent8����������
 f880dd000a8f41568609e0e1635d4d2e f517bc8999ee44ad81995015f3829cdc)ui://878c6aff-9f6c-4197-8676-3a01590cb5ae"x-mod/ui2��
$878c6aff-9f6c-4197-8676-3a01590cb5ae/ui/UIBattleResult�{
  "name": "UIBattleResult",
  "path": "/ui/UIBattleResult",
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
      "thumnail": "/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRwhMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCABkAMgDASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD2Twb/AMiP4f8A+wbb/wDota26xPBv/Ij+H/8AsG2//opa26b3FHYKKKKQwooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAMTwb/AMiP4f8A+wbb/wDopa26xPBv/Ij+H/8AsG2//opa26b3FHYKKKKQwooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAMTwb/AMiP4f8A+wbb/wDota26xPBv/Ij+H/8AsG2//ota26b3FHYKKKKQwooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAMTwb/AMiP4f8A+wbb/wDopa26xPBv/Ij+H/8AsG2//opa26b3FHYKKKKQwooooAKKKKACiiigAooooAKK5DS/CurnVdau9d167uYbu7WaygtbmWEWqI0gQfKwByjJuXG0lcncea6iximg0+2huJPMmjiVZHyTuYAAnJ680AT0UUUAFFFFABRRRQAUUUUAFFFFABRRRQBieDf+RH8P/wDYNt//AEUtbdYng3/kR/D/AP2Dbf8A9FrW3Te4o7BRRRSGFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQBieDf+RH8P/wDYNt//AEWtbdYng3/kR/D/AP2Dbf8A9FrW3Te4o7BRRRSGFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQBieDf+RH8P/wDYNt//AEUtbdFFN7ijsFFFFIYUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAH//2Q==",
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
}"UMOD.Core.UITransformComponent,MOD.Core.UIGroupComponent,MOD.Core.CanvasGroupComponent�
$39a34943-25af-4f00-abf6-f5353fc9285f"/ui/UIBattleResult/imageBackground�{
  "name": "imageBackground",
  "path": "/ui/UIBattleResult/imageBackground",
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
        "y": 0.0
      },
      "RectSize": {
        "x": 100.0,
        "y": 100.0
      },
      "OffsetMin": {
        "x": -1.0,
        "y": -1.0
      },
      "OffsetMax": {
        "x": 1.0,
        "y": 1.0
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
        "x": 1317.19385,
        "y": 1064.14429,
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
      "Text": "계속",
      "FontSize": 14,
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
}"LMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.TextComponent�
$bdf36bbe-05f9-4753-89e8-18c188bda809!/ui/UIBattleResult/buttonContinue�{
  "name": "buttonContinue",
  "path": "/ui/UIBattleResult/buttonContinue",
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
        "x": -19.151598,
        "y": -397.887115
      },
      "RectSize": {
        "x": 519.4833,
        "y": 128.6258
      },
      "OffsetMin": {
        "x": -278.89325,
        "y": -462.2
      },
      "OffsetMax": {
        "x": 240.590042,
        "y": -333.574219
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
        "x": 1289.39966,
        "y": 819.1122,
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
      "Text": "계속",
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
      "@type": "script.CommonButtonAction"
    }
  ],
  "@version": 1
}"MOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.ButtonComponent,MOD.Core.TextComponent,script.CommonButtonAction�
$1f08454a-1f54-4b83-846f-16bc37aca2fb/ui/UIBattleResult/textScore�{
  "name": "textScore",
  "path": "/ui/UIBattleResult/textScore",
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
        "x": 1.6238054,
        "y": -611.625366
      },
      "RectSize": {
        "x": 1903.90979,
        "y": 352.857971
      },
      "OffsetMin": {
        "x": 1.6238054,
        "y": -788.0543
      },
      "OffsetMax": {
        "x": 1.6238054,
        "y": -435.196381
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 9,
      "AnchorsMin": {
        "x": 0.0,
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
        "x": 955.5769,
        "y": 955.2126,
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
        "a": 0.0
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
      "Text": "점수",
      "FontSize": 200,
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
}"LMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.TextComponent�
$25269d74-d503-4ef7-8687-d80a31a3c9bd/ui/UIBattleResult/textResult�{
  "name": "textResult",
  "path": "/ui/UIBattleResult/textResult",
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
        "x": -4.218069,
        "y": -242.63591
      },
      "RectSize": {
        "x": 338.8144,
        "y": 177.9111
      },
      "OffsetMin": {
        "x": -173.625259,
        "y": -331.591461
      },
      "OffsetMax": {
        "x": 165.189133,
        "y": -153.680359
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 3,
      "AnchorsMin": {
        "x": 0.5,
        "y": 1.0
      },
      "AnchorsMax": {
        "x": 0.5,
        "y": 1.0
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": 952.8069,
        "y": 1130.175,
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
        "a": 0.0
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
      "Text": "결과",
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
}"LMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.TextComponent8���������;
 ba09f6ae4839495ab3fe36be2a5a1df4 f517bc8999ee44ad81995015f3829cdc)ui://a10955cb-e1e2-4510-9e45-269daf9907b0"x-mod/ui2�:�
$a10955cb-e1e2-4510-9e45-269daf9907b0/ui/UIGameIntro�{
  "name": "UIGameIntro",
  "path": "/ui/UIGameIntro",
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
      "GroupOrder": 8,
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
$2779c232-8c4a-4eb2-916d-b5c581a98b9d/ui/UIGameIntro/buttonSkip�{
  "name": "buttonSkip",
  "path": "/ui/UIGameIntro/buttonSkip",
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
        "x": -114.726929,
        "y": -60.81888
      },
      "RectSize": {
        "x": 298.604919,
        "y": 100.0
      },
      "OffsetMin": {
        "x": -264.0294,
        "y": -110.818878
      },
      "OffsetMax": {
        "x": 34.57553,
        "y": -10.8188782
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
        "x": 1734.875,
        "y": 1374.5,
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
        "DataId": "b2efe9b7579bd494baecc7a2ef3c16e3"
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
      "Text": "넘기기",
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
      "Enable": true,
      "@type": "script.CommonButtonAction"
    }
  ],
  "@version": 1
}"MOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.ButtonComponent,MOD.Core.TextComponent,script.CommonButtonAction8��������j
 0a106ee749134e65ae1f9acea33975da f517bc8999ee44ad81995015f3829cdc)ui://d275eee8-cd44-4a13-affb-85fc069cda55"x-mod/ui2�i�
$d275eee8-cd44-4a13-affb-85fc069cda55/ui/UIBattleGoal�{
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
      "thumnail": "/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRwhMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCABkAMgDASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwDj8H+7Rg/3aSivePnRwByPlowf7tIPvCk7UALg/wB2jB/u0lFAC4P92lwcfdptL2oAUg5Py0mD/doPU0lAC4P92jB/u0lFAC4P92nEHP3e1Mpx6/h/SgBMH+7Rg/3aSigBcH+7Rg/3aSigB+Dx8tNwf7tH92koAjuVJt2G30/nWtexQX9xNPBp2iRQXTyzLKbtlaFWydpTeOU3AACP5ig2hh1zSARgjIpnlR/3RWc4czuaQqcqsNkJmub+XzZrjzHZvOmGHkySdzcnk9Tyfqa6V9Y01/hhpmjs6SXlvqn2iW2kSQKY9r9WXscgcHPPbrXPBVAwAMUnlR7R8o61MqV0l2KjWcW33JJp7e6vZJrTTo7GLYi+TG7uNwHzNliTycnHYYHPUlMCKpO0AUVpGPKrGc5czuLRRRVECr94fWk7Uq/eH1pO1ABRRRQAUvYUlL2FAAeppKU9TSUAFFFFABSnr+H9KSlPX8P6UDEooooEFFFFAC/3aSl/u0lAwooooEFL/CPrSUv8I+tAAepooPU0UAJRRxRxQAq/eH1pO1KMbhRxigBKKOKOKACl7Ck4peMUAB6mkpT1NJxQMKKOKOKBBSnr+H9KTinHr+H9KBjaKOKOKBBRRxRxQAv92kp392m8UDCijijigQUv8I+tJxS8bR9aAA9TRQcZNFAw3N6n86Nzep/OkooEODHcOTSbj6n86F+8PrSdqBi7m9T+dG5vU/nSUUCF3N6n86XccdTTaXsKBiljk8mk3N6n86D1NJQAu5vU/nRub1P50lFAhdzep/OlLHPU9P6U2lPX8P6UDDc3qfzo3N6n86SigBdzep/Ojc3qfzpKKBDtx45NJub1P50f3aSgYu5vU/nRub1P50lFAhdzep/Ol3HaOT1ptL/CPrQMUscnk0Uh6migBKKKKBCr94fWk7Uq/eH1pO1ABRRRQAUvYUlL2FAAeppKU9TSUAFFFFABSnr+H9KSlPX8P6UDEooooEFFFFAC/wB2kpf7tJQMKKKKBBS/wj60lL/CPrQAHqaKD1NFACUUuT7flRk+35UDAfeFJ2pwJ3Dp+VJk+35UAJRS5Pt+VGT7flQAlL2oyfb8qXJx2/KgBD1NJTiTk9KTJ9vyoASilyfb8qMn2/KgBKcev4f0pMn2/KlJOe3T+lADaKXJ9vyoyfb8qAEopcn2/KjJ9vyoAP7tJTsnjpSZPt+VACUUuT7flRk+35UAJS/wj60ZPt+VLk7R06+lACHqaKUk5PT8qKAG0UUUCFX7w+tJ2oooAKKKKACl7CiigAPU0lFFABRRRQAUp6/h/SiigYlFFFAgooooAX+7SUUUDCiiigQUv8I+tFFAAepooooA/9k=",
      "DefaultShow": false,
      "GroupType": 2,
      "GroupOrder": 7,
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
$e590a6ed-4c68-451f-9daf-0f6224e2ec49/ui/UIBattleGoal/RemoveButton�{
  "name": "RemoveButton",
  "path": "/ui/UIBattleGoal/RemoveButton",
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
        "x": 0.0,
        "y": 6.10351563E-05
      },
      "RectSize": {
        "x": 1712.742,
        "y": 1082.0
      },
      "OffsetMin": {
        "x": -1.0,
        "y": -0.999938965
      },
      "OffsetMax": {
        "x": 1.0,
        "y": 1.000061
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
        "x": 1217.19385,
        "y": 1115.1665,
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
        "a": 0.7
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
      "@type": "script.CommonButtonAction"
    }
  ],
  "@version": 1
}"hMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.ButtonComponent,script.CommonButtonAction�
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
        "x": 0.0,
        "y": 113.1968
      },
      "RectSize": {
        "x": 1753.95264,
        "y": 579.824341
      },
      "OffsetMin": {
        "x": -21.6053467,
        "y": -176.715363
      },
      "OffsetMax": {
        "x": 21.6053467,
        "y": 403.108978
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 10,
      "AnchorsMin": {
        "x": 0.0,
        "y": 0.5
      },
      "AnchorsMax": {
        "x": 1.0,
        "y": 0.5
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": 1217.19385,
        "y": 1175.25513,
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
        "x": 0.0,
        "y": -63.89302
      },
      "RectSize": {
        "x": 1716.72815,
        "y": 213.874451
      },
      "OffsetMin": {
        "x": -2.993103,
        "y": -170.830246
      },
      "OffsetMax": {
        "x": 2.993103,
        "y": 43.0442047
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 10,
      "AnchorsMin": {
        "x": 0.0,
        "y": 0.5
      },
      "AnchorsMax": {
        "x": 1.0,
        "y": 0.5
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": 1217.19385,
        "y": 1081.25,
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
}"LMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.TextComponent8󟩋�����
 143bb51162684affa504192429f1d013 f517bc8999ee44ad81995015f3829cdc)ui://d669cade-6d27-49cc-b5c9-308fadbe2a67"x-mod/ui2��'
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
}"LMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.ChatComponent8�ۃ�������
 01cc9d6dd652451a9c1e81eff5b7a114 f517bc8999ee44ad81995015f3829cdc)ui://e62ed24c-6b00-4670-82eb-779e1bcb5e2a"x-mod/ui2���O
$e62ed24c-6b00-4670-82eb-779e1bcb5e2a/ui/UITitle�N{
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
        "x": 1.94341111,
        "y": 51.1386261
      },
      "OffsetMax": {
        "x": 1.94341111,
        "y": 251.113266
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
      "Text": "",
      "FontSize": 200,
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
        "x": -27.726162,
        "y": 0.0
      },
      "RectSize": {
        "x": 344.482147,
        "y": 100.000008
      },
      "OffsetMin": {
        "x": -199.967239,
        "y": -50.0
      },
      "OffsetMax": {
        "x": 144.514908,
        "y": 50.0
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
        "x": 1434.22192,
        "y": 1064.14429,
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
      "Text": "전략",
      "FontSize": 120,
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
}"LMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.TextComponent�
$ae9d4a66-6e5a-4d85-965b-471cb3e18d84/ui/UITitle/MODImage_1�{
  "name": "MODImage_1",
  "path": "/ui/UITitle/MODImage_1",
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
        "x": 3.259935,
        "y": -227.765839
      },
      "RectSize": {
        "x": 807.3876,
        "y": 410.670166
      },
      "OffsetMin": {
        "x": -400.433838,
        "y": -433.100922
      },
      "OffsetMax": {
        "x": 406.953735,
        "y": -22.4307556
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 3,
      "AnchorsMin": {
        "x": 0.5,
        "y": 1.0
      },
      "AnchorsMax": {
        "x": 0.5,
        "y": 1.0
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": 1455.20142,
        "y": 1256.42847,
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
        "DataId": "eac24df7e6e64686a6f6bf0c904421a2"
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
    }
  ],
  "@version": 1
}"5MOD.Core.UITransformComponent,MOD.Core.ImageComponent8����������
 1e211a2d3926421c8ef7c42ba5fd9cb9 f517bc8999ee44ad81995015f3829cdc)ui://ed5a3331-eae7-42cb-99ad-eda8925f0fbb"x-mod/ui2��
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
}"{MOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.ButtonComponent,MOD.Core.TextComponent,script.StateIntroSkip8���������
 8e36ebbbfb5f43b4890008c60e0500a5 f517bc8999ee44ad81995015f3829cdcuserdataset://introdialog"x-mod/userdataset2��{
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
}8����ϕ��   "dialog": "(말을 타고 가다 화살을 맞고 떨어졌는데 ... 내 눈이 다칠걸까?)​"
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