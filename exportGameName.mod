
 �L
 031f51ec378a488b8ff616e3c2acd3ce f632dad4121d46e3a8e3e76f7cc1979c0codeblock://301d181f-7d79-45f0-a07a-33cb351314cb"x-mod/codeblock2�K�K{
  "CoreVersion": {
    "Major": 0,
    "Minor": 2
  },
  "ScriptVersion": {
    "Major": 1,
    "Minor": 0
  },
  "Description": "",
  "Id": "301d181f-7d79-45f0-a07a-33cb351314cb",
  "Language": 1,
  "Name": "StateGame04",
  "Type": 1,
  "Source": 0,
  "Target": null,
  "Properties": [
    {
      "Name": "actors",
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
      "Arguments": null,
      "Code": "self.Entity.StateGameCommon.StateGame=self.Entity\nself.Entity.StateGameCommon:OnStateEntered()",
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
      "Name": "StartIntro",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": null,
      "Code": "local cameraPos=_UserService.LocalPlayer.TransformComponent.WorldPosition\nlocal state3=_EntityService:GetEntityByPath(\"/common/StateGame03\")\nlocal screenSize=state3.StateGame03.ScreenSize\nlocal layer=10000\nlocal scr=_EntityService:GetEntityByPath(\"/common/TileMovable\"):Clone()\nscr.Visible=true\nscr.SpriteRendererComponent.OrderInLayer=layer\nscr.TransformComponent.WorldPosition=cameraPos\nscr.TransformComponent.Scale=Vector3(screenSize.x,screenSize.y,100)\nscr.SpriteRendererComponent.Color=Color(0,0,0,1)\n\nlocal dm=_EntityService:GetEntityByPath(\"/common/DataManager\")\nlocal unit=dm.DataManager.Team[1]\nlocal b=_EntityService:GetEntityByPath(unit.entity):Clone()\nb.SpriteRendererComponent.Color=Color(1,1,1,0)\nb.SpriteRendererComponent.OrderInLayer=layer+1\nb.TransformComponent.WorldPosition=cameraPos-Vector3(-2,1,0)\n\nlocal s=_EntityService:GetEntityByPath(\"/maps/map01/UnitSunrye\"):Clone()\ns.SpriteRendererComponent.Color=Color(1,1,1,0)\ns.SpriteRendererComponent.OrderInLayer=layer+1\ns.SpriteRendererComponent.FlipX=true\ns.TransformComponent.WorldPosition=cameraPos-Vector3(2,1,0)\n\nlocal q=_EntityService:GetEntityByPath(\"/maps/map01/UnitQueen\"):Clone()\nq.SpriteRendererComponent.Color=Color(1,1,1,0)\nq.SpriteRendererComponent.OrderInLayer=layer+1\nq.TransformComponent.WorldPosition=cameraPos-Vector3(0,-1,0)\nq.NameTagComponent.Enable=false\n\nself.actors={b,s,q,scr}\n\nlocal ui=_EntityService:GetEntityByPath(\"/ui/UIEnding\")\nui.Visible=true\nui.Enable=true\nlocal txtSide=_EntityService:GetEntityByPath(\"/ui/UIEnding/txtSide\")\ntxtSide.TextComponent.Text=\"\"\nlocal txtMain=_EntityService:GetEntityByPath(\"/ui/UIEnding/txtMain\")\ntxtMain.TextComponent.Text=\"\"\n\nlocal scene25=function()\n\ttxtMain.TextComponent.Text=\"계속\"\nend\nlocal scene24=function()\n\tself:MoveUp(q)\n\ttxtSide.TextComponent.Text=\"언젠가\"\n\t_TimerService:SetTimerOnce(function() scene25() end,1)\nend\nlocal scene23=function()\n\ttxtSide.TextComponent.Text=\"언젠\"\n\t_TimerService:SetTimerOnce(function() scene24() end,0.5)\nend\nlocal scene22=function()\n\ttxtSide.TextComponent.Text=\"언\"\n\t_TimerService:SetTimerOnce(function() scene23() end,0.5)\nend\nlocal scene21=function()\n\tq.UnitCommon:AddChat(\"그럼 또 만나요!\")\n\t_TimerService:SetTimerOnce(function() scene22() end,2)\nend\nlocal scene20=function()\n\tb.UnitCommon:AddChat(\"으악!\")\n\ts.UnitCommon:AddChat(\"악!\")\n\n\tself:MoveDown(b)\n\tself:MoveDown(s)\n\t_TimerService:SetTimerOnce(function() scene21() end,2)\nend\nlocal scene19=function()\n\tb.UnitCommon:AddChat(\"전 어떻게 집으로 가죠?\")\n\ts.UnitCommon:AddChat(\"이제 물어볼 게...\")\n\t_TimerService:SetTimerOnce(function() scene20() end,2)\nend\nlocal scene18=function()\n\tb.UnitCommon:AddChat(\"...\")\n\ts.UnitCommon:AddChat(\"...\")\n\t_TimerService:SetTimerOnce(function() scene19() end,1)\nend\nlocal scene17=function()\n\tb.UnitCommon:AddChat(\"계세요\")\n\ts.UnitCommon:AddChat(\"계세요\")\n\t_TimerService:SetTimerOnce(function() scene18() end,2)\nend\nlocal scene16=function()\n\tb.UnitCommon:AddChat(\"안녕히...\")\n\ts.UnitCommon:AddChat(\"안녕히...\")\n\tq.UnitCommon:AddChat(\"계세요\")\n\t_TimerService:SetTimerOnce(function() scene17() end,2)\nend\nlocal scene15=function()\n\tb.UnitCommon:AddChat(\"그럼...\")\n\ts.UnitCommon:AddChat(\"그럼...\")\n\tq.UnitCommon:AddChat(\"안녕히...\")\n\t_TimerService:SetTimerOnce(function() scene16() end,2)\nend\nlocal scene14=function()\n\tq.UnitCommon:AddChat(\"그럼...\")\n\t_TimerService:SetTimerOnce(function() scene15() end,1)\nend\nlocal scene13=function()\n\tq.UnitCommon:AddChat(\"우리 인사부터 해요\")\n\t_TimerService:SetTimerOnce(function() scene14() end,2)\nend\nlocal scene12=function()\n\tq.UnitCommon:AddChat(\"죄송하지만...\")\n\t_TimerService:SetTimerOnce(function() scene13() end,2)\t\nend\nlocal scene11=function()\n\tb.UnitCommon:AddChat(\"그게 무슨...\")\n\ts.UnitCommon:AddChat(\"이해가 안되는데요...\")\n\t_TimerService:SetTimerOnce(function() scene12() end,1)\nend\nlocal scene10=function()\n\tq.UnitCommon:AddChat(\"그 때까지 시간의 방에서 기다려주세요\")\n\t_TimerService:SetTimerOnce(function() scene11() end,3)\nend\nlocal scene9=function()\n\tq.UnitCommon:AddChat(\"하지만 천사신께서 시간이 필요해요\")\n\t_TimerService:SetTimerOnce(function() scene10() end,4)\nend\nlocal scene8=function()\n\tq.UnitCommon:AddChat(\"모험이 끝난 건 아니예요\")\n\t_TimerService:SetTimerOnce(function() scene9() end,3)\nend\nlocal scene7=function()\n\ts.UnitCommon:AddChat(\"여왕님 설명해주세요\")\n\t_TimerService:SetTimerOnce(function() scene8() end,3)\nend\nlocal scene6=function()\n\tb.UnitCommon:AddChat(\"!\")\n\ts.UnitCommon:AddChat(\"?\")\n\t_TimerService:SetTimerOnce(function() scene7() end,1)\nend\nlocal scene5=function()\n\tq.UnitCommon:AddChat(\"더 할 것이 없어요\")\n\t_TimerService:SetTimerOnce(function() scene6() end,2)\nend\nlocal scene4=function()\n\tq.UnitCommon:AddChat(\"죄송해요\")\n\t_TimerService:SetTimerOnce(function() scene5() end,2)\nend\nlocal scene3=function()\n\tb.UnitCommon:AddChat(\"이제 무엇을 해야하죠?\")\n\tq.NameTagComponent.Enable=true\n\t_TimerService:SetTimerOnce(function() scene4() end,2)\nend\nlocal scene2=function()\n\tstate3.StateGame03:FadeIn(q)\n\t_TimerService:SetTimerOnce(function() scene3() end,2)\nend\n\nlocal scene1=function()\t\n\tstate3.StateGame03:FadeIn(b)\n\tstate3.StateGame03:FadeIn(s)\n\t_TimerService:SetTimerOnce(function() scene2() end,2)\nend\n\nscene1()",
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
      "Code": "for _,e in ipairs(self.actors) do\n\te:Destroy()\nend\nself.actors={}\ndo\n\tlocal ui=_EntityService:GetEntityByPath(\"/ui/UIBattleGoal\")\n\tui.Enable=false\n\tui.Visible=false\nend\ndo\n\tlocal ui=_EntityService:GetEntityByPath(\"/ui/UIEnding\")\n\tui.Visible=false\n\tui.Enable=false\nend\nlocal sm=_EntityService:GetEntityByPath(\"/common/StateManager\")\nsm.StateManager:OnStateChanged(\"Title\")",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "MoveDown",
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
          "Type": "any",
          "DefaultValue": "nil",
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "local pos=entity.TransformComponent.WorldPosition\nlocal groundPos=_UserService.LocalPlayer.TransformComponent.WorldPosition-Vector3(0,10,0)\n\nif pos.y>groundPos.y then\n\tentity.TransformComponent.WorldPosition=Vector3(pos.x,pos.y-0.1,pos.z)\n\t_TimerService:SetTimerOnce(function() self:MoveDown(entity) end,0.01)\nend",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "MoveUp",
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
          "Type": "any",
          "DefaultValue": "nil",
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "local pos=entity.TransformComponent.WorldPosition\nlocal groundPos=_UserService.LocalPlayer.TransformComponent.WorldPosition+Vector3(0,10,0)\n\nif pos.y<groundPos.y then\n\tentity.TransformComponent.WorldPosition=Vector3(pos.x,pos.y+0.1,pos.z)\n\t_TimerService:SetTimerOnce(function() self:MoveUp(entity) end,0.01)\nend",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    }
  ],
  "EventEmitters": [],
  "EventHandlers": [],
  "EntityEventHandlers": []
}8��������J 4a0271d2ebd14b04b8d62c075a5c7541��
 b82dd635b4aa48efbd7b49874214250e f632dad4121d46e3a8e3e76f7cc1979c0codeblock://34aeae04-5307-4f35-87b6-59ebd295518e"x-mod/codeblock2����{
  "CoreVersion": {
    "Major": 0,
    "Minor": 2
  },
  "ScriptVersion": {
    "Major": 1,
    "Minor": 0
  },
  "Description": "",
  "Id": "34aeae04-5307-4f35-87b6-59ebd295518e",
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
      "SyncDirection": 3
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
      "SyncDirection": 3
    },
    {
      "Name": "TurnMgr",
      "Type": "Entity",
      "DefaultValue": "nil",
      "Description": null,
      "SyncDirection": 3
    },
    {
      "Name": "MapOffset",
      "Type": "Vector3",
      "DefaultValue": "Vector3(0,0,0)",
      "Description": null,
      "SyncDirection": 3
    },
    {
      "Name": "TileSpriteRUID",
      "Type": "string",
      "DefaultValue": "\"\"",
      "Description": null,
      "SyncDirection": 3
    },
    {
      "Name": "TileSet",
      "Type": "table",
      "DefaultValue": "{}",
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
      "Arguments": [
        {
          "Name": "turnCnt",
          "Type": "number",
          "DefaultValue": "0",
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "do\n\tlocal ui=_EntityService:GetEntityByPath(\"/ui/UIBattle/txtTurn\")\n\tui.TextComponent.Text=tostring(turnCnt)\nend\nlocal grid_size = self.__properties.grid_size\nlocal tm = self.TurnMgr.TurnManager\t\ntm.MapSize = self.MapSize\ntm.MapOffset=self.MapOffset\ntm.GridSize = grid_size\ntm.StateGame = self.Entity\t\n\nlocal dm=_EntityService:GetEntityByPath(\"/common/DataManager\")\ndm=dm.DataManager\ndm:Refresh()\ndm:Backup()\n\nlocal teams=dm.Team\nlocal teamIdx=0\nlocal tileSet=self.TileSet\n\nfor i=0, #self.Map-1 do\n\tlocal location = self.Map[i + 1]\n\tif location==99 then\n\t\tgoto skip_to_next\n\tend\n\t\n\tlocal x = i - math.floor(i/self.MapSize.x)*self.MapSize.x\n\tlocal y = i / self.MapSize.x\n\ty = math.floor(y)\t\n\t\n\tif location==0 then\n\t\ttm.Map[i]=0\n\t\t--create random grass tile\n\t\tif tileSet~=nil and #tileSet>0 and math.random(1,10)>7 then\n\t\t\tlocal tileIdx=math.random(1,#tileSet)\n\t\t\tlocal tile=tileSet[tileIdx]\n\t\t\tself:AddActor(Vector2(x,y),{entity=tile})\n\t\tend\n\t\t\n\t\tgoto skip_to_next\n\tend\n\n\tlocal unit=nil\t\n\tif location==-1 then\n\t\tif #teams>teamIdx then\n\t\t\tteamIdx=teamIdx+1\t\t\t\n\t\t\tunit=teams[teamIdx]\n\t\tend\n\telse\n\t\tunit=dm.Units[location]\n\tend\n\t\n\tif unit==nil then\n\t\tgoto skip_to_next\n\tend\n\t\n\tlocal entity=self:AddActor(Vector2(x,y),unit)\n\tif entity==nil then\n\t\tlog(\"no entity:\",unit.entity)\n\t\tgoto skip_to_next\n\tend\n\t\n\ttm.Map[i]=entity.Id\n\t\n\t::skip_to_next::\nend\n\n--local background = _EntityService:GetEntityByPath(\"/maps/map01/BackGroundTemplate\")\n--background.BackgroundTemplateComponent.SolidColor = Color(0.1, 0.5, 0.3, 1)\n\n--set tile map at center of map\ndo\n\tlocal tileMap=_EntityService:GetEntityByPath(\"/maps/map01/Ground\")\n\ttileMap.Visible=true\n\tlocal z=tileMap.TransformComponent.WorldPosition.z\n\ttileMap.TransformComponent.WorldPosition=Vector3(0,-self.MapSize.y+1,z)+self.MapOffset\n\ttileMap.SpriteRendererComponent.TiledSize=self.MapSize\n\t--tileMap.SpriteRendererComponent:CommitPropertiesForced()\n\ttileMap.SpriteRendererComponent.SpriteRUID=self.TileSpriteRUID\n\ttileMap.SpriteRendererComponent:CommitPropertiesForced()\nend",
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
      "Code": "self.TurnMgr = _EntityService:GetEntityByPath(\"/common/TurnManager\")\nself.__properties.grid_size = Vector2(0.7, 1)\nself.Entity.Enable = false",
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
      "Arguments": [],
      "Code": "self:StartIntro()\t",
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
      "Arguments": [],
      "Code": "--check whether heroin can upgrade\nlocal dm=_EntityService:GetEntityByPath(\"/common/DataManager\")\nlocal heroin=nil\nfor _,unit in ipairs(dm.DataManager.Team) do\n\theroin=unit\n\tbreak\nend\nif heroin and heroin.LVLUP>0 and heroin.ISANGEL then\n\t--it blocks to change job again\n\t--because there is a bug but I can't fix it.\n\theroin.ISANGEL=false\n\theroin.LVLUP=0\n\theroin.LVL=heroin.LVL+1\n\t\n\tlocal ui=_EntityService:GetEntityByPath(\"/ui/UIChangeJob\")\n\tui.Enable=true\n\tui.Visible=true\n\t\n\tlocal btn=_EntityService:GetEntityByPath(\"/ui/UIChangeJob/btnChangeJob\")\n\tbtn.Visible=false\n\tbtn.CommonButtonAction.CurrentStage=self.StateGame\n\t\n\tlocal atk=_EntityService:GetEntityByPath(\"/ui/UIChangeJob/txtAtk\")\n\tatk.TextComponent.Text=tostring(math.floor(heroin.ATK))\n\tlocal def=_EntityService:GetEntityByPath(\"/ui/UIChangeJob/txtDef\")\n\tdef.TextComponent.Text=tostring(math.floor(heroin.DEF))\n\t\n\tlocal jobName=_EntityService:GetEntityByPath(\"/ui/UIChangeJob/txtJobName\")\n\tjobName.TextComponent.Text=heroin.job and heroin.job or \"?\"\n\t\n\tdo\n\t\tlocal entity=_EntityService:GetEntityByPath(heroin.entity)\n\t\tlocal ruid=\"33e6cdf4ca104e63a4d3fab2acadd973\"\n\t\tif entity then\n\t\t\truid=entity.SpriteRendererComponent.SpriteRUID\n\t\tend\n\t\t\n\t\tlocal sprMe=_EntityService:GetEntityByPath(\"/ui/UIChangeJob/sprMe\")\n\t\tsprMe.SpriteGUIRendererComponent.ImageRUID=ruid\n\tend\n\t\n\tlocal job1,job2=nil,nil\n\tif heroin.job==\"휴학생\" then\n\t\tjob1={\u000b\t\t\tjob=\"전투요리사\",\t\n\t\t\tjobDesc=\"그들은 따뜻한 요리를 좋아합니다. 검은 전투 뿐아니라 사냥에도 유용하게 쓰입니다\",\n\t\t\truid=\"cde2f4ed61044b4896ac70ae9b25215a\",\n\t\t\tentity=\"/maps/map01/UnitChef1\",\n\t\t\tATK=12,\n\t\t\tDEF=13,\n\t\t\tDEX=-3,\n\t\t\tHP=20,\n\t\t}\n\t\tjob2={\t\t\t\n\t\t\tjob=\"도끼술사\",\n\t\t\tjobDesc=\"도끼는 저주의 물건입니다. 그것을 사모하는 자들은 음침함을 사랑하며 한편으로 팬더 눈을 갖게 됩니다\",\n\t\t\truid=\"47f512a4570a4715a0a3702167ee67e4\",\n\t\t\tentity=\"/maps/map01/UnitWizard1\",\n\t\t\tATK=13,\n\t\t\tDEF=10,\n\t\t\tDEX=5,\n\t\t\tHP=18,\n\t\t}\n\telseif heroin.job==\"전투요리사\" then\n\t\tjob1={\t\t\t\n\t\t\tjob=\"전투주방장\",\t\n\t\t\tjobDesc=\"군대에서도 일류 요리를 만들고 싶은 그들은 식재료에 남다른 욕심을 냅니다\",\n\t\t\truid=\"ba135f41f50b4470a4eb7535d510e47a\",\n\t\t\tentity=\"/maps/map01/UnitSwordChef2\",\n\t\t\tATK=9,\n\t\t\tDEF=9,\n\t\t\tDEX=9,\n\t\t\tHP=9,\n\t\t}\n\t\tjob2={\t\t\t\n\t\t\tjob=\"전투보급관\",\n\t\t\tjobDesc=\"요리 만으로는 성이 차지 않은 그들은 남몰래 대량 급식을 계획했습니다\",\n\t\t\truid=\"06a65f73c1ac4e79978e0995fc2c9193\",\n\t\t\tentity=\"/maps/map01/UnitPaladin2\",\n\t\t\tATK=7,\n\t\t\tDEF=8,\n\t\t\tDEX=5,\n\t\t\tHP=18,\n\t\t}\n\telseif heroin.job==\"도끼술사\" then\n\t\tjob1={\t\t\t\n\t\t\tjob=\"궁술사\",\t\n\t\t\tjobDesc=\"도끼를 활로 쏘면 어떨까 하는 생각은 그들을 활로 이끌었습니다\",\n\t\t\truid=\"a43f726fe90e4ae7ae6ec0d8a3432f24\",\n\t\t\tentity=\"/maps/map01/UnitArcherWizard\",\n\t\t\tATK=12,\n\t\t\tDEF=11,\n\t\t\tDEX=9,\n\t\t\tHP=9,\n\t\t}\n\t\tjob2={\t\t\t\n\t\t\tjob=\"행복전도사\",\n\t\t\tjobDesc=\"행복은 칼보다 강합니다. 그들은 행복의 가치를 보여주며 적들을 붕괴시킵니다\",\n\t\t\truid=\"f42a3e29fc554d24acc7f491ac5d8178\",\n\t\t\tentity=\"/maps/map01/UnitWizard4\",\n\t\t\tATK=17,\n\t\t\tDEF=8,\n\t\t\tDEX=5,\n\t\t\tHP=18,\n\t\t}\n\tend\n\t\n\tlocal txtDesc=_EntityService:GetEntityByPath(\"/ui/UIChangeJob/txtJobDesc\")\n\ttxtDesc.TextComponent.Text=heroin.jobDesc\n\t\n\tdo\n\t\tlocal spr=_EntityService:GetEntityByPath(\"/ui/UIChangeJob/sprJob1\")\n\t\tlocal bkg=_EntityService:GetEntityByPath(\"/ui/UIChangeJob/sprJob1/bkgJob1\")\n\t\tif bkg==nil then\n\t\t\tlog_error(\"bkgJob1 is nil\")\n\t\tend\n\t\t\n\t\tif job1 then\n\t\t\tspr.Visible=true\n\t\t\tspr.Enable=true\n\t\t\tspr.SpriteGUIRendererComponent.ImageRUID=job1.ruid\n\t\t\tbkg.Visible=true\n\t\t\tbkg.Enable=true\n\t\t\tbkg.CommonButtonAction.Job=job1\n\t\t\tbkg.CommonButtonAction.HeroinStat=heroin\n\t\telse\n\t\t\tspr.Visible=false\n\t\t\tspr.Enable=false\n\t\t\tbkg.Visible=false\t\t\n\t\t\tbkg.Enable=false\n\t\tend\n\tend\n\tdo\n\t\tlocal spr=_EntityService:GetEntityByPath(\"/ui/UIChangeJob/sprJob2\")\n\t\tlocal bkg=_EntityService:GetEntityByPath(\"/ui/UIChangeJob/sprJob2/bkgJob2\")\n\t\tif bkg==nil then\n\t\t\tlog_error(\"bkgJob2 is nil\")\n\t\tend\n\t\t\n\t\tif job2 then\n\t\t\tspr.SpriteGUIRendererComponent.ImageRUID=job2.ruid\n\t\t\tspr.Visible=true\n\t\t\tspr.Enable=true\n\t\t\tbkg.Visible=true\n\t\t\tbkg.Enable=true\n\t\t\tbkg.CommonButtonAction.Job=job2\n\t\t\tbkg.CommonButtonAction.HeroinStat=heroin\n\t\telse\n\t\t\tspr.Visible=false\n\t\t\tspr.Enable=false\n\t\t\tbkg.Visible=false\n\t\t\tbkg.Enable=false\n\t\tend\n\tend\nelse\n\tself:GetGameStateComponent():GoOn()\nend",
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
      "Code": "log(\"Finish()\",is_victory)\ndo\n\tlocal tm=_EntityService:GetEntityByPath(\"/common/TurnManager\")\n\t\n\t_TimerService:ClearTimerById(tm.TurnManager.TimerIdx)\n\t\n\tfor _,entity in ipairs(tm.TurnManager.Allies) do\n\t\tentity.UnitCommon.Done=true\n\tend\n\ttm.TurnManager:__remove_tiles(true,true)\nend\ndo\n\tlocal ui=_EntityService:GetEntityByPath(\"/ui/UIBattle\")\n\tui.Enable=false\n\tui.Visible=false\nend\ndo\n\tlocal ui=_EntityService:GetEntityByPath(\"/ui/UIBattleCmd\")\n\tui.Enable=false\n\tui.Visible=false\nend\ndo\n\tlocal ui=_EntityService:GetEntityByPath(\"/ui/UICameraCtrl\")\n\tui.Enable=false\n\tui.Visible=false\nend\ndo\n\tlocal entity = _EntityService:GetEntityByPath(\"/ui/UIBattleResult\")\n\tentity.Enable = true\n\tentity.Visible = true\nend\nif is_victory==true then\n\t_SoundService:PlayBGM(\"bcc73825742745089f771fbb23c881e9\")\nelse\n\t_SoundService:PlayBGM(\"5b7eec52109e476c9815577f4d3c29bc\")\nend\n\nlocal button = _EntityService:GetEntityByPath(\"/ui/UIBattleResult/buttonContinue\")\nbutton.CommonButtonAction.CurrentStage = self.StateGame\nbutton.CommonButtonAction.IsVictory=is_victory\n\n--local score = _EntityService:GetEntityByPath(\"/ui/UIBattleResult/textScore\")\n--score.TextComponent.Text = \"666\"\n\nlocal result = _EntityService:GetEntityByPath(\"/ui/UIBattleResult/txtResult\")\nresult.TextComponent.Text = is_victory and \"성공!\" or \"실패...\"\n\nlocal ui=_EntityService:GetEntityByPath(\"/ui/UIChangeJob/btnChangeJob\")\t\nui.CommonButtonAction.Callback=nil",
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
      "Arguments": [],
      "Code": "local tileMap=_EntityService:GetEntityByPath(\"/maps/map01/Ground\")\ntileMap.Visible=false\n\nlocal ui=_EntityService:GetEntityByPath(\"/ui/UIGameIntro\")\nui.Enable=true\nui.Visible=true\n\nlocal btn=_EntityService:GetEntityByPath(\"/ui/UIGameIntro/buttonSkip\")\nbtn.CommonButtonAction.CurrentStage=self.StateGame\n\nself:GetGameStateComponent():StartIntro()",
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
      "Arguments": [],
      "Code": "if self.StateGame then\t\n\tif self.StateGame.Name == \"StateGame01\" then\t\t\n\t\treturn self.StateGame.StateGame01\t\n\telseif self.StateGame.Name == \"StateGame02\" then\t\t\n\t\treturn self.StateGame.StateGame02\t\n\telseif self.StateGame.Name == \"StateGame03\" then\t\t\n\t\treturn self.StateGame.StateGame03\n\telseif self.StateGame.Name == \"StateGame04\" then\t\t\n\t\treturn self.StateGame.StateGame04\n\telseif self.StateGame.Name == \"StateGame05\" then\t\t\n\t\treturn self.StateGame.StateGame05\n\tend\nend\n\nlog_error(\"StateGame is nil\")\nreturn nil",
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
      "Arguments": [],
      "Code": "do\n\tlocal ui=_EntityService:GetEntityByPath(\"/ui/UIGameIntro\")\n\tui.Enable=false\n\tui.Visible=false\nend\ndo\n\tlocal ui=_EntityService:GetEntityByPath(\"/ui/UIBattleGoal\")\n\tui.Enable=true\n\tui.Visible=true\nend\ndo\n\tlocal ui1=_EntityService:GetEntityByPath(\"/ui/UIBattle\")\t\n\tlocal ui2=_EntityService:GetEntityByPath(\"/ui/UICameraCtrl\")\t\n\tui2.UIGroupComponent.GroupOrder=ui1.UIGroupComponent.GroupOrder+5\n\tlocal ui3=_EntityService:GetEntityByPath(\"/ui/UIBattleCmd\")\n\tui3.UIGroupComponent.GroupOrder=ui1.UIGroupComponent.GroupOrder+10\n\t\n\t--local hp=_EntityService:GetEntityByPath(\"/ui/UIBattle/barHP\")\t\n\t--hp.Enable=false\n\t--local exp=_EntityService:GetEntityByPath(\"/ui/UIBattle/barExp\")\t\n\t--exp.Enable=false\nend\n\nlocal btn=_EntityService:GetEntityByPath(\"/ui/UIGameIntro/buttonSkip\")\nbtn.CommonButtonAction.CurrentStage=nil\n\nself:GetGameStateComponent():EndIntro()",
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
      "Code": "self.TurnMgr.TurnManager:End()\n\nlocal tileMap=_EntityService:GetEntityByPath(\"/maps/map01/Ground\")\ntileMap.Visible=false",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "RaiseEvent",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [
        {
          "Name": "eventType",
          "Type": "string",
          "DefaultValue": "\"\"",
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "param",
          "Type": "any",
          "DefaultValue": "nil",
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "self:GetGameStateComponent():RaiseEvent(eventType,param)",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "AddActor",
      "Return": {
        "Name": null,
        "Type": "any",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [
        {
          "Name": "map_pos",
          "Type": "Vector2",
          "DefaultValue": "Vector2(0,0)",
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "unit",
          "Type": "table",
          "DefaultValue": "{}",
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "local map=self.Map\nlocal map_size=self.MapSize\nlocal dm=_EntityService:GetEntityByPath(\"/common/DataManager\")\nlocal grid_size=self.__properties.grid_size\nlocal dm=dm.DataManager\nlocal teams=dm.Team\nlocal entity=_EntityService:GetEntityByPath(unit.entity)\nif entity==nil then\n\treturn nil\nend\nentity=entity:Clone()\n\n--local z=entity.TransformComponent.WorldPosition.z\nlocal entity_pos = Vector3(map_pos.x*grid_size.x, -map_pos.y*grid_size.y,0)\nentity_pos=entity_pos+self.MapOffset\nentity.TransformComponent.WorldPosition=entity_pos\nentity.SpriteRendererComponent.OrderInLayer=map_pos.y*100+map_pos.x\n\nif entity.UnitCommon then\n\tentity.UnitCommon.LocationAtMap=map_pos\n\tentity.UnitCommon.Done=true\n\tentity.UnitCommon.Properties=unit\nend\n\nlocal tm=self.TurnMgr.TurnManager\nif unit.IDX then\n\tif 0<unit.IDX and unit.IDX<20 then\n\t\tentity.UnitCommon:SetUnitType(1)\n\t\ttable.insert(tm.Allies,entity)\n\t\t\n\t\t_UserService.LocalPlayer.TransformComponent.WorldPosition = entity.TransformComponent.WorldPosition\n\telseif 20<=unit.IDX and unit.IDX<50 then\n\t\tif entity.TouchReceiveComponent then\n\t\t\tentity.TouchReceiveComponent.Enable=false\n\t\tend\n\t\t\n\t\tentity.SpriteRendererComponent.Color=Color(0.5,0.5,0.5,1)\n\t\tentity.SpriteRendererComponent.FlipX=true\n\t\tentity.UnitCommon:SetUnitType(2)\n\t\ttable.insert(tm.Enemies,entity)\n\telseif 50<=unit.IDX and unit.IDX<100 then \n\t\ttable.insert(tm.Blocks,entity)\n\tend\n\t\n\tlocal mapIdx=map_pos.y*self.MapSize.x+map_pos.x\n\ttm.Map[mapIdx]=entity.Id\nelse\n\ttable.insert(tm.Blocks,entity)\nend\n\nreturn entity",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "Restart",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": null,
      "Code": "local ui=_EntityService:GetEntityByPath(\"/ui/UIBattleResult\")\nui.Visible=false\nui.Enable=false\n\nlocal tm=_EntityService:GetEntityByPath(\"/common/TurnManager\")\nfor _,e in ipairs(tm.TurnManager.Allies) do\n\te:Destroy()\nend\ntm.TurnManager.Allies={}\nfor _,e in ipairs(tm.TurnManager.Enemies) do\n\te:Destroy()\nend\ntm.TurnManager.Enemies={}\nfor _,e in ipairs(tm.TurnManager.Blocks) do\n\te:Destroy()\nend\ntm.TurnManager.Blocks={}\n\nlocal dm=_EntityService:GetEntityByPath(\"/common/DataManager\")\ndm.DataManager:Restore()\n\nself:StartIntro()",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    }
  ],
  "EventEmitters": [],
  "EventHandlers": [],
  "EntityEventHandlers": []
}8�ӵ����J a66747a6623049feb727d93c9b75309f�
 e7310361df1a44e5bb156fd74e9dfc3c f632dad4121d46e3a8e3e76f7cc1979c0codeblock://35b6b31e-5c48-4131-add7-c4114afeb3ec"x-mod/codeblock2��{
  "CoreVersion": {
    "Major": 0,
    "Minor": 2
  },
  "ScriptVersion": {
    "Major": 1,
    "Minor": 0
  },
  "Description": "",
  "Id": "35b6b31e-5c48-4131-add7-c4114afeb3ec",
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
      "Code": "local bias = Vector3(0, 0, 0)\n\nif entity_name == \"UICameraCtrlUp\" then\n\tbias = Vector3(0, -1, 0)\t\nelseif entity_name == \"UICameraCtrlRight\" then\n\tbias = Vector3(1, 0, 0)\nelseif entity_name == \"UICameraCtrlDown\" then\n\tbias = Vector3(0, 1, 0)\nelseif entity_name == \"UICameraCtrlLeft\" then\n\tbias = Vector3(-1, 0, 0)\nelseif entity_name == \"UICameraCtrlLeftUp\" then\n\tbias = Vector3(-1, -1, 0)\nelseif entity_name == \"UICameraCtrlLeftDown\" then\n\tbias = Vector3(-1, 1, 0)\nelseif entity_name == \"UICameraCtrlRightUp\" then\n\tbias = Vector3(1, -1, 0)\nelseif entity_name == \"UICameraCtrlRightDown\" then\n\tbias = Vector3(1, 1, 0)\nelse\n\tlog(\"unknown ctrl: \", entity_name)\nend\n\nbias = Vector3(bias.x,-bias.y,0)\n\ndo\n\t--local pos=_UserService.LocalPlayer.TransformComponent.WorldPosition + bias\n\tlocal pos=_UserService.LocalPlayer.TransformComponent.WorldPosition + bias\n\tlocal tm=_EntityService:GetEntityByPath(\"/common/TurnManager\")\t\n\tlocal mapOffset=tm.TurnManager.MapOffset\n\tlocal mapSize=tm.TurnManager.MapSize\n\tlocal gridSize=tm.TurnManager.GridSize\n\tlocal mapPos=Vector2(mapSize.x*gridSize.x,-mapSize.y*gridSize.y)+Vector2(mapOffset.x,mapOffset.y)\n\t\n\tif mapOffset.x<pos.x and pos.x<mapPos.x and mapPos.y<pos.y and pos.y<mapOffset.y then\n\t\t--_UserService.LocalPlayer.TransformComponent.WorldPosition=pos\n\t\t_UserService.LocalPlayer.TransformComponent.WorldPosition=pos\n\tend\nend",
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
      "Code": "self.ui = _EntityService:GetEntityByPath(\"/ui/UICameraCtrl\")\n\nfor _,v in pairs(self.ui.Children) do\n\tif v.Name~=\"DefBtn\" then\n\t\tv.ImageComponent.Color=Color(1,1,1,0)\n\tend\nend\n\nself.Entity.Enable = false",
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
      "Code": "self.ui.Enable = true\r\nself.Entity.Enable = true",
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
      "Code": "self.ui.Enable = false\r\nself.Entity.Enable = false",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    }
  ],
  "EventEmitters": [],
  "EventHandlers": [],
  "EntityEventHandlers": []
}8�������J b4f0a7ab856c42e19148fe56278b6521�R
 aa03c65357b24b85a7aecf0ce4b5111b f632dad4121d46e3a8e3e76f7cc1979c0codeblock://4787e464-800f-4507-83ea-7077f40ac8e1"x-mod/codeblock2�Q�Q{
  "CoreVersion": {
    "Major": 0,
    "Minor": 2
  },
  "ScriptVersion": {
    "Major": 1,
    "Minor": 0
  },
  "Description": "",
  "Id": "4787e464-800f-4507-83ea-7077f40ac8e1",
  "Language": 1,
  "Name": "DataManager",
  "Type": 1,
  "Source": 0,
  "Target": null,
  "Properties": [
    {
      "Name": "Units",
      "Type": "table",
      "DefaultValue": "{}",
      "Description": null,
      "SyncDirection": 0
    },
    {
      "Name": "Team",
      "Type": "table",
      "DefaultValue": "{}",
      "Description": null,
      "SyncDirection": 0
    },
    {
      "Name": "TileSet",
      "Type": "table",
      "DefaultValue": "{}",
      "Description": null,
      "SyncDirection": 0
    },
    {
      "Name": "BackedUpTeam",
      "Type": "table",
      "DefaultValue": "{}",
      "Description": null,
      "SyncDirection": 0
    },
    {
      "Name": "Version",
      "Type": "string",
      "DefaultValue": "\"\"",
      "Description": null,
      "SyncDirection": 3
    },
    {
      "Name": "StageName",
      "Type": "string",
      "DefaultValue": "\"\"",
      "Description": null,
      "SyncDirection": 3
    },
    {
      "Name": "IsSaving",
      "Type": "boolean",
      "DefaultValue": "false",
      "Description": null,
      "SyncDirection": 3
    }
  ],
  "Methods": [
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
      "Code": "self.StageName=\"Game01\"\n\nfor k,unit in pairs(self.Units) do\n\tunit.IDX=k\n\tif unit.HP then\n\t\tunit.MAXHP=unit.HP\n\tend\n\t\n\tif 0<k and k<20 then\n\t\tunit.LVLUP=0\n\t\tunit.EXP=0\n\t\tunit.MAXEXP=10\n\tend\nend\n\nlocal team={1,2,3,3}\n\nfor _,idx in pairs(team) do\n\tlocal unit=self.Units[idx]\n\ttable.insert(self.Team,unit)\nend",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "Refresh",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": null,
      "Code": "for _,v in pairs(self.Team) do\n\tv.HP=v.MAXHP\nend",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "Backup",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": null,
      "Code": "self.BackedUpTeam=self:Deepcopy(self.Team)",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "Restore",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": null,
      "Code": "self.Team=self:Deepcopy(self.BackedUpTeam)",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "Deepcopy",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [
        {
          "Name": "orig",
          "Type": "table",
          "DefaultValue": "{}",
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "local orig_type = type(orig)\nlocal copy=nil\nif orig_type == 'table' then\n\tcopy = {}\n\tfor orig_key, orig_value in next, orig, nil do\n\t\tcopy[self:Deepcopy(orig_key)] = self:Deepcopy(orig_value)\n\tend\n\tsetmetatable(copy, self:Deepcopy(getmetatable(orig)))\nelse -- number, string, boolean, etc\n\tcopy = orig\nend\n    \n    return copy",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "Serial",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [
        {
          "Name": "tbl",
          "Type": "table",
          "DefaultValue": "{}",
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "local result={}\nfor k,v in pairs(tbl) do\n\tlocal kt=type(k)\n\tlocal ks=\"\"\n\tlocal key=\"\"\n\tif kt==\"number\" then\n\t\tkey=tostring(k)\n\telseif kt==\"string\" then\n\t\tkey=k\n\tend\n\t\n\tlocal vt=type(v)\n\tlocal vs=\"\"\n\tlocal value=\"\"\n\tif vt==\"number\" then\n\t\tvalue=tostring(v)\n\telseif vt==\"string\" then\n\t\tvalue=v\n\telseif vt==\"table\" then\n\t\tvalue=self:Serial(v)\n\tend\n\t\n\ttable.insert(result,key..\"=\"..value)\nend\n\nlocal text=\"\"\nfor _,v in ipairs(result) do\n\ttext=text..v..\",\"\nend\n\nreturn \"{\"..text..\"}\"",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "Deserial",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [
        {
          "Name": "txt",
          "Type": "string",
          "DefaultValue": "\"\"",
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "local convertVal=function(s)\r\n\tlocal v=tonumber(s)\r\n\treturn v==nil and tostring(s) or v\r\nend\r\n\r\nlocal tblPat='{([\"{}%w,=]+)}'\nlocal kvPat='(%w*)={([\"{}%w,=]+)}'\nlocal result={}\r\nlocal tasks={{result,txt}}\r\nwhile #tasks>0 do\t\n\tlocal elem=table.remove(tasks)\r\n\tlocal tbl,str=elem[1],elem[2]\r\n\t\r\n\t--key with value form\r\n\tfor k,v in string.gmatch(str,kvPat) do\r\n\t\tlocal childTbl={}\r\n\t\tk=convertVal(k)\r\n\t\ttbl[k]=childTbl\r\n\t\ttable.insert(tasks,{childTbl,v})\r\n\tend\r\n\t--remove them\r\n\twhile #str>0 do\r\n\t\tlocal start,final,txt=string.find(str,kvPat)\r\n\t\tif start==nil then\r\n\t\t  break\r\n\t\telse\r\n\t\t  str=string.sub(str,1,start-1)..string.sub(str,final+1,#str)\r\n\t\tend\r\n\tend\r\n\t\r\n\t--create task to parse decendant\r\n\tfor w in string.gmatch(str,tblPat) do\r\n\t\tlocal child={}\r\n\t\ttable.insert(tbl,child)\r\n\t\ttable.insert(tasks,{child,w})\r\n\tend\r\n\t--remove them\r\n\twhile #str>0 do\r\n\t\tlocal start,final,txt=string.find(str,tblPat)\r\n\t\tif start==nil then\r\n\t\t  break\r\n\t\telse\r\n\t\t  str=string.sub(str,1,start-1)..string.sub(str,final+1,#str)\r\n\t\tend\r\n\tend\r\n\t\r\n\t--parse alphanumeric key with alphanumeric value\r\n\tfor k,v in string.gmatch(str,\"(%w+)=(%w+)\") do\r\n\t\tk=convertVal(k)\r\n\t\tv=convertVal(v)\r\n\t\ttbl[k]=v\r\n\tend\r\nend\r\n\r\nreturn result",
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
      "Code": "--[[\n1:순례\n2:순심\n3:은하족\n20:철규\n21:반란군\n50:꽃\n51:덤불\n52:돌\n53:돌\n54:나무\n]]--\nself.Units={\t\n\t[1]={\n\t\tentity=\"/maps/map01/UnitBokrye\",\n\t\t--entity=\"/maps/map01/UnitChef1\",\n\t\tjob=\"휴학생\",\n\t\tjobDesc=\"편의점 교대 근무를 위해 휘영청 정월대보름에 나섰던 그녀는 달빛의 힘으로 평행 세계에 넘어왔습니다\",\t\t\n\t\tATK=1,\n\t\tDEF=8,\n\t\tDEX=10,\n\t\t--HP=15,\n\t\tHP=1,\n\t\tLVL=0,\n\t},\n\t[2]={\n\t\tentity=\"/maps/map01/UnitSunrye\",\n\t\tjob=\"근위대\",\n\t\tATK=15,\n\t\tDEF=15,\n\t\tDEX=25,\n\t\tHP=20,\n\t\tLVL=5,\n\t},\n\t[3]={\n\t\tentity=\"/maps/map01/UnitMilitia0\",\n\t\tjob=\"민병대\",\n\t\tATK=7,\n\t\tDEF=6,\n\t\tDEX=8,\n\t\tHP=18,\n\t\tLVL=1,\n\t},\n\t[4]={\n\t\tentity=\"/maps/map01/UnitMisuk\",\n\t\tATK=18,\n\t\tDEF=12,\n\t\tDEX=11,\n\t\tHP=25,\n\t},\n\t[5]={\n\t\tentity=\"/maps/map01/UnitQueen\",\n\t\tATK=1,\n\t\tDEF=1,\n\t\tDEX=1,\n\t\tHP=1000,\n\t},\n\t[6]={\n\t\tentity=\"/maps/map01/UnitPretorian\",\n\t\tATK=10,\n\t\tDEF=20,\n\t\tDEX=5,\n\t\tHP=20,\n\t},\n\t[20]={\n\t\tentity=\"/maps/map01/UnitKidong\",\n\t\tjob=\"기동대\",\n\t\tATK=25,\n\t\tDEF=20,\n\t\tDEX=20,\n\t\tHP=30,\n\t\tLVL=5,\n\t},\n\t[21]={\n\t\tentity=\"/maps/map01/UnitRebel0\",\n\t\tATK=6,\n\t\tDEF=7,\n\t\tDEX=8,\n\t\tHP=10,\n\t},\n\t[22]={\n\t\tentity=\"/maps/map01/UnitRebel1\",\n\t\tATK=7,\n\t\tDEF=9,\n\t\tDEX=12,\n\t\tHP=15,\n\t},\n\t[23]={\n\t\tentity=\"/maps/map01/UnitJumrye\",\n\t\tjob=\"기동대\",\n\t\tATK=15,\n\t\tDEF=5,\n\t\tDEX=5,\n\t\tHP=8,\n\t\tLVL=4,\n\t},\n\t[24]={\n\t\tentity=\"/maps/map01/UnitMalza\",\n\t\tATK=10,\n\t\tDEF=11,\n\t\tDEX=12,\n\t\tHP=10,\n\t},\n\t[25]={\n\t\tentity=\"/maps/map01/UnitElfArcher\",\n\t\tATK=10,\n\t\tDEF=11,\n\t\tDEX=12,\n\t\tHP=10,\n\t},\n\t[26]={\n\t\tentity=\"/maps/map01/UnitMushroom1\",\n\t\tATK=10,\n\t\tDEF=11,\n\t\tDEX=12,\n\t\tHP=10,\n\t},\n\t[50]={\t\t\n\t\tentity=\"/maps/map01/TileTree1\",\n\t},\n\t[51]={\t\t\n\t\tentity=\"/maps/map01/TileBush0\",\n\t},\n\t[52]={\t\t\n\t\tentity=\"/maps/map01/TileBush1\",\n\t},\n\t[53]={\t\t\n\t\tentity=\"/maps/map01/TileStone1\",\n\t},\n\t[54]={\t\t\n\t\tentity=\"/maps/map01/TileStone1\",\n\t},\n\t[55]={\t\t\n\t\tentity=\"/maps/map01/TileTree1\",\n\t},\n\t[56]={\t\t\n\t\tentity=\"/maps/map01/UnitTaxi\",\n\t},\n\t[57]={\u000b\t\tentity=\"/maps/map01/TileStatue1\",\n\t},\n\t[58]={\t\t\n\t\tentity=\"/maps/map01/TileCollection1\",\n\t},\n\t[59]={\t\t\n\t\tentity=\"/maps/map01/TileCabinet1\",\n\t},\n\t[60]={\t\t\n\t\tentity=\"/maps/map01/TileCabinet2\",\n\t},\n\t[61]={\t\t\n\t\tentity=\"/maps/map01/TileCabinet3\",\n\t},\n\t[62]={\t\t\n\t\tentity=\"/maps/map01/TileWall1\",\n\t},\n\t[63]={\u000b\t\tentity=\"/maps/map01/TileHidden\",\n\t},\n\t[64]={\t\t\n\t\tentity=\"/maps/map01/TileTorch1\",\n\t},\n\t[65]={\t\t\n\t\tentity=\"/maps/map01/TileStatue2\",\n\t},\n}\nself.TileSet={\n\t{\t\t\n\t\t\"/maps/map01/TileGrass1\",\n\t\t\"/maps/map01/TileGrass2\",\n\t\t\"/maps/map01/TileGrass3\",\n\t\t\"/maps/map01/TileGrass4\",\n\t},\n\t{\u000b\t\t--\"/maps/map01/TileBottle1\",\n\t},\n}",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 2
    }
  ],
  "EventEmitters": [],
  "EventHandlers": [],
  "EntityEventHandlers": []
}8��ё���J 260f68baf6194a4da96699a9dcb223ea�3
 ffe323b913814674ae46d8281ebc4409 f632dad4121d46e3a8e3e76f7cc1979c0codeblock://4cd9eb37-0542-4813-a916-e3af096be41d"x-mod/codeblock2�1�1{
  "CoreVersion": {
    "Major": 0,
    "Minor": 2
  },
  "ScriptVersion": {
    "Major": 1,
    "Minor": 0
  },
  "Description": "",
  "Id": "4cd9eb37-0542-4813-a916-e3af096be41d",
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
      "SyncDirection": 3
    },
    {
      "Name": "zoom",
      "Type": "number",
      "DefaultValue": "0",
      "Description": null,
      "SyncDirection": 3
    },
    {
      "Name": "Job",
      "Type": "table",
      "DefaultValue": "{}",
      "Description": null,
      "SyncDirection": 0
    },
    {
      "Name": "HeroinStat",
      "Type": "table",
      "DefaultValue": "{}",
      "Description": null,
      "SyncDirection": 0
    },
    {
      "Name": "IsVictory",
      "Type": "boolean",
      "DefaultValue": "false",
      "Description": null,
      "SyncDirection": 3
    },
    {
      "Name": "Callback",
      "Type": "any",
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
      "Code": "--[[\nlog(\"OnTouch\")\nlocal entity = _EntityService:GetEntityByPath(\"/ui/UIBattleGoal\")\nentity.UIGroupComponent.DefaultShow = false\nentity.Enable = false\nentity.Visible = false\n]]--",
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
      "Code": "self.zoom=100",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 1
    }
  ],
  "EventEmitters": [],
  "EventHandlers": [],
  "EntityEventHandlers": [
    {
      "Name": "HandleButtonClickEvent",
      "EventName": "ButtonClickEvent",
      "Target": "self",
      "Code": "_SoundService:PlaySound(\"dbb38b4f04044499906bd7a2ca9c4d7c\")\n\nif self.Entity.Name == \"RemoveButton\" then\n\tlocal entity = _EntityService:GetEntityByPath(\"/ui/UIBattleGoal\")\n\t\n\tentity.UIGroupComponent.DefaultShow = false\n\tentity.Visible = false\n\tentity.Enable = false\n\t\n\tlocal tm=_EntityService:GetEntityByPath(\"/common/TurnManager\")\n\ttm.TurnManager:Start()\nelseif self.Entity.Name == \"buttonContinue\" then\n\tlocal entity = _EntityService:GetEntityByPath(\"/ui/UIBattleResult\")\n\t\n\tentity.UIGroupComponent.DefaultShow = false\n\tentity.Visible = false\n\tentity.Enable = false\n\t\n\tif self.CurrentStage then\n\t\tif self.IsVictory==true then\n\t\t\tself.CurrentStage.StateGameCommon:GoOn()\n\t\t\tself.CurrentStage = nil\n\t\telse\n\t\t\tself.CurrentStage.StateGameCommon:Restart()\n\t\tend\n\telse\n\t\tlog_error(\"You need to set self.CurrentStageEntity before using /ui/UIBattleResult/buttonContinue\")\n\tend\nelseif self.Entity.Name==\"buttonSkip\" then\n\tif self.CurrentStage then\n\t\tlocal ui=_EntityService:GetEntityByPath(\"/ui/UIGameIntro\")\n\t\tui.Visible=false\n\t\tui.Enable=false\n\t\t\n\t\tself.CurrentStage.StateGameCommon:EndIntro()\n\telse\n\t\tlog_error(\"You need to set self.CurrentStageEntity before using /ui/UIGameIntroSkip/buttonSkip\")\n\tend\nelseif self.Entity.Name==\"btnStart\" then\n\tlocal dm=_EntityService:GetEntityByPath(\"/common/DataManager\")\n\tdm.DataManager:Start()\n\t\n\tlocal sm=_EntityService:GetEntityByPath(\"/common/StateManager\")\n\tsm.StateManager:OnStateChanged(\"Game01\")\nelseif self.Entity.Name==\"btnGoOn\" then\n\tlocal dm=_EntityService:GetEntityByPath(\"/common/DataManager\")\n\tdm.DataManager:RequestLoad()\nelseif self.Entity.Name==\"btnZoom\" then\n\t_CameraService:ZoomTo(200,9999999)\nelseif self.Entity.Name==\"btnChangeJob\" then\n\tlocal ui=_EntityService:GetEntityByPath(\"/ui/UIChangeJob\")\n\tui.Enable=false\n\tui.Visible=false\n\t\n\tdo\n\t\tlocal oldEntity=_EntityService:GetEntityByPath(self.HeroinStat.entity)\n\t\tlocal newEntity=_EntityService:GetEntityByPath(self.Job.entity)\n\t\tlog(self.HeroinStat.entity,\"->\",self.Job.entity)\n\t\t\n\t\tif oldEntity and newEntity then\n\t\t\tif oldEntity.NameTagComponent==nil then\n\t\t\t\tlog_error(\"old entity's name tag is not found\")\n\t\t\telseif newEntity.NameTagComponent==nil then\n\t\t\t\tlog_error(\"old entity's name tag is not found\")\n\t\t\tend\n\t\t\tnewEntity.NameTagComponent.Name=oldEntity.NameTagComponent.Name\n\t\telse\n\t\t\tlog_error(\"entity's name tag cannot change\")\n\t\tend\n\tend\n\t\n\tdo\n\t\tself.HeroinStat.entity=self.Job.entity\n\t\tself.HeroinStat.job=self.Job.job\n\t\tself.HeroinStat.ATK=self.HeroinStat.ATK+self.Job.ATK\n\t\tself.HeroinStat.DEF=self.HeroinStat.ATK+self.Job.DEF\n\t\tself.HeroinStat.DEX=self.HeroinStat.ATK+self.Job.DEX\n\t\tself.HeroinStat.HP=self.HeroinStat.ATK+self.Job.HP\n\tend\n\t\n\tif self.Callback then\n\t\tself.Callback(self.Job.entity)\n\telse\n\t\tself.CurrentStage.StateGameCommon:GetGameStateComponent():GoOn()\n\tend\nelseif self.Entity.Name==\"bkgJob1\" or self.Entity.Name==\"bkgJob2\" then\n\tlocal job=self.Entity.CommonButtonAction.Job\n\tself.Job=job\n\n\tlocal heroin=self.Entity.CommonButtonAction.HeroinStat\n\tlocal desc=_EntityService:GetEntityByPath(\"/ui/UIChangeJob/txtJobDesc\")\n\tdesc.TextComponent.Text=job.jobDesc\n\t\n\tlocal btn=_EntityService:GetEntityByPath(\"/ui/UIChangeJob/btnChangeJob\")\n\tbtn.Visible=true\n\tbtn.CommonButtonAction.Job=job\n\tbtn.CommonButtonAction.HeroinStat=heroin\n\t\n\tlocal atk=_EntityService:GetEntityByPath(\"/ui/UIChangeJob/txtAtk\")\n\tatk.TextComponent.Text=tostring(math.floor(heroin.ATK+job.ATK))\n\tlocal def=_EntityService:GetEntityByPath(\"/ui/UIChangeJob/txtDef\")\n\tdef.TextComponent.Text=tostring(math.floor(heroin.DEF+job.DEF))\n\t\n\tlocal jobName=_EntityService:GetEntityByPath(\"/ui/UIChangeJob/txtJobName\")\n\tjobName.TextComponent.Text=job.job\n\t\n\tlocal sprMe=_EntityService:GetEntityByPath(\"/ui/UIChangeJob/sprMe\")\n\tsprMe.SpriteGUIRendererComponent.ImageRUID=job.ruid\nend"
    }
  ]
}8�����J eddc7a3c2e4747d69d923205222db1c0��
 7f8b7ef7790642d98ca6bba610061416 f632dad4121d46e3a8e3e76f7cc1979c0codeblock://4e070daa-f2e6-468d-b865-145c3a80d612"x-mod/codeblock2����{
  "CoreVersion": {
    "Major": 0,
    "Minor": 2
  },
  "ScriptVersion": {
    "Major": 1,
    "Minor": 0
  },
  "Description": "",
  "Id": "4e070daa-f2e6-468d-b865-145c3a80d612",
  "Language": 1,
  "Name": "StateGame03",
  "Type": 1,
  "Source": 0,
  "Target": null,
  "Properties": [
    {
      "Name": "MapOffset",
      "Type": "Vector3",
      "DefaultValue": "Vector3(0,0,0)",
      "Description": null,
      "SyncDirection": 3
    },
    {
      "Name": "actors",
      "Type": "table",
      "DefaultValue": "{}",
      "Description": null,
      "SyncDirection": 0
    },
    {
      "Name": "ScreenSize",
      "Type": "Vector2",
      "DefaultValue": "Vector2(0,0)",
      "Description": null,
      "SyncDirection": 3
    },
    {
      "Name": "TimerIdx",
      "Type": "number",
      "DefaultValue": "0",
      "Description": null,
      "SyncDirection": 3
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
      "Code": "local sm=_EntityService:GetEntityByPath(\"/common/StateManager\")\nsm.StateManager:OnStateChanged(\"Game04\")",
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
      "Code": "_SoundService:PlayBGM(\"94af170f3209430e94d623a720b21692\")\nlocal map = {\t\t\n   \t62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,\n\t 0, 6, 5, 6, 0, 0, 0,64, 0, 0, 0, 0, 0, 0,65,\n\t 0, 6, 6, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,64,\n\t 0, 0, 0, 0, 0, 0, 0,65, 0, 0, 0, 0, 0, 0,57,\n\t 0, 0, 0, 0,22,22, 0, 0, 0, 0, 0, 0, 0, 0,64,\n\t 0, 0, 0,22,25,25, 0, 0, 0, 0, 0, 0, 0, 0,57,\n   \t57, 0, 0,21,21,26, 0,63, 0, 0,25,23,25, 0,64,\n\t64, 0, 0, 0, 0, 0, 0, 0, 0, 0,21,22,22,21,65,\n   \t57, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,64,\n    64, 0, 0, 0, 0, 0, 0,63, 0, 0, 0,-1,-1, 0,57,\n   \t57,64, 0,65, 0, 0, 0, 0, 0, 0, 0,-1,-1, 0,57,\n\t62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,\n}\nlocal map_size = Vector2(15,12)\n--[[\nlocal map={\n\t0,5,0,0,\n\t21,21,25,23,\n\t0,0, 0,0,\n\t0,0,-1,-1,\n\t0,0,-1,-1,\n}\nlocal map_size=Vector2(4,5)\n]]--\nlocal dm=_EntityService:GetEntityByPath(\"/common/DataManager\")\ndm=dm.DataManager\nself.MapOffset=Vector3(0,map_size.y,0)\nself.Entity.StateGameCommon.Map = map\nself.Entity.StateGameCommon.MapSize = map_size\nself.Entity.StateGameCommon.MapOffset=self.MapOffset\nself.Entity.StateGameCommon.StateGame = self.Entity\nself.Entity.StateGameCommon.TileSpriteRUID=\"1e02bf073065467d96c3426a527c6ab3\"\nself.Entity.StateGameCommon.TileSet=dm.TileSet[2]\nself.Entity.StateGameCommon:OnStateEntered()",
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
      "Code": "self.Entity.StateGameCommon:OnStateLeft()\n\n",
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
      "Code": "self.Entity.Enable = false\n\ndo\n\tlocal ui=_EntityService:GetEntityByPath(\"/ui/UIScreen/imgSize\")\n\tself.ScreenSize=ui.UITransformComponent.RectSize\nend",
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
      "Code": "_TimerService:ClearTimerById(self.timerIdx)\nlocal heroin=nil\nlocal dm=_EntityService:GetEntityByPath(\"/common/DataManager\")\nfor _,unit in ipairs(dm.DataManager.Team) do\n\theroin=unit\n\tbreak\nend\nlocal cameraPos=_UserService.LocalPlayer.TransformComponent.WorldPosition\nlocal bok=_EntityService:GetEntityByPath(heroin.entity):Clone()\nbok.TouchReceiveComponent.Enable=false\n--bok.TransformComponent.WorldPosition=cameraPos\n--bok.Visible=true\n\nlocal sun=_EntityService:GetEntityByPath(\"/maps/map01/UnitSunrye\"):Clone()\nsun.TouchReceiveComponent.Enable=false\n--sun.Visible=true\n--sun.TransformComponent.Position=cameraPos+Vector3(1,0,0)\n\nlocal taxi=_EntityService:GetEntityByPath(\"/maps/map01/UnitTaxi\"):Clone()\ntaxi.Visible=true\ntaxi.TransformComponent.Position=cameraPos+Vector3(5,-1,0)\n\nself.actors={bok=bok,sun=sun,taxi=taxi,}\n\ndo\n\tlocal bkg=_EntityService:GetEntityByPath(\"/maps/map01/BackGroundTemplate\")\n\tbkg.BackgroundTemplateComponent.MapRUID=\"e31d43adea3b46549c3f68f581affda1\"\n\tbkg.BackgroundTemplateComponent.BackType=1\n\tbkg.BackgroundTemplateComponent.Enable=true\nend\n\ndo\n\tlocal castle=_EntityService:GetEntityByPath(\"/maps/map01/TileCastle\")\n\tlocal img=_EntityService:GetEntityByPath(\"/ui/UIScreen/imgAnchor\")\n\tlocal anchorPos=img.UITransformComponent.WorldPosition\n\t--log(\"anchorPos:\",anchorPos,\"cameraPos:\",cameraPos)\n\tcastle=castle:Clone()\n\tcastle.Visible=true\n\tcastle.TransformComponent.WorldPosition=Vector3(cameraPos.x-5,cameraPos.y+1,0)\n\tcastle.SpriteRendererComponent.OrderInLayer=1\n\ttable.insert(self.actors,castle)\nend\n\ndo\n\tlocal bridge=_EntityService:GetEntityByPath(\"/maps/map01/TileBridge\")\n\tlocal x=0\n\tlocal y=-2\n\tlocal layer=taxi.SpriteRendererComponent.OrderInLayer+10\n\tbridge=bridge:Clone()\n\tbridge.TransformComponent.WorldPosition=cameraPos+Vector3(x,y,0)\n\tbridge.SpriteRendererComponent.OrderInLayer=layer\n\ttable.insert(self.actors,bridge)\n\tbridge=bridge:Clone()\n\tbridge.TransformComponent.WorldPosition=cameraPos+Vector3(x+2,y,0)\n\ttable.insert(self.actors,bridge)\n\tbridge=bridge:Clone()\n\tbridge.TransformComponent.WorldPosition=cameraPos+Vector3(x-2,y,0)\n\ttable.insert(self.actors,bridge)\n\tbridge=bridge:Clone()\n\tbridge.TransformComponent.WorldPosition=cameraPos+Vector3(x-6,y,0)\n\ttable.insert(self.actors,bridge)\n\tbridge=bridge:Clone()\n\tbridge.TransformComponent.WorldPosition=cameraPos+Vector3(x+6,y,0)\n\ttable.insert(self.actors,bridge)\nend\n\ndo\n\tlocal img=_EntityService:GetEntityByPath(\"/ui/UIScreen/imgScreen\")\n\timg.UITransformComponent.RectSize=Vector2(0,self.ScreenSize.y)\n\tlocal scr=_EntityService:GetEntityByPath(\"/ui/UIScreen\")\n\tlocal intro=_EntityService:GetEntityByPath(\"/ui/UIGameIntro\")\n\tintro.UIGroupComponent.GroupOrder=scr.UIGroupComponent.GroupOrder+1\nend\n\nself:MoveTaxi()\n\n--[[\n복례:여기는 어디죠?\n순례:여긴 바로 천사왕국 수도지. \n순례:근데 넌 정말 아무것도 모르는 것 같아\n순례:일단 성에 들어가서 여왕님을 만나보자\n복례:전 정말 아무것도 몰라요\n복례:아직도 알 수가 없어요.\n순례:자 이쪽이야.\n\n]]--",
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
      "Code": "do\n\tlocal entity=_EntityService:GetEntityByPath(\"/ui/UIBattleGoal/UIBattleGoalTitle\")\n\tentity.TextComponent.Text=\"혼돈\"\nend\ndo\n\tlocal entity=_EntityService:GetEntityByPath(\"/ui/UIBattleGoal/UIBattleGoalDesc\")\n\tentity.TextComponent.Text=\"여왕을 구출해야 한다\"\nend\n\nfor _,v in pairs(self.actors) do\n\tv:Destroy()\nend\n\nself.Entity.StateGameCommon:StartGame(10)\n\ndo\n\tlocal tm=self.Entity.StateGameCommon.TurnMgr.TurnManager\n\tfor k,v in pairs(tm.Enemies) do\n\t\tv.Enable=true\n\tend\t\n\tfor k,v in pairs(tm.Allies) do\t\n\t\tif v.TouchReceiveComponent then\n\t\t\tv.TouchReceiveComponent.Enable=true\n\t\tend\n\tend\nend\n\n_TimerService:ClearTimerById(self.TimerIdx)\n\ndo\n\tlocal ui=_EntityService:GetEntityByPath(\"/ui/UIScreen\")\n\tui.Enable=false\n\tui.Visible=false\nend",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "RaiseEvent",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [
        {
          "Name": "eventType",
          "Type": "string",
          "DefaultValue": "\"\"",
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "param",
          "Type": "any",
          "DefaultValue": "nil",
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "log(\"RaiseEvent:\",eventType,param)\nif eventType==\"turn\" then\t\n\tif param==1 then\n\t\tself:PlayScene1()\n\t\t--self:PlayScene3()\n\t\treturn\n\telseif param==2 then\n\t\t--local tm=_EntityService:GetEntityByPath(\"/common/TurnManager\")\n\t\t--tm.TurnManager:ActivateUnits(tm.TurnManager.Allies,true)\n\t\tself:PlayScene3()\n\t\treturn\n\telseif param==3 then\n\t\t--local tm=_EntityService:GetEntityByPath(\"/common/TurnManager\")\n\t\t--tm.TurnManager:ActivateUnits(tm.TurnManager.Allies,true)\n\t\t--self:PlayScene2()\n\tend\n\t\n\tlocal tm=_EntityService:GetEntityByPath(\"/common/TurnManager\")\n\ttm.TurnManager:ActivateUnits(tm.TurnManager.Allies,true)\nend",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "MoveTaxi",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": null,
      "Code": "local getLength=function(p1,p2)\n\tlocal d=p1-p2\n\treturn math.sqrt(d.x*d.x+d.y*d.y)\nend\nlocal cameraPos=_UserService.LocalPlayer.TransformComponent.Position\nlocal taxi=self.actors.taxi\nlocal dist=getLength(taxi.TransformComponent.WorldPosition,cameraPos)\n\nif dist>2 then\n\ttaxi.TransformComponent.WorldPosition=taxi.TransformComponent.WorldPosition+Vector3(-0.05,0,0)\n\tself.TimerIdx=_TimerService:SetTimerOnce(function() self:MoveTaxi() end,0.05)\n\treturn\nend\n\nlocal bok=self.actors.bok\nlocal sun=self.actors.sun\n\nlocal scene05=function()\n\tsun.UnitCommon:AddChat(\"안내해줄게\")\n\n\t--order of layer is so confused. it changed randomly when i did\n\t--self.TimerIdx=_TimerService:SetTimerOnce(function() self:HideScreen() end,1)\nend\n\nlocal scene04=function()\n\tsun.UnitCommon:AddChat(\"같이 가자\")\n\n\tself.TimerIdx=_TimerService:SetTimerOnce(function() scene05() end,1)\nend\n\nlocal scene03=function()\n\tsun.UnitCommon:AddChat(\"니 문제를 아실꺼야\")\n\n\tself.TimerIdx=_TimerService:SetTimerOnce(function() scene04() end,2)\nend\n\nlocal scene02=function()\n\tsun.UnitCommon:AddChat(\"여왕님을 뵙자\")\n\n\tself.TimerIdx=_TimerService:SetTimerOnce(function() scene03() end,1)\nend\n\nlocal scene01=function()\n\tbok.Visible=true\n\tbok.TransformComponent.WorldPosition=taxi.TransformComponent.WorldPosition+Vector3(1,-0.5,0)\n\tbok.SpriteRendererComponent.OrderInLayer=taxi.SpriteRendererComponent.OrderInLayer+1\n\tbok.UnitCommon:AddChat(\"아름다워요!\")\n\n\tself.TimerIdx=_TimerService:SetTimerOnce(function() scene02() end,1)\nend\n\nlocal scene00=function()\n\tsun.Visible=true\n\tsun.SpriteRendererComponent.OrderInLayer=taxi.SpriteRendererComponent.OrderInLayer-1\n\tsun.TransformComponent.WorldPosition=taxi.TransformComponent.WorldPosition+Vector3(-1,-0.5,0)\n\tsun.UnitCommon:AddChat(\"여기가 천사왕국이야\")\n\n\tself.TimerIdx=_TimerService:SetTimerOnce(function() scene01() end,1)\nend\n\n\nself.TimerIdx=_TimerService:SetTimerOnce(function() scene00() end,1)",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "HideScreen",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": null,
      "Code": "log(\"HideScreen\")\nlocal ui=_EntityService:GetEntityByPath(\"/ui/UIScreen\")\nui.Enable=true\nui.Visible=true\nlocal img=_EntityService:GetEntityByPath(\"/ui/UIScreen/imgScreen\")\nlocal rect=img.UITransformComponent.RectSize\n\nif rect.x<self.ScreenSize.x then\n\tlog(\"rect:\",rect.x,self.ScreenSize.x)\n\trect=Vector2(rect.x+30,rect.y)\n\timg.UITransformComponent.RectSize=rect\n\timg.UITransformComponent.anchoredPosition=Vector2(rect.x/2,0)\n\t\n\tself.TimerIdx=_TimerService:SetTimerOnce(function() self:HideScreen() end,0.01)\n\treturn\nend\n\nimg.UITransformComponent.RectSize=self.ScreenSize",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "PlayScene1",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": null,
      "Code": "local tm=_EntityService:GetEntityByPath(\"/common/TurnManager\")\nlocal jum=nil\nfor _,entity in ipairs(tm.TurnManager.Enemies) do\n\tif entity.NameTagComponent.Name==\"점례\" then\n\t\tjum=entity\n\t\tbreak\n\tend\nend\n\nlocal pretorians={}\nlocal sun,bok=nil\nfor _,entity in ipairs(tm.TurnManager.Allies) do\n\tif entity.NameTagComponent.Name==\"근위대\" then\n\t\ttable.insert(pretorians,entity)\n\telseif entity.NameTagComponent.Name==\"순례\" then\n\t\tsun=entity\n\telseif entity.NameTagComponent.Name==\"복례\" then\n\t\tbok=entity\n\tend\nend\n\nlocal scene6=function()\n\tif #pretorians>0 then\n\t\tfor i=2,#pretorians do\n\t\t\tlocal entity=pretorians[i]\n\t\t\tentity.UnitCommon:AddChat(\"천사!\")\n\t\tend\n\tend\n\t_TimerService:SetTimerOnce(function() tm.TurnManager:ActivateUnits(tm.TurnManager.Allies,true) end,3)\nend\n\nlocal scene05=function()\n\tlocal leader=pretorians[1]\n\tif leader then\n\t\t_UserService.LocalPlayer.TransformComponent.WorldPosition=leader.TransformComponent.WorldPosition\n\t\tleader.UnitCommon:AddChat(\"여왕님을 지켜라!\")\n\tend\n\t_TimerService:SetTimerOnce(function() scene6() end,2)\nend\n\nlocal scene04=function()\n\tjum.UnitCommon:AddChat(\"모두 잡아!\")\t\n\t_TimerService:SetTimerOnce(function() scene05() end, 1)\nend\n\nlocal scene03=function()\n\tjum.UnitCommon:AddChat(\"근위대장도 잡을 수 있겠군!\")\n\t_TimerService:SetTimerOnce(function() scene04() end, 2)\nend\n\nlocal scene02=function()\n\tjum.UnitCommon:AddChat(\"오호라!\")\n\t_UserService.LocalPlayer.TransformComponent.WorldPosition=jum.TransformComponent.WorldPosition\n\t_TimerService:SetTimerOnce(function() scene03() end, 1)\nend\n\t\nlocal scene01=function()\n\tsun.UnitCommon:AddChat(\"헉!\")\n\t_UserService.LocalPlayer.TransformComponent.WorldPosition=sun.TransformComponent.WorldPosition\n\t_TimerService:SetTimerOnce(function() scene02() end, 1)\nend\n\nscene01()",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "PlayScene2",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": null,
      "Code": "local tm=_EntityService:GetEntityByPath(\"/common/TurnManager\")\nlocal sun=nil\nfor _,entity in ipairs(tm.TurnManager.Allies) do\n\tif entity.NameTagComponent.Name==\"순례\" then\n\t\tsun=entity\n\t\tbreak\n\tend\nend\n\t\nif sun==nil then\n\t_TimerService:SetTimerOnce(function() tm.TurnManager:ActivateUnits(tm.TurnManager.Allies,true) end, 2)\n\treturn\nend\n\nlocal scene4=function()\n\t_TimerService:SetTimerOnce(function() tm.TurnManager:ActivateUnits(tm.TurnManager.Allies,true) end, 2)\nend\n\nlocal scene3=function()\n\tsun.UnitCommon:AddChat(\"그 방법 뿐이야!\")\n\t_TimerService:SetTimerOnce(function() scene4() end,3)\nend\nlocal scene2=function()\n\tsun.UnitCommon:AddChat(\"일단 싸우자!\")\n\t_TimerService:SetTimerOnce(function() scene3() end,3)\nend\nlocal scene1=function()\n\tsun.UnitCommon:AddChat(\"왜 변한지 모르겠지만...\")\n\t_UserService.LocalPlayer.TransformComponent.WorldPosition=sun.TransformComponent.WorldPosition\n\t_TimerService:SetTimerOnce(function() scene2() end,2)\nend\n\nscene1()",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "PlayScene3",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": null,
      "Code": "local uis={\"/ui/UIBattleCmd\",\"/ui/UICameraCtrl\",\"/ui/UIBattle\"}\nfor _,ui in ipairs(uis) do\n\tui=_EntityService:GetEntityByPath(ui)\n\tui.Enable=false\n\tui.Visible=false\nend\n\nlocal layer=10000\nlocal scr=_EntityService:GetEntityByPath(\"/common/TileMovable\"):Clone()\nscr.Visible=true\nscr.SpriteRendererComponent.OrderInLayer=layer\nscr.TransformComponent.WorldPosition=_UserService.LocalPlayer.TransformComponent.WorldPosition\nscr.TransformComponent.Scale=Vector3(self.ScreenSize.x,self.ScreenSize.y,100)\nscr.SpriteRendererComponent.Color=Color(0,0,0,0)\n\nself:FadeIn(scr)\n\nlocal tm=_EntityService:GetEntityByPath(\"/common/TurnManager\")\nlocal bok,realBok,sun=nil\nfor _,entity in ipairs(tm.TurnManager.Allies) do\n\tif entity.NameTagComponent.Name==\"복례\" then\n\t\trealBok=entity\n\t\t--I can't destroy it. Destroy() is uselss\n\t\trealBok.Visible=false\n\t\trealBok.Enable=false\n\n\t\tbok=entity:Clone()\n\t\tbok.TransformComponent.WorldPosition=entity.TransformComponent.WorldPosition\n\t\tbok.SpriteRendererComponent.OrderInLayer=layer+1\n\telseif entity.NameTagComponent.Name==\"순례\" then\n\t\tsun=entity\t\t\n\tend\nend\n--for test\n--self:PlayScene3Final({bok,scr},sun)\n\nlocal queen=_EntityService:GetEntityByPath(\"/maps/map01/UnitQueen\"):Clone()\nqueen.SpriteRendererComponent.Color=Color(1,1,1,0)\nqueen.SpriteRendererComponent.OrderInLayer=layer+1\nqueen.TransformComponent.WorldPosition=bok.TransformComponent.WorldPosition-Vector3(2,0,0)\nqueen.SpriteRendererComponent.FlipX=true\n\nlocal angel=nil\nlocal myHeroStat=nil\n\nlocal scene20=function()\n\tlocal pos=realBok.TransformComponent.WorldPosition\n\tangel.TransformComponent.WorldPosition=pos\n\tangel.UnitCommon.LocationAtMap=realBok.UnitCommon.LocationAtMap\n\tangel.UnitCommon.LocationAtMapMoving=realBok.UnitCommon.LocationAtMapMoving\n\tangel.UnitCommon.Properties=realBok.UnitCommon.Properties\n\tangel.UnitCommon:SetUnitType(realBok.UnitCommon.UnitType)\n\t--angel.UnitCommon.MovableAreas=realBok.UnitCommon.MovableArea\n\t--angel.UnitCommon.MovableAreaSize=realBok.UnitCommon.MovableAreaSize\n\t--angel.UnitCommon.AttackAreas=realBok.UnitCommon.AttackAreas\n\t--angel.UnitCommon.AttackAreaSize=realBok.UnitCommon.AttackAreaSize\n\tangel.SpriteRendererComponent.OrderInLayer=realBok.UnitCommon.OrderInLayer\n\n\t_UserService.LocalPlayer.TransformComponent.WorldPosition=pos\n\n\tlocal mapPos=angel.UnitCommon.LocationAtMap\n\tmapPos=tm.TurnManager:_GetMapIndex(mapPos.x,mapPos.y)\n\ttm.TurnManager.Map[mapPos]=angel.Id\n\n\tfor i,v in ipairs(tm.TurnManager.Allies) do\n\t\tif v.NameTagComponent.Name==\"복례\" then\n\t\t\ttable.remove(tm.TurnManager.Allies,i)\n\t\t\ttable.insert(tm.TurnManager.Allies,i,angel)\n\t\t\tbreak\n\t\tend\n\tend\n\n\tlocal actors={bok,realBok,queen,scr}\n\tself.TimerIdx=_TimerService:SetTimerOnce(function() self:PlayScene3Final(actors,sun) end,2)\nend\n\nlocal scene19=function()\n\tangel.UnitCommon:AddChat(\"잠깐만요!\")\n\tself:FadeOut(scr)\n\tself.TimerIdx=_TimerService:SetTimerOnce(function() scene20() end,2)\nend\n\nlocal scene18=function()\n\tqueen.UnitCommon:AddChat(\"기다릴게요\")\n\tqueen.NameTagComponent.Enable=false\n\tself:FadeOut(queen)\n\tself.TimerIdx=_TimerService:SetTimerOnce(function() scene19() end,2)\nend\n\nlocal scene17=function()\n\tqueen.UnitCommon:AddChat(\"이제 현실에 집중해야해요\")\n\tself.TimerIdx=_TimerService:SetTimerOnce(function() scene18() end,3)\nend\n\nlocal scene16=function()\n\tqueen.UnitCommon:AddChat(\"마음은 그대로예요\")\n\tself.TimerIdx=_TimerService:SetTimerOnce(function() scene17() end,2)\nend\n\nlocal scene15=function()\n\tangel.UnitCommon:AddChat(\"어떻게 된거죠?\")\n\tself.TimerIdx=_TimerService:SetTimerOnce(function() scene16() end,2)\nend\n\nlocal scene14=function(entity)\n\tangel=_EntityService:GetEntityByPath(entity):Clone()\n\tangel.TransformComponent.WorldPosition=bok.TransformComponent.WorldPosition\n\tangel.Visible=true\n\tangel.SpriteRendererComponent.OrderInLayer=layer+1\n\tangel.UnitCommon:AddChat(\"내가...\")\n\tbok.Visible=false\n\n\tself.TimerIdx=_TimerService:SetTimerOnce(function() scene15() end,3)\nend\n\nlocal scene13=function()\n\tlocal ui=_EntityService:GetEntityByPath(\"/ui/UIChangeJob/btnChangeJob\")\t\n\tui.CommonButtonAction.Callback=scene14\n\n\tself.Entity.StateGameCommon:GoOn()\nend\n\nlocal scene12=function()\n\tqueen.UnitCommon:AddChat(\"당신을 바꿔줄게요\")\n\trealBok.UnitCommon.Properties.ISANGEL=true\n\trealBok.UnitCommon.Properties.LVLUP=1\n\tself.TimerIdx=_TimerService:SetTimerOnce(function() scene13() end,3)\nend\nlocal scene11=function()\n\tbok.UnitCommon:AddChat(\"내가 뭘 해야하죠?\")\n\t_TimerService:SetTimerOnce(function() scene12() end,2)\nend\nlocal scene10=function()\n\tbok.UnitCommon:AddChat(\"그럼...\")\n\tself.TimerIdx=_TimerService:SetTimerOnce(function() scene11() end,1)\nend\nlocal scene9=function()\n\tqueen.UnitCommon:AddChat(\"당신만이 되돌릴 수 있어요\")\n\tself.TimerIdx=_TimerService:SetTimerOnce(function() scene10() end,3)\nend\nlocal scene8=function()\n\tqueen.UnitCommon:AddChat(\"다른 복례 쪽이 충격은 훨씬 커요\")\n\tself.TimerIdx=_TimerService:SetTimerOnce(function() scene9() end,3)\nend\n\nlocal scene7=function()\n\tqueen.UnitCommon:AddChat(\"우주가 탄생하는 것처럼요\")\n\tself.TimerIdx=_TimerService:SetTimerOnce(function() scene8() end,3)\nend\nlocal scene6=function()\n\tqueen.UnitCommon:AddChat(\"이런 일은 가끔 있답니다\")\n\tself.TimerIdx=_TimerService:SetTimerOnce(function() scene7() end,3)\nend\nlocal scene5=function()\n\tqueen.UnitCommon:AddChat(\"서로 다른 세계에 있어요\")\n\tself.TimerIdx=_TimerService:SetTimerOnce(function() scene6() end,2)\nend\nlocal scene4=function()\n\tqueen.UnitCommon:AddChat(\"천사왕국의 복례와 당신은...\")\n\tself.TimerIdx=_TimerService:SetTimerOnce(function() scene5() end,2)\nend\n\nlocal scene3=function()\n\tqueen.UnitCommon:AddChat(\"마음에 직접 이야기하는거예요\")\n\tself.TimerIdx=_TimerService:SetTimerOnce(function() scene4() end,3)\nend\n\nlocal scene2=function()\n\tself:FadeIn(queen)\n\tqueen.UnitCommon:AddChat(\"놀라지 마세요\")\n\tbok.SpriteRendererComponent.FlipX=false\n\t_UserService.LocalPlayer.TransformComponent.WorldPosition=bok.TransformComponent.WorldPosition-Vector3(2,0,0)\n\tself.TimerIdx=_TimerService:SetTimerOnce(function() scene3() end,2)\nend\n\nlocal scene1=function()\n\tbok.UnitCommon:AddChat(\"뭐야...\")\t\n\tself.TimerIdx=_TimerService:SetTimerOnce(function() scene2() end,1)\nend\n\nscene1()",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "PlayScene3Final",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [
        {
          "Name": "removedActors",
          "Type": "any",
          "DefaultValue": "nil",
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "sun",
          "Type": "any",
          "DefaultValue": "nil",
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "for _,v in ipairs(removedActors) do\n\tv:Destroy()\nend\n\nsun.UnitCommon:AddChat(\"헉...!\")\n\nlocal playAgain=function()\n\tlocal uis={\"/ui/UIBattleCmd\",\"/ui/UICameraCtrl\",\"/ui/UIBattle\"}\n\tfor _,ui in ipairs(uis) do\n\t\tui=_EntityService:GetEntityByPath(ui)\n\t\tui.Enable=true\n\t\tui.Visible=true\n\tend\n\tlocal tm=_EntityService:GetEntityByPath(\"/common/TurnManager\")\n\ttm.TurnManager:ActivateUnits(tm.TurnManager.Allies,true)\nend\n\n--tm.TurnManager:ActivateUnits(tm.TurnManager.Allies,true)\nself.TimerIdx=_TimerService:SetTimerOnce(function() playAgain() end, 2)",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "FadeIn",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [
        {
          "Name": "scr",
          "Type": "any",
          "DefaultValue": "nil",
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "local com=scr.SpriteRendererComponent\nlocal color=com.Color\n\nif com.Color.a<1 then\n\tcom.Color=Color(color.r,color.g,color.b,color.a+0.01)\n\tself.TimerIdx=_TimerService:SetTimerOnce(function() self:FadeIn(scr) end,0.01)\n\treturn\nend\n\ncom.Color=Color(color.r,color.g,color.b,1)",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "FadeOut",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [
        {
          "Name": "scr",
          "Type": "any",
          "DefaultValue": "nil",
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "local com=scr.SpriteRendererComponent\nlocal color=com.Color\n\nif com.Color.a>0 then\n\tcom.Color=Color(color.r,color.g,color.b,color.a-0.01)\n\tself.TimerIdx=_TimerService:SetTimerOnce(function() self:FadeOut(scr) end,0.01)\n\treturn\nend\n\ncom.Color=Color(color.r,color.g,color.b,0)",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    }
  ],
  "EventEmitters": [],
  "EventHandlers": [],
  "EntityEventHandlers": []
}8�ӵ����J d8620520eec340b9902e1836b481e3cb�.
 34e1620b00d74136b5b392b79e1152e6 f632dad4121d46e3a8e3e76f7cc1979c0codeblock://8d90d731-7727-4048-99a1-a62e08214eac"x-mod/codeblock2�,�,{
  "CoreVersion": {
    "Major": 0,
    "Minor": 2
  },
  "ScriptVersion": {
    "Major": 1,
    "Minor": 0
  },
  "Description": "",
  "Id": "8d90d731-7727-4048-99a1-a62e08214eac",
  "Language": 1,
  "Name": "StateTitle",
  "Type": 1,
  "Source": 0,
  "Target": null,
  "Properties": [
    {
      "Name": "background",
      "Type": "Entity",
      "DefaultValue": "nil",
      "Description": null,
      "SyncDirection": 3
    },
    {
      "Name": "isValid",
      "Type": "boolean",
      "DefaultValue": "false",
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
      "Arguments": null,
      "Code": "--[[\nOnStateEntered is called when StateManager is in OnBeginPlay(). StateTitle component may not be in this state.\nTherefore you should get entity on runtime. Don't get reference on OnBeginPlay().\nBut other states are enabled such things.\n]]--\n\nlocal ui = _EntityService:GetEntityByPath(\"/ui/UITitle\")\nui.UIGroupComponent.DefaultShow = true\nui.Enable = true\n\nself.background=_EntityService:GetEntityByPath(\"/maps/map01/BackGroundTemplate\")\n--self.background.BackgroundTemplateComponent.BackType=1\nself.background.BackgroundTemplateComponent.MapRUID=\"0cd16a9422ea44bdbd1e082aa6381fbc\"\n--self.background.Enable=true\n\n_SoundService:PlayBGM(\"b87b1307cb584a57941a1aeac41644c1\")\n\nself.isValid=true",
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
      "Code": "local ui = _EntityService:GetEntityByPath(\"/ui/UITitle\")\nui.UIGroupComponent.DefaultShow = false\nui.Enable = false\n\nself.isValid=false",
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
      "Code": "self.Entity.Visible=false\n\nlocal player = _UserService.LocalPlayer\nplayer.RigidbodyComponent.Enable=false\n--player.CameraComponent.CameraOffset = Vector2(0,-10)\n\ndo\n\tlocal btn=_EntityService:GetEntityByPath(\"/ui/UITitle/btnGoOn\")\n\tbtn.Visible=false\n\tbtn.Enable=false\nend\ndo\n\tlocal entities=_EntityService:GetEntitiesByPath(\"/maps/map01\")\n\tlocal entity=entities[1]\n\t\n\tfor _,v in ipairs(entity.Children) do\n\t\tif \"Tile\"==string.sub(v.Name,1,4) then\t\n\t\t\tv.Visible=false\n\t\telseif \"Unit\"==string.sub(v.Name,1,4) then\n\t\t\tv.Visible=false\n\t\t\t\n\t\t\tif v.MonsterMovementComponent then\n\t\t\t\tv.MonsterMovementComponent.Enable=false\t\t\t\n\t\t\tend\t\t\n\t\t\tif v.StateComponent then\n\t\t\t\tv.StateComponent.Enable=false\n\t\t\tend\n\t\t\tif v.RigidbodyComponent then\n\t\t\t\tv.RigidbodyComponent.Enable=false\n\t\t\tend\n\t\t\t--if v.TouchReceiveComponent then\n\t\t\t\t--v.TouchReceiveComponent.DynamicTouchArea=false\n\t\t\t--end\n\t\t\tif v.AIComponent then\n\t\t\t\tv.AIComponent.Enable=false\n\t\t\tend\n\t\t\tif v.MonsterMovementComponent then\n\t\t\t\tv.MonsterMovementComponent.Enable=false\n\t\t\tend\n\t\t\t\n\t\t\tif v.UnitCommon==nil then\n\t\t\t\tv:AddComponent(\"UnitCommon\",true)\n\t\t\tend\n\t\t\t\n\t\t\t--[[\n\t\t\tlocal c0,c1,c2,c3=nil,nil,nil,nil\n\t\t\tif v.ChatBalloonComponent==nil then\n\t\t\t\tc0=v:AddComponent(\"_MODChatBalloonComponent\",true)\t\n\t\t\tend\n\t\t\tif v.NameTagComponent==nil then\n\t\t\t\tc1=v:AddComponent(\"_NameTagComponent\",true)\n\t\t\tend\n\t\t\tif v.TouchReceiveComponent==nil then\n\t\t\t\tc2=v:AddComponent(\"_TouchReceiveComponent\",true)\n\t\t\tend\n\t\t\tif v.UnitCommon==nil then\n\t\t\t\tc3=v:AddComponent(\"UnitCommon\",true)\n\t\t\tend\n\t\t\t]]--\n\t\tend\n\tend\nend\t\ndo\n\tlocal entities=_EntityService:GetEntitiesByPath(\"/common\")\n\tlocal entity=entities[1]\n\t\n\tfor _,v in ipairs(entity.Children) do\n\t\tv.Visible = false\n\tend\nend\n\n_UserService.LocalPlayer.TransformComponent.Scale=Vector3(0.01,0.01,1)\n_UserService.LocalPlayer.NameTagComponent.Enable=false\n_UserService.LocalPlayer.MovementComponent.Enable=false\n--caution: if a tile exists in map, ConfineCameraArea flag could not invoke\n_UserService.LocalPlayer.CameraComponent.ConfineCameraArea=false\n_UserService.LocalPlayer.CameraComponent.CameraOffset=Vector2(0,0)\n",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 2
    },
    {
      "Name": "OnUpdate",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [
        {
          "Name": "delta",
          "Type": "number",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "if self.isValid==true then\n\tlocal p=_UserService.LocalPlayer.TransformComponent.WorldPosition\n\t_UserService.LocalPlayer.TransformComponent.WorldPosition=p+Vector3(0.1,0,0)\n\t--_UserService.LocalPlayer.CameraComponent.CameraOffset=_UserService.LocalPlayer.CameraComponent.CameraOffset+Vector2(0.1,0)\nend",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 2
    }
  ],
  "EventEmitters": [],
  "EventHandlers": [],
  "EntityEventHandlers": []
}8˭�ߐ���J 0cc1cb98847842ee84fc5e596881dd12�X
 73ae3a4e81854e6dabeb61f709d46287 f632dad4121d46e3a8e3e76f7cc1979c0codeblock://8e16a1e4-db62-4436-b85d-deb612fba7fe"x-mod/codeblock2�W�W{
  "CoreVersion": {
    "Major": 0,
    "Minor": 2
  },
  "ScriptVersion": {
    "Major": 1,
    "Minor": 0
  },
  "Description": "",
  "Id": "8e16a1e4-db62-4436-b85d-deb612fba7fe",
  "Language": 1,
  "Name": "StateGame02",
  "Type": 1,
  "Source": 0,
  "Target": null,
  "Properties": [
    {
      "Name": "timerIdx",
      "Type": "number",
      "DefaultValue": "0",
      "Description": null,
      "SyncDirection": 3
    },
    {
      "Name": "MapOffset",
      "Type": "Vector3",
      "DefaultValue": "Vector3(0,0,0)",
      "Description": null,
      "SyncDirection": 3
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
      "Code": "local sm=_EntityService:GetEntityByPath(\"/common/StateManager\")\nsm.StateManager:OnStateChanged(\"Game03\")",
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
      "Code": "--[[1: lee sung kye2: tuntra3: park wei4: militia5: rebel]]--\nlocal map = {\t\n\t55,50,53,52,55,54,54,52,56,53,50,54,54,54,50,53,\n\t55,51,52,50,51, 0, 0, 0, 0, 0,21,22, 0,54,54,54,\n\t55,52, 0,22,21, 0, 0,21,21, 0, 0, 0, 0, 0,54,55,\n\t55,53, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,54,55,55,\n\t55,54, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,54,55,54,\n   \t55,55, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,55,55,53,\n\t55,55, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,21,55,54,\n\t55,55, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,21,54,54,\n\t55,55,22, 0, 0, 0, 0,-1,-1, 0, 0, 0,51,51,53,53,\n\t55,50,51,52, 0, 0, 0,-1,-1, 0, 0, 0,52,51,52,53,\n}\nlocal map_size = Vector2(16,10)\nlocal dm=_EntityService:GetEntityByPath(\"/common/DataManager\")\ndm=dm.DataManager\nself.MapOffset=Vector3(0,map_size.y,0)\nself.Entity.StateGameCommon.Map = map\nself.Entity.StateGameCommon.MapSize = map_size\nself.Entity.StateGameCommon.MapOffset=self.MapOffset\nself.Entity.StateGameCommon.StateGame = self.Entity\nself.Entity.StateGameCommon.TileSpriteRUID=\"ae4c83b9b2dc49b2837ad0612b6523b8\"\nself.Entity.StateGameCommon.TileSet=dm.TileSet[1]\n\n--self.Entity.StateGameCommon:PutUnits(map,map_size)\nself.Entity.StateGameCommon:OnStateEntered()",
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
      "Code": "_TimerService:ClearTimerById(self.timerIdx)\ndo\n\tlocal entity=_EntityService:GetEntityByPath(\"/ui/UIBattleGoal/UIBattleGoalTitle\")\n\tentity.TextComponent.Text=\"탈출\"\nend\ndo\n\tlocal entity=_EntityService:GetEntityByPath(\"/ui/UIBattleGoal/UIBattleGoalDesc\")\n\tentity.TextComponent.Text=\"택시에 도착해야 한다\"\nend\n\nself.Entity.StateGameCommon:StartGame(7)\nlocal bokrye,sunrye,rabbit=nil,nil,nil\nlocal tm=self.Entity.StateGameCommon.TurnMgr.TurnManager\nfor k,v in pairs(tm.Allies) do\n\tif v.NameTagComponent.Name==\"복례\" then\n\t\tbokrye=v\n\telseif v.NameTagComponent.Name==\"순례\" then\n\t\tsunrye=v\n\telse\n\t\trabbit=v\n\tend\n\tv.TouchReceiveComponent.Enable=false\nend\nfor k,v in pairs(tm.Enemies) do\n\tv.Enable=false\nend\n\nlocal z=_UserService.LocalPlayer.TransformComponent.WorldPosition.z\nlocal getMapPos=function(x,y)\n\tlocal pos=Vector3(x,y,0)+self.MapOffset\n\treturn Vector3(pos.x*tm.GridSize.x,pos.y*tm.GridSize.y,0)\nend\n\nlocal scene15=function()\n\tsunrye.UnitCommon:AddChat(\"택시까지 가면 벗어날 수 있어!\")\n\t_UserService.LocalPlayer.TransformComponent.WorldPosition=sunrye.TransformComponent.WorldPosition\nend\n\nlocal scene14=function()\n\tlocal taxiPos=Vector3(7,0,0)+self.MapOffset\n\ttaxiPos=Vector3(taxiPos.x*tm.GridSize.x, taxiPos.y*tm.GridSize.y,0)\n\t_UserService.LocalPlayer.TransformComponent.WorldPosition=taxiPos\n\tself.timerIdx=_TimerService:SetTimerOnce(function() scene15() end,2)\nend\nlocal scene13=function()\n\t_UserService.LocalPlayer.TransformComponent.WorldPosition=sunrye.TransformComponent.WorldPosition\n\tsunrye.UnitCommon:AddChat(\"일단 안전한 곳으로 가자\")\n\tself.timerIdx=_TimerService:SetTimerOnce(function() scene14() end,2)\nend\n--[[\nlocal scene12_4=function()\n\tlocal cameraPos=getMapPos(13,7)\n\t_UserService.LocalPlayer.TransformComponent.WorldPosition=cameraPos\n\n\tself.timerIdx=_TimerService:SetTimerOnce(function() scene13() end,1)\nend\nlocal scene12_3=function()\n\tlocal cameraPos=getMapPos(2,11)\n\t_UserService.LocalPlayer.TransformComponent.WorldPosition=cameraPos\n\n\tself.timerIdx=_TimerService:SetTimerOnce(function() scene12_4() end,1)\nend\nlocal scene12_2=function()\n\tlocal cameraPos=getMapPos(5,3)\n\t_UserService.LocalPlayer.TransformComponent.WorldPosition=cameraPos\n\n\tself.timerIdx=_TimerService:SetTimerOnce(function() scene12_3() end,1)\nend\n]]--\nlocal scene12_1=function()\n\tlocal cameraPos=getMapPos(3,9)\n\t_UserService.LocalPlayer.TransformComponent.WorldPosition=cameraPos\n\n\tself.timerIdx=_TimerService:SetTimerOnce(function() scene13() end,2)\nend\nlocal scene12=function()\n\tfor k,v in pairs(tm.Enemies) do\n\t\tv.Enable=true\n\tend\t\n\tself.timerIdx=_TimerService:SetTimerOnce(function() scene13() end,2)\u000bend\nlocal scene11=function()\n\trabbit.UnitCommon:AddChat(\"매복이다!\")\n\n\tself.timerIdx=_TimerService:SetTimerOnce(function() scene12() end,1)\nend\nlocal scene10=function()\n\tbokrye.UnitCommon:AddChat(\"모든게 달라요\")\n\n\tself.timerIdx=_TimerService:SetTimerOnce(function() scene11() end,1)\nend\nlocal scene09=function()\n\tbokrye.UnitCommon:AddChat(\"그런데...\")\n\n\tself.timerIdx=_TimerService:SetTimerOnce(function() scene10() end,1)\nend\nlocal scene08=function()\n\tbokrye.UnitCommon:AddChat(\"전 틀림없는 복례에요...\")\n\n\tself.timerIdx=_TimerService:SetTimerOnce(function() scene09() end,2)\nend\nlocal scene07=function()\n\tsunrye.UnitCommon:AddChat(\"기억 안나니?\")\n\n\tself.timerIdx=_TimerService:SetTimerOnce(function() scene08() end,2)\nend\nlocal scene06=function()\n\tsunrye.UnitCommon:AddChat(\"나 언니 순례야.\")\n\n\tself.timerIdx=_TimerService:SetTimerOnce(function() scene07() end,2)\nend\nlocal scene05=function()\n\tsunrye.UnitCommon:AddChat(\"너 좀 이상해보여\")\n\n\tself.timerIdx=_TimerService:SetTimerOnce(function() scene06() end,2)\nend\nlocal scene04=function()\n\tsunrye.UnitCommon:AddChat(\"여긴 천사왕국이야.\")\n\n\tself.timerIdx=_TimerService:SetTimerOnce(function() scene05() end,2)\nend\nlocal scene03=function()\n\tbokrye.UnitCommon:AddChat(\"여기가 어디죠?\")\n\n\tself.timerIdx=_TimerService:SetTimerOnce(function() scene04() end,2)\nend\nlocal scene02=function()\n\tbokrye.UnitCommon:AddChat(\"설명 좀 해주세요.\")\n\n\tself.timerIdx=_TimerService:SetTimerOnce(function() scene03() end,2)\nend\nlocal scene01=function()\n\tbokrye.UnitCommon:AddChat(\"이제...\")\n\n\tself.timerIdx=_TimerService:SetTimerOnce(function() scene02() end,1)\nend\n\n--[[\ns 택시까지 가면 벗어날 수 있어!\ns 일단 탈출하자\n[적이 나타난다. 하나씩 카메라 포커스]\ns 매복이야!\ns 이런, 이럴 때가 아니야!\nb 난 자전거를 타고 있다가 차에 부딪혔는데...\nb 모르겠지만... 완전히 이상해\ns 나 순례야, 네 언니. 정말 모르겠니?\nb 나는 복례인데... 누구시죠?\ns 너... 뭔가 이상해. 나 기억 안나?\nb 설명 좀 해주세요. 무슨 상황이죠?\nb 이제 도망친건가...\n]]--\n\nscene01()",
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
      "Code": "do\n\tlocal tm=self.Entity.StateGameCommon.TurnMgr.TurnManager\n\tfor k,v in pairs(tm.Enemies) do\n\t\tv.Enable=true\n\tend\t\n\tfor k,v in pairs(tm.Allies) do\n\t\tv.TouchReceiveComponent.Enable=true\n\tend\nend\n_TimerService:ClearTimerById(self.timerIdx)",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "RaiseEvent",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [
        {
          "Name": "eventType",
          "Type": "string",
          "DefaultValue": "\"\"",
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "param",
          "Type": "any",
          "DefaultValue": "nil",
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "if eventType==\"move\" then\n\tlocal entity=param\n\tif entity.NameTagComponent.Name==\"복례\" then\n\t\tlocal mapPos=entity.UnitCommon.LocationAtMap\n\t\tlocal relPositions={Vector2(-1,0),Vector2(1,0),Vector2(0,1),Vector2(0,-1)}\n\t\tlocal tm=_EntityService:GetEntityByPath(\"/common/TurnManager\")\n\t\t\n\t\tif mapPos.x==7 and mapPos.y==1 or mapPos.x==8 and mapPos.y==1 then\n\t\t\ttm.TurnManager.StateGame.StateGameCommon:Finish(true)\n\t\tend\n\t\t--[[\n\t\tfor _,relPos in ipairs(relPositions) do\n\t\t\tlocal pos=mapPos+relPos\n\t\t\tlocal idx=tm.TurnManager:_GetMapIndex(pos.x,pos.y)\t\n\t\t\tif idx then\n\t\t\t\tlocal cellValue=tm.TurnManager.Map[idx]\n\t\t\t\tif cellValue~=0 then\n\t\t\t\t\tlocal cellEntity=_EntityService:GetEntity(cellValue)\n\t\t\t\t\tif cellEntity and cellEntity.Name==\"UnitTaxi\" then\n\t\t\t\t\t\ttm.TurnManager.StateGame.StateGameCommon:Finish(true)\n\t\t\t\t\t\treturn\n\t\t\t\t\tend\n\t\t\t\tend\n\t\t\tend\n\t\tend\n\t\t]]--\n\tend\nelseif eventType==\"turn\" then\n\tlocal tm=_EntityService:GetEntityByPath(\"/common/TurnManager\")\n\ttm.TurnManager:ActivateUnits(tm.TurnManager.Allies,true)\nend",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    }
  ],
  "EventEmitters": [],
  "EventHandlers": [],
  "EntityEventHandlers": []
}8�ӵ����J 32d3ecdf934a409aac2aa73c66285529�
 042285b67c3a4d19b71446681f2c2ce8 f632dad4121d46e3a8e3e76f7cc1979c0codeblock://9a6cfa96-3cbb-4a79-bfb6-8b119d3e5345"x-mod/codeblock2��{
  "CoreVersion": {
    "Major": 0,
    "Minor": 2
  },
  "ScriptVersion": {
    "Major": 1,
    "Minor": 0
  },
  "Description": "",
  "Id": "9a6cfa96-3cbb-4a79-bfb6-8b119d3e5345",
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
      "SyncDirection": 3
    },
    {
      "Name": "EntityID",
      "Type": "string",
      "DefaultValue": "\"\"",
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
      "Code": "_SoundService:PlaySound(\"dbb38b4f04044499906bd7a2ca9c4d7c\")\n\nlocal ui=_EntityService:GetEntityByPath(\"/ui/UIBattleCmd\")\nui.Enable=false\nui.Visible=false\n\n-- Parameters\nlocal Entity=event.Entity\n--------------------------------------------------------\nself.turn_mgr.TurnManager:ActUnit(Entity.UIBattleControl.EntityID, Entity.Name)"
    }
  ]
}8�򘙌���J cea78bfaf0dc47c5be424836795b0015�
 18dfcc4420f04a5e966b338a0324d424 f632dad4121d46e3a8e3e76f7cc1979c0codeblock://ab47c528-db81-4b14-a7a5-a0e6d1f2264c"x-mod/codeblock2����{
  "CoreVersion": {
    "Major": 0,
    "Minor": 2
  },
  "ScriptVersion": {
    "Major": 1,
    "Minor": 0
  },
  "Description": "",
  "Id": "ab47c528-db81-4b14-a7a5-a0e6d1f2264c",
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
      "SyncDirection": 3
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
      "SyncDirection": 3
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
      "SyncDirection": 3
    },
    {
      "Name": "Done",
      "Type": "boolean",
      "DefaultValue": "false",
      "Description": null,
      "SyncDirection": 3
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
      "SyncDirection": 3
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
      "SyncDirection": 3
    },
    {
      "Name": "Talked",
      "Type": "boolean",
      "DefaultValue": "false",
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
      "Code": "if self.Done==false then\n\tself.turn_mgr.TurnManager:SelectUnit(self.Entity,false)\t\nend",
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
      "Code": "if self.Entity.NameTagComponent==nil then\n\treturn\nend\n\nself.turn_mgr = _EntityService:GetEntityByPath(\"/common/TurnManager\")\n\nlocal name=self.Entity.NameTagComponent.Name\nif name==\"복례\" then\n\tlocal entityName=self.Entity.Name\n\tif entityName==\"전투요리사\" then\n\t\tself.MovableAreas={\n\t\t\t0, 0, 1, 0, 0,\n\t\t\t0, 1, 1, 1, 0,\n\t\t\t1, 1, 1, 1, 1,\n\t\t\t0, 1, 1, 1, 0,\n\t\t\t0, 0, 1, 0, 0,\n\t\t}\n\t\tself.MovableAreaSize=5\n\t\t\n\t\tself.AttackAreas={\t\t\n\t\t\t1, 1, 1,\n\t\t\t1, 0, 1,\n\t\t\t1, 1, 1,\n\t\t}\n\t\tself.AttackAreaSize=3\n\telseif entityName==\"도끼술사\" then\n\t\tself.MovableAreas={\t\n\t\t\t0, 0, 1, 0, 0,\n\t\t\t0, 0, 1, 0, 0,\n\t\t\t1, 1, 1, 1, 1,\n\t\t\t0, 0, 1, 0, 0,\n\t\t\t0, 0, 1, 0, 0,\n\t\t}\n\t\tself.MovableAreaSize=5\n\t\t\n\t\tself.AttackAreas={\t\t\n\t\t\t0, 0, 1, 0, 0,\n\t\t\t0, 0, 1, 0, 0,\n\t\t\t1, 1, 0, 1, 1,\n\t\t\t0, 0, 1, 0, 0,\n\t\t\t0, 0, 1, 0, 0,\n\t\t}\n\t\tself.AttackAreaSize=5\n\telse\n\t\tself.MovableAreas={\n\t\t\t0, 0, 1, 0, 0,\n\t\t\t0, 0, 1, 0, 0,\n\t\t\t1, 1, 1, 1, 1,\n\t\t\t0, 0, 1, 0, 0,\n\t\t\t0, 0, 1, 0, 0,\n\t\t}\n\t\tself.MovableAreaSize=5\n\t\t\n\t\tself.AttackAreas={\t\t\n\t\t\t0, 1, 0,\n\t\t\t1, 0, 1,\n\t\t\t0, 1, 0,\n\t\t}\n\t\tself.AttackAreaSize=3\n\tend\nelseif name==\"순례\" then\n\tself.MovableAreas={\n\t\t0, 0, 1, 0, 0,\n\t\t0, 1, 1, 1, 0,\n\t\t1, 1, 1, 1, 1,\n\t\t0, 1, 1, 1, 0,\n\t\t0, 0, 1, 0, 0,\n\t}\n\tself.MovableAreaSize=5\n\t\n\tself.AttackAreas={\t\t\n\t\t1, 1, 1,\n\t\t1, 0, 1,\n\t\t1, 1, 1,\n\t}\n\tself.AttackAreaSize=3\nelseif name==\"요정궁수\" then\n\tself.MovableAreas = {\t\n\t\t1, 1, 1,\n\t\t1, 1, 1,\n\t\t1, 1, 1,\n\t}\n\tself.MovableAreaSize = 3\n\t\n\tself.AttackAreas = {\t\n\t\t0, 0, 1, 0, 0,\n\t\t0, 0, 1, 0, 0,\n\t\t1, 1, 0, 1, 1,\n\t\t0, 0, 1, 0, 0,\n\t\t0, 0, 1, 0, 0,\n\t}\n\tself.AttackAreaSize = 5\nelseif name==\"점례\" or name==\"느린토끼\" then\n\tself.MovableAreas = {\t\n\t\t0, 0, 1, 0, 0,\n\t\t0, 1, 1, 1, 0,\n\t\t1, 1, 1, 1, 1,\n\t\t0, 1, 1, 1, 0,\n\t\t0, 0, 1, 0, 0,\n\t}\n\tself.MovableAreaSize = 5\n\t\n\tself.AttackAreas = {\t\n\t\t1, 1, 1,\n\t\t1, 0, 1,\n\t\t1, 1, 1,\n\t}\n\tself.AttackAreaSize = 3\nelseif name==\"근위대\" then\n\tself.MovableAreas = {\t\n\t\t1, 1, 1,\n\t\t1, 1, 1,\n\t\t1, 1, 1,\n\t}\n\tself.MovableAreaSize = 3\n\t\n\tself.AttackAreas = {\t\n\t\t1, 1, 1,\n\t\t1, 0, 1,\n\t\t1, 1, 1,\n\t}\n\tself.AttackAreaSize = 3\nelseif name==\"여왕\" then\n\tself.MovableAreas = {\t\n\t\t0,\n\t}\n\tself.MovableAreaSize = 1\n\t\n\tself.AttackAreas = {\t\n\t\t0,\n\t}\n\tself.AttackAreaSize = 1\nelse\n\tself.MovableAreas={\t\n\t\t1, 1, 1,\n\t\t1, 1, 1,\n\t\t1, 1, 1,\n\t}\n\tself.MovableAreaSize=3\n\t\n\tself.AttackAreas={\t\t\n\t\t0, 1, 0,\n\t\t1, 0, 1,\n\t\t0, 1, 0,\n\t}\n\tself.AttackAreaSize=3\t\nend\n\nif self.Entity.ChatBalloonComponent==nil then\n\tlog(\"no chatballoon comp:\",self.Entity.Name)\n\treturn\nend\n\nself.Entity.ChatBalloonComponent.BallonScale = 1\nself.Entity.ChatBalloonComponent.FontSize = 3\nself.Entity.ChatBalloonComponent.AutoShowEnabled = true\nself.Entity.ChatBalloonComponent.AutoHideBalloonDelay = 0\nself.Entity.ChatBalloonComponent.AutoShowBalloonDelay = 3\nself.Entity.ChatBalloonComponent.ChatModeEnabled=false",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 2
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
      "Code": "if self.UnitType==unit_type then \n\treturn false\nelse\n\treturn true\nend",
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
      "Code": "if self.Entity.UnitCommon.LocationAtMap.x > target_entity.UnitCommon.LocationAtMap.x then\n\tself.Entity.SpriteRendererComponent.FlipX = false\n\ttarget_entity.SpriteRendererComponent.FlipX = true\nelseif self.Entity.UnitCommon.LocationAtMap.x < target_entity.UnitCommon.LocationAtMap.x then\n\tself.Entity.SpriteRendererComponent.FlipX = true\n\ttarget_entity.SpriteRendererComponent.FlipX = false\nend\n\n--self.Entity.SpriteRendererComponent:CommitPropertiesForced()\n--self.Entity.SpriteRendererComponent:CommitPropertiesForcedForAnim()\n--self.Entity.SpriteRendererComponent:RegisterUpdate()\n\nself:AddChat(\"받아라!\")\n\nlocal properties = self.Properties\nlocal other_properties = target_entity.UnitCommon.Properties\n\nlocal is_succeed_to_attack = function() \n\tlocal dd = properties.DEX - other_properties.DEX\n\tlocal dice = math.random(1, 10)\n\t\n\t-- attacker is faster than target\n\tif dd > 0 then\n\t\treturn dice > 1\n\telse\t\n\t\treturn dice > 3\n\tend\nend\n\nlocal hurt_target = function()\n\tlocal damage = properties.ATK - other_properties.DEF\n\tdamage=math.floor(damage)\n\tdamage=math.max(damage,2)\n\tlocal damages = { damage }\n\tlocal dex_rate = properties.DEX / other_properties.DEX\t\n\t\n\t-- get more chance to attack when attacker is faster than target\n\tif dex_rate > 0.5 then\n\t\tdamage = math.random(1, damage)\n\t\ttable.insert(damages, damage)\n\tend\n\t\n\t-- lucky shot\n\tif 90 < math.random(1, 100) then\n\t\tdamage = math.random(1, damage)\n\t\ttable.insert(damages, damage)\t\t\n\tend\n\t\n\treturn damages\nend\n\n-- check whether it was succeced for attack\nif is_succeed_to_attack() then\n\tlocal damages = hurt_target()\t\n\tlocal critical = false\n\t\n\tif 1 < #damages then\n\t\tcritical = true\n\t\tself:AddExp(5)\n\telse\n\t\tself:AddExp(2)\n\tend\n\t\n\t_DamageSkinService:Play(target_entity, 2, 0, damages, DamageSkinTweenType.Default, critical)\t\n\tlocal length = 0\n\t_EffectService:PlayEffectAttached(\"f396262ddb6e4d5581360496bb4e9f86\", target_entity, Vector2(0,0), 0, Vector2(1,1), length)\n\t\n\t--if target_entity.StateComponent then\n\t--\ttarget_entity.StateComponent:ChangeState(\"HIT\",true)\n\t--end\n\t\n\tlocal total_damage = 0\n\t\n\tfor _, d in ipairs(damages) do\n\t\ttotal_damage = total_damage + d\n\tend\n\t\n\tother_properties.HP = other_properties.HP - total_damage\n\t\n\tif total_damage >= other_properties.HP then\n\t\ttarget_entity.UnitCommon:Die()\n\t\t\n\t\tself:AddExp(3)\n\t\treturn true\n\tend\nelse\n\tself:AddChat(\"빗나갔다!\")\nend\n\nreturn false",
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
      "Code": "if #text == 0 then\n\treturn\nend\n\nlog(\"AddChat:\",text,#text)\n\nif #text<5 then\n\tself.Entity.ChatBalloonComponent.BallonScale=1\nelseif #text<18 then\n\tself.Entity.ChatBalloonComponent.BallonScale=2\nelse\n\tself.Entity.ChatBalloonComponent.BallonScale=3\nend\n\nself.Entity.ChatBalloonComponent.Message = text\n\nlocal timer_id = self.Properties.__timer_id\nif timer_id then\n\t_TimerService:ClearTimerById(timer_id)\nend\n\nself.Properties.__timer_id = _TimerService:SetTimerOnce(function() self:HideChat() end, 3)",
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
      "Code": "self.UnitType = unit_type\n--[[\nlocal props = self.Properties\n\n-- default\nprops.HP = 60\nprops.ATK = 50\nprops.DEF = 50\nprops.DEX = 50\n]]--\n--[[\n1: lee sung kye\n2: tuntra\n3: park wei\n4: militia\n5: rebel\n]]--\n--[[\nif self.UnitType == 1 then\n\tprops.HP = 200\n\tprops.ATK = 100\n\tprops.DEF = 50\n\tprops.DEX = 100\nelseif self.UnitType == 2 then\n\tprops.HP = 10\n\tprops.ATK = 100\n\tprops.DEF = 50\n\tprops.DEX = 50\nelseif self.UnitType == 3 then\n\tprops.HP = 200\n\tprops.ATK = 100\n\tprops.DEF = 50\n\tprops.DEX = 50\nelseif self.UnitType == 4 then\n\tprops.HP = 200\n\tprops.ATK = 100\n\tprops.DEF = 50\n\tprops.DEX = 50\nelseif self.UnitType == 5 then\n\tprops.HP = 200\n\tprops.ATK = 100\n\tprops.DEF = 50\n\tprops.DEX = 50\t\nend\n]]--",
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
      "Code": "if chat_type == \"die\" then\n\treturn \"으악!\"\nend\n\nreturn \"\"",
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
      "Code": "log(\"Die()\",self.Entity.Name)\nself:AddChat(self:__get_chat(\"die\"))\n\n--if self.Entity.StateComponent then\n--\tself.Entity.StateComponent:ChangeState(\"DIE\")\n--end\n\nself.turn_mgr.TurnManager:RemoveEntity(self.Entity)\n\n--self.Entity:Destroy()\nself:banish()",
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
      "Code": "local color = self.Entity.SpriteRendererComponent.Color\r\n\t\r\nif color.a > 0 then\r\n\tself.Entity.SpriteRendererComponent.Color = Color(1, 1, 1, color.a - 0.1)\r\n\t\r\n\t_TimerService:SetTimerOnce(function() self:banish() end, 0.1)\r\nelse\r\n\tself.Entity:Destroy()\r\nend",
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
      "Code": "log(\"OnDestroy()\",self.Entity.Name)",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
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
      "Code": "if self.Talked==false then\n\tself.Talked=true\n\t\n\tlocal idx=self.Properties.IDX\t\n\tif idx==1 then\n\t\tif self.Entity.Name==\"UnitChef1\" or self.Entity.Name==\"UnitWizard1\" then\n\t\t\tlocal dialogs={\"맡겨줘!\",\"이긴다!\",\"!\",\"?\",\"...\"}\n\t\t\tlocal idx=math.random(1,#dialogs)\n\t\t\t\n\t\t\tself:AddChat(dialogs[idx])\t\n\t\telse\n\t\t\tlocal dialogs={\"알바는 어쩌지...\",\"왜 내가 여기 있지?\",\"무서워...\",\"뭐가 뭔지...\",\"...\"}\n\t\t\tlocal idx=math.random(1,#dialogs)\n\t\t\t\n\t\t\tself:AddChat(dialogs[idx])\n\t\tend\t\t\n\telseif idx==2 then\n\t\tlocal dialogs={\"언니를 믿어!\",\"천사왕국 제일검이 나다!\",\"칼날을 보고 싶나?\",\"내 무덤은 적으로 만든다!\"}\n\t\tlocal idx=math.random(1,#dialogs)\n\t\t\n\t\tself:AddChat(dialogs[idx])\n\telseif idx==3 then\n\t\tlocal dialogs={\"어흥\",\"토끼 맛을 봐라!\",\"힘들다...\",\"충성!\",\"단결!\",\"굴에 가고 싶다\"}\n\t\tlocal idx=math.random(1,#dialogs)\n\t\t\n\t\tself:AddChat(dialogs[idx])\n\tend\nend",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "GetGradeName",
      "Return": {
        "Name": null,
        "Type": "string",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": null,
      "Code": "local lvl=self.Properties.LVL\n\nif lvl==0 then\n\treturn \"민간인\"\nelseif lvl==1 then\n\treturn \"이병\"\nelseif lvl==2 then\n\treturn \"일병\"\nelseif lvl==3 then\n\treturn \"상병\"\nelseif lvl==4 then\n\treturn \"병장\"\nelseif lvl==5 then\n\treturn \"하사\"\nelseif lvl==6 then\n\treturn \"중사\"\nelseif lvl==7 then\n\treturn \"상사\"\nelseif lvl==8 then\n\treturn \"원사\"\nelseif lvl==9 then\n\treturn \"소위\"\nelseif lvl==10 then\n\treturn \"중위\"\nelseif lvl==11 then\n\treturn \"대위\"\nelseif lvl==12 then\n\treturn \"소령\"\nelseif lvl==13 then\n\treturn \"중령\"\nelse\n\treturn \"\"\nend",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "AddExp",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [
        {
          "Name": "exp",
          "Type": "number",
          "DefaultValue": "0",
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "local props=self.Properties\nif props.EXP and props.MAXEXP and props.LVL then\n\tprops.EXP=props.EXP+exp\n\t\n\tif props.EXP>props.MAXEXP then\n\t\tprops.EXP=0\n\t\tprops.LVL=props.LVL+1\n\t\tprops.ATK=props.ATK*1.2\n\t\tprops.DEF=props.DEF*1.2\n\t\tprops.DEX=props.DEX*1.2\n\t\tprops.MAXHP=props.MAXHP*1.2\n\t\tprops.MAXEXP=props.MAXEXP*1.5\n\t\tprops.HP=props.MAXHP\n\t\tprops.LVLUP=props.LVLUP+1\n\t\t\n\t\tself:AddChat(\"진급이다!\")\n\tend\nend",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    }
  ],
  "EventEmitters": [],
  "EventHandlers": [],
  "EntityEventHandlers": []
}8�������J 17d84fd862c34f06b6d7fc302e84788a�
 1aea3b249c1941ce9c6b2eb1f776d3c0 f632dad4121d46e3a8e3e76f7cc1979c0codeblock://b1b3e124-4bc8-4e70-b7f8-7a95131219c3"x-mod/codeblock2��{
  "CoreVersion": {
    "Major": 0,
    "Minor": 2
  },
  "ScriptVersion": {
    "Major": 1,
    "Minor": 0
  },
  "Description": "",
  "Id": "b1b3e124-4bc8-4e70-b7f8-7a95131219c3",
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
      "SyncDirection": 3
    },
    {
      "Name": "turn_mgr",
      "Type": "Entity",
      "DefaultValue": "nil",
      "Description": null,
      "SyncDirection": 3
    },
    {
      "Name": "MapPos",
      "Type": "Vector2",
      "DefaultValue": "Vector2(0,0)",
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
      "Code": "self.turn_mgr = _EntityService:GetEntityByPath(\"/common/TurnManager\")\n--self.Entity.TransformComponent.Scale = Vector3(1.5, 2, 1)\n--self.Entity.TransformComponent.Position = Vector3(0, -3, 0)\n\nif self.Entity.TouchReceiveComponent==nil then\n\tlog_error(\"needs TouchReceiveComponent:\",self.Entity.Name)\nend",
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
      "Code": "self.turn_mgr.TurnManager:MoveUnit(self.EntityID, self.MapPos)",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 2
    }
  ],
  "EventEmitters": [],
  "EventHandlers": [],
  "EntityEventHandlers": []
}8�毀����J 0769283d6e7e41cba934dd163cd888d5�	
 969387958f5a41d49c12c340a711f626 f632dad4121d46e3a8e3e76f7cc1979c0codeblock://be01b716-c3a3-4d2b-9f8a-63a566f9c2cf"x-mod/codeblock2��{
  "CoreVersion": {
    "Major": 0,
    "Minor": 2
  },
  "ScriptVersion": {
    "Major": 1,
    "Minor": 0
  },
  "Description": "",
  "Id": "be01b716-c3a3-4d2b-9f8a-63a566f9c2cf",
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
      "Code": "self.Entity.ImageComponent.Color = Color(0,0,0,0)",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 1
    }
  ],
  "EventEmitters": [],
  "EventHandlers": [],
  "EntityEventHandlers": [
    {
      "Name": "HandleButtonClickEvent",
      "EventName": "ButtonClickEvent",
      "Target": "self",
      "Code": "local Entity = event.Entity\nlocal entity = _EntityService:GetEntityByPath(\"/common/CameraManager\");\nentity.CameraManager:OnButtonClicked(Entity.Name)"
    }
  ]
}8��������J 7cd4938f17074d1fb4578a7c88395936�
 fdb4b199a42d42fea4345ddf8db3f045 f632dad4121d46e3a8e3e76f7cc1979c0codeblock://cb037e6e-350c-4958-ada0-05bdc430035e"x-mod/codeblock2��{
  "CoreVersion": {
    "Major": 0,
    "Minor": 2
  },
  "ScriptVersion": {
    "Major": 1,
    "Minor": 0
  },
  "Description": "",
  "Id": "cb037e6e-350c-4958-ada0-05bdc430035e",
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
      "SyncDirection": 3
    },
    {
      "Name": "RelPos",
      "Type": "Vector2",
      "DefaultValue": "Vector2(0,0)",
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
      "Code": "self.__properties.turn_manager = _EntityService:GetEntityByPath(\"/common/TurnManager\")\n--self.Entity.TransformComponent.Scale = Vector3(1.5, 2, 1)\n--self.Entity.TransformComponent.Position = Vector3(0, -3, 0)\n\nif self.Entity.TouchReceiveComponent==nil then\n\tlog_error(\"needs TouchReceiveComponent:\",self.Entity.Name)\nend",
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
}8�毀����J 825e210a11f4458e956209c3e22c465b�
 7f18dc77fd2c4c0db83233e1e15998b3 f632dad4121d46e3a8e3e76f7cc1979c0codeblock://cb3d0115-18c6-40b9-ad1b-49a346877dd7"x-mod/codeblock2��{
  "CoreVersion": {
    "Major": 0,
    "Minor": 2
  },
  "ScriptVersion": {
    "Major": 1,
    "Minor": 0
  },
  "Description": "",
  "Id": "cb3d0115-18c6-40b9-ad1b-49a346877dd7",
  "Language": 1,
  "Name": "DummyForSave",
  "Type": 1,
  "Source": 0,
  "Target": null,
  "Properties": [
    {
      "Name": "StageName",
      "Type": "string",
      "DefaultValue": "\"\"",
      "Description": null,
      "SyncDirection": 3
    },
    {
      "Name": "Team",
      "Type": "string",
      "DefaultValue": "\"\"",
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
      "Code": "local dm=_EntityService:GetEntityByPath(\"/common/DataManager\")\ndm.DataManager.IsSaving=true\n--dm.DataManager:Save()\n\nlog(\"saving team:\",self.Team)\nlog(\"saving stage:\",self.StageName)",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 1
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
      "Code": "log(\"*ondestroy\")\nlog(\"saving team:\",self.Team)\nlog(\"saving stage:\",self.StageName)",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 1
    }
  ],
  "EventEmitters": [],
  "EventHandlers": [],
  "EntityEventHandlers": []
}8��������J 400d42f9add7477780d1bf57c1f5106e�u
 5cee206b55af4537b57fede85f91a924 f632dad4121d46e3a8e3e76f7cc1979c0codeblock://e1fb4c34-c233-4e23-9880-bd44b53f2292"x-mod/codeblock2�t�t{
  "CoreVersion": {
    "Major": 0,
    "Minor": 2
  },
  "ScriptVersion": {
    "Major": 1,
    "Minor": 0
  },
  "Description": "",
  "Id": "e1fb4c34-c233-4e23-9880-bd44b53f2292",
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
      "Name": "GridSize",
      "Type": "Vector2",
      "DefaultValue": "Vector2(0,0)",
      "Description": null,
      "SyncDirection": 3
    },
    {
      "Name": "introEntites",
      "Type": "table",
      "DefaultValue": "{}",
      "Description": null,
      "SyncDirection": 0
    },
    {
      "Name": "actors",
      "Type": "table",
      "DefaultValue": "{}",
      "Description": null,
      "SyncDirection": 0
    },
    {
      "Name": "timerIdx",
      "Type": "number",
      "DefaultValue": "0",
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
      "Arguments": null,
      "Code": "--[[\n-4: bush0\n-3: flower0\n-2: tree0\n-1: stone0\n1: lee sung kye\n2: tuntra\n3: park wei\n4: militia\n5: rebel\n]]--\n--[[\nlocal map = {\t\n\t50,53,52,53, 0, 0,52,52,53,50,\n\t51, 0,50,51, 0, 0, 0, 0, 0,21,\n\t52, 0,21,21, 0, 0, 0, 0, 0, 0,\n\t 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,\n\t 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,\n   \t 0, 0, 0, 0, 0,-1,-1, 0, 0, 0,\n\t 0, 0, 0, 0, 0,-1,-1, 0, 0,21,\n\t 0, 0, 0, 0, 0, 0, 0, 0, 0,21,\n\t 0,21, 0, 0, 0, 0, 0, 0,51,51,\n\t50,51,52, 0, 0, 0, 0, 0,52,51,\n}\nlocal map_size = Vector2(10,10)\n]]--\nlocal map = {\t\n\t51,51,51,51,51,50,52,52,51,50,51,51,51,52,53,52,\n\t51,51,51,51,50,50,52,52,51,50,51,51,51,52,53,52,\n\t51,51,51,51,51,51, 0, 0, 0, 0,52, 0, 0, 0, 0,53,\n\t 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,53,\n \t 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,53,\n\t 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,-1, 0, 0,53,\n\t 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,21,23,53,\n\t52,51,51,52, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,21,53,\n}\nlocal map_size=Vector2(16,8)\nlocal dm=_EntityService:GetEntityByPath(\"/common/DataManager\")\ndm=dm.DataManager\nself.Entity.StateGameCommon.Map = map\nself.Entity.StateGameCommon.MapSize = map_size\nself.Entity.StateGameCommon.MapOffset=Vector3(0,10,0)\nself.Entity.StateGameCommon.StateGame = self.Entity\nself.Entity.StateGameCommon.TileSpriteRUID=\"ae4c83b9b2dc49b2837ad0612b6523b8\"\nself.Entity.StateGameCommon.TileSet=dm.TileSet[1]\n\n--self.Entity.StateGameCommon:PutUnits(map,map_size)\nself.Entity.StateGameCommon:OnStateEntered()\n\ndo\n\tlocal entity=_EntityService:GetEntityByPath(\"/ui/UIBattleGoal/UIBattleGoalTitle\")\n\tentity.TextComponent.Text=\"소환\"\nend\ndo\n\tlocal entity=_EntityService:GetEntityByPath(\"/ui/UIBattleGoal/UIBattleGoalDesc\")\n\tentity.TextComponent.Text=\"영문을 모르지만 살아남아야 한다.\"\nend\n\n_UserService.LocalPlayer.CameraComponent.CameraOffset=Vector2(0,0)",
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
      "Code": "self.Entity.StateGameCommon:OnStateLeft()\nself.actors={}",
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
      "Code": "_TimerService:ClearTimerById(self.timerIdx)\ndo\n\t_SoundService:PlayBGM(\"5b7eec52109e476c9815577f4d3c29bc\")\nend\n\nlocal tuntra = _EntityService:GetEntityByPath(\"/maps/map01/UnitBokrye\"):Clone()\ntuntra.TouchReceiveComponent.Enable=false\ntuntra.Visible=false\nlocal general = _EntityService:GetEntityByPath(\"/maps/map01/UnitKidong\"):Clone()\ngeneral.Visible = false\ngeneral.TouchReceiveComponent.Enable=false\nlocal s0 =_EntityService:GetEntityByPath(\"/maps/map01/UnitJumrye\"):Clone()\ns0.Visible=false\ns0.TouchReceiveComponent.Enable=false\nlocal s1=_EntityService:GetEntityByPath(\"/maps/map01/UnitRebel0\"):Clone()\ns1.Visible=false\ns1.TouchReceiveComponent.Enable=false\n\nself.introEntites={tuntra,general,s0,s1}\n\n--[[\nlocal scene_final=function()\n\tself:EndIntro()\n\n\t--self.Entity.StateGameCommon:StartGame()\nend\n]]--\nlocal scene13=function()\n\ttuntra.UnitCommon:AddChat(\"어쩌지...?\")\n\t--self.timerIdx=_TimerService:SetTimerOnce(function() scene_final() end, 3)\nend\n\nlocal scene12=function()\n\ts0.UnitCommon:AddChat(\"무기를 버려라!\")\n\ts1.UnitCommon:AddChat(\"명령이다!\")\n\tself.timerIdx=_TimerService:SetTimerOnce(function() scene13() end, 1)\nend\n\nlocal scene11=function()\n\tgeneral.Visible=false\n\tself.timerIdx=_TimerService:SetTimerOnce(function() scene12() end, 1)\nend\n\nlocal scene10=function()\n\tgeneral.UnitCommon:AddChat(\"곧 만나자. 후후\")\n\tself.timerIdx=_TimerService:SetTimerOnce(function() scene11() end, 1)\nend\n\nlocal scene09=function()\n\tgeneral.UnitCommon:AddChat(\"잡아!\")\n\t--general.ChatBalloonComponent.BallonScale = 2\n\tself.timerIdx=_TimerService:SetTimerOnce(function() scene10() end, 2)\nend\n\nlocal scene08=function()\n\ts0.UnitCommon:AddChat(\"어떡할까요?\")\n\t--s0.ChatBalloonComponent.BallonScale = 2\n\ts1.TransformComponent.WorldPosition = tuntra.TransformComponent.WorldPosition + Vector3(4,1,0)\n\ts1.Visible=true\n\tself.timerIdx=_TimerService:SetTimerOnce(function() scene09() end, 2)\nend\n\nlocal scene07=function()\n\ts0.UnitCommon:AddChat(\"대장님!\")\n\ts0.ChatBalloonComponent.BallonScale = 1\n\ts0.TransformComponent.WorldPosition = tuntra.TransformComponent.WorldPosition + Vector3(3,0,0)\n\ts0.Visible=true\n\tself.timerIdx=_TimerService:SetTimerOnce(function() scene08() end, 1)\nend\n\nlocal scene06=function()\n\tgeneral.UnitCommon:AddChat(\"여기는 전쟁터야!\")\n\t--general.ChatBalloonComponent.BallonScale = 3\n\t_TimerService:SetTimerOnce(function() scene07() end, 2)\nend\n\nlocal scene05=function()\n\tgeneral.UnitCommon:AddChat(\"후후 그건 무슨 흉내지?\")\n\t--general.ChatBalloonComponent.BallonScale = 3\n\tself.timerIdx=_TimerService:SetTimerOnce(function() scene06() end, 2)\nend\n\nlocal scene04=function()\n\ttuntra.UnitCommon:AddChat(\"누구...?\")\n\t--tuntra.ChatBalloonComponent.BallonScale = 2\n\tself.timerIdx=_TimerService:SetTimerOnce(function() scene05() end, 2)\nend\n\nlocal scene03 = function()\n\tgeneral.TransformComponent.WorldPosition = tuntra.TransformComponent.WorldPosition + Vector3(-2,-1,0)\t\n\tgeneral.SpriteRendererComponent.FlipX = true\n\tgeneral.Visible = true\n\tgeneral.UnitCommon:AddChat(\"잘 만났다. 복례\")\n\tgeneral.ChatBalloonComponent.BallonScale = 3\n\n\tself.timerIdx=_TimerService:SetTimerOnce(function() scene04() end, 2)\nend\n\nlocal scene02_1 = function()\n\ttuntra.UnitCommon:AddChat(\"...!\")\n\t--tuntra.ChatBalloonComponent.BallonScale = 1\n\tself.timerIdx=_TimerService:SetTimerOnce(function() scene03() end, 2)\nend\n\nlocal scene02 = function()\n\ttuntra.UnitCommon:AddChat(\"누구야!\")\n\t--tuntra.ChatBalloonComponent.BallonScale = 2\n\tself.timerIdx=_TimerService:SetTimerOnce(function() scene02_1() end, 2)\nend\n\nlocal scene01_2 = function()\n\ttuntra.UnitCommon:AddChat(\"뭔가 잃어버린 기분이야...\")\n\t--tuntra.ChatBalloonComponent.BallonScale = 3\n\tself.timerIdx=_TimerService:SetTimerOnce(function() scene02() end, 2)\nend\n\nlocal scene01_1 = function()\n\tlog(\"scene02\")\n\n\ttuntra.UnitCommon:AddChat(\"여긴 어디지?\")\n\t--tuntra.ChatBalloonComponent.BallonScale = 2\n\tself.timerIdx=_TimerService:SetTimerOnce(function() scene01_2() end, 2)\nend\n\nlocal scene01 = function() \n\tlog(\"scene01\")\n\n\t--_UserService.LocalPlayer.CameraComponent.CameraOffset=Vector2(tuntra.TransformComponent.Position.x,tuntra.TransformComponent.Position.y)\n\n\t_UserService.LocalPlayer.TransformComponent.WorldPosition = tuntra.TransformComponent.WorldPosition\n\t--tuntra.TransformComponent.WorldPosition=_UserService.LocalPlayer.TransformComponent.WorldPosition\n\tlocal text = \"머리 아파...\"\n\ttuntra.UnitCommon:AddChat(text)\n\t--tuntra.ChatBalloonComponent.BallonScale = 2\n\ttuntra.Visible = true\n\tself.timerIdx=_TimerService:SetTimerOnce(function() scene01_1() end, 2)\nend\n\ndo\n\tlocal background=_EntityService:GetEntityByPath(\"/maps/map01/BackGroundTemplate\")\n\tbackground.BackgroundTemplateComponent.BackType=2\n\tbackground.BackgroundTemplateComponent.SolidColor=Color(0,0,0,1)\nend\n\nscene01()\n\n--tuntra locate\n\n--she said \"Why I'm here? When I dropped from my horse. But I can't remember after that...\"\n--put message\n--lee sungkye is commong to her\n--he asked \"who are you?\"\n--she said \"I'm ... But tell me your name first\"\n--he answered \"I'm Lee sungkye. Tell me your name\"\n--she said \"I'm Tuntra.\"\n--he said \"Tuntura? It is strange name. However...\"\n--Milisha came on and said \"General! Enemies are in our sight\"\n--he said \"Ok Go now! Tuntura, come with me!\"\n--she said \"Oh... I'm\"",
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
      "Code": "do\n\tlocal ui=_EntityService:GetEntityByPath(\"/ui/UIGameIntro\")\n\tui.Enable=false\n\tui.Visible=false\nend\ndo\n\tlocal background=_EntityService:GetEntityByPath(\"/maps/map01/BackGroundTemplate\")\n\tbackground.BackgroundTemplateComponent.BackType=1\n\tbackground.BackgroundTemplateComponent.MapRUID=\"0cd16a9422ea44bdbd1e082aa6381fbc\"\nend\n\n_TimerService:ClearTimerById(self.timerIdx)\n\nfor i=1,#self.introEntites do\n\tlocal entity=table.remove(self.introEntites,1)\n\tentity:Destroy()\nend\n\n--local bkg=_EntityService:GetEntityByPath(\"/maps/map01/BackGroundTemplate\")\n--bkg.BackgroundTemplateComponent.SolidColor=Color(0,0.3,0,1)\n\nself.Entity.StateGameCommon:StartGame(5)\n\ndo\n\tlocal allies=self.Entity.StateGameCommon.TurnMgr.TurnManager.Allies\t\t\n\tfor _,unit in pairs(allies) do\n\t\tif unit.NameTagComponent.Name==\"복례\" or unit.NameTagComponent.Name==\"전투요리사\" then\n\t\t\tself.actors.heroin=unit\n\t\t\tbreak\n\t\tend\n\tend\nend\n\n--self.Entity.StateGameCommon.TurnMgr.TurnManager:Start()",
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
      "Code": "local sm=_EntityService:GetEntityByPath(\"/common/StateManager\")\nsm.StateManager:OnStateChanged(\"Game02\")",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "RaiseEvent",
      "Return": {
        "Name": null,
        "Type": "void",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [
        {
          "Name": "eventType",
          "Type": "string",
          "DefaultValue": "\"\"",
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "param",
          "Type": "any",
          "DefaultValue": "nil",
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "log(\"RaiseEvent()\",eventType,param)\nif eventType==\"turn\" then\n\tlocal dm=_EntityService:GetEntityByPath(\"/common/DataManager\")\n\tif param==1 then\n\t\tself.actors.heroin.UnitCommon:AddChat(\"적이 너무 많아...\")\n\telseif param==2 then\n\t\tlocal scene4=function()\n\t\t\tlocal tm=_EntityService:GetEntityByPath(\"/common/TurnManager\")\n\t\t\ttm.TurnManager:ActivateUnits(tm.TurnManager.Allies,true)\n\t\tend\n\t\tlocal scene3=function()\n\t\t\tlocal sunrye=dm.DataManager.Team[3]\n\t\t\tlocal entity=self.Entity.StateGameCommon:AddActor(Vector2(0,5),sunrye)\n\t\t\tentity.SpriteRendererComponent.FlipX=true\n\t\t\n\t\t\tself.timerIdx=_TimerService:SetTimerOnce(function() scene4() end,1)\t\t\n\t\tend\n\t\tlocal scene2=function()\n\t\t\tlocal sunrye=dm.DataManager.Team[3]\n\t\t\tlocal entity=self.Entity.StateGameCommon:AddActor(Vector2(0,3),sunrye)\n\t\t\tentity.SpriteRendererComponent.FlipX=true\n\t\n\t\t\tself.timerIdx=_TimerService:SetTimerOnce(function() scene3() end,1)\n\t\tend\n\t\tlocal scene1=function()\n\t\t\tlocal sunrye=dm.DataManager.Team[2]\n\t\t\tlocal entity=self.Entity.StateGameCommon:AddActor(Vector2(0,4),sunrye)\n\t\t\tentity.UnitCommon:AddChat(\"저기다!\")\n\t\t\tentity.SpriteRendererComponent.FlipX=true\n\t\t\t_UserService.LocalPlayer.TransformComponent.WorldPosition=entity.TransformComponent.WorldPosition\n\t\t\t\n\t\t\tself.actors.sunrye=entity\n\n\t\t\tself.timerIdx=_TimerService:SetTimerOnce(function() scene2() end, 1)\n\t\tend\n\t\t\n\t\tself.actors.heroin.UnitCommon:AddChat(\"끝인가?\")\n\t\tself.timerIdx=_TimerService:SetTimerOnce(function() scene1() end, 2)\n\t\treturn\n\telseif param==3 then\n\t\tself.actors.heroin.UnitCommon:AddChat(\"우리 편일까?\")\n\telseif param==4 then\n\t\tself.actors.sunrye.UnitCommon:AddChat(\"누구죠?\")\n\t\tself.actors.heroin.UnitCommon:AddChat(\"나중에!\")\n\telseif param==5 then\n\t\tself.actors.heroin.UnitCommon:AddChat(\"힘내!\")\n\t\tself.actors.sunrye.UnitCommon:AddChat(\"밀어부쳐!\")\n\tend\n\n\tlocal tm=_EntityService:GetEntityByPath(\"/common/TurnManager\")\n\ttm.TurnManager:ActivateUnits(tm.TurnManager.Allies,true)\nelseif eventType==\"move\" then\n\tlocal entity=param\nelse\n\tlog(\"undefined event:\", param)\nend",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    }
  ],
  "EventEmitters": [],
  "EventHandlers": [],
  "EntityEventHandlers": []
}8�ӵ����J e186f43b37ba44c79a9572941af4053f�
 5182c87a8f224254b98844e0da35bafa f632dad4121d46e3a8e3e76f7cc1979c0codeblock://e5356f9c-cb97-413a-8765-db511c4eec35"x-mod/codeblock2��{
  "CoreVersion": {
    "Major": 0,
    "Minor": 2
  },
  "ScriptVersion": {
    "Major": 1,
    "Minor": 0
  },
  "Description": "",
  "Id": "e5356f9c-cb97-413a-8765-db511c4eec35",
  "Language": 1,
  "Name": "StateManager",
  "Type": 1,
  "Source": 0,
  "Target": null,
  "Properties": [
    {
      "Name": "States",
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
      "Arguments": null,
      "Code": "local entity = _EntityService:GetEntityByPath(\"/common/StateTitle\")\r\nentity.StateTitle:OnStateEntered()\r\n-- debug purpose\r\n--local entity =_EntityService:GetEntityByPath(\"/common/StateGame01\")\r\n--entity.StateGame01:OnStateEntered()\r\nentity.Visible = true\r\ntable.insert(self.States, entity)",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
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
      "Code": "local entity = table.remove(self.States, 1)\n\nif entity.Name == \"StateTitle\" then\n\tentity.StateTitle:OnStateLeft()\nelseif entity.Name == \"StateGame01\" then\n\tentity.StateGame01:OnStateLeft()\nelseif entity.Name == \"StateGame02\" then\n\tentity.StateGame02:OnStateLeft()\nelseif entity.Name == \"StateGame03\" then\n\tentity.StateGame03:OnStateLeft()\nelseif entity.Name == \"StateGame04\" then\n\tentity.StateGame04:OnStateLeft()\nend\n\nentity.Enable = false\n\nif state == \"Title\" then\n\tentity = _EntityService:GetEntityByPath(\"/common/StateTitle\")\t\n\tentity.StateTitle:OnStateEntered()\nelse\n\t--do\n\t\t--local dm=_EntityService:GetEntityByPath(\"/common/DataManager\")\n\t\t--dm.DataManager.StageName=state\n\t\t--dm.DataManager.IsSaving=true\n\t\t\n\t\t--_TimerService:SetTimerOnce(function() dm.DataManager.StageName=\"test\" end,1)\n\t\t\n\t\t--trick to save\n\t\t--local com=_UserService.LocalPlayer:AddComponent(\"DummyForSave\",true)\n\t\t--com.StageName=\"Test\"\n\t\t--_UserService.LocalPlayer.ChatBalloonComponent.Message=\"test\"\n\t\t--_UserService.LocalPlayer:RemoveComponent(\"DummyForSave\",true)\n\t--end\n\t\n\tif state == \"Game01\" then\n\t\tentity = _EntityService:GetEntityByPath(\"/common/StateGame01\")\t\n\t\tentity.StateGame01:OnStateEntered()\n\telseif state == \"Game02\" then\n\t\tentity = _EntityService:GetEntityByPath(\"/common/StateGame02\")\t\n\t\tentity.StateGame02:OnStateEntered()\n\telseif state == \"Game03\" then\n\t\tentity = _EntityService:GetEntityByPath(\"/common/StateGame03\")\t\n\t\tentity.StateGame03:OnStateEntered()\n\telseif state == \"Game04\" then\n\t\tentity = _EntityService:GetEntityByPath(\"/common/StateGame04\")\t\n\t\tentity.StateGame04:OnStateEntered()\n\telse\n\t\tlog_error(\"not defined\")\n\tend\nend\n\n--for debugging\t\nentity.Enable = false\n\ntable.insert(self.States, entity)\n\nlog(\"OnStateChanged:\", state)\t",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    }
  ],
  "EventEmitters": [],
  "EventHandlers": [],
  "EntityEventHandlers": []
}8��������J 9346a58415f14fc2b839159fbae2e0a7��
 dc08f16446a34a729a054a2ced7d6838 f632dad4121d46e3a8e3e76f7cc1979c0codeblock://fe5d982b-0864-46e3-8fda-b70f6095037b"x-mod/codeblock2����{
  "CoreVersion": {
    "Major": 0,
    "Minor": 2
  },
  "ScriptVersion": {
    "Major": 1,
    "Minor": 0
  },
  "Description": "",
  "Id": "fe5d982b-0864-46e3-8fda-b70f6095037b",
  "Language": 1,
  "Name": "TurnManager",
  "Type": 1,
  "Source": 0,
  "Target": null,
  "Properties": [
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
      "SyncDirection": 3
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
      "SyncDirection": 3
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
    },
    {
      "Name": "turnIdx",
      "Type": "number",
      "DefaultValue": "0",
      "Description": null,
      "SyncDirection": 3
    },
    {
      "Name": "MapOffset",
      "Type": "Vector3",
      "DefaultValue": "Vector3(0,0,0)",
      "Description": null,
      "SyncDirection": 3
    },
    {
      "Name": "TimerIdx",
      "Type": "number",
      "DefaultValue": "0",
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
      "Code": "self.Entity.Enable = false\n\nself.battle_ui = _EntityService:GetEntityByPath(\"/ui/UIBattle\")\nself.__properties.battle_result_ui = _EntityService:GetEntitiesByPath(\"/ui/UIBattleResult\")\n\nself.camera_mgr = _EntityService:GetEntityByPath(\"/common/CameraManager\")\n\nself.movable_tile = _EntityService:GetEntityByPath(\"/common/TileMovable\")\nself.movable_tile.Enable = false\n\nself.__properties.attackable_tile = _EntityService:GetEntityByPath(\"/common/TileAttackable\")\nself.__properties.attackable_tile.Enable = false\n\nself.disable_color = Color(0.5, 0.5, 0.5, 1)\nself.enable_color = Color(1, 1, 1, 1)\n\nself.Allies = {}\nself.Enemies = {}\nself.__properties.__move_tiles = {}\nself.__properties.__hit_tiles = {}",
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
      "Arguments": null,
      "Code": "log(\"StartAlly()\")\nself.camera_mgr.CameraManager:Start()\n\nlog(\"**CameraManager:Start() invoked\")\n\nif #self.Allies==0 then\n\tself.StateGame.StateGameCommon:Finish(false)\n\treturn\nend\nlog(\"**Allies count checked\")\n\nfor _,entity in ipairs(self.Enemies) do\n\tif entity.ChatBalloonComponent then\n\t\tentity.ChatBalloonComponent.Message=\"\"\n\tend\nend\nlog(\"**enemies' dialog reset\")\n\nfor _,entity in ipairs(self.Allies) do\n\tif entity.UnitCommon then\n\t\tentity.UnitCommon.Talked=false\n\telse\n\t\tlog_error(\"StartAlly() UnitCommon don't exist\",entity.Name)\n\tend\nend\nlog(\"**friendries' dialog reset\")\n\nself.turnIdx=self.turnIdx+1\nif self.StateGame then\n\tself.StateGame.StateGameCommon:RaiseEvent(\"turn\",self.turnIdx)\nend\nlog(\"**event raised\")\n\n--self:ActivateUnits(self.Allies, true)",
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
      "Arguments": null,
      "Code": "do\n\tlocal ui=_EntityService:GetEntityByPath(\"/ui/UIBattleCmd\")\n\tui.Enable=false\n\tui.Visible=false\nend\n--self.battle_ui.Visible = false\n--self.battle_ui.Enable = false\n\ndo\n\tlocal remain_turn_txt = _EntityService:GetEntityByPath(\"/ui/UIBattle/txtTurn\")\n\tlocal remain_turn = math.tointeger(remain_turn_txt.TextComponent.Text)\n\t\n\tif remain_turn <= 0 then\n\t\tself.StateGame.StateGameCommon:Finish(false)\n\t\treturn\n\tend\n\tremain_turn_txt.TextComponent.Text = tostring(remain_turn - 1)\nend\n\nself:ActivateUnits(self.Enemies, false)\n\nlocal entity_ids = {}\nfor i=1, #self.Enemies do\n\tlocal entity = self.Enemies[i]\n\t\n\tif entity ~= nil then\n\t\ttable.insert(entity_ids, entity.Id)\n\tend\nend\nself.entity_ids = entity_ids\n\nself:_WorkEnemy()",
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
      "Arguments": null,
      "Code": "self.turnIdx=0\n_TimerService:ClearTimerById(self.TimerIdx)\n\nself:StartAlly()",
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
      "Code": "self.battle_ui.Visible = false\nself.battle_ui.Enable  = false\n\nself.Map={}\n\nfor i=1, #self.Allies do\n\tlocal entity = table.remove(self.Allies, 1)\n\tentity:Destroy()\nend\nfor i=1, #self.Enemies do\n\tlocal entity = table.remove(self.Enemies, 1)\n\tentity:Destroy()\nend\nfor i=1, #self.Blocks do\n\tlocal entity = table.remove(self.Blocks, 1)\n\tentity:Destroy()\nend\n\nself.camera_mgr.CameraManager:End()",
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
          "DefaultValue": "\"\"",
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "local entity = _EntityService:GetEntity(entity_id)\nif entity == nil then\n\treturn\nend\n\nentity.TransformComponent.WorldPosition = pos\n\nfor i=1, #self.cloned_movable_tiles do\n\tlocal entity = table.remove(self.cloned_movable_tiles, i)\n\tentity:Destroy()\nend",
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
          "DefaultValue": "nil",
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "isEnemy",
          "Type": "boolean",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "log(\"SelectUnit\",entity.Name)\nif #self.Enemies==0 or #self.Allies==0 then\n\treturn\nend\nself:__remove_tiles(true, true)\n\t\nif entity.UnitCommon.Done then\n\treturn\nend\ndo\n\t--local entities=isEnemy and self.Allies or self.Enemies\n\tfor _,entity in pairs(self.Allies) do\n\t\tentity.ChatBalloonComponent.Message=\"\"\n\tend\n\tfor _,entity in pairs(self.Enemies) do\n\t\tentity.ChatBalloonComponent.Message=\"\"\n\tend\nend\n\nentity.UnitCommon:Select()\n\nself.battle_ui.Visible = true\nself.battle_ui.Enable = true\t\n\n_UserService.LocalPlayer.TransformComponent.WorldPosition = entity.TransformComponent.WorldPosition\n\n-- put attack range\ndo\n\tlocal props=entity.UnitCommon.Properties\n\t\n\tdo\n\t\tlocal txt=_EntityService:GetEntityByPath(\"/ui/UIBattle/txtJob\")\n\t\ttxt.TextComponent.Text=props.job and props.job or \"\"\n\tend\n\tdo\n\t\tlocal txt=_EntityService:GetEntityByPath(\"/ui/UIBattle/txtName\")\n\t\ttxt.TextComponent.Text=entity.NameTagComponent.Name\n\tend\n\tdo\n\t\tlocal txt=_EntityService:GetEntityByPath(\"/ui/UIBattle/txtGrade\")\n\t\ttxt.TextComponent.Text=entity.UnitCommon:GetGradeName()\n\tend\n\tdo\n\t\tlocal txt=_EntityService:GetEntityByPath(\"/ui/UIBattle/txtAtk\")\n\t\t\n\t\tif props.ATK then\n\t\t\ttxt.TextComponent.Text=tostring(math.floor(props.ATK))\n\t\telse\n\t\t\tlog_error(\"prop not exists\",entity.NameTagComponent.Name)\n\t\tend\n\tend\n\tdo\n\t\tlocal txt=_EntityService:GetEntityByPath(\"/ui/UIBattle/txtDef\")\n\t\ttxt.TextComponent.Text=tostring(math.floor(props.DEF))\n\tend\n\tdo\n\t\tlocal bar=_EntityService:GetEntityByPath(\"/ui/UIBattle/barExp/bar\")\n\t\t\n\t\tif props.MAXEXP then\n\t\t\tbar.SliderComponent.MaxValue=props.MAXEXP\n\t\t\tbar.SliderComponent.Value=props.EXP\n\t\telse\n\t\t\tbar.SliderComponent.MaxValue=0\n\t\tend\n\tend\n\tdo\n\t\tlocal bar=_EntityService:GetEntityByPath(\"/ui/UIBattle/barHP/bar\")\n\t\tbar.SliderComponent.MaxValue=props.MAXHP\n\t\tbar.SliderComponent.Value=props.HP\n\tend\nend\n\nif entity.UnitCommon.Moved == false then\n\tentity.UnitCommon.LocationAtMapMoving = entity.UnitCommon.LocationAtMap\nend\n\nif isEnemy==false then\t\n\t--neutral side\n\tif entity.TouchReceiveComponent==nil then\n\t\tlocal target=self:_FindTarget(entity,self.Enemies)\n\t\tif target then\n\t\t\tentity.UnitCommon:Attack(target)\n\t\telse\t\t\n\t\t\tself:_MoveUnitAutomatically(entity,false)\n\t\tend\n\t\t\n\t\tentity.UnitCommon.Done=true\n\t\tentity.SpriteRendererComponent.Color=self.disable_color\n\t\t\n\t\t_TimerService:SetTimerOnce(function() self:CheckNextTurnEnabled(false) end,1)\n\telse\t\t\n\t\tlocal ui=_EntityService:GetEntityByPath(\"/ui/UIBattleCmd\")\n\t\tui.Enable=true\n\t\tui.Visible=true\n\t\tlocal btnDef=_EntityService:GetEntityByPath(\"/ui/UIBattleCmd/DefBtn\")\n\t\tbtnDef.UIBattleControl.EntityID=entity.Id\n\t\t\n\t\tself.__properties.__move_tiles = self:_ShowTiles(\n\t\t\tentity, \n\t\t\tentity.UnitCommon.MovableAreas, \n\t\t\tentity.UnitCommon.MovableAreaSize, \n\t\t\tColor(0, 0, 0, 0.5),\n\t\t\ttrue)\n\t\tself.__properties.__hit_tiles = self:_ShowTiles(\n\t\t\tentity, \n\t\t\tentity.UnitCommon.AttackAreas, \n\t\t\tentity.UnitCommon.AttackAreaSize, \n\t\t\tColor(1, 0, 0, 1),\n\t\t\tfalse)\n\t\t\n\t\tlocal btnAtk=_EntityService:GetEntityByPath(\"/ui/UIBattleCmd/AtkBtn\")\n\t\tif #self.__properties.__hit_tiles==0 then\n\t\t\tbtnAtk.Visible=false\n\t\t\tbtnAtk.Enable=false\n\t\telse\n\t\t\t--it's useless. but I need to fix function ActUnit(). it's so boring\n\t\t\tbtnAtk.UIBattleControl.EntityID=entity.Id\n\t\t\tbtnAtk.Enable=true\n\t\t\tbtnAtk.Visible=true\n\t\tend\n\tend\nelse\n\tlocal ui=_EntityService:GetEntityByPath(\"/ui/UIBattleCmd\")\n\tui.Enable=false\n\tui.Visible=false\nend",
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
          "DefaultValue": "\"\"",
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "map_pos",
          "Type": "Vector2",
          "DefaultValue": "Vector2(0,0)",
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "local entity = _EntityService:GetEntity(entity_id)\nif entity == nil then\n\treturn\nelseif entity.UnitCommon.LocationAtMap == map_pos then\n\treturn\nelseif entity.UnitCommon.Done==true then\n\treturn\nend\n\nif entity.UnitCommon.LocationAtMap.x > map_pos.x then\n\tentity.SpriteRendererComponent.FlipX = false\nelseif entity.UnitCommon.LocationAtMap.x < map_pos.x then\n\tentity.SpriteRendererComponent.FlipX = true\nend\n\nentity.UnitCommon.Moved = true\n\nlocal map_idx = self:_GetMapIndex(entity.UnitCommon.LocationAtMap.x, entity.UnitCommon.LocationAtMap.y)\nself.Map[map_idx] = 0\n\n-- move unit\nlocal x = self.GridSize.x * map_pos.x\nlocal y = self.GridSize.y * -map_pos.y\nlocal pos = Vector3(x, y, entity.TransformComponent.WorldPosition.z)\nentity.TransformComponent.WorldPosition = pos+self.MapOffset\n\nentity.UnitCommon.LocationAtMap = map_pos\nentity.SpriteRendererComponent.OrderInLayer = map_pos.y*100+map_pos.x\nentity.SpriteRendererComponent:CommitPropertiesForced()\n\nmap_idx = self:_GetMapIndex(map_pos.x, map_pos.y)\nself.Map[map_idx] = entity.Id\n\n--if entity.UnitCommon:IsEnemy() == false then\nif entity.TouchReceiveComponent then\n\tlocal isEnemy=true\n\tif entity.UnitCommon.UnitType==1 then\n\t\tisEnemy=false\n\tend\n\t\n\tself:SelectUnit(entity,isEnemy)\n\tself.StateGame.StateGameCommon:RaiseEvent(\"move\",entity)\nelse\n\tlocal ui=_EntityService:GetEntityByPath(\"/ui/UIBattleCmd\")\n\tui.Visible=false\nend",
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
      "Code": "local remove_tiles = function(tiles) \n\tif tiles then\n\t\tfor i=1, #tiles do\n\t\t\tlocal entity = table.remove(tiles, 1)\n\t\t\tentity:Destroy()\n\t\tend\n\tend\nend\n\nif is_move_tile then\n\tremove_tiles(self.__properties.__move_tiles)\nend\n\nif is_hit_tile then\n\tremove_tiles(self.__properties.__hit_tiles)\nend",
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
          "DefaultValue": "\"\"",
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "control_name",
          "Type": "string",
          "DefaultValue": "\"\"",
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "local entity = _EntityService:GetEntity(entity_id)\nif entity == nil then\n\treturn\nend\n\nif control_name == \"DefBtn\" then\t\n\t--self.battle_ui.Visible = false\n\t--self.battle_ui.Enable = false\nelseif control_name==\"AtkBtn\" then\n\tlocal hitTiles=self.__properties.__hit_tiles\n\tlocal randIdx=math.random(1,#hitTiles)\n\tfor i,tile in ipairs(hitTiles) do\n\t\tif i==randIdx then\n\t\t\tif tile.TileAttackable then\n\t\t\t\tlocal entityId=tile.TileAttackable.EntityID\n\t\t\t\tlocal relPos=tile.TileAttackable.RelPos\n\t\t\t\tself:AttackUnit(relPos,entityId)\n\t\t\t\tbreak\n\t\t\tend\n\t\tend\n\tend\nelse\n\tlog_error(\"not defined button \")\nend\n\nentity.UnitCommon.Done = true\nentity.SpriteRendererComponent.Color = self.disable_color\n\nself.TimerIdx=_TimerService:SetTimerOnce(function() self:CheckNextTurnEnabled(false) end,1)\n--self:CheckNextTurnEnabled(false)",
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
      "Code": "self:__remove_tiles(true, true)\n\nif self.StateGame then\n\tif #self.Enemies == 0 then\n\t\tself.StateGame.StateGameCommon:Finish(true)\n\t\t--self.StateGame = nil\n\t\treturn\n\telseif #self.Allies == 0 then\n\t\tself.StateGame.StateGameCommon:Finish(false)\n\t\t--self.StateGame = nil\n\t\treturn\n\tend\nelse\n\tlog_error(\"self.StateGame is nil\")\nend\n\nlocal entities = nil\nlocal wait_second = 3\n\nif is_enemy == true then\n\tlocal isExistBokrye=false\n\tfor _,e in ipairs(self.Allies) do\n\t\tif e.NameTagComponent.Name==\"복례\" then\n\t\t\tisExistBokrye=true\n\t\t\tbreak\n\t\tend\n\tend\n\tif isExistBokrye==false then\n\t\tself.StateGame.StateGameCommon:Finish(false)\n\t\treturn\n\tend\n\t\n\tfor i=1, #self.Enemies do\n\t\tlocal entity = self.Enemies[i]\n\t\t\n\t\tif entity.UnitCommon.Done == false then\t\t\t\n\t\t\treturn\n\t\tend\n\tend\n\t\n\tself.TimerIdx=_TimerService:SetTimerOnce(function() self:StartEnemy() end, wait_second)\nelse\n\tfor i=1, #self.Allies do\n\t\tlocal entity = self.Allies[i]\n\t\t\n\t\tif entity.UnitCommon.Done == false then\n\t\t\tself:SelectUnit(entity,false)\n\t\t\treturn\n\t\tend\n\tend\n\t\n\tself.TimerIdx=_TimerService:SetTimerOnce(function() self:StartEnemy() end, wait_second)\nend",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "_ShowTiles",
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
          "DefaultValue": "nil",
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "areas",
          "Type": "table",
          "DefaultValue": "{}",
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "row_count",
          "Type": "number",
          "DefaultValue": "0",
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "tile_color",
          "Type": "any",
          "DefaultValue": "nil",
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
      "Code": "local locationAtMap = entity.UnitCommon.LocationAtMap\nif is_movable and entity.UnitCommon.Moved then\n\tlocationAtMap = entity.UnitCommon.LocationAtMapMoving\n\tlog(\"LocationAtMapMoving\",locationAtMap)\nelse\n\tif is_movable==true then\n\t\tlog(\"LocationAtMap\",locationAtMap)\n\tend\nend\n\nlocal tiles = {}\nlocal center = math.floor(row_count / 2)\nlocal width = 0.7\nlocal height = 1\nlocal entity_pos = Vector3(locationAtMap.x * self.GridSize.x, -locationAtMap.y * self.GridSize.y, 0)\nlocal zocFlags={}\nlocal debugZocLocs={}\n\nif is_movable then\n\tlocal weights={}\n\tlocal weightsIsEmpty=true\n\tlocal movePow=math.floor(entity.UnitCommon.MovableAreaSize/2)+1\n\tlocal nearPositions={\n\t\tVector2(-1,-1),Vector2(0,-1),Vector2(1,-1),\n\t\tVector2(-1,0),Vector2(1,0),\n\t\tVector2(-1,1),Vector2(0,1),Vector2(1,1)}\n\tfor i=1,#areas do\n\t\tlocal index = self:_GetIndexOfMap(areas, row_count, i, locationAtMap)\t\n\t\tif index~=nil then\n\t\t\tlocal mapIdx=self:_GetMapIndex(index.z,index.w)\n\t\t\tlocal otherEntity=_EntityService:GetEntity(self.Map[mapIdx])\n\t\t\t--scan all enemies in movable area\n\t\t\tif otherEntity and otherEntity.UnitCommon and entity.UnitCommon:CheckEnemy(otherEntity.UnitCommon.UnitType)==true then\n\t\t\t\t--mark weight+1 nearby enemy\n\t\t\t\tfor _,nearPos in ipairs(nearPositions) do\n\t\t\t\t\tlocal nearPos=nearPos+otherEntity.UnitCommon.LocationAtMap\n\t\t\t\t\tlocal nearMapIdx=self:_GetMapIndex(nearPos.x,nearPos.y)\n\t\t\t\t\tif weights[nearMapIdx]==nil then\n\t\t\t\t\t\tweights[nearMapIdx]=movePow+1\n\t\t\t\t\t\tweightsIsEmpty=false\n\t\t\t\t\t\tdebugZocLocs[nearMapIdx]=nearPos\n\t\t\t\t\telse\n\t\t\t\t\t\tweights[nearMapIdx]=weights[nearMapIdx]+movePow+1\n\t\t\t\t\tend\n\t\t\t\tend\n\t\t\tend\n\t\tend\n\tend\n\t--change weight value to 1 nearby player entity\n\tif weightsIsEmpty==false then\n\t\tfor _,nearPos in ipairs(nearPositions) do\n\t\t\tnearPos=nearPos+locationAtMap\n\t\t\tlocal nearMapIdx=self:_GetMapIndex(nearPos.x,nearPos.y)\n\t\t\tif weights[nearMapIdx]~=nil then\n\t\t\t\tweights[nearMapIdx]=1\n\t\t\tend\n\t\tend\t\n\tend\n\t\n\t--check movable flag equal less than movable size\n\tlocal entityMapIdx=self:_GetMapIndex(locationAtMap.x,locationAtMap.y)\n\tfor k,v in pairs(weights) do\n\t\tif v>movePow-1 and entityMapIdx~=k then\n\t\t\tzocFlags[k]=true\n\t\tend\n\tend\nend\n\nfor i=1, #areas do\n\tlocal index = self:_GetIndexOfMap(areas, row_count, i, locationAtMap)\t\n\tif index == nil then\n\t\tgoto skip_next\n\tend\n\t\n\tlocal rel_pos = Vector2(index.x, index.y)\n\tlocal map_index = self:_GetMapIndex(index.z, index.w)\n\tlocal other_entity_id = self.Map[map_index]\t\n\tif other_entity_id == nil then\n\t\tgoto skip_next\n\telseif is_movable then\n\t\tif other_entity_id ~= 0 and other_entity_id ~= entity.Id then\n\t\t\tgoto skip_next\n\t\telseif zocFlags[map_index]==true then\n\t\t\tgoto skip_next\n\t\tend\n\telse\n\t\tif other_entity_id == 0 then\n\t\t\tgoto skip_next\n\t\telse\n\t\t\tlocal other_entity = _EntityService:GetEntity(other_entity_id)\n\t\t\tif other_entity then\n\t\t\t\tif other_entity.UnitCommon==nil or false == entity.UnitCommon:CheckEnemy(other_entity.UnitCommon.UnitType) then\n\t\t\t\t\tgoto skip_next\n\t\t\t\tend\n\t\t\telse\n\t\t\t\tlog_error(\"Map has an invalid entity id\")\n\t\t\tend\n\t\tend\n\tend\n\n\tlocal pos = Vector3(0,0,0)\n\tpos.x = rel_pos.x * width\n\tpos.y = rel_pos.y * -height\t\n\tpos = pos + entity_pos\n\tlocal bias = Vector3(0, 0.5, 0)\n\tpos=pos+bias+self.MapOffset\n\n\tlocal tile = nil\t\n\tif is_movable then\t\t\n\t\ttile = self.movable_tile:Clone()\n\t\ttile.TileMovable.EntityID = entity.Id\n\t\ttile.TileMovable.MapPos = rel_pos + locationAtMap\n\telse\n\t\ttile = self.__properties.attackable_tile:Clone()\n\t\ttile.TileAttackable.EntityID = entity.Id\n\t\ttile.TileAttackable.RelPos = rel_pos\t\t\n\tend\t\n\t--tile.SpriteRendererComponent.OrderInLayer=\n\ttable.insert(tiles, tile)\t\n\t\n\ttile.TransformComponent.WorldPosition=pos\n\ttile.Enable = true\t\n\ttile.SpriteRendererComponent.Color = tile_color\t\n\t\n\t::skip_next::\nend\n\nreturn tiles",
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
          "DefaultValue": "{}",
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
      "Code": "local focused = false\n\nfor i=1, #entities do\n\tlocal entity = entities[i]\n\tentity.UnitCommon.Moved = false\n\tentity.UnitCommon.Done = false\n\tentity.SpriteRendererComponent.Color = self.enable_color\n\t\n\tif focused == false then\n\t\tfocused = true\n\t\t\n\t\tif auto_select then\n\t\t\tself:SelectUnit(entity,false)\n\t\telse\n\t\t\t_UserService.LocalPlayer.TransformComponent.WorldPosition = entity.TransformComponent.WorldPosition\n\t\tend\n\tend\nend",
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
      "Arguments": null,
      "Code": "if #self.entity_ids==0 then\n\tself:StartAlly()\n\treturn\nend\n\nlocal entity_id = table.remove(self.entity_ids, 1)\nlocal entity = _EntityService:GetEntity(entity_id)\n\nif entity then\n\t--if entity.StateComponent then\n\t--\tentity.StateComponent:AddState(\"MOVE\",nil)\n\t--\tentity.StateComponent:ChangeState(\"MOVE\")\n\t--end\n\t\n\tself:SelectUnit(entity,true)\n\t_UserService.LocalPlayer.TransformComponent.WorldPosition = entity.TransformComponent.WorldPosition\n\n\tlocal target_entity = self:_FindTarget(entity, self.Allies)\n\t\n\t-- can attack? do it and done\n\tif target_entity and entity.UnitCommon.Done==false then\n\t\tentity.SpriteRendererComponent.Color=self.disable_color\n\t\t\t\n\t\tlocal isDead=entity.UnitCommon:Attack(target_entity)\t\t\t\n\t\tif isDead==true then\n\t\t\tlog(\"_WorkdEnemy()/die\",target_entity.NameTagComponent.Name)\n\t\t\t\t\n\t\t\tif target_entity.NameTagComponent.Name==\"복례\" then\n\t\t\t\tself.StateGame.StateGameCommon:Finish(false)\n\t\t\t\treturn\t\t\n\t\t\tend\n\t\tend\n\telseif entity.UnitCommon.Moved == false then\t\t\t\n\t\tself:_MoveUnitAutomatically(entity,true)\n\t\tentity.UnitCommon.Moved = true\n\t\t\t\n\t\ttable.insert(self.entity_ids, entity.Id)\n\telse\n\t\tentity.SpriteRendererComponent.Color=self.disable_color\n\tend\nend\t\t\n\nself.TimerIdx=_TimerService:SetTimerOnce(function() self:_WorkEnemy() end, 1)",
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
          "DefaultValue": "nil",
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "allies",
          "Type": "table",
          "DefaultValue": "{}",
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "local areas = enemy_entity.UnitCommon.AttackAreas\r\nlocal area_size = enemy_entity.UnitCommon.AttackAreaSize\r\nlocal location_at_map = enemy_entity.UnitCommon.LocationAtMap\r\n\r\nfor i=1, #areas do\r\n\tlocal index = self:_GetIndexOfMap(areas, area_size, i, location_at_map)\r\n\t\r\n\tif index == nil then\r\n\t\tgoto skip_next\r\n\tend\r\n\t\r\n\tlocal attack_location = Vector2(index.z, index.w)\r\n\t\r\n\tfor j=1, #allies do\r\n\t\tlocal ally = allies[j]\r\n\t\t\r\n\t\tif ally.UnitCommon.LocationAtMap == attack_location then\r\n\t\t\treturn ally\r\n\t\tend\r\n\tend\r\n\t\r\n\t::skip_next::\r\nend\r\n\r\nreturn nil",
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
          "DefaultValue": "{}",
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "row_count",
          "Type": "number",
          "DefaultValue": "0",
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "index_of_area",
          "Type": "number",
          "DefaultValue": "0",
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "location_of_entity",
          "Type": "Vector2",
          "DefaultValue": "Vector2(0,0)",
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "--[[\r\nnil or Vector4\r\n\r\nx: x of relative positon\r\ny: y of relative position\r\nz: x axis of self.Map\r\nw: y axis of self.Map\r\n]]--\r\nlocal center = math.floor(row_count / 2)\r\nlocal area = areas[index_of_area]\r\n\t\r\nif area == 0 or area == nil then\r\n\treturn nil\r\nend\r\n\r\nindex_of_area = index_of_area - 1\r\nlocal x = index_of_area - math.floor(index_of_area / row_count) * row_count\r\nlocal y = index_of_area / row_count\r\ny = math.floor(y)\r\n\r\nlocal rel_pos = Vector2(0, 0)\r\n\r\nif x <= center then\r\n\trel_pos.x = center - x\r\n\trel_pos.x = rel_pos.x * -1\r\nelse\r\n\trel_pos.x = x - center\r\nend\r\n\r\nif y <= center then\r\n\trel_pos.y = center - y\t\t\r\n\trel_pos.y = rel_pos.y * -1\r\nelse\r\n\trel_pos.y = y - center\r\nend\r\n\r\nlocal map_pos = location_of_entity + rel_pos\r\n\r\nif map_pos.x >= self.MapSize.x or map_pos.y >= self.MapSize.y then\r\n\treturn nil\r\nelseif map_pos.x < 0 or map_pos.y < 0 then\r\n\treturn nil\r\nend\r\n\r\nreturn Vector4(rel_pos.x, rel_pos.y, map_pos.x, map_pos.y)",
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
          "DefaultValue": "0",
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "y",
          "Type": "number",
          "DefaultValue": "0",
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "-- convert one dimensional value from x, y\nreturn x + y * self.MapSize.x",
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
          "DefaultValue": "nil",
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "isEnemy",
          "Type": "boolean",
          "DefaultValue": null,
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "local targets=isEnemy==true and self.Allies or self.Enemies\n\n-- seek an ally\nif #targets==0 then\n\treturn\nend\n\n--find nearest target\nlocal target=nil\nlocal shortestLen=1/0\nfor _,allyEntity in ipairs(targets) do\n\tlocal len=self:getLength(allyEntity.UnitCommon.LocationAtMap,entity.UnitCommon.LocationAtMap)\n\tif len<shortestLen and allyEntity.UnitCommon.MovableAreaSize>1 then\n\t\tshortestLen=len\n\t\ttarget=allyEntity\n\tend\nend\n\nlocal start=entity.UnitCommon.LocationAtMap\nlocal goal=target.UnitCommon.LocationAtMap\nlocal path=self:findPath(start,goal)\n\t\nif #path then\n\tlocal areas=entity.UnitCommon.MovableAreas\n\tlocal rowCount=entity.UnitCommon.MovableAreaSize\n\tlocal locationAtMap=entity.UnitCommon.LocationAtMap\n\t\n\tfor i=1,#areas do\n\t\tlocal idx=self:_GetIndexOfMap(areas,rowCount,i,locationAtMap)\n\t\tif idx then\n\t\t\tfor _,p in pairs(path) do\n\t\t\t\tif p.x==idx.z and p.y==idx.w then\n\t\t\t\t\tlocal mapIdx=self:_GetMapIndex(p.x,p.y)\t\t\n\t\t\t\t\tif self.Map[mapIdx]==0 then\n\t\t\t\t\t\tself:MoveUnit(entity.Id,p)\n\t\t\t\t\t\treturn\n\t\t\t\t\tend\n\t\t\t\tend\n\t\t\tend\n\t\tend\n\tend\nend",
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
          "DefaultValue": "\"\"",
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "log(\"RemoveEntity entry\",entity.Name,entity.Id)\nlocal map_index = self:_GetMapIndex(entity.UnitCommon.LocationAtMap.x, entity.UnitCommon.LocationAtMap.y)\nself.Map[map_index] = 0\n\nlocal removed=false\nfor i,e in ipairs(self.Allies) do\n\tif e.Id==entity.Id then\n\t\tlog(\"**\",e.Name,e.Id)\n\t\ttable.remove(self.Allies,i)\n\t\tremoved=true\n\t\tbreak\n\tend\nend\n\nif removed==false then\n\tfor i,e in ipairs(self.Enemies) do\n\t\tif e.Id==entity.Id then\n\t\t\ttable.remove(self.Enemies,i)\n\t\t\tremoved=true\n\t\t\tbreak\n\t\tend\n\tend\nend\n\nif removed==true then\n\tlog(\"RemoveEntity() succeed\",entity.Name)\nend",
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
          "DefaultValue": "Vector2(0,0)",
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "entity_id",
          "Type": "string",
          "DefaultValue": "\"\"",
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "local entity = _EntityService:GetEntity(entity_id)\nif entity and entity.UnitCommon.Done==false then\n\tlocal pos = entity.UnitCommon.LocationAtMap + rel_pos\t\n\tfor _, enemy in ipairs(self.Enemies) do\n\t\tif enemy.UnitCommon.LocationAtMap == pos then\t\t\n\t\t\tentity.UnitCommon:Attack(enemy)\t\t\t\n\t\t\tentity.UnitCommon.Done = true\n\t\t\tentity.SpriteRendererComponent.Color = self.disable_color\t\n\t\t\t\n\t\t\tlocal ui=_EntityService:GetEntityByPath(\"/ui/UIBattleCmd\")\n\t\t\tui.Visible=false\n\t\t\tbreak\n\t\tend\n\tend\nend\n\t\nself.TimerIdx=_TimerService:SetTimerOnce(function() self:CheckNextTurnEnabled(false) end,1)",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "findPath",
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
          "Type": "Vector2",
          "DefaultValue": "Vector2(0,0)",
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "goal",
          "Type": "Vector2",
          "DefaultValue": "Vector2(0,0)",
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "local visited,visiting={},{start}\nlocal nodes,bypass={},{}\nlocal startIdx=self:_GetMapIndex(start.x,start.y)\nnodes[startIdx]=0\nbypass[startIdx]=start\n\nlocal found=false\nwhile found==false do\n\tlocal curNode=self:popNearest(visiting,goal)\n\tif curNode==nil then\n\t\tbreak\n\tend\n\ttable.insert(visited,curNode)\n\n\tlocal curIdx=self:_GetMapIndex(curNode.x,curNode.y)\t\n\tlocal distCur=nodes[curIdx]\n\tlocal nearbyNodes=self:getNearby(curNode,goal)\n\tfor _,nearby in pairs(nearbyNodes) do\n\t\tlocal nearbyIdx=self:_GetMapIndex(nearby.x,nearby.y)\n\t\tif nearby.x==goal.x and nearby.y==goal.y then\n\t\t\tbypass[nearbyIdx]=curNode\n\t\t\tfound=true\n\t\t\tbreak\n\t\tend\n\t\t\n\t\tif nodes[nearbyIdx]==nil then\n\t\t\tlocal distBetweenTile=self:getLength(curNode,nearby)\n\t\t\tnodes[nearbyIdx]=distBetweenTile+distCur\n\t\t\tbypass[nearbyIdx]=curNode\n\t\t\t\n\t\t\ttable.insert(visiting,nearby)\t\t\n\t\telse\n\t\t\tlocal distSince=nodes[nearbyIdx]\n\t\t\tif distSince>distSince+distCur then\n\t\t\t\tnodes[nearbyIdx]=distCur+distSince\n\t\t\t\tbypass[nearbyIdx]=curNode\n\t\t\tend\n\t\tend\n\tend\nend\nreturn bypass\n--[[\nlocal path={goal}\nlocal pass=goal\nwhile true do\n\tlocal passIdx=self:_GetMapIndex(pass.x,pass.y)\n\tlocal next=bypass[passIdx]\n\tif next==nil then\n\t\treturn nil\n\telseif next.x==pass.x and next.y==pass.y then\n\t\treturn path\n\telse\n\t\tpass=next\n\t\ttable.insert(path,1,pass)\n\tend\nend\nreturn nil\n]]--",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "getLength",
      "Return": {
        "Name": null,
        "Type": "number",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [
        {
          "Name": "p1",
          "Type": "any",
          "DefaultValue": "nil",
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "p2",
          "Type": "any",
          "DefaultValue": "nil",
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "local dx=p1.x-p2.x\nlocal dy=p1.y-p2.y\nreturn math.sqrt(dx^2+dy^2)",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "getNearby",
      "Return": {
        "Name": null,
        "Type": "table",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [
        {
          "Name": "node",
          "Type": "any",
          "DefaultValue": "nil",
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "goal",
          "Type": "Vector2",
          "DefaultValue": "Vector2(0,0)",
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "--relative positions of eight direction\nlocal rels={\n\t{x=-1,y=-1},{x=0,y=-1},{x=1,y=-1},\n\t{x=-1,y=0},{x=1,y=0},\n\t{x=-1,y=1},{x=0,y=1},{x=1,y=1},\n}\nlocal goalIdx=self:_GetMapIndex(goal.x,goal.y)\nlocal result={}\nfor _,v in pairs(rels) do\n\tlocal x=node.x-v.x\n\tlocal y=node.y-v.y    \n\tif 1<=x and x<=self.MapSize.x and 1<=y and y<=self.MapSize.y then\n\t\tlocal mapIdx=self:_GetMapIndex(x,y)\n\t\tif mapIdx==goalIdx or self.Map[mapIdx]==0 then\n\t\t\ttable.insert(result,Vector2(x,y))\n\t\tend\n\tend\nend\nreturn result",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    },
    {
      "Name": "popNearest",
      "Return": {
        "Name": null,
        "Type": "any",
        "DefaultValue": null,
        "Description": null,
        "SyncDirection": 0
      },
      "Arguments": [
        {
          "Name": "visiting",
          "Type": "table",
          "DefaultValue": "{}",
          "Description": null,
          "SyncDirection": 0
        },
        {
          "Name": "goal",
          "Type": "Vector2",
          "DefaultValue": "Vector2(0,0)",
          "Description": null,
          "SyncDirection": 0
        }
      ],
      "Code": "if #visiting==0 then\n\treturn nil\nend\n\nlocal shortestLength=1/0\nlocal shortestIdx=nil\nfor i,pos in ipairs(visiting) do\n\tlocal length=self:getLength(pos,goal)\n\tif shortestLength>length then\n\t\tshortestLength=length\n\t\tshortestIdx=i\n\tend\nend\n\nreturn table.remove(visiting,shortestIdx)",
      "Description": null,
      "Scope": 2,
      "ExecSpace": 0
    }
  ],
  "EventEmitters": [],
  "EventHandlers": [],
  "EntityEventHandlers": []
}8�ӵ����J a7aea0eaa9c442208309517955c455d3��
 fc1fb83824cf4b55b9c21b5ee0479263 f632dad4121d46e3a8e3e76f7cc1979c,gamelogic://92bdf71d7d9c4fef9589214e99fa4ac3"x-mod/gamelogic2���
$e0f25011-2de8-41f9-81e3-12b1f3a5ea5b/common�{
  "name": "common",
  "path": "/common",
  "nameEditable": false,
  "enable": true,
  "visible": true,
  "@components": [],
  "@version": 1
}�
$e02ea149-d683-410b-a802-c82aa0881525/common/DataManager�{
  "name": "DataManager",
  "path": "/common/DataManager",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMapObject$000fe9c23a0f4a1bbfa15d6d8e66c4f0",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 1.70786428,
        "y": 6.51747227,
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
      "SpriteRUID": "c35dc58fa0254fc3942d99ea83b10c10",
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
      "EndFrameIndex": 7,
      "PlayRate": 1.0,
      "ActionSheet": {},
      "Enable": true,
      "@type": "MOD.Core.SpriteRendererComponent"
    },
    {
      "Version": "",
      "StageName": "",
      "IsSaving": false,
      "Enable": true,
      "@type": "script.DataManager"
    }
  ],
  "@version": 1
}"OMOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,script.DataManager�!
$bba3259e-aeba-4c3f-b82a-3ce36d2b19d1/common/TurnManager�{
  "name": "TurnManager",
  "path": "/common/TurnManager",
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
        "x": 1.767948,
        "y": 4.015919,
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
      "Enable": true,
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
      "turnIdx": 0.0,
      "MapOffset": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "TimerIdx": 0.0,
      "Enable": true,
      "@type": "script.TurnManager"
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.StateComponent,MOD.Core.ChatBalloonComponent,MOD.Core.NameTagComponent,script.TurnManager�
$e0d4b422-2cbd-4183-942a-572ce7485019/common/CameraManager�{
  "name": "CameraManager",
  "path": "/common/CameraManager",
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
        "x": 1.76158,
        "y": 5.092113,
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
      "Enable": true,
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
      "Name": "CameraManager",
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
$5db34dee-6bed-4994-b7a6-b427ab9c5058/common/StateTitle�{
  "name": "StateTitle",
  "path": "/common/StateTitle",
  "nameEditable": true,
  "enable": true,
  "visible": false,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryNpc$00d05bcb44a14e688eeaa3a7548fa45b",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 1.70937419,
        "y": 6.073692,
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
      "Enable": true,
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
      "isValid": false,
      "Enable": true,
      "@type": "script.StateTitle"
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.StateComponent,MOD.Core.ChatBalloonComponent,MOD.Core.NameTagComponent,script.StateTitle�"
$84624d5b-ed15-4d87-adc7-506b5dd9c6af/common/StateGame01�{
  "name": "StateGame01",
  "path": "/common/StateGame01",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryNpc$007526f8ecdd4847913604d699caf184",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 1.86227334,
        "y": 7.219533,
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
      "SpriteRUID": "9eaa68f2817a432387fb025713970a3b",
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
        "stand": "9eaa68f2817a432387fb025713970a3b",
        "playing": "5bdfcae716ce45078ff08e6b2bffab1c",
        "spark": "e4a4607f3514416bb6c0754d6ab835ea"
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
      "Enable": true,
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
      "timerIdx": 0.0,
      "Enable": true,
      "@type": "script.StateGame01"
    },
    {
      "MapSize": {
        "x": 0.0,
        "y": 0.0
      },
      "TurnMgr": "0",
      "MapOffset": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "TileSpriteRUID": "",
      "Enable": true,
      "@type": "script.StateGameCommon"
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.StateComponent,MOD.Core.ChatBalloonComponent,MOD.Core.NameTagComponent,script.StateGame01,script.StateGameCommon�"
$85b02275-5f29-4ce8-9892-177394da3932/common/StateGame02� {
  "name": "StateGame02",
  "path": "/common/StateGame02",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryNpc$007526f8ecdd4847913604d699caf184",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 3.061596,
        "y": 7.244714,
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
      "SpriteRUID": "9eaa68f2817a432387fb025713970a3b",
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
        "stand": "9eaa68f2817a432387fb025713970a3b",
        "playing": "5bdfcae716ce45078ff08e6b2bffab1c",
        "spark": "e4a4607f3514416bb6c0754d6ab835ea"
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
      "timerIdx": 0.0,
      "MapOffset": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "Enable": true,
      "@type": "script.StateGame02"
    },
    {
      "MapSize": {
        "x": 0.0,
        "y": 0.0
      },
      "TurnMgr": "0",
      "MapOffset": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "TileSpriteRUID": "",
      "Enable": true,
      "@type": "script.StateGameCommon"
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.StateComponent,MOD.Core.ChatBalloonComponent,MOD.Core.NameTagComponent,script.StateGame02,script.StateGameCommon�#
$13177f91-8435-4e18-ad72-65d1110aaa6e/common/StateGame03� {
  "name": "StateGame03",
  "path": "/common/StateGame03",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryNpc$007526f8ecdd4847913604d699caf184",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 4.22459841,
        "y": 7.23490524,
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
      "SpriteRUID": "9eaa68f2817a432387fb025713970a3b",
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
        "stand": "9eaa68f2817a432387fb025713970a3b",
        "playing": "5bdfcae716ce45078ff08e6b2bffab1c",
        "spark": "e4a4607f3514416bb6c0754d6ab835ea"
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
      "Name": "StateGame03",
      "FontSize": 1.0,
      "OffsetY": 0.0,
      "Enable": true,
      "@type": "MOD.Core.NameTagComponent"
    },
    {
      "StateGame": "",
      "MapSize": {
        "x": 0.0,
        "y": 0.0
      },
      "TurnMgr": "0",
      "MapOffset": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "TileSpriteRUID": "",
      "Enable": true,
      "@type": "script.StateGameCommon"
    },
    {
      "MapOffset": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "ScreenSize": {
        "x": 0.0,
        "y": 0.0
      },
      "TimerIdx": 0.0,
      "Enable": true,
      "@type": "script.StateGame03"
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.StateComponent,MOD.Core.ChatBalloonComponent,MOD.Core.NameTagComponent,script.StateGameCommon,script.StateGame03�!
$c93c6b0e-d275-4f65-b15c-22d4ceb4fed8/common/StateGame04�{
  "name": "StateGame04",
  "path": "/common/StateGame04",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryNpc$007526f8ecdd4847913604d699caf184",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 4.225175,
        "y": 5.801573,
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
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.TransformComponent"
    },
    {
      "SpriteRUID": "9eaa68f2817a432387fb025713970a3b",
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
        "stand": "9eaa68f2817a432387fb025713970a3b",
        "playing": "5bdfcae716ce45078ff08e6b2bffab1c",
        "spark": "e4a4607f3514416bb6c0754d6ab835ea"
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
      "Name": "StateGame04",
      "FontSize": 1.0,
      "OffsetY": 0.0,
      "Enable": true,
      "@type": "MOD.Core.NameTagComponent"
    },
    {
      "StateGame": "",
      "MapSize": {
        "x": 0.0,
        "y": 0.0
      },
      "TurnMgr": "0",
      "MapOffset": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "TileSpriteRUID": "",
      "Enable": true,
      "@type": "script.StateGameCommon"
    },
    {
      "Enable": true,
      "@type": "script.StateGame04"
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.StateComponent,MOD.Core.ChatBalloonComponent,MOD.Core.NameTagComponent,script.StateGameCommon,script.StateGame04�
$5f1aaed3-2304-4f1f-9e2d-6c92cf162a51/common/StateManager�{
  "name": "StateManager",
  "path": "/common/StateManager",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryNpc$0080a089b015426aa57c44910cc178a8",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 2.87558675,
        "y": 6.153498,
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
        "x": 0.569093,
        "y": 0.5690928,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.TransformComponent"
    },
    {
      "SpriteRUID": "74e01c235ea8431588227224d019a132",
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
        "stand": "74e01c235ea8431588227224d019a132",
        "die1": "fba0f74d5f554b75a6615ce52f36411f"
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
      "Enable": true,
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
      "Name": "npc-5",
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
$4d55d67d-abd9-4658-9617-013a727cd035/common/TileAttackable�{
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
        "x": 0.3914323,
        "y": 10.9122229,
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
        "x": 2.0,
        "y": 3.0,
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
      "OrderInLayer": 2,
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
      "EntityID": "",
      "RelPos": {
        "x": 0.0,
        "y": 0.0
      },
      "Enable": true,
      "@type": "script.TileAttackable"
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
}"qMOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,script.TileAttackable,MOD.Core.TouchReceiveComponent�
$8bdf279c-189c-413d-862c-f9b941a10bff/common/TileMovable�{
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
        "x": 1.01494431,
        "y": 10.9216633,
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
        "x": 2.0,
        "y": 3.0,
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
      "OrderInLayer": 2,
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
      "EntityID": "",
      "turn_mgr": "",
      "MapPos": {
        "x": 0.0,
        "y": 0.0
      },
      "Enable": true,
      "@type": "script.TileMovable"
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
}"nMOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,script.TileMovable,MOD.Core.TouchReceiveComponent8���隄��Ϭ
 f51ca7a1a8ea411b996cd28d33671cdc f632dad4121d46e3a8e3e76f7cc1979cmap://map01"	x-mod/map2��
 c4f0478a343f44428b1eb71de7a99d55/maps/map01�{
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
    },
    {
      "Mute": false,
      "Volume": 1.0,
      "Loop": false,
      "AudioClipRUID": "d6308ef193bf40b8a4774f6ef3d4629a",
      "SoundTestInEditMode": false,
      "Bgm": true,
      "PlayOnEnable": true,
      "ThumbnailPath": "d6/30/d6308ef193bf40b8a4774f6ef3d4629a_64.png",
      "Enable": true,
      "@type": "MOD.Core.SoundComponent"
    }
  ],
  "@version": 1
}"fMOD.Core.MapComponent,MOD.Core.MapPropertyComponent,MOD.Core.FootholdComponent,MOD.Core.SoundComponent�
$a68bf238-c1f6-4b72-a823-2f296872de99/maps/map01/BackGroundTemplate�{
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
      "MapRUID": "e31d43adea3b46549c3f68f581affda1",
      "SolidColor": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "BackgroundUrl": "",
      "Enable": true,
      "@type": "MOD.Core.BackgroundTemplateComponent"
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
      "Type": 2,
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
}"<MOD.Core.BackgroundTemplateComponent,MOD.Core.ImageComponent�
$24985ed3-e75f-4f9d-a719-649a65237aa7/maps/map01/MapleMapLayer�{
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
      "thumbnail": "iVBORw0KGgoAAAANSUhEUgAAAMgAAABkCAYAAADDhn8LAAABdUlEQVR4Ae3QMQEAAADCoPVPbQwfiEBhwIABAwYMGDBgwIABAwYMGDBgwIABAwYMGDBgwIABAwYMGDBgwIABAwYMGDBgwIABAwYMGDBgwIABAwYMGDBgwIABAwYMGDBgwIABAwYMGDBgwIABAwYMGDBgwIABAwYMGDBgwIABAwYMGDBgwIABAwYMGDBgwIABAwYMGDBgwIABAwYMGDBgwIABAwYMGDBgwIABAwYMGDBgwIABAwYMGDBgwIABAwYMGDBgwIABAwYMGDBgwIABAwYMGDBgwIABAwYMGDBgwIABAwYMGDBgwIABAwYMGDBgwIABAwYMGDBgwIABAwYMGDBgwIABAwYMGDBgwIABAwYMGDBgwIABAwYMGDBgwIABAwYMGDBgwIABAwYMGDBgwIABAwYMGDBgwIABAwYMGDBgwIABAwYMGDBgwIABAwYMGDBgwIABAwYMGDBgwIABAwYMGDBgwIABAwYMGDBgwIABAwY+AwM48wABxKIRswAAAABJRU5ErkJggg==",
      "MapLayerName": "Layer1",
      "LayerSortOrder": 0,
      "Enable": true,
      "@type": "MOD.Core.MapLayerComponent"
    }
  ],
  "@version": 1
}"MOD.Core.MapLayerComponent�	
$af6cf18a-8aeb-4a46-aa33-5cf08d976077/maps/map01/TileMap�{
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
        "DataId": "e0968f13bd5c402ea2af3fce389713fe"
      },
      "IsOddGridPosition": false,
      "SortingLayer": "MapLayer0",
      "OrderInLayer": 1,
      "Enable": true,
      "@type": "MOD.Core.TileMapComponent"
    }
  ],
  "@version": 1
}"5MOD.Core.TransformComponent,MOD.Core.TileMapComponent�
$8a9f5252-45a6-4111-abe1-bfc34dda6aa0/maps/map01/TileGrass2�{
  "name": "TileGrass2",
  "path": "/maps/map01/TileGrass2",
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
        "x": 0.7349957,
        "y": 15.9339123,
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
      "OrderInLayer": 1,
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
}"<MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent�
$85f9dbf5-2d3d-4215-9d81-b998d9b5cfe1/maps/map01/MapleMapLayer_1�{
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
$096aba11-8f33-4ad7-bc05-442b0a839e4a/maps/map01/TileMap_1�{
  "name": "TileMap_1",
  "path": "/maps/map01/TileMap_1",
  "nameEditable": false,
  "enable": false,
  "visible": false,
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
      "tileMapVersion": 1,
      "tiles": [],
      "footholdWalk": 1.0,
      "footholdForce": 0.0,
      "footholdDrag": 2.5,
      "TileSetRUID": {
        "DataId": ""
      },
      "IsOddGridPosition": false,
      "SortingLayer": "MapLayer1",
      "OrderInLayer": 0,
      "Enable": true,
      "@type": "MOD.Core.TileMapComponent"
    }
  ],
  "@version": 1
}"5MOD.Core.TransformComponent,MOD.Core.TileMapComponent�+
$645cccea-81cf-4b6a-ad42-4b851a830837/maps/map01/UnitJumrye�({
  "name": "UnitJumrye",
  "path": "/maps/map01/UnitJumrye",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMonster$23fc7e7f19d047a1ad23bba942ecc7b8",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": -1.20817327,
        "y": 16.7714348,
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
      "SpriteRUID": "8bc65d375f3749a6b29b0e12dd21c747",
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
        "move": "8bc65d375f3749a6b29b0e12dd21c747",
        "stand": "304c330c63be41339e2658e253b08925",
        "attack1": "80f30f5f210f40d2b036bb7924b2b8a6",
        "attack2": "68a11f388f374dbd82c41846838f9248",
        "attack3": "30328be58cfd484583a11887d93f704c",
        "attack4": "ad0fc40c492f4cb8a207e9e6d0e09d41",
        "skill1": "27e8c36518f7452aab3a86d63ecebffd",
        "hit1": "15b73e38ddbc46709f3399da6a5752ba",
        "die1": "73b1841e26f049e1a6aa160beb03f1d7"
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
      "@type": "MOD.Core.AIComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateStringToMonsterActionComponent"
    },
    {
      "BoxSize": {
        "x": 0.52,
        "y": 0.65
      },
      "BoxOffset": {
        "x": 0.0199999958,
        "y": 0.325
      },
      "Enable": true,
      "@type": "MOD.Core.HitComponent"
    },
    {
      "Enable": false,
      "@type": "MOD.Core.DamageSkinSpawnerComponent"
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
      "Name": "점례",
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
      "Talked": false,
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
    },
    {
      "ChatModeEnabled": true,
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
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.AIComponent,MOD.Core.StateComponent,MOD.Core.StateStringToMonsterActionComponent,MOD.Core.HitComponent,MOD.Core.DamageSkinSpawnerComponent,MOD.Core.NameTagComponent,script.UnitCommon,MOD.Core.TouchReceiveComponent,MOD.Core.ChatBalloonComponent�*
$917fbf8c-10e8-4835-a8d4-1b6b5f97c2a1/maps/map01/UnitMalsun�'{
  "name": "UnitMalsun",
  "path": "/maps/map01/UnitMalsun",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMonster$43fe0b2071634140a187296fcf636572",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": -4.55304337,
        "y": 15.5602436,
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
      "SpriteRUID": "952e567184ed430993247c1b5c114e74",
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
        "move": "952e567184ed430993247c1b5c114e74",
        "stand": "09bb3868216848959dba9e4530746ec4",
        "attack1": "f9e16baf14024e8791e53de92826820a",
        "skill1": "f76fedaa95614cc9a4d4b20c33dd023f",
        "hit1": "77d7c15f155c45c480006376e80bb67a",
        "die1": "e7c74618e5a6404eabb708c16f58b12d"
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
      "@type": "MOD.Core.AIComponent"
    },
    {
      "Enable": false,
      "@type": "MOD.Core.StateComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateStringToMonsterActionComponent"
    },
    {
      "BoxSize": {
        "x": 0.6,
        "y": 1.01
      },
      "BoxOffset": {
        "x": 0.0300000012,
        "y": 0.505
      },
      "Enable": false,
      "@type": "MOD.Core.HitComponent"
    },
    {
      "Enable": false,
      "@type": "MOD.Core.DamageSkinSpawnerComponent"
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
      "Talked": false,
      "Enable": true,
      "@type": "script.UnitCommon"
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
      "Name": "말순",
      "FontSize": 1.0,
      "OffsetY": 0.0,
      "Enable": true,
      "@type": "MOD.Core.NameTagComponent"
    },
    {
      "ChatModeEnabled": true,
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
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.AIComponent,MOD.Core.StateComponent,MOD.Core.StateStringToMonsterActionComponent,MOD.Core.HitComponent,MOD.Core.DamageSkinSpawnerComponent,MOD.Core.TouchReceiveComponent,script.UnitCommon,MOD.Core.NameTagComponent,MOD.Core.ChatBalloonComponent�"
$0974b15c-94ae-4116-8ebc-43e2dc0672ef/maps/map01/UnitKidong� {
  "name": "UnitKidong",
  "path": "/maps/map01/UnitKidong",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMonster$4e363102ade649b689e378dd0704f55a",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 4.368412,
        "y": 11.828186,
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
      "SpriteRUID": "53297c43a8ad4ee0a456bfa4fab10f86",
      "LocalPosition": {
        "x": 0.0,
        "y": -0.3
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
        "stand": "53297c43a8ad4ee0a456bfa4fab10f86",
        "hit1": "3fe7ebf7dadc4d0eb37765b0f1052d9a",
        "die1": "37b8e144f76d42408eb0b32e8fd015d6",
        "attack1": "d7b4c641aa9a4dedb1b14f08fcbb6710",
        "skill1": "5ef570c599d24f859717541ed35277a3",
        "skill2": "6de66ee3a0fb4f56b83edcc52ee783da",
        "skill3": "aaab3909dfeb414a9fcd6d1dead3c369",
        "skill4": "28c5d807d91244f8bfb7ab3210ea0b4c"
      },
      "Enable": true,
      "@type": "MOD.Core.SpriteRendererComponent"
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
      "Talked": false,
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
      "Name": "귀동",
      "FontSize": 1.0,
      "OffsetY": 0.3,
      "Enable": true,
      "@type": "MOD.Core.NameTagComponent"
    },
    {
      "ChatModeEnabled": true,
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
      "Offset": 3,
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
      "Enable": true,
      "@type": "MOD.Core.StateComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateStringToMonsterActionComponent"
    },
    {
      "BoxSize": {
        "x": 1.11,
        "y": 1.19
      },
      "BoxOffset": {
        "x": -0.07999998,
        "y": 0.835000038
      },
      "Enable": true,
      "@type": "MOD.Core.HitComponent"
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,script.UnitCommon,MOD.Core.TouchReceiveComponent,MOD.Core.NameTagComponent,MOD.Core.ChatBalloonComponent,MOD.Core.StateComponent,MOD.Core.StateStringToMonsterActionComponent,MOD.Core.HitComponent�)
$e10b5d2e-1025-4378-bb62-d62a5f5313af/maps/map01/UnitMilitia0�&{
  "name": "UnitMilitia0",
  "path": "/maps/map01/UnitMilitia0",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMonster$808b0144e6294c9f98f7c41d18ed199d",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": -4.42373753,
        "y": 14.3546181,
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
      "SpriteRUID": "823d3542da7c43ea8bc8f99590b6f2da",
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
        "stand": "af5a8582517b4476a508f1429872f253",
        "move": "823d3542da7c43ea8bc8f99590b6f2da",
        "hit1": "814d4a19b1654aa28c3a96e4ab530e91",
        "die1": "c01530dfc2624f0b8414045ad1563e6b"
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
      "@type": "MOD.Core.AIComponent"
    },
    {
      "Enable": false,
      "@type": "MOD.Core.StateComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateStringToMonsterActionComponent"
    },
    {
      "BoxSize": {
        "x": 0.74,
        "y": 1.01
      },
      "BoxOffset": {
        "x": -0.0300000012,
        "y": 0.505
      },
      "Enable": false,
      "@type": "MOD.Core.HitComponent"
    },
    {
      "Enable": false,
      "@type": "MOD.Core.DamageSkinSpawnerComponent"
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
      "Talked": false,
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
      "Name": "느린토끼",
      "FontSize": 1.0,
      "OffsetY": 0.0,
      "Enable": true,
      "@type": "MOD.Core.NameTagComponent"
    },
    {
      "ChatModeEnabled": true,
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
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.AIComponent,MOD.Core.StateComponent,MOD.Core.StateStringToMonsterActionComponent,MOD.Core.HitComponent,MOD.Core.DamageSkinSpawnerComponent,script.UnitCommon,MOD.Core.TouchReceiveComponent,MOD.Core.NameTagComponent,MOD.Core.ChatBalloonComponent�*
$5fe694e1-97bc-4f15-b93a-7105f2e66ed0/maps/map01/UnitMalza�&{
  "name": "UnitMalza",
  "path": "/maps/map01/UnitMalza",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMonster$896732ed59754635990b9b2040c27efb",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": -0.218602657,
        "y": 16.6135979,
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
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.TransformComponent"
    },
    {
      "SpriteRUID": "a955046c78c3470292f42a89bfb5719a",
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
        "stand": "790845793b714ae989f03301673ed674",
        "move": "a955046c78c3470292f42a89bfb5719a",
        "attack1": "feb66d62fdab4079992da9df50b83ba8",
        "hit1": "4ded3b4196aa4a6a8bd71bce21171f3a",
        "die1": "232bac7795b14c9d8c100d6361f6b73a"
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
      "@type": "MOD.Core.AIComponent"
    },
    {
      "Enable": false,
      "@type": "MOD.Core.StateComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateStringToMonsterActionComponent"
    },
    {
      "BoxSize": {
        "x": 0.98,
        "y": 0.73
      },
      "BoxOffset": {
        "x": 0.01000002,
        "y": 0.365
      },
      "Enable": true,
      "@type": "MOD.Core.HitComponent"
    },
    {
      "Enable": false,
      "@type": "MOD.Core.DamageSkinSpawnerComponent"
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
      "Talked": false,
      "Enable": true,
      "@type": "script.UnitCommon"
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
      "Name": "말자",
      "FontSize": 1.0,
      "OffsetY": 0.0,
      "Enable": true,
      "@type": "MOD.Core.NameTagComponent"
    },
    {
      "ChatModeEnabled": true,
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
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.AIComponent,MOD.Core.StateComponent,MOD.Core.StateStringToMonsterActionComponent,MOD.Core.HitComponent,MOD.Core.DamageSkinSpawnerComponent,MOD.Core.TouchReceiveComponent,script.UnitCommon,MOD.Core.NameTagComponent,MOD.Core.ChatBalloonComponent�*
$39c76cae-0cdd-4a68-84a8-09c7d8606350/maps/map01/UnitSunrye�'{
  "name": "UnitSunrye",
  "path": "/maps/map01/UnitSunrye",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMonster$9f407577fd6641d5a0def609cd66f737",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": -5.279934,
        "y": 11.9483709,
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
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.TransformComponent"
    },
    {
      "SpriteRUID": "172206ccff1e48238b91e8ca7362fbf0",
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
        "stand": "4befcbbcbfe54ec3a4a31c5a0a6b94e2",
        "move": "172206ccff1e48238b91e8ca7362fbf0",
        "attack1": "82aae3fc0f6f4606a8ca96a1c8ad5a9c",
        "attack2": "fdb3b303902f4d3b90247c3d883d4308",
        "attack3": "d13b015edbe44e13a6950121cd9704b2",
        "hit1": "d6c61dabd04d40e088b94094c6b3dd8e",
        "die1": "a6681964c0f64d8fa899956229a66c5d"
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
      "@type": "MOD.Core.AIComponent"
    },
    {
      "Enable": false,
      "@type": "MOD.Core.StateComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateStringToMonsterActionComponent"
    },
    {
      "BoxSize": {
        "x": 0.86,
        "y": 0.86
      },
      "BoxOffset": {
        "x": 0.0600000024,
        "y": 0.43
      },
      "Enable": false,
      "@type": "MOD.Core.HitComponent"
    },
    {
      "Enable": false,
      "@type": "MOD.Core.DamageSkinSpawnerComponent"
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
      "Talked": false,
      "Enable": true,
      "@type": "script.UnitCommon"
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
      "Name": "순례",
      "FontSize": 1.0,
      "OffsetY": 0.0,
      "Enable": true,
      "@type": "MOD.Core.NameTagComponent"
    },
    {
      "ChatModeEnabled": true,
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
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.AIComponent,MOD.Core.StateComponent,MOD.Core.StateStringToMonsterActionComponent,MOD.Core.HitComponent,MOD.Core.DamageSkinSpawnerComponent,MOD.Core.TouchReceiveComponent,script.UnitCommon,MOD.Core.NameTagComponent,MOD.Core.ChatBalloonComponent�*
$3143df4b-6638-47ec-b7d3-3bbecc3feced/maps/map01/UnitBokrye�'{
  "name": "UnitBokrye",
  "path": "/maps/map01/UnitBokrye",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMonster$b1edacc7339f45c6bab65720aa652eb0",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": -5.47909927,
        "y": 15.5026226,
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
      "SpriteRUID": "6a693774b9e340eaa941a2833c47f5a3",
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
        "move": "6a693774b9e340eaa941a2833c47f5a3",
        "stand": "86f465bc75844ee08c14bdb4e62fe180",
        "hit1": "9c5709f3b7444a72aa0d8ca84a6fb17e",
        "die1": "de45609d4c004de0aaca21c9540e8493",
        "jump": "57a5af71c18b4cfebcfd52001cde410a",
        "skill1": "e8453d44facc4f99814c52975c63a9aa",
        "skillAfter1": "71fd53cefdc64b96adf2b094ec02dc7c"
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
      "InputSpeed": 1.5,
      "JumpForce": 6.0,
      "Enable": false,
      "@type": "MOD.Core.MonsterMovementComponent"
    },
    {
      "Enable": false,
      "@type": "MOD.Core.AIChaseComponent"
    },
    {
      "Enable": false,
      "@type": "MOD.Core.StateComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateStringToMonsterActionComponent"
    },
    {
      "BoxSize": {
        "x": 0.57,
        "y": 0.81
      },
      "BoxOffset": {
        "x": 0.025000006,
        "y": 0.395
      },
      "Enable": false,
      "@type": "MOD.Core.HitComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.DamageSkinSpawnerComponent"
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
      "Talked": false,
      "Enable": true,
      "@type": "script.UnitCommon"
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
      "Name": "복례",
      "FontSize": 1.0,
      "OffsetY": 0.0,
      "Enable": true,
      "@type": "MOD.Core.NameTagComponent"
    },
    {
      "ChatModeEnabled": true,
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
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.AIChaseComponent,MOD.Core.StateComponent,MOD.Core.StateStringToMonsterActionComponent,MOD.Core.HitComponent,MOD.Core.DamageSkinSpawnerComponent,MOD.Core.TouchReceiveComponent,script.UnitCommon,MOD.Core.NameTagComponent,MOD.Core.ChatBalloonComponent�*
$04157b97-1ada-478f-be31-13af63955343/maps/map01/UnitRebel0�&{
  "name": "UnitRebel0",
  "path": "/maps/map01/UnitRebel0",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMonster$9f976b4241a64af3b9867851b8964f20",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": -0.323367119,
        "y": 14.4397564,
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
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.TransformComponent"
    },
    {
      "SpriteRUID": "6ad988b3ef6d4ceab3a504d300755a5b",
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
        "move": "6ad988b3ef6d4ceab3a504d300755a5b",
        "stand": "96e955c1bf27415e84f96deea200a8f1",
        "jump": "94bbe2a7eb9c4f9caa10dd9de44ee860",
        "hit1": "aec9504d5dc24aceb5646b79d30abad4",
        "die1": "65a2bfb039614f2e9e4ccc354340153d"
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
      "InputSpeed": 1.5,
      "JumpForce": 6.0,
      "Enable": false,
      "@type": "MOD.Core.MonsterMovementComponent"
    },
    {
      "Enable": false,
      "@type": "MOD.Core.AIChaseComponent"
    },
    {
      "Enable": false,
      "@type": "MOD.Core.StateComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateStringToMonsterActionComponent"
    },
    {
      "BoxSize": {
        "x": 0.63,
        "y": 0.58
      },
      "BoxOffset": {
        "x": 0.0449999869,
        "y": 0.29
      },
      "Enable": false,
      "@type": "MOD.Core.HitComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.DamageSkinSpawnerComponent"
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
      "Talked": false,
      "Enable": true,
      "@type": "script.UnitCommon"
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
      "Name": "버섯",
      "FontSize": 1.0,
      "OffsetY": 0.0,
      "Enable": true,
      "@type": "MOD.Core.NameTagComponent"
    },
    {
      "ChatModeEnabled": true,
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
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.AIChaseComponent,MOD.Core.StateComponent,MOD.Core.StateStringToMonsterActionComponent,MOD.Core.HitComponent,MOD.Core.DamageSkinSpawnerComponent,MOD.Core.TouchReceiveComponent,script.UnitCommon,MOD.Core.NameTagComponent,MOD.Core.ChatBalloonComponent�)
$7486267f-930c-4913-bb2d-419f2b541ecb/maps/map01/UnitRebel1�&{
  "name": "UnitRebel1",
  "path": "/maps/map01/UnitRebel1",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMonster$0c1d1abecc7046aab48a665c0fb7788f",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": -0.4111042,
        "y": 15.4639254,
        "z": 999.988
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
      "SpriteRUID": "4d6190231a66495ebc0ab239c3dda245",
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
        "stand": "979f072804d04c9e99257f5f24e5bb70",
        "move": "4d6190231a66495ebc0ab239c3dda245",
        "hit1": "4c16f86aaacf496fa28283abd7f95d0d",
        "die1": "2648824a4bff430383fcdfc65dc668e4"
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
      "@type": "MOD.Core.AIComponent"
    },
    {
      "Enable": false,
      "@type": "MOD.Core.StateComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateStringToMonsterActionComponent"
    },
    {
      "BoxSize": {
        "x": 0.69,
        "y": 0.5
      },
      "BoxOffset": {
        "x": 0.095,
        "y": 0.245
      },
      "Enable": false,
      "@type": "MOD.Core.HitComponent"
    },
    {
      "Enable": false,
      "@type": "MOD.Core.DamageSkinSpawnerComponent"
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
      "Talked": false,
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
      "Name": "슬라임",
      "FontSize": 1.0,
      "OffsetY": 0.0,
      "Enable": true,
      "@type": "MOD.Core.NameTagComponent"
    },
    {
      "ChatModeEnabled": true,
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
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.AIComponent,MOD.Core.StateComponent,MOD.Core.StateStringToMonsterActionComponent,MOD.Core.HitComponent,MOD.Core.DamageSkinSpawnerComponent,script.UnitCommon,MOD.Core.TouchReceiveComponent,MOD.Core.NameTagComponent,MOD.Core.ChatBalloonComponent�
$32361d64-f814-46a2-8445-8aaca99bddd2/maps/map01/TileStone1�{
  "name": "TileStone1",
  "path": "/maps/map01/TileStone1",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMapObject$035506d00ac146f4afb71ca2556f5668",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 2.4144423,
        "y": 14.1800766,
        "z": 999.987
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
        "x": 0.5,
        "y": 0.5,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.TransformComponent"
    },
    {
      "SpriteRUID": "be2a7a3ee5a0423ebf948a8c5979de73",
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
      "OrderInLayer": 1,
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
$3ec87ec0-d23d-416c-b4d2-bdbd0cc6dd43/maps/map01/TileTree1�{
  "name": "TileTree1",
  "path": "/maps/map01/TileTree1",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMapObject$02eff0f5bcd843b88ddcee592bca0183",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 2.868053,
        "y": 17.84486,
        "z": 999.986
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
        "x": 0.386876285,
        "y": 0.386876285,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.TransformComponent"
    },
    {
      "SpriteRUID": "7e62e8b9359149fbb06589728489fdf0",
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
      "OrderInLayer": 1,
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
$d056a638-5586-4636-a1e6-2f9c0afcf9c6/maps/map01/TileGrass3�{
  "name": "TileGrass3",
  "path": "/maps/map01/TileGrass3",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMapObject$0aa819e3b29446099b37287765e35611",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 4.43955135,
        "y": 17.29307,
        "z": 999.985
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
      "SpriteRUID": "99ae76700da047c7a52fd4c213fc8431",
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
      "OrderInLayer": 1,
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
$9c49922f-5d50-4c7a-b1a8-325bd6d533bd/maps/map01/TileGrass1�{
  "name": "TileGrass1",
  "path": "/maps/map01/TileGrass1",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMapObject$0afefeeddd024a3985e04419d4c41f2a",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 4.99853945,
        "y": 14.8257408,
        "z": 999.984
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
      "SpriteRUID": "4583c4b3b0c74510ac1216cc7e65c635",
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
      "OrderInLayer": 1,
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
$45df3573-6f62-4008-bf56-6a7c43959987/maps/map01/UnitTaxi�{
  "name": "UnitTaxi",
  "path": "/maps/map01/UnitTaxi",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMapObject$0d2bbd9f983046338418e86e8c8825fb",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": -0.492383957,
        "y": 18.5744839,
        "z": 999.983
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
      "SpriteRUID": "34ddca33bacf482eb1a6b794e0c0473b",
      "LocalPosition": {
        "x": 0.0,
        "y": 2.0
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
      "OrderInLayer": 7,
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
$7bd571cc-b364-4b7e-8e25-f8f70c8d5acd/maps/map01/Ground�{
  "name": "Ground",
  "path": "/maps/map01/Ground",
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
        "x": 0.0,
        "y": -4.0,
        "z": 999.981
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
      "SpriteRUID": "ae4c83b9b2dc49b2837ad0612b6523b8",
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
      "DrawMode": 2,
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
}"<MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent�(
$1714c50d-126e-4ec2-961e-316133c60ec3/maps/map01/UnitElfArcher�%{
  "name": "UnitElfArcher",
  "path": "/maps/map01/UnitElfArcher",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMonster$28335237cfbd4cce9d5db7b6ff1156fb",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 2.24518681,
        "y": 10.0251045,
        "z": 999.982
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
      "SpriteRUID": "acf0929cf3304f71a8b48e5fae59cdb4",
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
        "move": "acf0929cf3304f71a8b48e5fae59cdb4",
        "stand": "5eca246fcd8e4b1c9be2782ae23418eb",
        "skill1": "a6d80d348c9340e9ba9dbe671c7c97a0",
        "attack1": "8244464b1afc4e489034c5842664d151",
        "attack2": "e89d5d025bc44bc0855ea962cfc2c037",
        "jump": "fdd880f38b3a4ee381aa0f2211b01fca",
        "hit1": "ba1ee6429d45429abcdf45f16be33115",
        "die1": "dadf86a992104615908f076b5e7bb600"
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
      "InputSpeed": 1.5,
      "JumpForce": 6.0,
      "Enable": true,
      "@type": "MOD.Core.MonsterMovementComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.AIChaseComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateStringToMonsterActionComponent"
    },
    {
      "BoxSize": {
        "x": 0.57,
        "y": 0.7
      },
      "BoxOffset": {
        "x": 0.0549999923,
        "y": 0.34
      },
      "Enable": true,
      "@type": "MOD.Core.HitComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.DamageSkinSpawnerComponent"
    },
    {
      "ChatModeEnabled": true,
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
      "Name": "요정궁수",
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
      "Talked": false,
      "Enable": true,
      "@type": "script.UnitCommon"
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.AIChaseComponent,MOD.Core.StateComponent,MOD.Core.StateStringToMonsterActionComponent,MOD.Core.HitComponent,MOD.Core.DamageSkinSpawnerComponent,MOD.Core.ChatBalloonComponent,MOD.Core.NameTagComponent,script.UnitCommon�
$a38da752-66ed-4206-b141-9ff980fb06f9/maps/map01/TileBush2�{
  "name": "TileBush2",
  "path": "/maps/map01/TileBush2",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMapObject$00407706baf14b9dbce291c72ea785ff",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 5.00289631,
        "y": 15.9907179,
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
        "x": 0.3274384,
        "y": 0.3274384,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.TransformComponent"
    },
    {
      "SpriteRUID": "9668501205af4c3188b78328f55c8220",
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
$39f911d0-52db-4e2e-9d61-39bc5150e1b9/maps/map01/TileStone2�{
  "name": "TileStone2",
  "path": "/maps/map01/TileStone2",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMapObject$0178b710a35c4924a7d79d1f76ce4770",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 5.272345,
        "y": 15.610528,
        "z": 999.98
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
        "x": 0.74089247,
        "y": 0.74089247,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.TransformComponent"
    },
    {
      "SpriteRUID": "f76e32ba974d46969ffb0a2f516b7fe4",
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
$227110bc-3e4f-4b96-9240-8dd98096836b/maps/map01/TileGlass4�{
  "name": "TileGlass4",
  "path": "/maps/map01/TileGlass4",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMapObject$024fdcd115b44c61a37f0a8631175319",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 4.20598364,
        "y": 14.1057148,
        "z": 999.979
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
      "SpriteRUID": "c03a6361651d4af593bd147d956e3998",
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
$7204a455-a7a6-4b37-a137-3db80906f646/maps/map01/TileTree2�{
  "name": "TileTree2",
  "path": "/maps/map01/TileTree2",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMapObject$0322a089c31c4db4aee659f2093f880a",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 7.167155,
        "y": 15.4031305,
        "z": 999.978
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
        "x": 0.79014194,
        "y": 0.790142,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.TransformComponent"
    },
    {
      "SpriteRUID": "b5f4c3cc02134db89bc96abfac2da17e",
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
$228c3acc-fcb0-4ae2-b9a5-dcdd54996c37/maps/map01/TileBush0�{
  "name": "TileBush0",
  "path": "/maps/map01/TileBush0",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMapObject$035d4af4111b41829b222b7d9b013915",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 2.14035058,
        "y": 17.7057114,
        "z": 999.977
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
      "SpriteRUID": "ba579594531d45e1ad8d7f96cb2ecd3d",
      "LocalPosition": {
        "x": 0.0,
        "y": 1.3
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
$237b3575-6a41-4df1-ba46-069b014bd01a/maps/map01/TileBush1�{
  "name": "TileBush1",
  "path": "/maps/map01/TileBush1",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMapObject$0743c3d7f51047b3804433471e2fc482",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 8.656693,
        "y": 15.6826954,
        "z": 999.976
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
        "x": 1.84077466,
        "y": 1.84077489,
        "z": 1.0
      },
      "Enable": true,
      "@type": "MOD.Core.TransformComponent"
    },
    {
      "SpriteRUID": "4571e0454274432a92c639830a2f8680",
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
}"<MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent�
$3a08f534-3ef5-493c-812c-996bbac39df0/maps/map01/UnitAndroid2�{
  "name": "UnitAndroid2",
  "path": "/maps/map01/UnitAndroid2",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMonster$0d0434641920401aa98f3df7e0b011db",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": -3.26790619,
        "y": 11.0694084,
        "z": 999.975
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
      "SpriteRUID": "e90425a636ef4d19850d50881122a289",
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
        "move": "e90425a636ef4d19850d50881122a289",
        "stand": "2636345f622a490295f0ae6d18d85e31",
        "attack1": "5e80c5a7235b4c979b851177ba3b0858",
        "attack2": "b524ac5519304a6187436427dfc680cf",
        "hit1": "518902c2e6984d68812aa20686358f5b",
        "die1": "619b3b3774f7478c876e95cc6f8def71"
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
      "Enable": true,
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
      "@type": "MOD.Core.AIComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateStringToMonsterActionComponent"
    },
    {
      "BoxSize": {
        "x": 1.09,
        "y": 0.86
      },
      "BoxOffset": {
        "x": -0.13499999,
        "y": 0.480000019
      },
      "Enable": true,
      "@type": "MOD.Core.HitComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.DamageSkinSpawnerComponent"
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.AIComponent,MOD.Core.StateComponent,MOD.Core.StateStringToMonsterActionComponent,MOD.Core.HitComponent,MOD.Core.DamageSkinSpawnerComponent�(
$80c1df50-ffc5-4e6d-a2ea-a1ebcd91bbc9/maps/map01/UnitWizard4�%{
  "name": "UnitWizard4",
  "path": "/maps/map01/UnitWizard4",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMonster$0d109bc8eaf846a49a730e0059b63f17",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": -3.14912415,
        "y": 7.333596,
        "z": 999.974
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
      "SpriteRUID": "f42a3e29fc554d24acc7f491ac5d8178",
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
        "stand": "bed2fc7d9ed045d8a76b8b5ff0262d8a",
        "move": "f42a3e29fc554d24acc7f491ac5d8178",
        "hit1": "aabbdec0b5cb4cd49bbc0b6c65a7e344",
        "die1": "4cfc04f57a5c4a7084439aeebdb2e90c",
        "skill1": "0a9b5615d6df44de9860bfe301fd77f3",
        "attack1": "67d7ab6f4a7540e3a8da7d889a79d62c",
        "skill2": "6890e2cb4af942cfa77add69c2b25a4f",
        "skill3": "17d72e036ffd4c49ab77fc12d92ad52f",
        "skill4": "687c6a1b3eda4c8686a3cae9d955e2ed",
        "skillAfter4": "35b3c0fa934d4598b2ba0ef9ac4a91d7"
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
      "@type": "MOD.Core.AIComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateStringToMonsterActionComponent"
    },
    {
      "BoxSize": {
        "x": 0.87,
        "y": 1.04
      },
      "BoxOffset": {
        "x": 0.0150000155,
        "y": 0.669999957
      },
      "Enable": true,
      "@type": "MOD.Core.HitComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.DamageSkinSpawnerComponent"
    },
    {
      "ChatModeEnabled": true,
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
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.AIComponent,MOD.Core.StateComponent,MOD.Core.StateStringToMonsterActionComponent,MOD.Core.HitComponent,MOD.Core.DamageSkinSpawnerComponent,MOD.Core.ChatBalloonComponent,MOD.Core.NameTagComponent,MOD.Core.TouchReceiveComponent�
$06759594-3837-4378-9c4c-b38db2ca0f44/maps/map01/UnitGeneral�{
  "name": "UnitGeneral",
  "path": "/maps/map01/UnitGeneral",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMonster$426a143ff8564a479bca9ceb83e06689",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": -1.649538,
        "y": 12.4771481,
        "z": 999.973
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
      "SpriteRUID": "702dcac870e540a9a2bff7997c80f8e8",
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
        "move": "702dcac870e540a9a2bff7997c80f8e8",
        "stand": "20c067944bb74af8923b9a6db09e06d2",
        "attack1": "68398b6c7f7e4480b86cd1898b2caa86",
        "skill1": "92782b88df3f40f9a4f0d8b0e013d500",
        "hit1": "10741c3ac7234077b186a4ec42cec198",
        "die1": "eaa777c7233b4723874d54b196c99e38"
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
      "Enable": true,
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
      "@type": "MOD.Core.AIComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateStringToMonsterActionComponent"
    },
    {
      "BoxSize": {
        "x": 0.76,
        "y": 1.01
      },
      "BoxOffset": {
        "x": 0.0499999821,
        "y": 0.505
      },
      "Enable": true,
      "@type": "MOD.Core.HitComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.DamageSkinSpawnerComponent"
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.AIComponent,MOD.Core.StateComponent,MOD.Core.StateStringToMonsterActionComponent,MOD.Core.HitComponent,MOD.Core.DamageSkinSpawnerComponent�'
$bde06df0-97ea-4fb1-bbe9-4084eb9c8390/maps/map01/UnitSwordShef2�#{
  "name": "UnitSwordShef2",
  "path": "/maps/map01/UnitSwordShef2",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMonster$501fc34c11884024a890abb011aa21ff",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": -3.842183,
        "y": 11.928051,
        "z": 999.972
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
      "SpriteRUID": "ba135f41f50b4470a4eb7535d510e47a",
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
        "stand": "9fe264e5966544e180191a141423af42",
        "move": "ba135f41f50b4470a4eb7535d510e47a",
        "attack1": "3bf932f5e7754f1aa6ae63e36ef1b0af",
        "skill1": "cb7ea6068ca843169a34186fae152e88",
        "hit1": "9939235de3e64f60af4ff259ff5202b2",
        "die1": "edbe06bcdc874c0c8b13f79aca0869db"
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
      "Enable": true,
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
      "@type": "MOD.Core.AIComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateStringToMonsterActionComponent"
    },
    {
      "BoxSize": {
        "x": 1.16,
        "y": 1.01
      },
      "BoxOffset": {
        "x": -0.19,
        "y": 0.285
      },
      "Enable": true,
      "@type": "MOD.Core.HitComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.DamageSkinSpawnerComponent"
    },
    {
      "ChatModeEnabled": true,
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
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.AIComponent,MOD.Core.StateComponent,MOD.Core.StateStringToMonsterActionComponent,MOD.Core.HitComponent,MOD.Core.DamageSkinSpawnerComponent,MOD.Core.ChatBalloonComponent,MOD.Core.NameTagComponent,MOD.Core.TouchReceiveComponent�
$089c13c9-40aa-497d-9e1e-a3525302e71d/maps/map01/UnitPeople�{
  "name": "UnitPeople",
  "path": "/maps/map01/UnitPeople",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMonster$62ee11e99c454acda444496913d337ad",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": -0.699412,
        "y": 12.975359,
        "z": 999.971
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
      "SpriteRUID": "694a4a5a5f1f432fb5a8804006f9d97e",
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
        "move": "694a4a5a5f1f432fb5a8804006f9d97e",
        "stand": "a2d6154b325f47e9bfb886ae74a3fa0d",
        "attack1": "ba5fd2add95a4bb6b7ba4f706469e4fa",
        "skill1": "52f86729ed1b4452a3c269126939e0d8",
        "hit1": "53bc6db1f4954a6d87dfee5b7cb2faca",
        "die1": "b6379896aaef4a3c812078edda9c264b"
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
      "Enable": true,
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
      "@type": "MOD.Core.AIComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateStringToMonsterActionComponent"
    },
    {
      "BoxSize": {
        "x": 0.65,
        "y": 1.01
      },
      "BoxOffset": {
        "x": 0.0549999774,
        "y": 0.505
      },
      "Enable": true,
      "@type": "MOD.Core.HitComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.DamageSkinSpawnerComponent"
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.AIComponent,MOD.Core.StateComponent,MOD.Core.StateStringToMonsterActionComponent,MOD.Core.HitComponent,MOD.Core.DamageSkinSpawnerComponent�
$e1266150-6880-41f1-94f7-1d2684834bbc/maps/map01/UnitSpecialForce�{
  "name": "UnitSpecialForce",
  "path": "/maps/map01/UnitSpecialForce",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMonster$6787658d4a3c45f683f3531534aa1753",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": -0.634995937,
        "y": 12.2200127,
        "z": 999.97
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
      "SpriteRUID": "4d22d4f8a94546f3b27d7e9e7d8946e3",
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
        "stand": "4d22d4f8a94546f3b27d7e9e7d8946e3",
        "hit1": "c31dd41d7b3d4682bc0f48f4bdc96d79",
        "die1": "d2a5926b1ab94c2cbb9c18a4df755763"
      },
      "Enable": true,
      "@type": "MOD.Core.SpriteRendererComponent"
    }
  ],
  "@version": 1
}"<MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent�&
$94ae94ea-c370-419e-93c7-e706df82c25d/maps/map01/UnitPaladin2�#{
  "name": "UnitPaladin2",
  "path": "/maps/map01/UnitPaladin2",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMonster$68639a64ada24f2e9cb58fe4d627b79d",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": -3.986414,
        "y": 10.4947548,
        "z": 999.969
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
      "SpriteRUID": "06a65f73c1ac4e79978e0995fc2c9193",
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
        "stand": "b8b6dc4cfb8f47aa8d8635d92049e845",
        "move": "06a65f73c1ac4e79978e0995fc2c9193",
        "attack1": "c9284f1e3c2e4e17b66898e46598b969",
        "hit1": "eb1cf243edd34dc19da45926afceaaf9",
        "die1": "132613b13beb42b099145607d578d9a0"
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
      "@type": "MOD.Core.AIComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateStringToMonsterActionComponent"
    },
    {
      "BoxSize": {
        "x": 1.06,
        "y": 1.03
      },
      "BoxOffset": {
        "x": -0.24000001,
        "y": 0.295
      },
      "Enable": true,
      "@type": "MOD.Core.HitComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.DamageSkinSpawnerComponent"
    },
    {
      "ChatModeEnabled": true,
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
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.AIComponent,MOD.Core.StateComponent,MOD.Core.StateStringToMonsterActionComponent,MOD.Core.HitComponent,MOD.Core.DamageSkinSpawnerComponent,MOD.Core.ChatBalloonComponent,MOD.Core.NameTagComponent,MOD.Core.TouchReceiveComponent�
$25388393-45de-443e-9dd1-261bdb84e55d/maps/map01/UnitAirForce�{
  "name": "UnitAirForce",
  "path": "/maps/map01/UnitAirForce",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMonster$7578e094d75149cf855bdeb8d95749dc",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 2.73007154,
        "y": 10.4456205,
        "z": 999.968
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
      "SpriteRUID": "a2c3be0ad6aa4b0b95681925bece7109",
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
        "stand": "d298e48c66a64ea99bca0c8a5dcf328f",
        "move": "a2c3be0ad6aa4b0b95681925bece7109",
        "attack1": "134eefc0122947769194d028d61c012f",
        "attack2": "e3389407e6c04104bbbf979d00585f8f",
        "attack3": "81d7b1ba5c6f41549233bf75ac6bb85f",
        "attack4": "e199a93497ee4a65928a7423dacc8882",
        "attack5": "3379f16f1660489dbf4cd57f53c993b8",
        "hit1": "d34c310eaa1d484a8a42c1b2c427c28d",
        "die1": "37983ead0cf545a2a148b231f69c594a"
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
      "@type": "MOD.Core.AIComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateStringToMonsterActionComponent"
    },
    {
      "BoxSize": {
        "x": 1.61,
        "y": 1.15
      },
      "BoxOffset": {
        "x": -0.0450000167,
        "y": 0.885
      },
      "Enable": true,
      "@type": "MOD.Core.HitComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.DamageSkinSpawnerComponent"
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.AIComponent,MOD.Core.StateComponent,MOD.Core.StateStringToMonsterActionComponent,MOD.Core.HitComponent,MOD.Core.DamageSkinSpawnerComponent�*
$a19eeada-9da2-4474-8697-017eddf99944/maps/map01/UnitWizard1�'{
  "name": "UnitWizard1",
  "path": "/maps/map01/UnitWizard1",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMonster$767e17f65a3d491c91e78914f8648b72",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": -5.098128,
        "y": 8.679903,
        "z": 999.967
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
      "SpriteRUID": "47f512a4570a4715a0a3702167ee67e4",
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
        "move": "47f512a4570a4715a0a3702167ee67e4",
        "stand": "d32ad556f67147d89dbbc9d8eb603bc0",
        "attack1": "39e5f4e19a954b6f8f42a414c712866d",
        "attack2": "22079780d134460085254a898ac9c6a9",
        "hit1": "e4f05d51a843467396fbabc3c6d5fcbe",
        "die1": "d26a338bdf614dbf866e5f53fcf07663"
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
      "Enable": false,
      "@type": "MOD.Core.AIComponent"
    },
    {
      "Enable": false,
      "@type": "MOD.Core.StateComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateStringToMonsterActionComponent"
    },
    {
      "BoxSize": {
        "x": 0.8,
        "y": 0.66
      },
      "BoxOffset": {
        "x": 0.0300000012,
        "y": 0.33
      },
      "Enable": true,
      "@type": "MOD.Core.HitComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.DamageSkinSpawnerComponent"
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
      "Name": "도끼술사",
      "FontSize": 1.0,
      "OffsetY": 0.0,
      "Enable": true,
      "@type": "MOD.Core.NameTagComponent"
    },
    {
      "ChatModeEnabled": true,
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
      "Talked": false,
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
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.AIComponent,MOD.Core.StateComponent,MOD.Core.StateStringToMonsterActionComponent,MOD.Core.HitComponent,MOD.Core.DamageSkinSpawnerComponent,MOD.Core.NameTagComponent,MOD.Core.ChatBalloonComponent,script.UnitCommon,MOD.Core.TouchReceiveComponent�
$ccef498a-1791-4742-8d16-8ee5fd0128d8/maps/map01/UnitAndroid1�{
  "name": "UnitAndroid1",
  "path": "/maps/map01/UnitAndroid1",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMonster$78c49b884db147fe927105d5ab88210f",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": -3.16957569,
        "y": 10.1020184,
        "z": 999.966
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
      "SpriteRUID": "02ccd5b15e4d4faea56001b692b88379",
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
        "move": "02ccd5b15e4d4faea56001b692b88379",
        "stand": "c75d27a1132b4d1fb482394692ac9aa7",
        "attack1": "b0991bdfe9cb446bb7a691aa98dd8eb5",
        "hit1": "844877f00ca640c5a7b7db877ef1c4f3",
        "die1": "94cb4a84768a41cdabe0299896239cf3"
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
      "Enable": true,
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
      "@type": "MOD.Core.AIComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateStringToMonsterActionComponent"
    },
    {
      "BoxSize": {
        "x": 1.17,
        "y": 0.94
      },
      "BoxOffset": {
        "x": -0.09500003,
        "y": 0.47
      },
      "Enable": true,
      "@type": "MOD.Core.HitComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.DamageSkinSpawnerComponent"
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.AIComponent,MOD.Core.StateComponent,MOD.Core.StateStringToMonsterActionComponent,MOD.Core.HitComponent,MOD.Core.DamageSkinSpawnerComponent�(
$039d4aea-4ae8-40ef-b349-42459cf9443d/maps/map01/UnitQueen�%{
  "name": "UnitQueen",
  "path": "/maps/map01/UnitQueen",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMonster$78e94f5ffc3849fa94ddcc48f8193b6d",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": -2.89117146,
        "y": 13.8949509,
        "z": 999.965
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
      "SpriteRUID": "45259308de31498db63edaf7aff97544",
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
        "stand": "73d90a5a068d4974a01231e64b1f43c5",
        "move": "45259308de31498db63edaf7aff97544",
        "attack1": "1bb431cf8f7f4ae5b8b4e9fe6d823649",
        "attack2": "175568a669d7468c9b67599bfcb9b5d6",
        "attack3": "4dfd990da2d346be8d3c3063c30c71e7",
        "die1": "107ee9ec15bd43d0ab3ba50d7d09ef59",
        "hit1": "bbf0b67d2b7f4281989a6946ad93a470"
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
      "@type": "MOD.Core.AIComponent"
    },
    {
      "Enable": false,
      "@type": "MOD.Core.StateComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateStringToMonsterActionComponent"
    },
    {
      "BoxSize": {
        "x": 1.4,
        "y": 2.0
      },
      "BoxOffset": {
        "x": 0.229999989,
        "y": 1.01
      },
      "Enable": false,
      "@type": "MOD.Core.HitComponent"
    },
    {
      "Enable": false,
      "@type": "MOD.Core.DamageSkinSpawnerComponent"
    },
    {
      "ChatModeEnabled": true,
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
      "Offset": 6,
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
      "Name": "여왕",
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
      "Talked": false,
      "Enable": true,
      "@type": "script.UnitCommon"
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.AIComponent,MOD.Core.StateComponent,MOD.Core.StateStringToMonsterActionComponent,MOD.Core.HitComponent,MOD.Core.DamageSkinSpawnerComponent,MOD.Core.ChatBalloonComponent,MOD.Core.NameTagComponent,script.UnitCommon�
$e9e0da0d-2db7-4963-9163-0b345876622f/maps/map01/UnitGhost�{
  "name": "UnitGhost",
  "path": "/maps/map01/UnitGhost",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMonster$97dde1402a0a484db33a7f50289db269",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 0.8616116,
        "y": 13.6529016,
        "z": 999.964
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
      "SpriteRUID": "52382436bc6647fa9858c19289307528",
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
        "fly": "52382436bc6647fa9858c19289307528",
        "stand": "3b09f4c09cac42c78190cf5df39c2a91",
        "die1": "29c7b643a16c48d0911755e9b9b97d97"
      },
      "Enable": true,
      "@type": "MOD.Core.SpriteRendererComponent"
    }
  ],
  "@version": 1
}"<MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent�$
$003ea6b4-8262-4bb6-9ff5-f42f065934ea/maps/map01/UnitMushroom1�!{
  "name": "UnitMushroom1",
  "path": "/maps/map01/UnitMushroom1",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMonster$aba70fc1d897418e87a936fe2733c445",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 1.82888746,
        "y": 15.8039312,
        "z": 999.963
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
      "SpriteRUID": "cc07c35fb3324f08b5c2f8049ab821b7",
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
        "move": "cc07c35fb3324f08b5c2f8049ab821b7",
        "stand": "7097645993be48fa9fec7af5fee24f00",
        "attack1": "e38a0068d93b4a69b3d689756c40fa1a",
        "hit1": "3212d5365c514a24b3b25545a32be148",
        "die1": "02ddfc767aa14d368b1644a6e28fad22"
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
      "Enable": true,
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
      "@type": "MOD.Core.AIComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateStringToMonsterActionComponent"
    },
    {
      "BoxSize": {
        "x": 0.56,
        "y": 0.52
      },
      "BoxOffset": {
        "x": 0.00999999,
        "y": 0.26
      },
      "Enable": true,
      "@type": "MOD.Core.HitComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.DamageSkinSpawnerComponent"
    },
    {
      "ChatModeEnabled": true,
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
      "Name": "안녕버섯",
      "FontSize": 1.0,
      "OffsetY": 0.0,
      "Enable": true,
      "@type": "MOD.Core.NameTagComponent"
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.AIComponent,MOD.Core.StateComponent,MOD.Core.StateStringToMonsterActionComponent,MOD.Core.HitComponent,MOD.Core.DamageSkinSpawnerComponent,MOD.Core.ChatBalloonComponent,MOD.Core.NameTagComponent�
$84885715-0298-402b-a4d2-48355f379f4c/maps/map01/UnitScout�{
  "name": "UnitScout",
  "path": "/maps/map01/UnitScout",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMonster$c7957b3ddd0a4c0fa8ba38d4464e96fa",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": -2.531232,
        "y": 12.8563032,
        "z": 999.962
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
      "SpriteRUID": "9e133e450df647d2847388fda689f3f4",
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
        "move": "9e133e450df647d2847388fda689f3f4",
        "stand": "1791b114de1b4865bfea5f2bb94e5d60",
        "rope": "c0fbae65e9f54ec7bf11fb277108f0d8",
        "hit1": "965ff966d41f41d6b91dd425664cdbb1",
        "die1": "1fe1381e423c4ac8a8cf86a8d166f306",
        "attack1": "237674b2c0ce44edb2be804594a4e975",
        "jump": "5c4293678052433e8724f08f0cb86c1d",
        "ladder": "efd7d02305314ca4a299e6d92ea65852"
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
      "Enable": true,
      "@type": "MOD.Core.RigidbodyComponent"
    },
    {
      "InputSpeed": 1.5,
      "JumpForce": 6.0,
      "Enable": true,
      "@type": "MOD.Core.MonsterMovementComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.AIChaseComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateStringToMonsterActionComponent"
    },
    {
      "BoxSize": {
        "x": 0.65,
        "y": 0.85
      },
      "BoxOffset": {
        "x": 0.0549999774,
        "y": 0.395
      },
      "Enable": true,
      "@type": "MOD.Core.HitComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.DamageSkinSpawnerComponent"
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.AIChaseComponent,MOD.Core.StateComponent,MOD.Core.StateStringToMonsterActionComponent,MOD.Core.HitComponent,MOD.Core.DamageSkinSpawnerComponent�*
$4e3c7136-9619-49bf-be27-34f1f6e03614/maps/map01/UnitChef1�'{
  "name": "UnitChef1",
  "path": "/maps/map01/UnitChef1",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMonster$c9aa77cd25d54853a2984a59ad0da54b",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": -4.87064028,
        "y": 10.546566,
        "z": 999.961
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
      "SpriteRUID": "cde2f4ed61044b4896ac70ae9b25215a",
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
        "stand": "e1ffb6144ddf41afb38bdaddc2a2b84d",
        "move": "cde2f4ed61044b4896ac70ae9b25215a",
        "attack1": "bceae18d8e624f00b32a8c07a0e420e6",
        "skill1": "9094b84e4dbd4b55ac5e816aea3f6fe1",
        "hit1": "dd6f1da6584d486ab5170d12a3badded",
        "die1": "d440c6bf60f64badb8c8084e94446953"
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
      "Enable": false,
      "@type": "MOD.Core.AIComponent"
    },
    {
      "Enable": false,
      "@type": "MOD.Core.StateComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateStringToMonsterActionComponent"
    },
    {
      "BoxSize": {
        "x": 1.03,
        "y": 1.01
      },
      "BoxOffset": {
        "x": -0.255,
        "y": 0.285
      },
      "Enable": true,
      "@type": "MOD.Core.HitComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.DamageSkinSpawnerComponent"
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
      "Talked": false,
      "Enable": true,
      "@type": "script.UnitCommon"
    },
    {
      "ChatModeEnabled": true,
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
      "Name": "전투요리사",
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
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.AIComponent,MOD.Core.StateComponent,MOD.Core.StateStringToMonsterActionComponent,MOD.Core.HitComponent,MOD.Core.DamageSkinSpawnerComponent,script.UnitCommon,MOD.Core.ChatBalloonComponent,MOD.Core.NameTagComponent,MOD.Core.TouchReceiveComponent�
$4d92d7bb-e4ff-4a3f-b415-7cb8123f760b/maps/map01/UnitElfLongbow�{
  "name": "UnitElfLongbow",
  "path": "/maps/map01/UnitElfLongbow",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMonster$d375f54c01ad4dcead6c603db8cfdf10",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": -1.52063572,
        "y": 11.4100914,
        "z": 999.96
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
      "SpriteRUID": "1bd5c855725840608f4297f1b13e6df8",
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
        "stand": "1bd5c855725840608f4297f1b13e6df8",
        "attack1": "57fff13dd41f462181ac6e8e30cc45c1",
        "hit1": "6b97a331cb104407becef6012cf9f06e",
        "die1": "82e0541ac1344e6789cc2372fc02fa70"
      },
      "Enable": true,
      "@type": "MOD.Core.SpriteRendererComponent"
    }
  ],
  "@version": 1
}"<MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent�(
$3d140124-5710-4fcd-8c0c-59d57e350a10/maps/map01/UnitArcherWizard�${
  "name": "UnitArcherWizard",
  "path": "/maps/map01/UnitArcherWizard",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMonster$e3368579ce9244a781c8fd0ed043cbec",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": -3.86097145,
        "y": 8.605736,
        "z": 999.959
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
      "SpriteRUID": "a43f726fe90e4ae7ae6ec0d8a3432f24",
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
        "stand": "e63f08656bea424a9074d9049b7d5ad1",
        "move": "a43f726fe90e4ae7ae6ec0d8a3432f24",
        "attack1": "42cbee8dbd2f43dd9654bdea4f7b268e",
        "attack2": "bce6a325c58142c6bd469197884072e0",
        "attack3": "35d3dad633364ab082b5419edced0f2e",
        "skill1": "a7cf3594df1f40e6b633654e5beeb197",
        "hit1": "7a159e5d50524391980be3b24925ae92",
        "die1": "f95105e763954a7aa5765cf92669a114"
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
      "@type": "MOD.Core.AIComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateStringToMonsterActionComponent"
    },
    {
      "BoxSize": {
        "x": 1.04,
        "y": 0.95
      },
      "BoxOffset": {
        "x": -0.0600000024,
        "y": 0.355
      },
      "Enable": true,
      "@type": "MOD.Core.HitComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.DamageSkinSpawnerComponent"
    },
    {
      "ChatModeEnabled": true,
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
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.AIComponent,MOD.Core.StateComponent,MOD.Core.StateStringToMonsterActionComponent,MOD.Core.HitComponent,MOD.Core.DamageSkinSpawnerComponent,MOD.Core.ChatBalloonComponent,MOD.Core.NameTagComponent,MOD.Core.TouchReceiveComponent�
$fde04113-778a-4f04-80a7-28a56ed2cc06/maps/map01/UnitKidong2�{
  "name": "UnitKidong2",
  "path": "/maps/map01/UnitKidong2",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMonster$e53f424d4c8943a59d440bd95e743492",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 4.390934,
        "y": 12.7346439,
        "z": 999.958
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
      "SpriteRUID": "079cfd0233c24b2aa912cdab756b7ae5",
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
        "stand": "079cfd0233c24b2aa912cdab756b7ae5",
        "hit1": "fe707faf45fa4232b85f51a60a287ce1",
        "die1": "de277beb60fb43e3985e4300cf887936",
        "attack1": "f92830c816ca407ba4f1dd8be9d6f038",
        "skill1": "d0fbf68fcc7e4aff8214d99c2b8e3ef8",
        "skill2": "aa0fdb44fb374e07aa3761bad3edca07",
        "skill3": "a41405a55ab149ec96545842f45b6b81",
        "skill4": "06af8f85970045f3b5eca05b2d67e867",
        "skill5": "62bdc6cc7d944ef38288564d7bfde84b",
        "skill6": "ee94ef4b1b3348f09a4a2c349076697d",
        "skill7": "ac1a4981791341c28ce7fea12e8e5189",
        "skill8": "65c1f03e753049e6a47278402cc97595",
        "skill9": "c047b58ba9954749a6a376bc9a8238be",
        "skill10": "87e389e49f6c440e88da56ebf05d90a9"
      },
      "Enable": true,
      "@type": "MOD.Core.SpriteRendererComponent"
    }
  ],
  "@version": 1
}"<MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent�
$81d15f05-d51c-4320-9978-b2b15dd20762/maps/map01/UnitStaffWizard�{
  "name": "UnitStaffWizard",
  "path": "/maps/map01/UnitStaffWizard",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMonster$f6de2cbac6d84d4c870d481bb9218ff1",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": -3.03222418,
        "y": 8.94183,
        "z": 999.957
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
      "SpriteRUID": "b090189904234731b53d01ecbc0e043d",
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
        "stand": "dd65349cbdb84a0b97b6b2fb5cc46af7",
        "move": "b090189904234731b53d01ecbc0e043d",
        "attack1": "6bf60aaa30ba40689fe2156e0cef56c2",
        "attack2": "14451ba1ed324eb5a27a38a280e7d154",
        "attack3": "0eb10225c3bd4cde8dd7184ff0786012",
        "skill1": "ac1b606642fe4878863e605177b570d9",
        "skill2": "b39db129bab441d4b80051bdddea16cf",
        "skill3": "103bdb18d7d04ee3a963acbb990fb305",
        "skillAfter1": "c88a0a3b838a4392850e3f0e7ec2d2f2",
        "hit1": "210b87d1ad3a48b7b999c8b8d721f0d9",
        "die1": "acb82b020b5c4a6b91a6f430e10c1fc5"
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
      "@type": "MOD.Core.AIComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateStringToMonsterActionComponent"
    },
    {
      "BoxSize": {
        "x": 0.78,
        "y": 0.99
      },
      "BoxOffset": {
        "x": 0.00999999,
        "y": 0.485
      },
      "Enable": true,
      "@type": "MOD.Core.HitComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.DamageSkinSpawnerComponent"
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.AIComponent,MOD.Core.StateComponent,MOD.Core.StateStringToMonsterActionComponent,MOD.Core.HitComponent,MOD.Core.DamageSkinSpawnerComponent�
$1eb6290b-27f2-4559-82bf-b75b74209f26/maps/map01/UnitWizard2�{
  "name": "UnitWizard2",
  "path": "/maps/map01/UnitWizard2",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMonster$fcb500b7ac0b4588bf888fffee8012d6",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 0.9828186,
        "y": 2.39044762,
        "z": 999.956
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
      "SpriteRUID": "3fff3cd9c3704edeb492e6e03826c753",
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
        "attack1": "82099b5d58bf40d8b94e58a3aeabefb2",
        "stand": "f651f47ffdb7435ba4a0fbf34c5b7c7b",
        "hit1": "b568762654494f398c62c418c893af9c",
        "die1": "5cd448ce93384b27a8f5784708703d7e",
        "move": "3fff3cd9c3704edeb492e6e03826c753"
      },
      "Enable": false,
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
      "Enable": true,
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
      "@type": "MOD.Core.AIComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateStringToMonsterActionComponent"
    },
    {
      "BoxSize": {
        "x": 2.5,
        "y": 2.5
      },
      "BoxOffset": {
        "x": 0.120000005,
        "y": 0.97
      },
      "Enable": true,
      "@type": "MOD.Core.HitComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.DamageSkinSpawnerComponent"
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.AIComponent,MOD.Core.StateComponent,MOD.Core.StateStringToMonsterActionComponent,MOD.Core.HitComponent,MOD.Core.DamageSkinSpawnerComponent�
$87a96d20-f400-4bfd-bf6e-f7632ce178d1/maps/map01/TileBridge�{
  "name": "TileBridge",
  "path": "/maps/map01/TileBridge",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMapObject$1013114a7fb0492aa11ba7c05e805887",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 10.8097992,
        "y": 12.9428606,
        "z": 999.955
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
      "SpriteRUID": "82aaffbfbaf24359839f52cbc05b73c7",
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
$93f2bab8-a86a-41d5-9685-80e3f52c7c66/maps/map01/TileGrass2�{
  "name": "TileGrass2",
  "path": "/maps/map01/TileGrass2",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMapObject$061cb21790ef4454b37b50bf21d66f21",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 7.95603466,
        "y": 16.9746456,
        "z": 999.954
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
      "SpriteRUID": "f901b8714a6b4d54b54e56e1f3075454",
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
$ba1c0827-2d52-45c3-9156-5b6c3d860fd0/maps/map01/TileBigLeaf�{
  "name": "TileBigLeaf",
  "path": "/maps/map01/TileBigLeaf",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMapObject$0b1661cb36b84571a8b7a5b3e6424c7b",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 7.08916759,
        "y": 17.2903519,
        "z": 999.953
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
      "SpriteRUID": "1383e7b2dc4e4e029a5dc60cc84b2a90",
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
$5a251991-046e-41ac-8b8c-7cd5e25490c7/maps/map01/TileSmallPlant�{
  "name": "TileSmallPlant",
  "path": "/maps/map01/TileSmallPlant",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMapObject$0b13f6ffe9894686b00f7ca4155e575c",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 3.30477047,
        "y": 16.2617874,
        "z": 999.952
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
      "SpriteRUID": "d566326edc6246b3aca21972561596d9",
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
}"<MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent�
$582558dc-5594-49db-8031-373bccac0a13/maps/map01/UnitDevil�{
  "name": "UnitDevil",
  "path": "/maps/map01/UnitDevil",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMonster$3cd3be439ac549058c25a2f0b1e60274",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 0.817408264,
        "y": 12.2364292,
        "z": 999.951
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
      "SpriteRUID": "0d0fb04e8b76431093437ad170a2bd3b",
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
        "regen": "2b963d6aa07d42b8abfae3058647ba0b",
        "stand": "1a13843f22334dc4b3b7360055086ea4",
        "move": "0d0fb04e8b76431093437ad170a2bd3b",
        "attack1": "6ce7d5a39e71446a8e87343bfe90da5b",
        "attack2": "017aff565391419399d2f62ff075ca3c",
        "attack3": "f9cdd6751aab4db293f55c6dea98606b",
        "skill1": "84c649efcfc8459c9907fdeb65c5e09a",
        "skill2": "e4c309fe57514ee4879d63c4e184fc2e",
        "hit1": "5814bdfa99014b61a86133dd31d78610",
        "die1": "18d9c871186447228a9980dfd8dad1af"
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
      "@type": "MOD.Core.AIComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateStringToMonsterActionComponent"
    },
    {
      "BoxSize": {
        "x": 1.86,
        "y": 1.37
      },
      "BoxOffset": {
        "x": -0.00999999,
        "y": 0.625
      },
      "Enable": true,
      "@type": "MOD.Core.HitComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.DamageSkinSpawnerComponent"
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.AIComponent,MOD.Core.StateComponent,MOD.Core.StateStringToMonsterActionComponent,MOD.Core.HitComponent,MOD.Core.DamageSkinSpawnerComponent�
$59369298-8495-4630-8fb9-e6f9b42847ad/maps/map01/UnitGeisha�{
  "name": "UnitGeisha",
  "path": "/maps/map01/UnitGeisha",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMonster$3d2867ed546545709571dd3d154d8524",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 2.77174616,
        "y": 7.98226357,
        "z": 999.95
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
      "SpriteRUID": "3654fc4fecc6415e9e1d071795557998",
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
        "stand": "07a035a9a98d48c08f475189b73159ad",
        "move": "3654fc4fecc6415e9e1d071795557998",
        "hit1": "82be6fe04a83407fb4fd8330bf1969bf",
        "die1": "a391bb761aa84ef7857347a3f630cd81"
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
      "@type": "MOD.Core.AIComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateStringToMonsterActionComponent"
    },
    {
      "BoxSize": {
        "x": 1.96,
        "y": 1.98
      },
      "BoxOffset": {
        "x": 0.09000003,
        "y": 0.91
      },
      "Enable": true,
      "@type": "MOD.Core.HitComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.DamageSkinSpawnerComponent"
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.AIComponent,MOD.Core.StateComponent,MOD.Core.StateStringToMonsterActionComponent,MOD.Core.HitComponent,MOD.Core.DamageSkinSpawnerComponent�
$19909d7b-a48e-42e3-b78e-d550ab9295eb/maps/map01/UnitDaughter�{
  "name": "UnitDaughter",
  "path": "/maps/map01/UnitDaughter",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMonster$3e2a2ccbcf5f437e85381356b82760b2",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": -0.386186719,
        "y": 9.732338,
        "z": 999.949
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
      "SpriteRUID": "ee49558d9f394f2ab74a76a224ad7fa3",
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
        "move": "ee49558d9f394f2ab74a76a224ad7fa3",
        "stand": "e8a9bc61ed2442ca91e61c06b3c16dbd",
        "attack1": "3b479cc26a4041b183f3489c6124808b",
        "skill1": "8c79500963b64c8f8ad3aa3b455afa3f",
        "hit1": "fa595196da054d138f717340e7d7969e",
        "die1": "06b178f367ba4fa5b842f062ea8284a9"
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
      "@type": "MOD.Core.AIComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateStringToMonsterActionComponent"
    },
    {
      "BoxSize": {
        "x": 0.71,
        "y": 1.03
      },
      "BoxOffset": {
        "x": 0.08499998,
        "y": 0.494999975
      },
      "Enable": true,
      "@type": "MOD.Core.HitComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.DamageSkinSpawnerComponent"
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.AIComponent,MOD.Core.StateComponent,MOD.Core.StateStringToMonsterActionComponent,MOD.Core.HitComponent,MOD.Core.DamageSkinSpawnerComponent�$
$f0657eaa-bf4d-4750-a7a6-06dbcd909c64/maps/map01/UnitPretorian�!{
  "name": "UnitPretorian",
  "path": "/maps/map01/UnitPretorian",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMonster$4bb18cff47f74eaeb7aa1f9bfb29af87",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": -2.01236868,
        "y": 10.4814816,
        "z": 999.948
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
      "SpriteRUID": "d5d27bbe538243eb9931efd56a4cccbd",
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
        "move": "d5d27bbe538243eb9931efd56a4cccbd",
        "stand": "04dcf745e6584ee281e8f9e5ff91eef8",
        "attack1": "79c3f2e896b845a189875286ec45cf8d",
        "hit1": "937f3f333cbd4c0d9b442c1552e5f127",
        "die1": "45f3fbd0ba9b4783979fc1468c043548"
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
      "Enable": true,
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
      "@type": "MOD.Core.AIComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateStringToMonsterActionComponent"
    },
    {
      "BoxSize": {
        "x": 1.41,
        "y": 0.93
      },
      "BoxOffset": {
        "x": -0.13499999,
        "y": 0.465
      },
      "Enable": true,
      "@type": "MOD.Core.HitComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.DamageSkinSpawnerComponent"
    },
    {
      "ChatModeEnabled": true,
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
      "Name": "근위대",
      "FontSize": 1.0,
      "OffsetY": 0.0,
      "Enable": true,
      "@type": "MOD.Core.NameTagComponent"
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.AIComponent,MOD.Core.StateComponent,MOD.Core.StateStringToMonsterActionComponent,MOD.Core.HitComponent,MOD.Core.DamageSkinSpawnerComponent,MOD.Core.ChatBalloonComponent,MOD.Core.NameTagComponent�
$99a8ddac-c696-4fa2-987b-afe8607c075c/maps/map01/UnitAngel�{
  "name": "UnitAngel",
  "path": "/maps/map01/UnitAngel",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMonster$5bc282b3d5614e7b8a03951f98f4674f",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": -0.5005902,
        "y": 11.0858946,
        "z": 999.947
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
      "SpriteRUID": "7e9aa6a44eb04dca8257bc2233e945f3",
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
        "move": "7e9aa6a44eb04dca8257bc2233e945f3",
        "stand": "08d0e2fc9a434b3a80b63ec9500ec254",
        "attack1": "12f7c02ae1a845428ebbca212fd55f17",
        "skill1": "4426b0c387de449b85368ac66e2752a7",
        "hit1": "bd47e99af06945579062e4e95bc46272",
        "die1": "c86d210847d14aa0a0604bf656f252fb"
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
      "Enable": true,
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
      "@type": "MOD.Core.AIComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateStringToMonsterActionComponent"
    },
    {
      "BoxSize": {
        "x": 1.24,
        "y": 1.07
      },
      "BoxOffset": {
        "x": 0.06999999,
        "y": 0.475000024
      },
      "Enable": true,
      "@type": "MOD.Core.HitComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.DamageSkinSpawnerComponent"
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.AIComponent,MOD.Core.StateComponent,MOD.Core.StateStringToMonsterActionComponent,MOD.Core.HitComponent,MOD.Core.DamageSkinSpawnerComponent�$
$872a3b76-1f8b-404f-ada6-49b790d3f611/maps/map01/UnitMushroom2�!{
  "name": "UnitMushroom2",
  "path": "/maps/map01/UnitMushroom2",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMonster$655e7de016c04a6bb7c88a8e85e830ad",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 1.88957179,
        "y": 14.8967743,
        "z": 999.946
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
      "SpriteRUID": "8239541953a6457fbe6d35e17f19f0f8",
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
        "move": "8239541953a6457fbe6d35e17f19f0f8",
        "stand": "1a176a7afb114fe7aef2bc58ef2d945b",
        "jump": "a7ea0755262242199ae50ab6a3387034",
        "hit1": "7b405108d05741699893a4dc3d715165",
        "die1": "9e74e807797d442f9c938ca64aa9f4cd"
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
      "Enable": true,
      "@type": "MOD.Core.RigidbodyComponent"
    },
    {
      "InputSpeed": 1.5,
      "JumpForce": 6.0,
      "Enable": true,
      "@type": "MOD.Core.MonsterMovementComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.AIChaseComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.StateStringToMonsterActionComponent"
    },
    {
      "BoxSize": {
        "x": 0.63,
        "y": 0.58
      },
      "BoxOffset": {
        "x": 0.0550000072,
        "y": 0.29
      },
      "Enable": true,
      "@type": "MOD.Core.HitComponent"
    },
    {
      "Enable": true,
      "@type": "MOD.Core.DamageSkinSpawnerComponent"
    },
    {
      "ChatModeEnabled": true,
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
      "Name": "슬픈버섯",
      "FontSize": 1.0,
      "OffsetY": 0.0,
      "Enable": true,
      "@type": "MOD.Core.NameTagComponent"
    }
  ],
  "@version": 1
}"�MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent,MOD.Core.RigidbodyComponent,MOD.Core.MonsterMovementComponent,MOD.Core.AIChaseComponent,MOD.Core.StateComponent,MOD.Core.StateStringToMonsterActionComponent,MOD.Core.HitComponent,MOD.Core.DamageSkinSpawnerComponent,MOD.Core.ChatBalloonComponent,MOD.Core.NameTagComponent�
$14591ec6-78bd-401d-b084-885c982c8817/maps/map01/TileBottle1�{
  "name": "TileBottle1",
  "path": "/maps/map01/TileBottle1",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMapObject$01753e7d8bdb429cbc26c7cfd8d24373",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 6.38266039,
        "y": 13.3328581,
        "z": 999.945
      },
      "QuaternionRotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.46174854,
        "w": 0.8870109
      },
      "Rotation": {
        "x": 0.0,
        "y": 0.0,
        "z": 55.0
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
      "SpriteRUID": "8bddb6da5f0247948dca0ced91f9cf85",
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
$1cbfc5c4-35a8-4992-aae1-827f28652e5a/maps/map01/TileStatue1�{
  "name": "TileStatue1",
  "path": "/maps/map01/TileStatue1",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMapObject$010f45c4758f422080db57d83a677e5e",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 8.406947,
        "y": 11.5782146,
        "z": 999.944
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
      "SpriteRUID": "fed12733f0d748d58fc118fc86db7c89",
      "LocalPosition": {
        "x": -0.2,
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
$b0476ae8-2fe0-4b02-ab2f-5bdb44a75eea/maps/map01/TileCollection1�{
  "name": "TileCollection1",
  "path": "/maps/map01/TileCollection1",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMapObject$0233c3b6129f43498a77296a001a5a8d",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 10.6311016,
        "y": 17.4942856,
        "z": 999.943
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
      "SpriteRUID": "7c6de30c2a57485387fb6845c2369baa",
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
$9f92f5a1-f4f3-4bd4-882c-4e811464eb35/maps/map01/TileCabinet1�{
  "name": "TileCabinet1",
  "path": "/maps/map01/TileCabinet1",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMapObject$02575d119f574a36b54e446f9694aa86",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 13.1594,
        "y": 18.2817879,
        "z": 999.942
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
      "SpriteRUID": "b8b3b67e29324fd9b913ae08be94e8a1",
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
$68d97738-0a8d-4216-b310-ec4d809f9838/maps/map01/TileWall1�{
  "name": "TileWall1",
  "path": "/maps/map01/TileWall1",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMapObject$053f5e2132224487bae1a4e81306398f",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 11.2582474,
        "y": 10.872858,
        "z": 999.941
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
      "SpriteRUID": "104bd4b08296471fa91152d2fa95c005",
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
$17b89908-1a3a-4c85-aa6d-1aac86388149/maps/map01/TileCabinet2�{
  "name": "TileCabinet2",
  "path": "/maps/map01/TileCabinet2",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMapObject$05a5ca559bbf47529c1b9b06584ba6d5",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 14.658762,
        "y": 18.36893,
        "z": 999.94
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
      "SpriteRUID": "13964b39acef483885fc4e0311a04a35",
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
$b5b53343-31c1-42ec-8c61-af9118def6df/maps/map01/TileCabinet3�{
  "name": "TileCabinet3",
  "path": "/maps/map01/TileCabinet3",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMapObject$07bbf86bab8c41b4ba90a15adcb9cea8",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 15.9683952,
        "y": 18.09679,
        "z": 999.939
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
      "SpriteRUID": "5f3b971e951543eea5c31f448a8c6e95",
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
$6b570f67-a9cc-4eee-ac44-a3e23abf4d3d/maps/map01/TileTheThing1�{
  "name": "TileTheThing1",
  "path": "/maps/map01/TileTheThing1",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMapObject$09bfbfbb4a354a1aa33f8632cf4d26d8",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 18.2224,
        "y": 18.3892879,
        "z": 999.938
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
      "SpriteRUID": "93b9910fb93c4af29eb8abc58e4b0fe1",
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
$bb04ab6d-094c-4572-8c5b-788963940356/maps/map01/TileHidden�{
  "name": "TileHidden",
  "path": "/maps/map01/TileHidden",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMapObject$05d07e684a454c6d8e6d6e6d378a0354",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 8.314935,
        "y": 9.813214,
        "z": 999.937
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
      "SpriteRUID": "684b2f510e7541a395275def6eb07b19",
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
      "Enable": false,
      "@type": "MOD.Core.SpriteRendererComponent"
    }
  ],
  "@version": 1
}"<MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent�
$6f9afa7a-5a69-4348-9654-3f2b1eaa540a/maps/map01/TileTorch1�{
  "name": "TileTorch1",
  "path": "/maps/map01/TileTorch1",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMapObject$04f8cc1f5a774a548241c27ce7834a71",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 5.970041,
        "y": 9.01741,
        "z": 999.936
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
      "SpriteRUID": "3913568046574b92a7552fdf2ba711a5",
      "LocalPosition": {
        "x": -0.1,
        "y": -0.2
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
      "EndFrameIndex": 6,
      "PlayRate": 1.0,
      "ActionSheet": {},
      "Enable": true,
      "@type": "MOD.Core.SpriteRendererComponent"
    }
  ],
  "@version": 1
}"<MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent�
$98783790-d623-4ac9-9d57-a5997ccfc613/maps/map01/TileStatue2�{
  "name": "TileStatue2",
  "path": "/maps/map01/TileStatue2",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMapObject$0e6037a7d38b4a43914d5a26e4d8a3ed",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 5.39951754,
        "y": 6.417856,
        "z": 999.935
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
      "SpriteRUID": "c5ba60faea3943abb0bf73f551348717",
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
$f1118d3f-cf8d-484f-b4f8-db33f9a36e0c/maps/map01/TileCastle�{
  "name": "TileCastle",
  "path": "/maps/map01/TileCastle",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MapleStoryMapObject$0a40901537a54e76909b0194943b83c5",
    "sub_entity_id": null
  },
  "@components": [
    {
      "Position": {
        "x": 8.752144,
        "y": 8.426072,
        "z": 999.934
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
      "SpriteRUID": "5d7eb1396f924aefa3b8d3088c6ca9cb",
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
}"<MOD.Core.TransformComponent,MOD.Core.SpriteRendererComponent8���䚄���5
 64bafd24349743e792677c0c1fc657bb f632dad4121d46e3a8e3e76f7cc1979cmodel://asset/player"x-mod/model2�4�4{
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
        "x": 10.0,
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
      "Name": "CameraOffset",
      "ValueType": {
        "$type": "MODNativeType",
        "type": "MOD.Core.MODVector2, MOD.Core, Version=1.0.3.0, Culture=neutral, PublicKeyToken=null"
      },
      "Value": {
        "$type": "MOD.Core.MODVector2, MOD.Core",
        "x": 10.0,
        "y": 0.0
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
        "x": 20.0,
        "y": 0.0,
        "z": 0.0
      }
    }
  ],
  "EventLinks": [],
  "Children": []
}8��������J 2774e6df33cb45538ef57c735ee3a40d�	
 0e144406320a4e41be6c4b48e8ee02c3 f632dad4121d46e3a8e3e76f7cc1979c<model://maplestorymapobject$00035747aedb4111a2058fee63c0e055"x-mod/model2��{
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
}8��������J 88ee4194dbe14839bca9e8895000c43c�	
 88bc6d8814844374a4eb97bb1d49faf5 f632dad4121d46e3a8e3e76f7cc1979c<model://maplestorymapobject$000fe9c23a0f4a1bbfa15d6d8e66c4f0"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMapObject$000fe9c23a0f4a1bbfa15d6d8e66c4f0",
  "ModelId": "MapObject",
  "DataSetId": "MapObjectDataSet",
  "DataId": "000fe9c23a0f4a1bbfa15d6d8e66c4f0",
  "Target": {
    "Name": "MapleStoryMapObject$000fe9c23a0f4a1bbfa15d6d8e66c4f0",
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
        "Value": "c35dc58fa0254fc3942d99ea83b10c10"
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
}8��߻����J 0396ae2a36324e4b8432ccfd046d8949�	
 59ba90eb241e42dfa5495fce3ec39d61 f632dad4121d46e3a8e3e76f7cc1979c<model://maplestorymapobject$00407706baf14b9dbce291c72ea785ff"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMapObject$00407706baf14b9dbce291c72ea785ff",
  "ModelId": "MapObject",
  "DataSetId": "MapObjectDataSet",
  "DataId": "00407706baf14b9dbce291c72ea785ff",
  "Target": {
    "Name": "MapleStoryMapObject$00407706baf14b9dbce291c72ea785ff",
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
        "Value": "9668501205af4c3188b78328f55c8220"
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
}8��������J 9e918cbe84624251a5e74e77001260e0�	
 4e9da024645e4612aa1cf64d2a849cc1 f632dad4121d46e3a8e3e76f7cc1979c<model://maplestorymapobject$005bc438766d47ebbb8536d0de285aad"x-mod/model2��{
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
}8��������J 1d90fcebe4c944acaebe932e00184f5f�	
 bb8bcf5d6b7a4a00aa6d947bab7df928 f632dad4121d46e3a8e3e76f7cc1979c<model://maplestorymapobject$010f45c4758f422080db57d83a677e5e"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMapObject$010f45c4758f422080db57d83a677e5e",
  "ModelId": "MapObject",
  "DataSetId": "MapObjectDataSet",
  "DataId": "010f45c4758f422080db57d83a677e5e",
  "Target": {
    "Name": "MapleStoryMapObject$010f45c4758f422080db57d83a677e5e",
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
        "Value": "fed12733f0d748d58fc118fc86db7c89"
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
}8˔�۟���J fb4d92fdfaa94dce92c6268358d0cf97�	
 64dbe17a656c41d08bbeeda0dd2dfb22 f632dad4121d46e3a8e3e76f7cc1979c<model://maplestorymapobject$01753e7d8bdb429cbc26c7cfd8d24373"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMapObject$01753e7d8bdb429cbc26c7cfd8d24373",
  "ModelId": "MapObject",
  "DataSetId": "MapObjectDataSet",
  "DataId": "01753e7d8bdb429cbc26c7cfd8d24373",
  "Target": {
    "Name": "MapleStoryMapObject$01753e7d8bdb429cbc26c7cfd8d24373",
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
        "Value": "8bddb6da5f0247948dca0ced91f9cf85"
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
}8�������J eaf75e5a89b24ff9b88d104af576d5a1�	
 a30d48f252364b4d89b7e98f7680aa16 f632dad4121d46e3a8e3e76f7cc1979c<model://maplestorymapobject$0178b710a35c4924a7d79d1f76ce4770"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMapObject$0178b710a35c4924a7d79d1f76ce4770",
  "ModelId": "MapObject",
  "DataSetId": "MapObjectDataSet",
  "DataId": "0178b710a35c4924a7d79d1f76ce4770",
  "Target": {
    "Name": "MapleStoryMapObject$0178b710a35c4924a7d79d1f76ce4770",
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
        "Value": "f76e32ba974d46969ffb0a2f516b7fe4"
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
}8��������J 5bfced227ec347ecbc4213bdc7b3dbe6�	
 588c596b1cf741e49931c3042ff95140 f632dad4121d46e3a8e3e76f7cc1979c<model://maplestorymapobject$0233c3b6129f43498a77296a001a5a8d"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMapObject$0233c3b6129f43498a77296a001a5a8d",
  "ModelId": "MapObject",
  "DataSetId": "MapObjectDataSet",
  "DataId": "0233c3b6129f43498a77296a001a5a8d",
  "Target": {
    "Name": "MapleStoryMapObject$0233c3b6129f43498a77296a001a5a8d",
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
        "Value": "7c6de30c2a57485387fb6845c2369baa"
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
}8�������J cf6b44134c494b9c9edc75704218c244�	
 9a91c1ff693a4573827d461a4a03cac1 f632dad4121d46e3a8e3e76f7cc1979c<model://maplestorymapobject$024fdcd115b44c61a37f0a8631175319"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMapObject$024fdcd115b44c61a37f0a8631175319",
  "ModelId": "MapObject",
  "DataSetId": "MapObjectDataSet",
  "DataId": "024fdcd115b44c61a37f0a8631175319",
  "Target": {
    "Name": "MapleStoryMapObject$024fdcd115b44c61a37f0a8631175319",
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
        "Value": "c03a6361651d4af593bd147d956e3998"
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
}8��������J 1289961986134261a642bb31bf052de6�	
 f52e2b2418d943638d5481dfde72c0e2 f632dad4121d46e3a8e3e76f7cc1979c<model://maplestorymapobject$02575d119f574a36b54e446f9694aa86"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMapObject$02575d119f574a36b54e446f9694aa86",
  "ModelId": "MapObject",
  "DataSetId": "MapObjectDataSet",
  "DataId": "02575d119f574a36b54e446f9694aa86",
  "Target": {
    "Name": "MapleStoryMapObject$02575d119f574a36b54e446f9694aa86",
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
        "Value": "b8b3b67e29324fd9b913ae08be94e8a1"
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
}8�������J 669ea60d6bac477a8e0ca2db706cdc45�	
 66af730843b0415bb2a17a7e507370e1 f632dad4121d46e3a8e3e76f7cc1979c<model://maplestorymapobject$02eff0f5bcd843b88ddcee592bca0183"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMapObject$02eff0f5bcd843b88ddcee592bca0183",
  "ModelId": "MapObject",
  "DataSetId": "MapObjectDataSet",
  "DataId": "02eff0f5bcd843b88ddcee592bca0183",
  "Target": {
    "Name": "MapleStoryMapObject$02eff0f5bcd843b88ddcee592bca0183",
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
        "Value": "7e62e8b9359149fbb06589728489fdf0"
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
}8�ӳ����J 428043b000174ef08bc929ad8cbb5252�	
 0993bd3581054caf9ae7e4f6e8a42511 f632dad4121d46e3a8e3e76f7cc1979c<model://maplestorymapobject$0322a089c31c4db4aee659f2093f880a"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMapObject$0322a089c31c4db4aee659f2093f880a",
  "ModelId": "MapObject",
  "DataSetId": "MapObjectDataSet",
  "DataId": "0322a089c31c4db4aee659f2093f880a",
  "Target": {
    "Name": "MapleStoryMapObject$0322a089c31c4db4aee659f2093f880a",
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
        "Value": "b5f4c3cc02134db89bc96abfac2da17e"
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
}8��������J 3c7a00582c5848b899f7637a679074a0�	
 4fd7c4edb64147fcb1981783df505f06 f632dad4121d46e3a8e3e76f7cc1979c<model://maplestorymapobject$033fa51060c14c5887a6a7dfd49f62ae"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMapObject$033fa51060c14c5887a6a7dfd49f62ae",
  "ModelId": "MapObject",
  "DataSetId": "MapObjectDataSet",
  "DataId": "033fa51060c14c5887a6a7dfd49f62ae",
  "Target": {
    "Name": "MapleStoryMapObject$033fa51060c14c5887a6a7dfd49f62ae",
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
        "Value": "d315b35228754a4182b5df10e79d4044"
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
}8��������J 353bf30165a644299f896f87de5fb959�	
 222e3107fe114366a0aa23b2d3bf2c13 f632dad4121d46e3a8e3e76f7cc1979c<model://maplestorymapobject$034130b42f944bbd93856e89b7e88034"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMapObject$034130b42f944bbd93856e89b7e88034",
  "ModelId": "MapObject",
  "DataSetId": "MapObjectDataSet",
  "DataId": "034130b42f944bbd93856e89b7e88034",
  "Target": {
    "Name": "MapleStoryMapObject$034130b42f944bbd93856e89b7e88034",
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
        "Value": "0c0b7f8d596448758aac6205dbd6b22c"
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
}8��������J 1a15482d8df1426fabc49a1fa86edd68�	
 5c07dbf054114ffbb222e93cec4af6ea f632dad4121d46e3a8e3e76f7cc1979c<model://maplestorymapobject$035506d00ac146f4afb71ca2556f5668"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMapObject$035506d00ac146f4afb71ca2556f5668",
  "ModelId": "MapObject",
  "DataSetId": "MapObjectDataSet",
  "DataId": "035506d00ac146f4afb71ca2556f5668",
  "Target": {
    "Name": "MapleStoryMapObject$035506d00ac146f4afb71ca2556f5668",
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
        "Value": "be2a7a3ee5a0423ebf948a8c5979de73"
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
}8�ӳ����J f3db845e628f4d848881b6c6b6f88f0a�	
 18ab25e7a8dd49d9a7a5c8930a5de4b5 f632dad4121d46e3a8e3e76f7cc1979c<model://maplestorymapobject$035d4af4111b41829b222b7d9b013915"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMapObject$035d4af4111b41829b222b7d9b013915",
  "ModelId": "MapObject",
  "DataSetId": "MapObjectDataSet",
  "DataId": "035d4af4111b41829b222b7d9b013915",
  "Target": {
    "Name": "MapleStoryMapObject$035d4af4111b41829b222b7d9b013915",
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
        "Value": "ba579594531d45e1ad8d7f96cb2ecd3d"
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
}8��������J ba638e5bd5894b9e9aaa343ed498b7f7�	
 94bd4164002241bb8d8ac4e3acdfc56f f632dad4121d46e3a8e3e76f7cc1979c<model://maplestorymapobject$04313b6a3e3e42ce841a4e343235159d"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMapObject$04313b6a3e3e42ce841a4e343235159d",
  "ModelId": "MapObject",
  "DataSetId": "MapObjectDataSet",
  "DataId": "04313b6a3e3e42ce841a4e343235159d",
  "Target": {
    "Name": "MapleStoryMapObject$04313b6a3e3e42ce841a4e343235159d",
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
        "Value": "1f23cda068f54db4bcb35d8962a8dbc9"
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
}8��������J c0dae5c28575455488693764f9124edf�	
 9ea2deb65628475193548295c16d2c97 f632dad4121d46e3a8e3e76f7cc1979c<model://maplestorymapobject$04f8cc1f5a774a548241c27ce7834a71"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMapObject$04f8cc1f5a774a548241c27ce7834a71",
  "ModelId": "MapObject",
  "DataSetId": "MapObjectDataSet",
  "DataId": "04f8cc1f5a774a548241c27ce7834a71",
  "Target": {
    "Name": "MapleStoryMapObject$04f8cc1f5a774a548241c27ce7834a71",
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
        "Value": "3913568046574b92a7552fdf2ba711a5"
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
}8�������J 3c8b3befe8064ee2af4bd198f37d5b6e�	
 8405766078a7458aa9884affabdfc60d f632dad4121d46e3a8e3e76f7cc1979c<model://maplestorymapobject$04fcb191775b406a8f74cfd08ff4cba2"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMapObject$04fcb191775b406a8f74cfd08ff4cba2",
  "ModelId": "MapObject",
  "DataSetId": "MapObjectDataSet",
  "DataId": "04fcb191775b406a8f74cfd08ff4cba2",
  "Target": {
    "Name": "MapleStoryMapObject$04fcb191775b406a8f74cfd08ff4cba2",
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
        "Value": "ada28480a72b4335ab27977d0270baec"
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
}8˔�۟���J 4a418d0a06224efc8e305e4ad5809a4c�	
 1ed20231150447d38fbe86d19f08f305 f632dad4121d46e3a8e3e76f7cc1979c<model://maplestorymapobject$053f5e2132224487bae1a4e81306398f"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMapObject$053f5e2132224487bae1a4e81306398f",
  "ModelId": "MapObject",
  "DataSetId": "MapObjectDataSet",
  "DataId": "053f5e2132224487bae1a4e81306398f",
  "Target": {
    "Name": "MapleStoryMapObject$053f5e2132224487bae1a4e81306398f",
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
        "Value": "104bd4b08296471fa91152d2fa95c005"
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
}8˔�۟���J e68d69f396ea4da68b8cf32ae2c0ab4b�	
 f8595f6dd246471d880cc7de69287c91 f632dad4121d46e3a8e3e76f7cc1979c<model://maplestorymapobject$05a5ca559bbf47529c1b9b06584ba6d5"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMapObject$05a5ca559bbf47529c1b9b06584ba6d5",
  "ModelId": "MapObject",
  "DataSetId": "MapObjectDataSet",
  "DataId": "05a5ca559bbf47529c1b9b06584ba6d5",
  "Target": {
    "Name": "MapleStoryMapObject$05a5ca559bbf47529c1b9b06584ba6d5",
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
        "Value": "13964b39acef483885fc4e0311a04a35"
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
}8�������J 3195b40810274b60af2bde4f227fa70e�	
 d5c852790142411d872888293e1b96d3 f632dad4121d46e3a8e3e76f7cc1979c<model://maplestorymapobject$05d07e684a454c6d8e6d6e6d378a0354"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMapObject$05d07e684a454c6d8e6d6e6d378a0354",
  "ModelId": "MapObject",
  "DataSetId": "MapObjectDataSet",
  "DataId": "05d07e684a454c6d8e6d6e6d378a0354",
  "Target": {
    "Name": "MapleStoryMapObject$05d07e684a454c6d8e6d6e6d378a0354",
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
        "Value": "684b2f510e7541a395275def6eb07b19"
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
}8�������J b0041534995a423ba077003aa118ecb1�	
 289ac14133a64a948db224cead93cb6d f632dad4121d46e3a8e3e76f7cc1979c<model://maplestorymapobject$061cb21790ef4454b37b50bf21d66f21"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMapObject$061cb21790ef4454b37b50bf21d66f21",
  "ModelId": "MapObject",
  "DataSetId": "MapObjectDataSet",
  "DataId": "061cb21790ef4454b37b50bf21d66f21",
  "Target": {
    "Name": "MapleStoryMapObject$061cb21790ef4454b37b50bf21d66f21",
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
        "Value": "f901b8714a6b4d54b54e56e1f3075454"
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
}8˔�۟���J 16047ead9bd94eb7b1db9086767dc319�	
 86b0175d6d0e48a89c91bd7db62c8d8a f632dad4121d46e3a8e3e76f7cc1979c<model://maplestorymapobject$0671c9339aa8433f89dbb15b854f4ec7"x-mod/model2��{
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
}8��������J 72a5ffc285494efdad9c6026df82d873�	
 54923b43bbf1484da41d6b4536bdd903 f632dad4121d46e3a8e3e76f7cc1979c<model://maplestorymapobject$0743c3d7f51047b3804433471e2fc482"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMapObject$0743c3d7f51047b3804433471e2fc482",
  "ModelId": "MapObject",
  "DataSetId": "MapObjectDataSet",
  "DataId": "0743c3d7f51047b3804433471e2fc482",
  "Target": {
    "Name": "MapleStoryMapObject$0743c3d7f51047b3804433471e2fc482",
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
        "Value": "4571e0454274432a92c639830a2f8680"
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
}8��������J b0a1d6bd50a24b95acf8e341d46685d9�	
 962140e6e986428cbd486e75380d7d0b f632dad4121d46e3a8e3e76f7cc1979c<model://maplestorymapobject$0783750fa40d4679990a6aa1e29a3237"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMapObject$0783750fa40d4679990a6aa1e29a3237",
  "ModelId": "MapObject",
  "DataSetId": "MapObjectDataSet",
  "DataId": "0783750fa40d4679990a6aa1e29a3237",
  "Target": {
    "Name": "MapleStoryMapObject$0783750fa40d4679990a6aa1e29a3237",
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
        "Value": "bcd8a2a7cfc74d93aed23639bc68b26d"
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
}8˔�۟���J e359ea56d4994c988026512aaf0946b1�	
 ca21a0a5d7184def9f7fd6c1c86aac84 f632dad4121d46e3a8e3e76f7cc1979c<model://maplestorymapobject$07b92287e3df44faaba1ce5334132f02"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMapObject$07b92287e3df44faaba1ce5334132f02",
  "ModelId": "MapObject",
  "DataSetId": "MapObjectDataSet",
  "DataId": "07b92287e3df44faaba1ce5334132f02",
  "Target": {
    "Name": "MapleStoryMapObject$07b92287e3df44faaba1ce5334132f02",
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
        "Value": "d3ec15f947c84cc4887876534c5662ad"
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
}8˔�۟���J a02ea86d76fd418e9d19cf4bb15ec222�	
 291ca901fb024c198eb8d31f355a35aa f632dad4121d46e3a8e3e76f7cc1979c<model://maplestorymapobject$07bbf86bab8c41b4ba90a15adcb9cea8"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMapObject$07bbf86bab8c41b4ba90a15adcb9cea8",
  "ModelId": "MapObject",
  "DataSetId": "MapObjectDataSet",
  "DataId": "07bbf86bab8c41b4ba90a15adcb9cea8",
  "Target": {
    "Name": "MapleStoryMapObject$07bbf86bab8c41b4ba90a15adcb9cea8",
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
        "Value": "5f3b971e951543eea5c31f448a8c6e95"
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
}8�������J 9d755a8a2ca34f00818e9c9d99cbd61b�	
 f339428f23224e69afc32fc98b01c8b5 f632dad4121d46e3a8e3e76f7cc1979c<model://maplestorymapobject$09bfbfbb4a354a1aa33f8632cf4d26d8"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMapObject$09bfbfbb4a354a1aa33f8632cf4d26d8",
  "ModelId": "MapObject",
  "DataSetId": "MapObjectDataSet",
  "DataId": "09bfbfbb4a354a1aa33f8632cf4d26d8",
  "Target": {
    "Name": "MapleStoryMapObject$09bfbfbb4a354a1aa33f8632cf4d26d8",
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
        "Value": "93b9910fb93c4af29eb8abc58e4b0fe1"
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
}8�������J 4cca8a2e5c60442189a68ea0536ffa90�	
 49695528b95e4909948945306d7324ea f632dad4121d46e3a8e3e76f7cc1979c<model://maplestorymapobject$09dddbfcf96d4e49a4c3d84a311706aa"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMapObject$09dddbfcf96d4e49a4c3d84a311706aa",
  "ModelId": "MapObject",
  "DataSetId": "MapObjectDataSet",
  "DataId": "09dddbfcf96d4e49a4c3d84a311706aa",
  "Target": {
    "Name": "MapleStoryMapObject$09dddbfcf96d4e49a4c3d84a311706aa",
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
        "Value": "c0898e3210d44a21b827ed0447fcaeb2"
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
}8˔�۟���J bc6203854e364a62ba44aee532c79519�	
 dc4e4ec2cd734405841b3a824f7f9fe1 f632dad4121d46e3a8e3e76f7cc1979c<model://maplestorymapobject$0a05560e25d049538eb3607259652cb7"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMapObject$0a05560e25d049538eb3607259652cb7",
  "ModelId": "MapObject",
  "DataSetId": "MapObjectDataSet",
  "DataId": "0a05560e25d049538eb3607259652cb7",
  "Target": {
    "Name": "MapleStoryMapObject$0a05560e25d049538eb3607259652cb7",
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
        "Value": "41a9d65c4ce444d3a5262de70390324a"
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
}8˔�۟���J ab59d35c525b403fa47d269ff37dd944�	
 0a4a56e1291e44d4b66596455a274b24 f632dad4121d46e3a8e3e76f7cc1979c<model://maplestorymapobject$0a40901537a54e76909b0194943b83c5"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMapObject$0a40901537a54e76909b0194943b83c5",
  "ModelId": "MapObject",
  "DataSetId": "MapObjectDataSet",
  "DataId": "0a40901537a54e76909b0194943b83c5",
  "Target": {
    "Name": "MapleStoryMapObject$0a40901537a54e76909b0194943b83c5",
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
        "Value": "5d7eb1396f924aefa3b8d3088c6ca9cb"
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
}8˭�ߐ���J f88345618e484d5d8d5a6f6fb0c506b5�	
 4356334c8dfc4d93915c357614754364 f632dad4121d46e3a8e3e76f7cc1979c<model://maplestorymapobject$0aa819e3b29446099b37287765e35611"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMapObject$0aa819e3b29446099b37287765e35611",
  "ModelId": "MapObject",
  "DataSetId": "MapObjectDataSet",
  "DataId": "0aa819e3b29446099b37287765e35611",
  "Target": {
    "Name": "MapleStoryMapObject$0aa819e3b29446099b37287765e35611",
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
        "Value": "99ae76700da047c7a52fd4c213fc8431"
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
}8�ӳ����J a2ee0178b0d44fd49103e66d1b65af1f�	
 390135f36e9541ec97e75e107318105a f632dad4121d46e3a8e3e76f7cc1979c<model://maplestorymapobject$0ad6cba14b5d4c2886aeebd8e243fdb2"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMapObject$0ad6cba14b5d4c2886aeebd8e243fdb2",
  "ModelId": "MapObject",
  "DataSetId": "MapObjectDataSet",
  "DataId": "0ad6cba14b5d4c2886aeebd8e243fdb2",
  "Target": {
    "Name": "MapleStoryMapObject$0ad6cba14b5d4c2886aeebd8e243fdb2",
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
        "Value": "3b3454c5b3cc4cc5bcbaab6d897cb6fb"
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
}8˔�۟���J 4030b6e3e776446e95d494beb4ac312a�	
 028483658e6d4897a6ba468ee0937292 f632dad4121d46e3a8e3e76f7cc1979c<model://maplestorymapobject$0afefeeddd024a3985e04419d4c41f2a"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMapObject$0afefeeddd024a3985e04419d4c41f2a",
  "ModelId": "MapObject",
  "DataSetId": "MapObjectDataSet",
  "DataId": "0afefeeddd024a3985e04419d4c41f2a",
  "Target": {
    "Name": "MapleStoryMapObject$0afefeeddd024a3985e04419d4c41f2a",
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
        "Value": "4583c4b3b0c74510ac1216cc7e65c635"
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
}8�ӳ����J bad6a460133d43119beeb4a51a4f3a63�	
 d96be1803bb24efda4af466116d259f5 f632dad4121d46e3a8e3e76f7cc1979c<model://maplestorymapobject$0b13f6ffe9894686b00f7ca4155e575c"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMapObject$0b13f6ffe9894686b00f7ca4155e575c",
  "ModelId": "MapObject",
  "DataSetId": "MapObjectDataSet",
  "DataId": "0b13f6ffe9894686b00f7ca4155e575c",
  "Target": {
    "Name": "MapleStoryMapObject$0b13f6ffe9894686b00f7ca4155e575c",
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
        "Value": "d566326edc6246b3aca21972561596d9"
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
}8˔�۟���J 46ca6e8273d04add85c9b116d8644de3�	
 075d9a8a83fb43339e13a0b7353a4e3c f632dad4121d46e3a8e3e76f7cc1979c<model://maplestorymapobject$0b1661cb36b84571a8b7a5b3e6424c7b"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMapObject$0b1661cb36b84571a8b7a5b3e6424c7b",
  "ModelId": "MapObject",
  "DataSetId": "MapObjectDataSet",
  "DataId": "0b1661cb36b84571a8b7a5b3e6424c7b",
  "Target": {
    "Name": "MapleStoryMapObject$0b1661cb36b84571a8b7a5b3e6424c7b",
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
        "Value": "1383e7b2dc4e4e029a5dc60cc84b2a90"
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
}8˔�۟���J 9a77341e6f55474f97dfc868cb09f900�	
 1e590e349f404b20a7f4b11d65e70107 f632dad4121d46e3a8e3e76f7cc1979c<model://maplestorymapobject$0d2bbd9f983046338418e86e8c8825fb"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMapObject$0d2bbd9f983046338418e86e8c8825fb",
  "ModelId": "MapObject",
  "DataSetId": "MapObjectDataSet",
  "DataId": "0d2bbd9f983046338418e86e8c8825fb",
  "Target": {
    "Name": "MapleStoryMapObject$0d2bbd9f983046338418e86e8c8825fb",
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
        "Value": "34ddca33bacf482eb1a6b794e0c0473b"
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
}8�ӳ����J 9d86968646a94097b075372ca4a22b81�	
 185ce711ca044ee2ac704e0ed8760c35 f632dad4121d46e3a8e3e76f7cc1979c<model://maplestorymapobject$0e6037a7d38b4a43914d5a26e4d8a3ed"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMapObject$0e6037a7d38b4a43914d5a26e4d8a3ed",
  "ModelId": "MapObject",
  "DataSetId": "MapObjectDataSet",
  "DataId": "0e6037a7d38b4a43914d5a26e4d8a3ed",
  "Target": {
    "Name": "MapleStoryMapObject$0e6037a7d38b4a43914d5a26e4d8a3ed",
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
        "Value": "c5ba60faea3943abb0bf73f551348717"
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
}8�������J 3bc62965bafa40a1b20c2dccafc7f3f9�	
 bef765f669964284a18924fffa4cf669 f632dad4121d46e3a8e3e76f7cc1979c<model://maplestorymapobject$1013114a7fb0492aa11ba7c05e805887"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMapObject$1013114a7fb0492aa11ba7c05e805887",
  "ModelId": "MapObject",
  "DataSetId": "MapObjectDataSet",
  "DataId": "1013114a7fb0492aa11ba7c05e805887",
  "Target": {
    "Name": "MapleStoryMapObject$1013114a7fb0492aa11ba7c05e805887",
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
        "Value": "82aaffbfbaf24359839f52cbc05b73c7"
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
}8�Ë����J b5f3ea09db1a4b36a820f21bc7006488�
 b6ee462c562c4c59a5d4bf571ece1b97 f632dad4121d46e3a8e3e76f7cc1979c:model://maplestorymonster$0c1d1abecc7046aab48a665c0fb7788f"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMonster$0c1d1abecc7046aab48a665c0fb7788f",
  "ModelId": "MoveMonster",
  "DataSetId": "MonsterDataSet",
  "DataId": "0c1d1abecc7046aab48a665c0fb7788f",
  "Target": {
    "Name": "MapleStoryMonster$0c1d1abecc7046aab48a665c0fb7788f",
    "BaseModelId": "model://movemonster",
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
        "Value": 1.0
      },
      {
        "TargetType": null,
        "Name": "jumpForce",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": 0.0
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
          "stand": "979f072804d04c9e99257f5f24e5bb70",
          "move": "4d6190231a66495ebc0ab239c3dda245",
          "hit1": "4c16f86aaacf496fa28283abd7f95d0d",
          "die1": "2648824a4bff430383fcdfc65dc668e4"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "4d6190231a66495ebc0ab239c3dda245"
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
}8��߻����J 69e23e98725945e0a35204ce9dc02dce�
 5bae51caa708459a99d3e5a04bede485 f632dad4121d46e3a8e3e76f7cc1979c:model://maplestorymonster$0d0434641920401aa98f3df7e0b011db"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMonster$0d0434641920401aa98f3df7e0b011db",
  "ModelId": "MoveMonster",
  "DataSetId": "MonsterDataSet",
  "DataId": "0d0434641920401aa98f3df7e0b011db",
  "Target": {
    "Name": "MapleStoryMonster$0d0434641920401aa98f3df7e0b011db",
    "BaseModelId": "model://movemonster",
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
        "Value": 1.0
      },
      {
        "TargetType": null,
        "Name": "jumpForce",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": 0.0
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
          "move": "e90425a636ef4d19850d50881122a289",
          "stand": "2636345f622a490295f0ae6d18d85e31",
          "attack1": "5e80c5a7235b4c979b851177ba3b0858",
          "attack2": "b524ac5519304a6187436427dfc680cf",
          "hit1": "518902c2e6984d68812aa20686358f5b",
          "die1": "619b3b3774f7478c876e95cc6f8def71"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "e90425a636ef4d19850d50881122a289"
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
}8��������J 545e0a2186104c028bff3d5328f39e65�
 83cbb9b8797a43d9bd4715d7e99740c3 f632dad4121d46e3a8e3e76f7cc1979c:model://maplestorymonster$0d109bc8eaf846a49a730e0059b63f17"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMonster$0d109bc8eaf846a49a730e0059b63f17",
  "ModelId": "MoveMonster",
  "DataSetId": "MonsterDataSet",
  "DataId": "0d109bc8eaf846a49a730e0059b63f17",
  "Target": {
    "Name": "MapleStoryMonster$0d109bc8eaf846a49a730e0059b63f17",
    "BaseModelId": "model://movemonster",
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
        "Value": 1.0
      },
      {
        "TargetType": null,
        "Name": "jumpForce",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": 0.0
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
          "stand": "bed2fc7d9ed045d8a76b8b5ff0262d8a",
          "move": "f42a3e29fc554d24acc7f491ac5d8178",
          "hit1": "aabbdec0b5cb4cd49bbc0b6c65a7e344",
          "die1": "4cfc04f57a5c4a7084439aeebdb2e90c",
          "skill1": "0a9b5615d6df44de9860bfe301fd77f3",
          "attack1": "67d7ab6f4a7540e3a8da7d889a79d62c",
          "skill2": "6890e2cb4af942cfa77add69c2b25a4f",
          "skill3": "17d72e036ffd4c49ab77fc12d92ad52f",
          "skill4": "687c6a1b3eda4c8686a3cae9d955e2ed",
          "skillAfter4": "35b3c0fa934d4598b2ba0ef9ac4a91d7"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "f42a3e29fc554d24acc7f491ac5d8178"
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
}8��������J 169fe522e1824161bbf57d7d59c73374�
 fdee8e3aee5541fbb5d483a490df6490 f632dad4121d46e3a8e3e76f7cc1979c:model://maplestorymonster$23fc7e7f19d047a1ad23bba942ecc7b8"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMonster$23fc7e7f19d047a1ad23bba942ecc7b8",
  "ModelId": "MoveMonster",
  "DataSetId": "MonsterDataSet",
  "DataId": "23fc7e7f19d047a1ad23bba942ecc7b8",
  "Target": {
    "Name": "MapleStoryMonster$23fc7e7f19d047a1ad23bba942ecc7b8",
    "BaseModelId": "model://movemonster",
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
        "Value": 1.0
      },
      {
        "TargetType": null,
        "Name": "jumpForce",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": 0.0
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
          "move": "8bc65d375f3749a6b29b0e12dd21c747",
          "stand": "304c330c63be41339e2658e253b08925",
          "attack1": "80f30f5f210f40d2b036bb7924b2b8a6",
          "attack2": "68a11f388f374dbd82c41846838f9248",
          "attack3": "30328be58cfd484583a11887d93f704c",
          "attack4": "ad0fc40c492f4cb8a207e9e6d0e09d41",
          "skill1": "27e8c36518f7452aab3a86d63ecebffd",
          "hit1": "15b73e38ddbc46709f3399da6a5752ba",
          "die1": "73b1841e26f049e1a6aa160beb03f1d7"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "8bc65d375f3749a6b29b0e12dd21c747"
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
}8��߻����J 28b4ff08949f4f5cb8e23f9be637e742�
 96255e34d0a649b0baa1057bfe706bb2 f632dad4121d46e3a8e3e76f7cc1979c:model://maplestorymonster$28335237cfbd4cce9d5db7b6ff1156fb"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMonster$28335237cfbd4cce9d5db7b6ff1156fb",
  "ModelId": "ChaseMonster",
  "DataSetId": "MonsterDataSet",
  "DataId": "28335237cfbd4cce9d5db7b6ff1156fb",
  "Target": {
    "Name": "MapleStoryMonster$28335237cfbd4cce9d5db7b6ff1156fb",
    "BaseModelId": "model://chasemonster",
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
        "Value": 1.5
      },
      {
        "TargetType": null,
        "Name": "jumpForce",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": 6.0
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
          "move": "acf0929cf3304f71a8b48e5fae59cdb4",
          "stand": "5eca246fcd8e4b1c9be2782ae23418eb",
          "skill1": "a6d80d348c9340e9ba9dbe671c7c97a0",
          "attack1": "8244464b1afc4e489034c5842664d151",
          "attack2": "e89d5d025bc44bc0855ea962cfc2c037",
          "jump": "fdd880f38b3a4ee381aa0f2211b01fca",
          "hit1": "ba1ee6429d45429abcdf45f16be33115",
          "die1": "dadf86a992104615908f076b5e7bb600"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "acf0929cf3304f71a8b48e5fae59cdb4"
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
}8�̍�����J 6c6727abed2f493681fa85250797fbaf�
 48aa6a9c0a2c48e28b40d7177a87040e f632dad4121d46e3a8e3e76f7cc1979c:model://maplestorymonster$3cd3be439ac549058c25a2f0b1e60274"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMonster$3cd3be439ac549058c25a2f0b1e60274",
  "ModelId": "MoveMonster",
  "DataSetId": "MonsterDataSet",
  "DataId": "3cd3be439ac549058c25a2f0b1e60274",
  "Target": {
    "Name": "MapleStoryMonster$3cd3be439ac549058c25a2f0b1e60274",
    "BaseModelId": "model://movemonster",
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
        "Value": 1.0
      },
      {
        "TargetType": null,
        "Name": "jumpForce",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": 0.0
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
          "regen": "2b963d6aa07d42b8abfae3058647ba0b",
          "stand": "1a13843f22334dc4b3b7360055086ea4",
          "move": "0d0fb04e8b76431093437ad170a2bd3b",
          "attack1": "6ce7d5a39e71446a8e87343bfe90da5b",
          "attack2": "017aff565391419399d2f62ff075ca3c",
          "attack3": "f9cdd6751aab4db293f55c6dea98606b",
          "skill1": "84c649efcfc8459c9907fdeb65c5e09a",
          "skill2": "e4c309fe57514ee4879d63c4e184fc2e",
          "hit1": "5814bdfa99014b61a86133dd31d78610",
          "die1": "18d9c871186447228a9980dfd8dad1af"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "0d0fb04e8b76431093437ad170a2bd3b"
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
}8˔�۟���J dc48c56a4bea49fdb4dd186c09564369�
 77ab353bc9c74257af98e7e97ef58fa9 f632dad4121d46e3a8e3e76f7cc1979c:model://maplestorymonster$3d2867ed546545709571dd3d154d8524"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMonster$3d2867ed546545709571dd3d154d8524",
  "ModelId": "MoveMonster",
  "DataSetId": "MonsterDataSet",
  "DataId": "3d2867ed546545709571dd3d154d8524",
  "Target": {
    "Name": "MapleStoryMonster$3d2867ed546545709571dd3d154d8524",
    "BaseModelId": "model://movemonster",
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
        "Value": 1.0
      },
      {
        "TargetType": null,
        "Name": "jumpForce",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": 0.0
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
          "stand": "07a035a9a98d48c08f475189b73159ad",
          "move": "3654fc4fecc6415e9e1d071795557998",
          "hit1": "82be6fe04a83407fb4fd8330bf1969bf",
          "die1": "a391bb761aa84ef7857347a3f630cd81"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "3654fc4fecc6415e9e1d071795557998"
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
}8˔�۟���J 60ac5e49d3b8426eb33bf7e1254728d7�
 60495a5dba7e40039ec14623d078958e f632dad4121d46e3a8e3e76f7cc1979c:model://maplestorymonster$3e2a2ccbcf5f437e85381356b82760b2"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMonster$3e2a2ccbcf5f437e85381356b82760b2",
  "ModelId": "MoveMonster",
  "DataSetId": "MonsterDataSet",
  "DataId": "3e2a2ccbcf5f437e85381356b82760b2",
  "Target": {
    "Name": "MapleStoryMonster$3e2a2ccbcf5f437e85381356b82760b2",
    "BaseModelId": "model://movemonster",
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
        "Value": 1.0
      },
      {
        "TargetType": null,
        "Name": "jumpForce",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": 0.0
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
          "move": "ee49558d9f394f2ab74a76a224ad7fa3",
          "stand": "e8a9bc61ed2442ca91e61c06b3c16dbd",
          "attack1": "3b479cc26a4041b183f3489c6124808b",
          "skill1": "8c79500963b64c8f8ad3aa3b455afa3f",
          "hit1": "fa595196da054d138f717340e7d7969e",
          "die1": "06b178f367ba4fa5b842f062ea8284a9"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "ee49558d9f394f2ab74a76a224ad7fa3"
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
}8˔�۟���J 29b3cf02c0dd4f5da612b2436439a8cf�
 0b1024bc5d3345b685694e392a062d07 f632dad4121d46e3a8e3e76f7cc1979c:model://maplestorymonster$426a143ff8564a479bca9ceb83e06689"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMonster$426a143ff8564a479bca9ceb83e06689",
  "ModelId": "MoveMonster",
  "DataSetId": "MonsterDataSet",
  "DataId": "426a143ff8564a479bca9ceb83e06689",
  "Target": {
    "Name": "MapleStoryMonster$426a143ff8564a479bca9ceb83e06689",
    "BaseModelId": "model://movemonster",
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
        "Value": 1.0
      },
      {
        "TargetType": null,
        "Name": "jumpForce",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": 0.0
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
          "move": "702dcac870e540a9a2bff7997c80f8e8",
          "stand": "20c067944bb74af8923b9a6db09e06d2",
          "attack1": "68398b6c7f7e4480b86cd1898b2caa86",
          "skill1": "92782b88df3f40f9a4f0d8b0e013d500",
          "hit1": "10741c3ac7234077b186a4ec42cec198",
          "die1": "eaa777c7233b4723874d54b196c99e38"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "702dcac870e540a9a2bff7997c80f8e8"
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
}8��������J 9d75aea3c6e14cf7b96cac79e661a0ce�
 8d9a79afa0a94aa3a9f013123bb15d03 f632dad4121d46e3a8e3e76f7cc1979c:model://maplestorymonster$43f039e5115645e387a3ca3457705f4f"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMonster$43f039e5115645e387a3ca3457705f4f",
  "ModelId": "MoveMonster",
  "DataSetId": "MonsterDataSet",
  "DataId": "43f039e5115645e387a3ca3457705f4f",
  "Target": {
    "Name": "MapleStoryMonster$43f039e5115645e387a3ca3457705f4f",
    "BaseModelId": "model://movemonster",
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
        "Value": 1.0
      },
      {
        "TargetType": null,
        "Name": "jumpForce",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": 0.0
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
          "move": "70e298de1d704950866553323b1422b6",
          "stand": "a036a8993b894fb49397e428e41ed2da",
          "hit1": "5cca59e412ff4b9ca8c344e78fafce38",
          "die1": "b1403183892a446ea1bb7cc415568cf0",
          "attack1": "9556084e79884b8ba10e1f84745d92a8",
          "skill1": "19d4be62d7084f818eccd718d58e2d2e",
          "skill2": "7e9c6f7d6737425db876d75158a61ec0",
          "skill3": "ae96f4308e074299828be74b56e91307"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "70e298de1d704950866553323b1422b6"
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
}8˔�۟���J 409e43e9791d494997354ac234dce982�
 dfecb254c8614f80a3e4e6e8a13a5ccf f632dad4121d46e3a8e3e76f7cc1979c:model://maplestorymonster$43fe0b2071634140a187296fcf636572"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMonster$43fe0b2071634140a187296fcf636572",
  "ModelId": "MoveMonster",
  "DataSetId": "MonsterDataSet",
  "DataId": "43fe0b2071634140a187296fcf636572",
  "Target": {
    "Name": "MapleStoryMonster$43fe0b2071634140a187296fcf636572",
    "BaseModelId": "model://movemonster",
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
        "Value": 1.0
      },
      {
        "TargetType": null,
        "Name": "jumpForce",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": 0.0
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
          "move": "952e567184ed430993247c1b5c114e74",
          "stand": "09bb3868216848959dba9e4530746ec4",
          "attack1": "f9e16baf14024e8791e53de92826820a",
          "skill1": "f76fedaa95614cc9a4d4b20c33dd023f",
          "hit1": "77d7c15f155c45c480006376e80bb67a",
          "die1": "e7c74618e5a6404eabb708c16f58b12d"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "952e567184ed430993247c1b5c114e74"
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
}8��߻����J 78a8cc11b57d4da7988e5dcfae6b59ca�
 440acc7dde85475d9cf789cf8c61fcd4 f632dad4121d46e3a8e3e76f7cc1979c:model://maplestorymonster$4bb18cff47f74eaeb7aa1f9bfb29af87"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMonster$4bb18cff47f74eaeb7aa1f9bfb29af87",
  "ModelId": "MoveMonster",
  "DataSetId": "MonsterDataSet",
  "DataId": "4bb18cff47f74eaeb7aa1f9bfb29af87",
  "Target": {
    "Name": "MapleStoryMonster$4bb18cff47f74eaeb7aa1f9bfb29af87",
    "BaseModelId": "model://movemonster",
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
        "Value": 1.0
      },
      {
        "TargetType": null,
        "Name": "jumpForce",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": 0.0
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
          "move": "d5d27bbe538243eb9931efd56a4cccbd",
          "stand": "04dcf745e6584ee281e8f9e5ff91eef8",
          "attack1": "79c3f2e896b845a189875286ec45cf8d",
          "hit1": "937f3f333cbd4c0d9b442c1552e5f127",
          "die1": "45f3fbd0ba9b4783979fc1468c043548"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "d5d27bbe538243eb9931efd56a4cccbd"
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
}8˔�۟���J f91f21c9907741568be767fb0b231f16�
 b2de1a9feb6145c2ac24fd4f805efe78 f632dad4121d46e3a8e3e76f7cc1979c:model://maplestorymonster$4e363102ade649b689e378dd0704f55a"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMonster$4e363102ade649b689e378dd0704f55a",
  "ModelId": "StaticMonster",
  "DataSetId": "MonsterDataSet",
  "DataId": "4e363102ade649b689e378dd0704f55a",
  "Target": {
    "Name": "MapleStoryMonster$4e363102ade649b689e378dd0704f55a",
    "BaseModelId": "model://staticmonster",
    "Components": [],
    "Properties": [],
    "Values": [
      {
        "TargetType": null,
        "Name": "actionSheet",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Collections.Generic.Dictionary`2[[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": {
          "$type": "System.Collections.Generic.Dictionary`2[[System.String, mscorlib],[System.String, mscorlib]], mscorlib",
          "stand": "53297c43a8ad4ee0a456bfa4fab10f86",
          "hit1": "3fe7ebf7dadc4d0eb37765b0f1052d9a",
          "die1": "37b8e144f76d42408eb0b32e8fd015d6",
          "attack1": "d7b4c641aa9a4dedb1b14f08fcbb6710",
          "skill1": "5ef570c599d24f859717541ed35277a3",
          "skill2": "6de66ee3a0fb4f56b83edcc52ee783da",
          "skill3": "aaab3909dfeb414a9fcd6d1dead3c369",
          "skill4": "28c5d807d91244f8bfb7ab3210ea0b4c"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "53297c43a8ad4ee0a456bfa4fab10f86"
      },
      {
        "TargetType": null,
        "Name": "spriteName",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": null
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
}8��߻����J 9ebbefff64ac4003a2bcd523b87a5769�
 8eb279361a6d4792b8460e2f031d78bd f632dad4121d46e3a8e3e76f7cc1979c:model://maplestorymonster$501fc34c11884024a890abb011aa21ff"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMonster$501fc34c11884024a890abb011aa21ff",
  "ModelId": "MoveMonster",
  "DataSetId": "MonsterDataSet",
  "DataId": "501fc34c11884024a890abb011aa21ff",
  "Target": {
    "Name": "MapleStoryMonster$501fc34c11884024a890abb011aa21ff",
    "BaseModelId": "model://movemonster",
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
        "Value": 1.0
      },
      {
        "TargetType": null,
        "Name": "jumpForce",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": 0.0
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
          "stand": "9fe264e5966544e180191a141423af42",
          "move": "ba135f41f50b4470a4eb7535d510e47a",
          "attack1": "3bf932f5e7754f1aa6ae63e36ef1b0af",
          "skill1": "cb7ea6068ca843169a34186fae152e88",
          "hit1": "9939235de3e64f60af4ff259ff5202b2",
          "die1": "edbe06bcdc874c0c8b13f79aca0869db"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "ba135f41f50b4470a4eb7535d510e47a"
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
}8��������J 4e645e872911447585a65dbc026f33b3�
 fc4542ee4a6f4f3ebf15cdb5b4ce7556 f632dad4121d46e3a8e3e76f7cc1979c:model://maplestorymonster$5bc282b3d5614e7b8a03951f98f4674f"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMonster$5bc282b3d5614e7b8a03951f98f4674f",
  "ModelId": "MoveMonster",
  "DataSetId": "MonsterDataSet",
  "DataId": "5bc282b3d5614e7b8a03951f98f4674f",
  "Target": {
    "Name": "MapleStoryMonster$5bc282b3d5614e7b8a03951f98f4674f",
    "BaseModelId": "model://movemonster",
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
        "Value": 1.0
      },
      {
        "TargetType": null,
        "Name": "jumpForce",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": 0.0
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
          "move": "7e9aa6a44eb04dca8257bc2233e945f3",
          "stand": "08d0e2fc9a434b3a80b63ec9500ec254",
          "attack1": "12f7c02ae1a845428ebbca212fd55f17",
          "skill1": "4426b0c387de449b85368ac66e2752a7",
          "hit1": "bd47e99af06945579062e4e95bc46272",
          "die1": "c86d210847d14aa0a0604bf656f252fb"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "7e9aa6a44eb04dca8257bc2233e945f3"
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
}8˔�۟���J 04c12f23ebd54a40ad3c197fa8aa963c�
 7352249cf0e4476195196f7ac0c2f483 f632dad4121d46e3a8e3e76f7cc1979c:model://maplestorymonster$62ee11e99c454acda444496913d337ad"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMonster$62ee11e99c454acda444496913d337ad",
  "ModelId": "MoveMonster",
  "DataSetId": "MonsterDataSet",
  "DataId": "62ee11e99c454acda444496913d337ad",
  "Target": {
    "Name": "MapleStoryMonster$62ee11e99c454acda444496913d337ad",
    "BaseModelId": "model://movemonster",
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
        "Value": 1.0
      },
      {
        "TargetType": null,
        "Name": "jumpForce",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": 0.0
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
          "move": "694a4a5a5f1f432fb5a8804006f9d97e",
          "stand": "a2d6154b325f47e9bfb886ae74a3fa0d",
          "attack1": "ba5fd2add95a4bb6b7ba4f706469e4fa",
          "skill1": "52f86729ed1b4452a3c269126939e0d8",
          "hit1": "53bc6db1f4954a6d87dfee5b7cb2faca",
          "die1": "b6379896aaef4a3c812078edda9c264b"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "694a4a5a5f1f432fb5a8804006f9d97e"
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
}8��������J c3283061a6a14a5aa8c225baf1613de7�
 849e2f12468743509d82c33293db46f8 f632dad4121d46e3a8e3e76f7cc1979c:model://maplestorymonster$655e7de016c04a6bb7c88a8e85e830ad"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMonster$655e7de016c04a6bb7c88a8e85e830ad",
  "ModelId": "ChaseMonster",
  "DataSetId": "MonsterDataSet",
  "DataId": "655e7de016c04a6bb7c88a8e85e830ad",
  "Target": {
    "Name": "MapleStoryMonster$655e7de016c04a6bb7c88a8e85e830ad",
    "BaseModelId": "model://chasemonster",
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
        "Value": 1.5
      },
      {
        "TargetType": null,
        "Name": "jumpForce",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": 6.0
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
          "move": "8239541953a6457fbe6d35e17f19f0f8",
          "stand": "1a176a7afb114fe7aef2bc58ef2d945b",
          "jump": "a7ea0755262242199ae50ab6a3387034",
          "hit1": "7b405108d05741699893a4dc3d715165",
          "die1": "9e74e807797d442f9c938ca64aa9f4cd"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "8239541953a6457fbe6d35e17f19f0f8"
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
}8˔�۟���J 1f5920f96d8a40ddba663b148b7e5ff5�
 134b1bcfd43b4663a2309ea655cf6148 f632dad4121d46e3a8e3e76f7cc1979c:model://maplestorymonster$6787658d4a3c45f683f3531534aa1753"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMonster$6787658d4a3c45f683f3531534aa1753",
  "ModelId": "StaticMonster",
  "DataSetId": "MonsterDataSet",
  "DataId": "6787658d4a3c45f683f3531534aa1753",
  "Target": {
    "Name": "MapleStoryMonster$6787658d4a3c45f683f3531534aa1753",
    "BaseModelId": "model://staticmonster",
    "Components": [],
    "Properties": [],
    "Values": [
      {
        "TargetType": null,
        "Name": "actionSheet",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Collections.Generic.Dictionary`2[[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": {
          "$type": "System.Collections.Generic.Dictionary`2[[System.String, mscorlib],[System.String, mscorlib]], mscorlib",
          "stand": "4d22d4f8a94546f3b27d7e9e7d8946e3",
          "hit1": "c31dd41d7b3d4682bc0f48f4bdc96d79",
          "die1": "d2a5926b1ab94c2cbb9c18a4df755763"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "4d22d4f8a94546f3b27d7e9e7d8946e3"
      },
      {
        "TargetType": null,
        "Name": "spriteName",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": null
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
}8��������J 03442efc806f418cb19ca3e852b5109a�
 bbd469df041f41f2a88530cccb42611e f632dad4121d46e3a8e3e76f7cc1979c:model://maplestorymonster$68639a64ada24f2e9cb58fe4d627b79d"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMonster$68639a64ada24f2e9cb58fe4d627b79d",
  "ModelId": "MoveMonster",
  "DataSetId": "MonsterDataSet",
  "DataId": "68639a64ada24f2e9cb58fe4d627b79d",
  "Target": {
    "Name": "MapleStoryMonster$68639a64ada24f2e9cb58fe4d627b79d",
    "BaseModelId": "model://movemonster",
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
        "Value": 1.0
      },
      {
        "TargetType": null,
        "Name": "jumpForce",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": 0.0
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
          "stand": "b8b6dc4cfb8f47aa8d8635d92049e845",
          "move": "06a65f73c1ac4e79978e0995fc2c9193",
          "attack1": "c9284f1e3c2e4e17b66898e46598b969",
          "hit1": "eb1cf243edd34dc19da45926afceaaf9",
          "die1": "132613b13beb42b099145607d578d9a0"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "06a65f73c1ac4e79978e0995fc2c9193"
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
}8��������J d93c762703414ea69d80ab37a519accd�
 0fcf3ec6725b43b0b8ad04d625303695 f632dad4121d46e3a8e3e76f7cc1979c:model://maplestorymonster$7578e094d75149cf855bdeb8d95749dc"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMonster$7578e094d75149cf855bdeb8d95749dc",
  "ModelId": "MoveMonster",
  "DataSetId": "MonsterDataSet",
  "DataId": "7578e094d75149cf855bdeb8d95749dc",
  "Target": {
    "Name": "MapleStoryMonster$7578e094d75149cf855bdeb8d95749dc",
    "BaseModelId": "model://movemonster",
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
        "Value": 1.0
      },
      {
        "TargetType": null,
        "Name": "jumpForce",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": 0.0
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
          "stand": "d298e48c66a64ea99bca0c8a5dcf328f",
          "move": "a2c3be0ad6aa4b0b95681925bece7109",
          "attack1": "134eefc0122947769194d028d61c012f",
          "attack2": "e3389407e6c04104bbbf979d00585f8f",
          "attack3": "81d7b1ba5c6f41549233bf75ac6bb85f",
          "attack4": "e199a93497ee4a65928a7423dacc8882",
          "attack5": "3379f16f1660489dbf4cd57f53c993b8",
          "hit1": "d34c310eaa1d484a8a42c1b2c427c28d",
          "die1": "37983ead0cf545a2a148b231f69c594a"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "a2c3be0ad6aa4b0b95681925bece7109"
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
}8��������J b63cb3c23156416792ce808f0e1627c3�
 a54592c0c5144114a019086fd5514662 f632dad4121d46e3a8e3e76f7cc1979c:model://maplestorymonster$767e17f65a3d491c91e78914f8648b72"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMonster$767e17f65a3d491c91e78914f8648b72",
  "ModelId": "MoveMonster",
  "DataSetId": "MonsterDataSet",
  "DataId": "767e17f65a3d491c91e78914f8648b72",
  "Target": {
    "Name": "MapleStoryMonster$767e17f65a3d491c91e78914f8648b72",
    "BaseModelId": "model://movemonster",
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
        "Value": 1.0
      },
      {
        "TargetType": null,
        "Name": "jumpForce",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": 0.0
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
          "move": "47f512a4570a4715a0a3702167ee67e4",
          "stand": "d32ad556f67147d89dbbc9d8eb603bc0",
          "attack1": "39e5f4e19a954b6f8f42a414c712866d",
          "attack2": "22079780d134460085254a898ac9c6a9",
          "hit1": "e4f05d51a843467396fbabc3c6d5fcbe",
          "die1": "d26a338bdf614dbf866e5f53fcf07663"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "47f512a4570a4715a0a3702167ee67e4"
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
}8��������J 8af1054a87c2476cb8955da01218962d�
 7372ed86aad74ca98324a84e3e7d989e f632dad4121d46e3a8e3e76f7cc1979c:model://maplestorymonster$78c49b884db147fe927105d5ab88210f"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMonster$78c49b884db147fe927105d5ab88210f",
  "ModelId": "MoveMonster",
  "DataSetId": "MonsterDataSet",
  "DataId": "78c49b884db147fe927105d5ab88210f",
  "Target": {
    "Name": "MapleStoryMonster$78c49b884db147fe927105d5ab88210f",
    "BaseModelId": "model://movemonster",
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
        "Value": 1.0
      },
      {
        "TargetType": null,
        "Name": "jumpForce",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": 0.0
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
          "move": "02ccd5b15e4d4faea56001b692b88379",
          "stand": "c75d27a1132b4d1fb482394692ac9aa7",
          "attack1": "b0991bdfe9cb446bb7a691aa98dd8eb5",
          "hit1": "844877f00ca640c5a7b7db877ef1c4f3",
          "die1": "94cb4a84768a41cdabe0299896239cf3"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "02ccd5b15e4d4faea56001b692b88379"
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
}8��������J 6242bd65a8c04730b89ada7dfd67bb19�
 33942d58c9ee4ef2b078e5fb7fe34b38 f632dad4121d46e3a8e3e76f7cc1979c:model://maplestorymonster$78e94f5ffc3849fa94ddcc48f8193b6d"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMonster$78e94f5ffc3849fa94ddcc48f8193b6d",
  "ModelId": "MoveMonster",
  "DataSetId": "MonsterDataSet",
  "DataId": "78e94f5ffc3849fa94ddcc48f8193b6d",
  "Target": {
    "Name": "MapleStoryMonster$78e94f5ffc3849fa94ddcc48f8193b6d",
    "BaseModelId": "model://movemonster",
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
        "Value": 1.0
      },
      {
        "TargetType": null,
        "Name": "jumpForce",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": 0.0
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
          "stand": "73d90a5a068d4974a01231e64b1f43c5",
          "move": "45259308de31498db63edaf7aff97544",
          "attack1": "1bb431cf8f7f4ae5b8b4e9fe6d823649",
          "attack2": "175568a669d7468c9b67599bfcb9b5d6",
          "attack3": "4dfd990da2d346be8d3c3063c30c71e7",
          "die1": "107ee9ec15bd43d0ab3ba50d7d09ef59",
          "hit1": "bbf0b67d2b7f4281989a6946ad93a470"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "45259308de31498db63edaf7aff97544"
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
}8��������J 5cc1f279b46d43b78f7ad8a5bd1a99a6�
 9183c1131a2e4e0792c94e8e329b6f75 f632dad4121d46e3a8e3e76f7cc1979c:model://maplestorymonster$7a2fb76c4bc14a74b78a41b7fb2936c7"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMonster$7a2fb76c4bc14a74b78a41b7fb2936c7",
  "ModelId": "MoveMonster",
  "DataSetId": "MonsterDataSet",
  "DataId": "7a2fb76c4bc14a74b78a41b7fb2936c7",
  "Target": {
    "Name": "MapleStoryMonster$7a2fb76c4bc14a74b78a41b7fb2936c7",
    "BaseModelId": "model://movemonster",
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
        "Value": 1.0
      },
      {
        "TargetType": null,
        "Name": "jumpForce",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": 0.0
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
          "stand": "e1ae7f0a3c7e488389aee50c6c279bf7",
          "move": "c63a5f1fe3fc45b28364cfc248ae3d90",
          "hit1": "d2cc8f38e5f1484a94b3442dc212b636",
          "attack1": "22cf5b894c4e4a4a90261ab0612a8199",
          "attack2": "77c199b49eed49afa28c7957d4c8bef7",
          "skill1": "4d1f20bd4f6c45478e67a7882446b457",
          "skill2": "f17f2615e1f7494db95f6e7f6d091340",
          "skill3": "58c09721dad143ab97102cfc296ac741",
          "die1": "09189b7dae0442648f7d18656a918c5a"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "c63a5f1fe3fc45b28364cfc248ae3d90"
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
}8˔�۟���J efe2da842341494aac4953e041dbdb9a�
 cc98dcf1a2264a19a05115c27a0d051a f632dad4121d46e3a8e3e76f7cc1979c:model://maplestorymonster$808b0144e6294c9f98f7c41d18ed199d"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMonster$808b0144e6294c9f98f7c41d18ed199d",
  "ModelId": "MoveMonster",
  "DataSetId": "MonsterDataSet",
  "DataId": "808b0144e6294c9f98f7c41d18ed199d",
  "Target": {
    "Name": "MapleStoryMonster$808b0144e6294c9f98f7c41d18ed199d",
    "BaseModelId": "model://movemonster",
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
        "Value": 1.0
      },
      {
        "TargetType": null,
        "Name": "jumpForce",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": 0.0
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
          "stand": "af5a8582517b4476a508f1429872f253",
          "move": "823d3542da7c43ea8bc8f99590b6f2da",
          "hit1": "814d4a19b1654aa28c3a96e4ab530e91",
          "die1": "c01530dfc2624f0b8414045ad1563e6b"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "823d3542da7c43ea8bc8f99590b6f2da"
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
}8��߻����J de4543e21c704fae98bd5dc7f0268e38�
 313b04e838b74871b1fd06f2ad665c4d f632dad4121d46e3a8e3e76f7cc1979c:model://maplestorymonster$896732ed59754635990b9b2040c27efb"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMonster$896732ed59754635990b9b2040c27efb",
  "ModelId": "MoveMonster",
  "DataSetId": "MonsterDataSet",
  "DataId": "896732ed59754635990b9b2040c27efb",
  "Target": {
    "Name": "MapleStoryMonster$896732ed59754635990b9b2040c27efb",
    "BaseModelId": "model://movemonster",
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
        "Value": 1.0
      },
      {
        "TargetType": null,
        "Name": "jumpForce",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": 0.0
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
          "stand": "790845793b714ae989f03301673ed674",
          "move": "a955046c78c3470292f42a89bfb5719a",
          "attack1": "feb66d62fdab4079992da9df50b83ba8",
          "hit1": "4ded3b4196aa4a6a8bd71bce21171f3a",
          "die1": "232bac7795b14c9d8c100d6361f6b73a"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "a955046c78c3470292f42a89bfb5719a"
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
}8��߻����J 21d94b55f0aa4af6805eea6e14f54dde�
 df9a95e3a8ac4ee3b7654888d0ed80c9 f632dad4121d46e3a8e3e76f7cc1979c:model://maplestorymonster$97dde1402a0a484db33a7f50289db269"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMonster$97dde1402a0a484db33a7f50289db269",
  "ModelId": "StaticMonster",
  "DataSetId": "MonsterDataSet",
  "DataId": "97dde1402a0a484db33a7f50289db269",
  "Target": {
    "Name": "MapleStoryMonster$97dde1402a0a484db33a7f50289db269",
    "BaseModelId": "model://staticmonster",
    "Components": [],
    "Properties": [],
    "Values": [
      {
        "TargetType": null,
        "Name": "actionSheet",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Collections.Generic.Dictionary`2[[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": {
          "$type": "System.Collections.Generic.Dictionary`2[[System.String, mscorlib],[System.String, mscorlib]], mscorlib",
          "fly": "52382436bc6647fa9858c19289307528",
          "stand": "3b09f4c09cac42c78190cf5df39c2a91",
          "die1": "29c7b643a16c48d0911755e9b9b97d97"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "52382436bc6647fa9858c19289307528"
      },
      {
        "TargetType": null,
        "Name": "spriteName",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": null
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
}8��������J 98cb2b35d1284d908e6a89221fe6ded3�
 f56375f5addc47cc9bcdc8c295fcf1d1 f632dad4121d46e3a8e3e76f7cc1979c:model://maplestorymonster$9f407577fd6641d5a0def609cd66f737"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMonster$9f407577fd6641d5a0def609cd66f737",
  "ModelId": "MoveMonster",
  "DataSetId": "MonsterDataSet",
  "DataId": "9f407577fd6641d5a0def609cd66f737",
  "Target": {
    "Name": "MapleStoryMonster$9f407577fd6641d5a0def609cd66f737",
    "BaseModelId": "model://movemonster",
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
        "Value": 1.0
      },
      {
        "TargetType": null,
        "Name": "jumpForce",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": 0.0
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
          "stand": "4befcbbcbfe54ec3a4a31c5a0a6b94e2",
          "move": "172206ccff1e48238b91e8ca7362fbf0",
          "attack1": "82aae3fc0f6f4606a8ca96a1c8ad5a9c",
          "attack2": "fdb3b303902f4d3b90247c3d883d4308",
          "attack3": "d13b015edbe44e13a6950121cd9704b2",
          "hit1": "d6c61dabd04d40e088b94094c6b3dd8e",
          "die1": "a6681964c0f64d8fa899956229a66c5d"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "172206ccff1e48238b91e8ca7362fbf0"
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
}8��߻����J af3f4d649d5240eaae26995a46e443f8�
 108fc9588070427f961d4be5fc08a8ba f632dad4121d46e3a8e3e76f7cc1979c:model://maplestorymonster$9f976b4241a64af3b9867851b8964f20"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMonster$9f976b4241a64af3b9867851b8964f20",
  "ModelId": "ChaseMonster",
  "DataSetId": "MonsterDataSet",
  "DataId": "9f976b4241a64af3b9867851b8964f20",
  "Target": {
    "Name": "MapleStoryMonster$9f976b4241a64af3b9867851b8964f20",
    "BaseModelId": "model://chasemonster",
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
        "Value": 1.5
      },
      {
        "TargetType": null,
        "Name": "jumpForce",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": 6.0
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
          "move": "6ad988b3ef6d4ceab3a504d300755a5b",
          "stand": "96e955c1bf27415e84f96deea200a8f1",
          "jump": "94bbe2a7eb9c4f9caa10dd9de44ee860",
          "hit1": "aec9504d5dc24aceb5646b79d30abad4",
          "die1": "65a2bfb039614f2e9e4ccc354340153d"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "6ad988b3ef6d4ceab3a504d300755a5b"
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
}8��߻����J 85211a1a2eb94c79903caea934d7420e�
 aacebc71aba2401f9e388fa196cbac66 f632dad4121d46e3a8e3e76f7cc1979c:model://maplestorymonster$aba70fc1d897418e87a936fe2733c445"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMonster$aba70fc1d897418e87a936fe2733c445",
  "ModelId": "MoveMonster",
  "DataSetId": "MonsterDataSet",
  "DataId": "aba70fc1d897418e87a936fe2733c445",
  "Target": {
    "Name": "MapleStoryMonster$aba70fc1d897418e87a936fe2733c445",
    "BaseModelId": "model://movemonster",
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
        "Value": 1.0
      },
      {
        "TargetType": null,
        "Name": "jumpForce",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": 0.0
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
          "move": "cc07c35fb3324f08b5c2f8049ab821b7",
          "stand": "7097645993be48fa9fec7af5fee24f00",
          "attack1": "e38a0068d93b4a69b3d689756c40fa1a",
          "hit1": "3212d5365c514a24b3b25545a32be148",
          "die1": "02ddfc767aa14d368b1644a6e28fad22"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "cc07c35fb3324f08b5c2f8049ab821b7"
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
}8��������J abb189aa258540c5b6d97d1c518dd6c4�
 4fc966e1d925487289ef9453f81dad68 f632dad4121d46e3a8e3e76f7cc1979c:model://maplestorymonster$b1edacc7339f45c6bab65720aa652eb0"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMonster$b1edacc7339f45c6bab65720aa652eb0",
  "ModelId": "ChaseMonster",
  "DataSetId": "MonsterDataSet",
  "DataId": "b1edacc7339f45c6bab65720aa652eb0",
  "Target": {
    "Name": "MapleStoryMonster$b1edacc7339f45c6bab65720aa652eb0",
    "BaseModelId": "model://chasemonster",
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
        "Value": 1.5
      },
      {
        "TargetType": null,
        "Name": "jumpForce",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": 6.0
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
          "move": "6a693774b9e340eaa941a2833c47f5a3",
          "stand": "86f465bc75844ee08c14bdb4e62fe180",
          "hit1": "9c5709f3b7444a72aa0d8ca84a6fb17e",
          "die1": "de45609d4c004de0aaca21c9540e8493",
          "jump": "57a5af71c18b4cfebcfd52001cde410a",
          "skill1": "e8453d44facc4f99814c52975c63a9aa",
          "skillAfter1": "71fd53cefdc64b96adf2b094ec02dc7c"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "6a693774b9e340eaa941a2833c47f5a3"
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
}8��߻����J a9f11f8824b840fca0b71590b207b01e�
 a9449c9b681448039ddf3639c80e095f f632dad4121d46e3a8e3e76f7cc1979c:model://maplestorymonster$c7957b3ddd0a4c0fa8ba38d4464e96fa"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMonster$c7957b3ddd0a4c0fa8ba38d4464e96fa",
  "ModelId": "ChaseMonster",
  "DataSetId": "MonsterDataSet",
  "DataId": "c7957b3ddd0a4c0fa8ba38d4464e96fa",
  "Target": {
    "Name": "MapleStoryMonster$c7957b3ddd0a4c0fa8ba38d4464e96fa",
    "BaseModelId": "model://chasemonster",
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
        "Value": 1.5
      },
      {
        "TargetType": null,
        "Name": "jumpForce",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": 6.0
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
          "move": "9e133e450df647d2847388fda689f3f4",
          "stand": "1791b114de1b4865bfea5f2bb94e5d60",
          "rope": "c0fbae65e9f54ec7bf11fb277108f0d8",
          "hit1": "965ff966d41f41d6b91dd425664cdbb1",
          "die1": "1fe1381e423c4ac8a8cf86a8d166f306",
          "attack1": "237674b2c0ce44edb2be804594a4e975",
          "jump": "5c4293678052433e8724f08f0cb86c1d",
          "ladder": "efd7d02305314ca4a299e6d92ea65852"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "9e133e450df647d2847388fda689f3f4"
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
}8��������J a02c8bc2308746d8aef159fd9f711c7b�
 7fb44b5b1c5e4206a0a069cd69d89307 f632dad4121d46e3a8e3e76f7cc1979c:model://maplestorymonster$c9aa77cd25d54853a2984a59ad0da54b"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMonster$c9aa77cd25d54853a2984a59ad0da54b",
  "ModelId": "MoveMonster",
  "DataSetId": "MonsterDataSet",
  "DataId": "c9aa77cd25d54853a2984a59ad0da54b",
  "Target": {
    "Name": "MapleStoryMonster$c9aa77cd25d54853a2984a59ad0da54b",
    "BaseModelId": "model://movemonster",
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
        "Value": 1.0
      },
      {
        "TargetType": null,
        "Name": "jumpForce",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": 0.0
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
          "stand": "e1ffb6144ddf41afb38bdaddc2a2b84d",
          "move": "cde2f4ed61044b4896ac70ae9b25215a",
          "attack1": "bceae18d8e624f00b32a8c07a0e420e6",
          "skill1": "9094b84e4dbd4b55ac5e816aea3f6fe1",
          "hit1": "dd6f1da6584d486ab5170d12a3badded",
          "die1": "d440c6bf60f64badb8c8084e94446953"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "cde2f4ed61044b4896ac70ae9b25215a"
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
}8��������J 5e5b547eb624442198e54dbc6c224a5e�
 0ff5f0fdfc37425c8617cefd4213e6f3 f632dad4121d46e3a8e3e76f7cc1979c:model://maplestorymonster$d375f54c01ad4dcead6c603db8cfdf10"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMonster$d375f54c01ad4dcead6c603db8cfdf10",
  "ModelId": "StaticMonster",
  "DataSetId": "MonsterDataSet",
  "DataId": "d375f54c01ad4dcead6c603db8cfdf10",
  "Target": {
    "Name": "MapleStoryMonster$d375f54c01ad4dcead6c603db8cfdf10",
    "BaseModelId": "model://staticmonster",
    "Components": [],
    "Properties": [],
    "Values": [
      {
        "TargetType": null,
        "Name": "actionSheet",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Collections.Generic.Dictionary`2[[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": {
          "$type": "System.Collections.Generic.Dictionary`2[[System.String, mscorlib],[System.String, mscorlib]], mscorlib",
          "stand": "1bd5c855725840608f4297f1b13e6df8",
          "attack1": "57fff13dd41f462181ac6e8e30cc45c1",
          "hit1": "6b97a331cb104407becef6012cf9f06e",
          "die1": "82e0541ac1344e6789cc2372fc02fa70"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "1bd5c855725840608f4297f1b13e6df8"
      },
      {
        "TargetType": null,
        "Name": "spriteName",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": null
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
}8��������J 937bead74ecb4925b6799b2c3a0373f8�
 c9ebaeb7c5604351b284bd6cfa368d73 f632dad4121d46e3a8e3e76f7cc1979c:model://maplestorymonster$e3368579ce9244a781c8fd0ed043cbec"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMonster$e3368579ce9244a781c8fd0ed043cbec",
  "ModelId": "MoveMonster",
  "DataSetId": "MonsterDataSet",
  "DataId": "e3368579ce9244a781c8fd0ed043cbec",
  "Target": {
    "Name": "MapleStoryMonster$e3368579ce9244a781c8fd0ed043cbec",
    "BaseModelId": "model://movemonster",
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
        "Value": 1.0
      },
      {
        "TargetType": null,
        "Name": "jumpForce",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": 0.0
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
          "stand": "e63f08656bea424a9074d9049b7d5ad1",
          "move": "a43f726fe90e4ae7ae6ec0d8a3432f24",
          "attack1": "42cbee8dbd2f43dd9654bdea4f7b268e",
          "attack2": "bce6a325c58142c6bd469197884072e0",
          "attack3": "35d3dad633364ab082b5419edced0f2e",
          "skill1": "a7cf3594df1f40e6b633654e5beeb197",
          "hit1": "7a159e5d50524391980be3b24925ae92",
          "die1": "f95105e763954a7aa5765cf92669a114"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "a43f726fe90e4ae7ae6ec0d8a3432f24"
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
}8��������J 9aacd44434c44d55ade24839b5156885�
 f7b505d9fe3a4596bdc7c7a988ad64f7 f632dad4121d46e3a8e3e76f7cc1979c:model://maplestorymonster$e53f424d4c8943a59d440bd95e743492"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMonster$e53f424d4c8943a59d440bd95e743492",
  "ModelId": "StaticMonster",
  "DataSetId": "MonsterDataSet",
  "DataId": "e53f424d4c8943a59d440bd95e743492",
  "Target": {
    "Name": "MapleStoryMonster$e53f424d4c8943a59d440bd95e743492",
    "BaseModelId": "model://staticmonster",
    "Components": [],
    "Properties": [],
    "Values": [
      {
        "TargetType": null,
        "Name": "actionSheet",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Collections.Generic.Dictionary`2[[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": {
          "$type": "System.Collections.Generic.Dictionary`2[[System.String, mscorlib],[System.String, mscorlib]], mscorlib",
          "stand": "079cfd0233c24b2aa912cdab756b7ae5",
          "hit1": "fe707faf45fa4232b85f51a60a287ce1",
          "die1": "de277beb60fb43e3985e4300cf887936",
          "attack1": "f92830c816ca407ba4f1dd8be9d6f038",
          "skill1": "d0fbf68fcc7e4aff8214d99c2b8e3ef8",
          "skill2": "aa0fdb44fb374e07aa3761bad3edca07",
          "skill3": "a41405a55ab149ec96545842f45b6b81",
          "skill4": "06af8f85970045f3b5eca05b2d67e867",
          "skill5": "62bdc6cc7d944ef38288564d7bfde84b",
          "skill6": "ee94ef4b1b3348f09a4a2c349076697d",
          "skill7": "ac1a4981791341c28ce7fea12e8e5189",
          "skill8": "65c1f03e753049e6a47278402cc97595",
          "skill9": "c047b58ba9954749a6a376bc9a8238be",
          "skill10": "87e389e49f6c440e88da56ebf05d90a9"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "079cfd0233c24b2aa912cdab756b7ae5"
      },
      {
        "TargetType": null,
        "Name": "spriteName",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": null
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
}8��������J d448f838659b4cdba7c4e4b38abde7c9�
 666d82c165124721890de61fe6a37c06 f632dad4121d46e3a8e3e76f7cc1979c:model://maplestorymonster$f6de2cbac6d84d4c870d481bb9218ff1"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMonster$f6de2cbac6d84d4c870d481bb9218ff1",
  "ModelId": "MoveMonster",
  "DataSetId": "MonsterDataSet",
  "DataId": "f6de2cbac6d84d4c870d481bb9218ff1",
  "Target": {
    "Name": "MapleStoryMonster$f6de2cbac6d84d4c870d481bb9218ff1",
    "BaseModelId": "model://movemonster",
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
        "Value": 1.0
      },
      {
        "TargetType": null,
        "Name": "jumpForce",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": 0.0
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
          "stand": "dd65349cbdb84a0b97b6b2fb5cc46af7",
          "move": "b090189904234731b53d01ecbc0e043d",
          "attack1": "6bf60aaa30ba40689fe2156e0cef56c2",
          "attack2": "14451ba1ed324eb5a27a38a280e7d154",
          "attack3": "0eb10225c3bd4cde8dd7184ff0786012",
          "skill1": "ac1b606642fe4878863e605177b570d9",
          "skill2": "b39db129bab441d4b80051bdddea16cf",
          "skill3": "103bdb18d7d04ee3a963acbb990fb305",
          "skillAfter1": "c88a0a3b838a4392850e3f0e7ec2d2f2",
          "hit1": "210b87d1ad3a48b7b999c8b8d721f0d9",
          "die1": "acb82b020b5c4a6b91a6f430e10c1fc5"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "b090189904234731b53d01ecbc0e043d"
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
}8��������J 0c4c0ffd36ab408b99eb2c95e47258ff�
 60143bf1a2374a04a967458196d87031 f632dad4121d46e3a8e3e76f7cc1979c:model://maplestorymonster$f78b41b44c764edca3c61dea865f0f1a"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMonster$f78b41b44c764edca3c61dea865f0f1a",
  "ModelId": "MoveMonster",
  "DataSetId": "MonsterDataSet",
  "DataId": "f78b41b44c764edca3c61dea865f0f1a",
  "Target": {
    "Name": "MapleStoryMonster$f78b41b44c764edca3c61dea865f0f1a",
    "BaseModelId": "model://movemonster",
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
        "Value": 1.0
      },
      {
        "TargetType": null,
        "Name": "jumpForce",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": 0.0
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
          "regen": "cb17512009c142d69240d6a3d366c519",
          "stand": "441a5e74ef0a49929ff11edbf8a8257e",
          "move": "c6fc77b252d748899add45c25c957232",
          "hit1": "1a9bfefa0b5a4fe2b427b084693e09e9",
          "die1": "a7e12fdbbca440b0815bdd10810cc620",
          "skill1": "66daa6ddc0dc4d0ca45546cf3c56c0b1",
          "skill2": "62c07cbd18be4accbf61820721b69093",
          "skill3": "9d0d370469e64b2cbc8b6058907d2d36",
          "skillAfter3": "0f94ba3b6e254f1eb476a504b9c82ea2",
          "skill4": "baff487998a24e658b4649e8cbe66aa5",
          "skillAfter4": "4ba56887c0764bdb8f9ecb0ed6005e0a",
          "skill5": "f3e30eeb593d4f79ae72c6ef628e423c",
          "attack1": "28b1661a5e694dd4b6752f445b2e8881",
          "attack2": "f58cd0707df94b8eb4e9c84b734b6a58",
          "attack3": "3143fd2f205d466eb35bc99e6b59035a",
          "attack4": "6613f236ae6d4237a88754e3a167e05d",
          "attack5": "52e21ad40df04c5abc9dff199678a648",
          "attack6": "5388f2159932440ead2af10d729dcde0",
          "attack7": "c8c3cb517aef4bc5802aaf1f75ce2706",
          "attack8": "97be415781fc4b9ba86436263b1aea2e",
          "attack9": "e07ad3a384b24165b8f07338f7c3fff9",
          "attack10": "e7e3e1383496452c9f3c8d19ade05922"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "c6fc77b252d748899add45c25c957232"
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
}8��������J 6e82e03ea31348178de67341c237168f�
 b6f377fc39394275aea0d6bfcae278f4 f632dad4121d46e3a8e3e76f7cc1979c:model://maplestorymonster$fcb500b7ac0b4588bf888fffee8012d6"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryMonster$fcb500b7ac0b4588bf888fffee8012d6",
  "ModelId": "MoveMonster",
  "DataSetId": "MonsterDataSet",
  "DataId": "fcb500b7ac0b4588bf888fffee8012d6",
  "Target": {
    "Name": "MapleStoryMonster$fcb500b7ac0b4588bf888fffee8012d6",
    "BaseModelId": "model://movemonster",
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
        "Value": 1.0
      },
      {
        "TargetType": null,
        "Name": "jumpForce",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": 0.0
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
          "attack1": "82099b5d58bf40d8b94e58a3aeabefb2",
          "stand": "f651f47ffdb7435ba4a0fbf34c5b7c7b",
          "hit1": "b568762654494f398c62c418c893af9c",
          "die1": "5cd448ce93384b27a8f5784708703d7e",
          "move": "3fff3cd9c3704edeb492e6e03826c753"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "3fff3cd9c3704edeb492e6e03826c753"
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
}8��������J 920e128decc24e26b063a1279053bc36�
 d66683075e184866b29d68f28f677c86 f632dad4121d46e3a8e3e76f7cc1979c6model://maplestorynpc$003245a8ce3f46f4824aef43968d1413"x-mod/model2��{
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
}8��������J f594145a3ba4408fb03f7469b612121b�
 e5cc660bceac4567bf6445fdd6d01fd3 f632dad4121d46e3a8e3e76f7cc1979c6model://maplestorynpc$007526f8ecdd4847913604d699caf184"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryNpc$007526f8ecdd4847913604d699caf184",
  "ModelId": "StaticNPC",
  "DataSetId": "NpcDataSet",
  "DataId": "007526f8ecdd4847913604d699caf184",
  "Target": {
    "Name": "MapleStoryNpc$007526f8ecdd4847913604d699caf184",
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
        "Value": "npc-4"
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
          "stand": "9eaa68f2817a432387fb025713970a3b",
          "playing": "5bdfcae716ce45078ff08e6b2bffab1c",
          "spark": "e4a4607f3514416bb6c0754d6ab835ea"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "9eaa68f2817a432387fb025713970a3b"
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
}8��������J f571916a9233425b9750a40b8e0817f7�
 e541ce5dcf2c43ba9de651a256fca785 f632dad4121d46e3a8e3e76f7cc1979c6model://maplestorynpc$0080a089b015426aa57c44910cc178a8"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryNpc$0080a089b015426aa57c44910cc178a8",
  "ModelId": "StaticNPC",
  "DataSetId": "NpcDataSet",
  "DataId": "0080a089b015426aa57c44910cc178a8",
  "Target": {
    "Name": "MapleStoryNpc$0080a089b015426aa57c44910cc178a8",
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
        "Value": "npc-5"
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
          "stand": "74e01c235ea8431588227224d019a132",
          "die1": "fba0f74d5f554b75a6615ce52f36411f"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "74e01c235ea8431588227224d019a132"
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
}8��������J d111b6102c834d6ba5b07472be6dcb7e�
 cead6bea559f4139977aace9777edf80 f632dad4121d46e3a8e3e76f7cc1979c6model://maplestorynpc$0087ca01ac7b49afa0a87158521fd38f"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryNpc$0087ca01ac7b49afa0a87158521fd38f",
  "ModelId": "StaticNPC",
  "DataSetId": "NpcDataSet",
  "DataId": "0087ca01ac7b49afa0a87158521fd38f",
  "Target": {
    "Name": "MapleStoryNpc$0087ca01ac7b49afa0a87158521fd38f",
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
        "Value": "npc-2"
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
      }
    ],
    "EventLinks": [],
    "Children": []
  }
}8��������J a226b6b92376466c9d15c46495f1a407�
 f30b7b8894c845f59e2771e9f476f51a f632dad4121d46e3a8e3e76f7cc1979c6model://maplestorynpc$00d05bcb44a14e688eeaa3a7548fa45b"x-mod/model2��{
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
}8��������J 1d2cbd7f18a7499696d8b88354516861�
 dd37d861b8a7496282a8dd72cf95eca5 f632dad4121d46e3a8e3e76f7cc1979c6model://maplestorynpc$0259e11f4ec54d768e24af130fb59022"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryNpc$0259e11f4ec54d768e24af130fb59022",
  "ModelId": "StaticNPC",
  "DataSetId": "NpcDataSet",
  "DataId": "0259e11f4ec54d768e24af130fb59022",
  "Target": {
    "Name": "MapleStoryNpc$0259e11f4ec54d768e24af130fb59022",
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
        "Value": "npc-93"
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
          "stand": "731961bc19764b90b0316a732e79e9e3",
          "say": "3825921919a44f1495d5ad2fa61ba842",
          "blink": "60aba3a4a84b4687807c274555742c63"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "731961bc19764b90b0316a732e79e9e3"
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
}8��������J 7ae020bf5c3d4a28b21a57109bd4e912�
 6478c3c2f72040799be6ef3635a5494e f632dad4121d46e3a8e3e76f7cc1979c6model://maplestorynpc$033ef4f315c04284994379d2d6b660fe"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryNpc$033ef4f315c04284994379d2d6b660fe",
  "ModelId": "StaticNPC",
  "DataSetId": "NpcDataSet",
  "DataId": "033ef4f315c04284994379d2d6b660fe",
  "Target": {
    "Name": "MapleStoryNpc$033ef4f315c04284994379d2d6b660fe",
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
        "Value": "npc-68"
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
          "stand": "cb6e57a708d241428208daa03e7cf0df",
          "eye": "fbd3a16e273741e98dbf2b6a56ea8896"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "cb6e57a708d241428208daa03e7cf0df"
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
}8��������J 0bb29299bce14e98a3d7a898e6068d8e�
 57893379ec4f42adbe5c861778ccd888 f632dad4121d46e3a8e3e76f7cc1979c6model://maplestorynpc$036fad6823694ce9a5dc4af4063500c6"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryNpc$036fad6823694ce9a5dc4af4063500c6",
  "ModelId": "StaticNPC",
  "DataSetId": "NpcDataSet",
  "DataId": "036fad6823694ce9a5dc4af4063500c6",
  "Target": {
    "Name": "MapleStoryNpc$036fad6823694ce9a5dc4af4063500c6",
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
        "Value": "npc-69"
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
          "stand": "13cde47729404eb3acc5148732f171b0",
          "say": "4a937fce43e541e5ace263fb11766df5",
          "blink": "dff6b90b74d242e6814fea5efc168dcb"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "13cde47729404eb3acc5148732f171b0"
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
}8��������J f0ed9ef8636447ffb86c1f43bd23c843�
 dafa8bd505b841f7b19e30ef4e0e0ac1 f632dad4121d46e3a8e3e76f7cc1979c6model://maplestorynpc$040b0986af744220b670648b105bb624"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryNpc$040b0986af744220b670648b105bb624",
  "ModelId": "StaticNPC",
  "DataSetId": "NpcDataSet",
  "DataId": "040b0986af744220b670648b105bb624",
  "Target": {
    "Name": "MapleStoryNpc$040b0986af744220b670648b105bb624",
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
        "Value": "npc-67"
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
          "stand": "2ea660285c3e45588a6f1c2c14504b2a"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "2ea660285c3e45588a6f1c2c14504b2a"
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
}8��������J 83bdda0d418d44c590608854f9cd1c58�
 7fe36b3e309b461b8803378b28bc7fac f632dad4121d46e3a8e3e76f7cc1979c6model://maplestorynpc$043dfed1fa5f4b34bb78015d371f0b08"x-mod/model2��{
  "Type": "MODLazyModel",
  "Name": "MapleStoryNpc$043dfed1fa5f4b34bb78015d371f0b08",
  "ModelId": "StaticNPC",
  "DataSetId": "NpcDataSet",
  "DataId": "043dfed1fa5f4b34bb78015d371f0b08",
  "Target": {
    "Name": "MapleStoryNpc$043dfed1fa5f4b34bb78015d371f0b08",
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
        "Value": "npc-81"
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
          "stand": "bf35efd1a08b4c87a923a651c5716fdf",
          "say": "ae596fb0c7de43dfa0dbf15a0a39f58c",
          "eye": "bc0f84432099493681c5044e0c1dab71",
          "move": "e343cde4463c4b919fe9961f1c017579"
        }
      },
      {
        "TargetType": null,
        "Name": "renderguid",
        "ValueType": {
          "$type": "MODNativeType",
          "type": "System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
        },
        "Value": "bf35efd1a08b4c87a923a651c5716fdf"
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
}8��߻����J b8273c5e37b044c79ebc774a00396a1a�
 71b6726a01054eb595152508f6a6a9a6 f632dad4121d46e3a8e3e76f7cc1979c6model://maplestorynpc$763d2d6d0986419b922b59c58bc15e38"x-mod/model2��{
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
      }
    ],
    "EventLinks": [],
    "Children": []
  }
}8��������J 576523c691f24e20acbd69ab161c64d4�	
 692f0922882d4d1fb58dec4c07117a9a f632dad4121d46e3a8e3e76f7cc1979c7model://maplestorytrap$4a7cef45d7374b1d99aa48d2a6899dd8"x-mod/model2��{
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
}8��������J 49d7233dd11541709334453bd3fd67e8�
 1a6f3a48c94649299b787bca1b7bfba6 f632dad4121d46e3a8e3e76f7cc1979c)sprite://1e02bf073065467d96c3426a527c6ab3"x-mod/sprite2��{
  "upload_keyname": "resource_earlyaccess/f6/32/f632dad4121d46e3a8e3e76f7cc1979c/sprite/1e02bf073065467d96c3426a527c6ab3/637616761099583770",
  "upload_hash": "3426D62074A70EFD9509E8FD7E37CC344F9A9E3D5CB94047FF63B11CC5F05DAB",
  "name": "stoneTile",
  "resource_guid": "1e02bf073065467d96c3426a527c6ab3",
  "resource_version": "1"
}8�������J 9dd43d775e114e2fa3546bb843914a6e�
 4a154b81c4f3430a912127c8a2818e70 f632dad4121d46e3a8e3e76f7cc1979c)sprite://39b0f83d97404844a18e48668ff66d6e"x-mod/sprite2��{
  "upload_keyname": "resource_earlyaccess/f6/32/f632dad4121d46e3a8e3e76f7cc1979c/sprite/39b0f83d97404844a18e48668ff66d6e/637608157501113155",
  "upload_hash": "DD72DC3ABE915E6943FD72A2BE6BEB7EB87DC750E72EA79BF57E65B7A084F27C",
  "name": "logo",
  "resource_guid": "39b0f83d97404844a18e48668ff66d6e",
  "resource_version": "1"
}8��˔���J 66979906caaa49e4b9ef03cb269dd2ac�
 a6fb7c4407704a11a6a7d50f75db65ad f632dad4121d46e3a8e3e76f7cc1979c)sprite://5b1f638d87c04e79841cc7f7830c63a6"x-mod/sprite2��{
  "upload_keyname": "resource_earlyaccess/f6/32/f632dad4121d46e3a8e3e76f7cc1979c/sprite/5b1f638d87c04e79841cc7f7830c63a6/637609737664784282",
  "upload_hash": "452FAAB7C80707DFFDAC1A40C6EFC20344C9CB03CBB5D7D610673CE5E2C4A306",
  "name": "tile0",
  "resource_guid": "5b1f638d87c04e79841cc7f7830c63a6",
  "resource_version": "1"
}8��������J 57906e2e4f894c718efdd8f7e9614691�
 36bb7beb00784e49b8dc04d61a43b4ca f632dad4121d46e3a8e3e76f7cc1979c)sprite://714ee5699ad34b0abd0b121c13252ea9"x-mod/sprite2��{
  "upload_keyname": "resource_earlyaccess/f6/32/f632dad4121d46e3a8e3e76f7cc1979c/sprite/714ee5699ad34b0abd0b121c13252ea9/637609848560262747",
  "upload_hash": "CE3C9306DF337AAC8F85422DC40C50D593A55BEE1B4B608EDD5A3A1DB13208FA",
  "name": "tileGrass",
  "resource_guid": "714ee5699ad34b0abd0b121c13252ea9",
  "resource_version": "1"
}8������J ef1b28c708334ca781c7d68f13f0cb98�
 a268d18b4c7841c5a7da4ece9ef43f13 f632dad4121d46e3a8e3e76f7cc1979c)sprite://a943e2e02ee54ea799e2264ad53915a6"x-mod/sprite2��{
  "upload_keyname": "resource_earlyaccess/f6/32/f632dad4121d46e3a8e3e76f7cc1979c/sprite/a943e2e02ee54ea799e2264ad53915a6/637609737664549263",
  "upload_hash": "5E8B8BC795868F0645B1D1DD7D8C575DF115EB8C2F26FC0C0DE69B38E38CEDAF",
  "name": "tile1",
  "resource_guid": "a943e2e02ee54ea799e2264ad53915a6",
  "resource_version": "1"
}8��������J 765bb487624e41ec87e861dd9dc3faae�
 ac6913c58b2841afa9e1aee7de4e6d8b f632dad4121d46e3a8e3e76f7cc1979c)sprite://ae4c83b9b2dc49b2837ad0612b6523b8"x-mod/sprite2��{
  "upload_keyname": "resource_earlyaccess/f6/32/f632dad4121d46e3a8e3e76f7cc1979c/sprite/ae4c83b9b2dc49b2837ad0612b6523b8/637610726685515816",
  "upload_hash": "AC70B26E71D972FC71FD3212A4644F771523F00BC427BC3060D6414C6E7E8AAD",
  "name": "grassTile1",
  "resource_guid": "ae4c83b9b2dc49b2837ad0612b6523b8",
  "resource_version": "1"
}8�̍�����J 17d96138ff194fdba919ce422f578d19�
 d71f55c886e044c88d29e5006fd8a6e6 f632dad4121d46e3a8e3e76f7cc1979c)sprite://e6d18646a451455fbcd987958898d50f"x-mod/sprite2��{
  "upload_keyname": "resource_earlyaccess/f6/32/f632dad4121d46e3a8e3e76f7cc1979c/sprite/e6d18646a451455fbcd987958898d50f/637608159747621030",
  "upload_hash": "52A2FE295CE59A83229011760AEB07449E4DFEBAE37E56E354178F4EE81FDFE8",
  "name": "grassTile",
  "resource_guid": "e6d18646a451455fbcd987958898d50f",
  "resource_version": "1"
}8��˔���J 1f362863c4c548efb04c84d43ee12393�X
 4092f49a92d140bd87cf719d01dcf05a f632dad4121d46e3a8e3e76f7cc1979c)ui://0477f27e-699f-4e70-bbdd-86ea43ac08bd"x-mod/ui2�W�
$0477f27e-699f-4e70-bbdd-86ea43ac08bd/ui/UIScreen�{
  "name": "UIScreen",
  "path": "/ui/UIScreen",
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
        "x": -9.536743E-07,
        "y": 0.0
      },
      "RectSize": {
        "x": 1866.755,
        "y": 1080.0
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
        "x": 345.05,
        "y": 690.0,
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
      "thumnail": "/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRwhMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCABkAMgDASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwDkQRjv1HekyPf86Qfd/EUle8fOjsj3/OjI9/zptFAhwIz3/OjI9/zpB1/CkoGOyPf86Mj3/Om0UCHZHv8AnQSM9/zptB6mgY7I9/zoyPf86bRQIdke/wCdGR7/AJ03vRQMdke/50ZHv+dNooEOyPf86CR7/nTRSmgYuR7/AJ0ZHv8AnTaKBDsj3/OlJHv19aZSn+poGOQWDSP9vSV4xE2wI+07+CPmwdvQ9Vb04zuWrOEeJtm1j5UYYxgKpIHTAVeQMAnnLAnJzmp6KhwTdy1UajynQ+LLvwzd3lu2gwIu18oYY/KEcPlINjgqC77xId2TwerZG0rnh1FFEIKCsgqVHOXMxR938RSU4fd/EU2rICiiigQo6/hSUo60lABRRRQAUHqaKU9TQAlFFFAB3oo70UDCiiigQClNIKU0DEooooEFKf6mkpT/AFNAxKKKKBAOoopR1FFAxwxjt1FN49v1oH3fxFJQAvHt+tHHt+tJRQA4Yz2/Wk49v1oHX8KSgBePb9aOPb9aSigBePb9aU4yen602g9TQAvHt+tHHt+tJRQA7j2/Wjj2/Wm96KAF49v1o49v1pKKAHce360HHt+tNFKaADj2/Wjj2/WkooAXj2/WnHHt1plKf6mgA49v1o49v1pKKAHDGR0/WimjqKKAFH3fxFJSj7v4ikoAKKKKBCjr+FJSjr+FJQAUUUUAFB6mig9TQAUUUUAHeijvRQMKKKKBAKU0gpTQMSiiigQUp/qaSlP9TQMSiiigQDqKKUdRRQMcOn4jtTePf8qB938RSUALx7/lRx7/AJUlFADh17/lSce/5UDr+FJQAvHv+VHHv+VJRQAvHv8AlSnqev5U2g9TQAvHv+VHHv8AlSUUAO49/wAqOPf8qb3ooAXj3/Kjj3/KkooAcPx/Kg/j+VNFKaADj3/Kjj3/ACpKKAF49/ypx/r6UylP9TQAce/5Uce/5UlFADhjI6/lRTR1FFACj7v4ikpR938RSUAFFFFAhR1/CkpR1/CkoAKKKKACg9TRQepoAKKKKADvRR3ooGFFFFAgFKaQUpoGJRRRQIKU/wBTSUp/qaBiUUUUCAdRRQOoooGSBRj8abtFFFABtFG0UUUAKFFG0UUUAJtFG0UUUALtFBUZoooATaKNooooAXaM0bRRRQAm0UbRRRQAu0UFRRRQAm0UbRRRQAu0UpUfrRRQA3aKNooooAUKM0UUUgP/2Q==",
      "DefaultShow": false,
      "GroupType": 2,
      "GroupOrder": 9,
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
}"UMOD.Core.UITransformComponent,MOD.Core.UIGroupComponent,MOD.Core.CanvasGroupComponent�
$58e6693e-6872-40a6-8921-f440f232e7a9/ui/UIScreen/imgSize�{
  "name": "imgSize",
  "path": "/ui/UIScreen/imgSize",
  "nameEditable": true,
  "enable": true,
  "visible": false,
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
        "x": 1898.42957,
        "y": 1080.0
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
      "Color": {
        "r": 0.7089844,
        "g": 0.306026459,
        "b": 0.306026459,
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
    }
  ],
  "@version": 1
}"5MOD.Core.UITransformComponent,MOD.Core.ImageComponent�
$bb553343-88ba-46d7-91be-07adb4086dfe/ui/UIScreen/imgScreen�{
  "name": "imgScreen",
  "path": "/ui/UIScreen/imgScreen",
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
        "x": 50.0,
        "y": 0.0
      },
      "RectSize": {
        "x": 100.0,
        "y": 1080.0
      },
      "OffsetMin": {
        "x": 0.0,
        "y": 0.0
      },
      "OffsetMax": {
        "x": 100.0,
        "y": 0.0
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 12,
      "AnchorsMin": {
        "x": 0.0,
        "y": 0.0
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
        "x": 18.625,
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
      "Color": {
        "r": 0.0,
        "g": 0.0,
        "b": 0.0,
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
}"5MOD.Core.UITransformComponent,MOD.Core.ImageComponent�
$40978d0e-7c51-46a9-8ccf-9c41fb007bc8/ui/UIScreen/imgAnchor�{
  "name": "imgAnchor",
  "path": "/ui/UIScreen/imgAnchor",
  "nameEditable": true,
  "enable": false,
  "visible": false,
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
        "x": -50.0,
        "y": -50.0
      },
      "OffsetMax": {
        "x": 50.0,
        "y": 50.0
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
        "x": -0.0001,
        "y": -201.1501,
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
    }
  ],
  "@version": 1
}"5MOD.Core.UITransformComponent,MOD.Core.ImageComponent8Ʋ�嚄����
 9f75204e15644bde91a07c90519ad11c f632dad4121d46e3a8e3e76f7cc1979c)ui://0c2c5e81-849e-4b6f-b6e1-d8de67b90113"x-mod/ui2��(
$0c2c5e81-849e-4b6f-b6e1-d8de67b90113/ui/UIBattle�'{
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
        "x": -9.536743E-07,
        "y": 0.0
      },
      "RectSize": {
        "x": 1866.755,
        "y": 1080.0
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
      "thumnail": "/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRwhMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCABkAMgDASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwDjqKXafb86Np9vzr3j5wT0opdp9vzo2n2/OgYDofpSU4A4PTp60m0+350AJR2pdp9vzo2nHb86AEqK5/49Zv8AcP8AKptp9vzpk0bSQyICMspAyaT2BbnMmumFvpt14SZrK3sDe2los97LI1wJ9zXJQBBnyiArQ5yP4jjJBxlHR7j+/F/31/8AWrSluNen0sabJqINptVGQNguq/cV2Ay6r/CGJC9sVxunPsd6qw7mjpvhrw7deDYtVuNTu49Qf7WvkLGPL3xRNIoLEDbnMQ7klsDqStHTfCy3ljLfTP5Fs1rFNbs86bmJuI4HZkXc4QEy4O3+EdehyRo9xn78X/fX/wBaj+x7j+/F/wB9f/WpeymP2sDS8X+HdO8OXtvBpviGz1pJY97SWw/1ZzjBwWX/AMez6gcEutv+POH/AK5isv8Ase4/vxf99f8A1q14Y2jt40JGVQA4NbUYyjuc9ecZL3RaKXafb86Np9vzroOYD1/GkpxB9vzpNp9vzoGC9fwNJTgDnt09aTafb86AFtRAt+JLjzAm3AdI0l2nPUxvw4xkYyOSDnjBiul89p2QSYcIB5jAk4GD0AAHHC9hgZOMmTafb86XB2np19ajkV7l87tYta1qsutatcXjQGBJrqS58surhCwUYB2g/wAPPY8cDHJVTafb86KcYqKshTm5u7EoooqiA9KKPSigBR0P0pKUdD9KSgAo7UUdqBhRRRQIU9fwpKU9fwpKAFHUUlKOopKACl7D6UlL2H0oASiiigBT1/GkpT1/GkoGKvX8DSUq9fwNJQIKX+E/Wkpf4T9aAEooooAM0uaSigBc9KTNHpRQMUHg/SjNA6H6UlABmlzxSUdqADNGaKKBCnr+FJmlPX8KSgYoPIpM0o6ikoAM07sPpTaXsPpQAmaM0UUCFJpM0p6/jSUDFHX8DSZpV6/gaSgAzS5+U/Wkpf4T9aAEzRRRQIXB9DRg+hpM+1GfagBcH0NGD6GjPtSZ9qBigHB4PSjB9DQOh47UZ9qADB9DRg46Gkz7UueOlABg+howfQ0mfajPtQIUg56HpRg+hoPXp2pM+1AxQDkcGjB9DQOo4pM+1AC4PoaXBwOO1Nz7U7sOO1ACYPoaMH0NJn2oz7UCFIPpRg+hoP0pM+1AxwBz07GkwfQ0Dr07Gkz7UALg+howdp4PWkz7Uv8ACeO9ABg+hopM+1FAi9pVraXdyyXdx5K7QEwwXcxZVHLcDG4sc4BCkZGcjck0HQ002UtqcsepJBBMls/SQSRwOcHHJy8oCjnhfQ552ztormYpNe29ooXPmTrIQT6fIrHP4Y4rTm0q9S4jjh1KK5W5sXnEsTyBXhiD5U7lB48kgAjHArOW+5rHba5ielFadzodza2f2qaWFYw0CnkkjzY/NU9Om3r7+tPt9AuLuDz4J7d4vLnfflh/qUDuMFc5wy47c9armRPJLYyh0P0pKUdDz2pPxqiQo7UfjS9utACUUfjR+NAhT1/CkpT169qT8aBijqKSlHUc0n40AFL2H0pPxpew57UAJRR+NH40CFPX8aSlP1pPxoGKvX8DSUq9evY0n40AFL/CfrSfjS/wnnvQAlFH40UCNnw/cW8L3a3FzaW5aINE11arMhcOvyn925AKl+gHIGa07rxGLXxJFexSW01rEk6W8emr9nNukocbVcxKcru3A7Tzz1JrF0fSotSlkNxqVpYW0IDSyzv82CeiIPmdsZOB6ckZFaurWmjavDNqWiTxWfkLtksLuRY5GCgBXjPAYsoyy5yGzjdkVlJR5tTaLly6Ft/GCNG90puBMb6zla3knLtNHDHtO99oBJZVPI6nOOKavim0vLm6luZdUDNZ3UcZvL43Kq0kbAKqiMbcnbznHHNWvD/hK31PwtcaheadNbRpaTSx6ibsGNnViADEFLADnPX7vvTvFGm2Np4eVreG1LC100ieKLbvLJPuYZAPzbQTkAnAz0rP93flSNf3nLzN+Zwg6H6UlKOh+lJXScgUdqKO1AwooooEKev4UlKev4UlACjqKSlHUUlABS9h9KSl7D6UAJRRRQAp6/jSUp6/jSUDFXr+BpKVev4GkoEFL/CfrSUv8J+tACUUUUAdPoN7qNpo+rGz1S8tUtolnWOGTarO0kaEkfQ/oKu654o1+C/iSLWb1FNnauQspHzNBGSfxJJ/GiisuWLlqv60NueSho/61Ov8LeFdL1DwZpus3KSteWlvKIGWUqEKzSMrcY5BNYni2SS68OCeeRpJZbTTHdyeWYpOST+Joormi26jv3/U65JKkrdv0PPfKX1NHlL6miiu088PKX1NHlL6miigA8pfU0eUvqaKKAOm8DeGbLxPr01jey3EcSWrTAwsA2QyDuDx8xrmBEpAOTRRUp+8y2lyoXylz1NHlL6miiqIJ7q0jgkRVLENEjnJ7lQT/OoPLHqaKKFsN7h5S+po8pfU0UUCDyl9TR5S+poooABGo7mjyl9TRRQAeUvqaPKXGMmiigA8pfU0UUUAf//Z",
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
}"UMOD.Core.UITransformComponent,MOD.Core.UIGroupComponent,MOD.Core.CanvasGroupComponent�
$fc2f11ab-9956-4ad6-8328-8d9bc4992e38/ui/UIBattle/barExp�{
  "name": "barExp",
  "path": "/ui/UIBattle/barExp",
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
        "x": 1.52587891E-05,
        "y": 572.0
      },
      "RectSize": {
        "x": 1710.742,
        "y": 1096.112
      },
      "OffsetMin": {
        "x": 0.0,
        "y": 23.94397
      },
      "OffsetMax": {
        "x": 0.0,
        "y": 1120.056
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 11,
      "AnchorsMin": {
        "x": 0.0,
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
        "x": 1380.19385,
        "y": 797.9376,
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
        "DataId": "4fea64a3307cda641809ad8be0d4890b"
      },
      "Color": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
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
    }
  ],
  "@version": 1
}"5MOD.Core.UITransformComponent,MOD.Core.ImageComponent�
$ff33c790-f56b-48fe-b714-7a55e5041a19/ui/UIBattle/barExp/bar�{
  "name": "bar",
  "path": "/ui/UIBattle/barExp/bar",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MODSlider",
    "sub_entity_id": null
  },
  "@components": [
    {
      "MobileOnly": false,
      "anchoredPosition": {
        "x": -4.76837158E-07,
        "y": -535.0
      },
      "RectSize": {
        "x": 1920.0,
        "y": 14.0
      },
      "OffsetMin": {
        "x": -1.0,
        "y": 0.0
      },
      "OffsetMax": {
        "x": 1.0,
        "y": -1070.0
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
        "x": 5.0867,
        "y": -343.35,
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
        "DataId": "4fea64a3307cda641809ad8be0d4890b"
      },
      "Color": {
        "r": 0.197265625,
        "g": 0.0312080383,
        "b": 0.0312080383,
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
      "Direction": 0,
      "MinValue": 0.0,
      "MaxValue": 180.0,
      "Value": 180.0,
      "UseIntegerValue": false,
      "FillRectEntityRef": {
        "EntityId": "c74d11c6-8627-4ff4-a3fb-14d1f7bff84b",
        "EntityPath": "/ui/UIBattle/My_info/Exp_bar/FillRect_exp"
      },
      "Enable": true,
      "@type": "MOD.Core.SliderComponent"
    }
  ],
  "@version": 1
}"NMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.SliderComponent�
$c74d11c6-8627-4ff4-a3fb-14d1f7bff84b$/ui/UIBattle/barExp/bar/FillRect_exp�{
  "name": "FillRect_exp",
  "path": "/ui/UIBattle/barExp/bar/FillRect_exp",
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
        "y": -2.0
      },
      "RectSize": {
        "x": 1920.0,
        "y": 12.0
      },
      "OffsetMin": {
        "x": 0.0,
        "y": -1.0
      },
      "OffsetMax": {
        "x": 0.0,
        "y": -3.0
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
      "ImageRUID": {
        "DataId": "4fea64a3307cda641809ad8be0d4890b"
      },
      "Color": {
        "r": 0.6862745,
        "g": 0.9529412,
        "b": 0.0431372561,
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
}"5MOD.Core.UITransformComponent,MOD.Core.ImageComponent�
$2bbc266c-5b25-4f5d-aa47-94f3e4e21866/ui/UIBattle/barHP�{
  "name": "barHP",
  "path": "/ui/UIBattle/barHP",
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
        "x": 1.52587891E-05,
        "y": 547.0
      },
      "RectSize": {
        "x": 1710.742,
        "y": 1096.112
      },
      "OffsetMin": {
        "x": 1.52587891E-05,
        "y": -1.05603027
      },
      "OffsetMax": {
        "x": 1.52587891E-05,
        "y": 1095.056
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 11,
      "AnchorsMin": {
        "x": 0.0,
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
        "x": 1380.19385,
        "y": 780.432,
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
        "DataId": "4fea64a3307cda641809ad8be0d4890b"
      },
      "Color": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
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
    }
  ],
  "@version": 1
}"5MOD.Core.UITransformComponent,MOD.Core.ImageComponent�
$d5d88296-7791-47d7-9d17-55a57d3a9529/ui/UIBattle/barHP/bar�{
  "name": "bar",
  "path": "/ui/UIBattle/barHP/bar",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MODSlider",
    "sub_entity_id": null
  },
  "@components": [
    {
      "MobileOnly": false,
      "anchoredPosition": {
        "x": -4.76837158E-07,
        "y": -535.0
      },
      "RectSize": {
        "x": 1920.0,
        "y": 14.0
      },
      "OffsetMin": {
        "x": -1.0,
        "y": 0.0
      },
      "OffsetMax": {
        "x": 1.0,
        "y": -1070.0
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
        "x": 5.0867,
        "y": -343.35,
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
        "DataId": "4fea64a3307cda641809ad8be0d4890b"
      },
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
      "Direction": 0,
      "MinValue": 0.0,
      "MaxValue": 180.0,
      "Value": 180.0,
      "UseIntegerValue": false,
      "FillRectEntityRef": {
        "EntityId": "7e146bd3-29b8-4a35-bbc5-2f9b482e1629",
        "EntityPath": "/ui/UIBattle/barExp_1/Exp_bar/FillRect_exp"
      },
      "Enable": true,
      "@type": "MOD.Core.SliderComponent"
    }
  ],
  "@version": 1
}"NMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.SliderComponent�
$7e146bd3-29b8-4a35-bbc5-2f9b482e1629#/ui/UIBattle/barHP/bar/FillRect_exp�{
  "name": "FillRect_exp",
  "path": "/ui/UIBattle/barHP/bar/FillRect_exp",
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
        "y": -2.0
      },
      "RectSize": {
        "x": 1920.0,
        "y": 12.0
      },
      "OffsetMin": {
        "x": 0.0,
        "y": -1.0
      },
      "OffsetMax": {
        "x": 0.0,
        "y": -3.0
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
      "ImageRUID": {
        "DataId": "4fea64a3307cda641809ad8be0d4890b"
      },
      "Color": {
        "r": 1.0,
        "g": 0.0,
        "b": 0.0,
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
}"5MOD.Core.UITransformComponent,MOD.Core.ImageComponent�
$d0dc0213-378c-4007-8032-ed9d714a6de8/ui/UIBattle/txtName�{
  "name": "txtName",
  "path": "/ui/UIBattle/txtName",
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
        "x": 390.833374,
        "y": 139.999969
      },
      "RectSize": {
        "x": 748.0659,
        "y": 300.0
      },
      "OffsetMin": {
        "x": 16.800415,
        "y": -10.0000305
      },
      "OffsetMax": {
        "x": 764.866333,
        "y": 289.999969
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
        "x": 1054.91418,
        "y": 429.9109,
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
      "Text": "순례",
      "FontSize": 150,
      "FontColor": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "AlignmentOptions": 3,
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
$df94555f-e05d-4713-8168-cc2ec364c673/ui/UIBattle/txtGrade�{
  "name": "txtGrade",
  "path": "/ui/UIBattle/txtGrade",
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
        "x": 223.292084,
        "y": 387.3345
      },
      "RectSize": {
        "x": 364.552917,
        "y": 187.381119
      },
      "OffsetMin": {
        "x": 41.015625,
        "y": 293.643951
      },
      "OffsetMax": {
        "x": 405.568542,
        "y": 481.025055
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
        "x": 449.9772,
        "y": 658.9613,
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
      "Text": "이병",
      "FontSize": 60,
      "FontColor": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "AlignmentOptions": 3,
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
}"LMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.TextComponent�
$4bfc97bd-6c25-4a02-8e8a-87860ef46db2/ui/UIBattle/MODImage_2�{
  "name": "MODImage_2",
  "path": "/ui/UIBattle/MODImage_2",
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
        "x": -105.680695,
        "y": 60.0063477
      },
      "RectSize": {
        "x": 100.0,
        "y": 100.000015
      },
      "OffsetMin": {
        "x": -155.6807,
        "y": 10.00634
      },
      "OffsetMax": {
        "x": -55.6806946,
        "y": 110.006355
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 6,
      "AnchorsMin": {
        "x": 0.5,
        "y": 0.0
      },
      "AnchorsMax": {
        "x": 0.5,
        "y": 0.0
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": 1306.19385,
        "y": 373.8975,
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
}"5MOD.Core.UITransformComponent,MOD.Core.ImageComponent�
$16bd3bd9-707c-4736-9e04-15d69c86a2a2/ui/UIBattle/txtAtk�{
  "name": "txtAtk",
  "path": "/ui/UIBattle/txtAtk",
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
        "x": 30.657465,
        "y": 64.59578
      },
      "RectSize": {
        "x": 120.291695,
        "y": 112.048187
      },
      "OffsetMin": {
        "x": -29.4883823,
        "y": 8.571686
      },
      "OffsetMax": {
        "x": 90.8033142,
        "y": 120.619873
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 6,
      "AnchorsMin": {
        "x": 0.5,
        "y": 0.0
      },
      "AnchorsMax": {
        "x": 0.5,
        "y": 0.0
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": 1401.66089,
        "y": 377.1111,
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
      "Text": "99",
      "FontSize": 60,
      "FontColor": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "AlignmentOptions": 3,
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
}"LMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.TextComponent�
$98dee6dc-4e81-4ad3-b1c1-da2dbbd73d6a/ui/UIBattle/MODImage_2_1�{
  "name": "MODImage_2_1",
  "path": "/ui/UIBattle/MODImage_2_1",
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
        "x": 128.521011,
        "y": 60.01574
      },
      "RectSize": {
        "x": 100.0,
        "y": 100.000015
      },
      "OffsetMin": {
        "x": 78.52101,
        "y": 10.0157318
      },
      "OffsetMax": {
        "x": 178.521011,
        "y": 110.015747
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 6,
      "AnchorsMin": {
        "x": 0.5,
        "y": 0.0
      },
      "AnchorsMax": {
        "x": 0.5,
        "y": 0.0
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": 1470.18713,
        "y": 373.9041,
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
        "DataId": "3e9d2ba77c6875d48a1a084f5f4a37b7"
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
}"5MOD.Core.UITransformComponent,MOD.Core.ImageComponent�
$7a0992d9-0ccf-4199-8d43-f6eade4199bd/ui/UIBattle/txtDef�{
  "name": "txtDef",
  "path": "/ui/UIBattle/txtDef",
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
        "x": 249.149872,
        "y": 66.03038
      },
      "RectSize": {
        "x": 120.291695,
        "y": 112.048187
      },
      "OffsetMin": {
        "x": 189.004028,
        "y": 10.0062866
      },
      "OffsetMax": {
        "x": 309.295715,
        "y": 122.054474
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 6,
      "AnchorsMin": {
        "x": 0.5,
        "y": 0.0
      },
      "AnchorsMax": {
        "x": 0.5,
        "y": 0.0
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": 1554.65417,
        "y": 378.1157,
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
      "Text": "99",
      "FontSize": 60,
      "FontColor": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "AlignmentOptions": 3,
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
}"LMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.TextComponent�
$f0b47f64-3574-456b-9120-6edc6ac5345a$/ui/UIBattle/UIBattleRemainTurnFrame�{
  "name": "UIBattleRemainTurnFrame",
  "path": "/ui/UIBattle/UIBattleRemainTurnFrame",
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
        "y": -80.0
      },
      "RectSize": {
        "x": 400.0,
        "y": 200.0
      },
      "OffsetMin": {
        "x": -200.0,
        "y": -180.0
      },
      "OffsetMax": {
        "x": 200.0,
        "y": 20.0
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
        "x": 698.6324,
        "y": 848.2832,
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
        "DataId": "24cf25177f4a4f349872564a6064a964"
      },
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
    }
  ],
  "@version": 1
}"5MOD.Core.UITransformComponent,MOD.Core.ImageComponent�
$c02c040d-3166-40c8-b75d-e6de67293314/ui/UIBattle/txtTurn�{
  "name": "txtTurn",
  "path": "/ui/UIBattle/txtTurn",
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
        "x": -124.009727,
        "y": 449.24292
      },
      "RectSize": {
        "x": 136.72261,
        "y": 100.0
      },
      "OffsetMin": {
        "x": -192.371033,
        "y": 399.24292
      },
      "OffsetMax": {
        "x": -55.6484222,
        "y": 499.24292
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
        "x": 640.8645,
        "y": 843.2722,
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
      "Text": "5",
      "FontSize": 100,
      "FontColor": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "AlignmentOptions": 5,
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
$c1c873ca-6ca5-4d93-8487-fe81fd6598fa/ui/UIBattle/MODText_1�{
  "name": "MODText_1",
  "path": "/ui/UIBattle/MODText_1",
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
        "x": 63.2931976,
        "y": 449.243073
      },
      "RectSize": {
        "x": 237.4136,
        "y": 100.0
      },
      "OffsetMin": {
        "x": -55.4136047,
        "y": 399.243073
      },
      "OffsetMax": {
        "x": 182.0,
        "y": 499.243073
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
        "x": 728.1165,
        "y": 843.2723,
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
      "Text": "턴 남음",
      "FontSize": 60,
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
$e627d858-96c1-4b32-a3f1-624debe3d970/ui/UIBattle/txtJob�{
  "name": "txtJob",
  "path": "/ui/UIBattle/txtJob",
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
        "x": 457.0419,
        "y": 278.948151
      },
      "RectSize": {
        "x": 861.219666,
        "y": 187.3811
      },
      "OffsetMin": {
        "x": 26.4320679,
        "y": 185.2576
      },
      "OffsetMax": {
        "x": 887.651733,
        "y": 372.6387
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
        "x": 536.2698,
        "y": 618.9487,
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
      "Text": "군바리",
      "FontSize": 100,
      "FontColor": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "AlignmentOptions": 3,
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
}"LMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.TextComponent8Ă�嚄���m
 dc44ac1d7a374481933b50c6a9b41312 f632dad4121d46e3a8e3e76f7cc1979c)ui://2dbe70db-0846-4406-bdd7-3cd6e879c984"x-mod/ui2�l�
$2dbe70db-0846-4406-bdd7-3cd6e879c984/ui/UIBattleCmd�{
  "name": "UIBattleCmd",
  "path": "/ui/UIBattleCmd",
  "nameEditable": true,
  "enable": false,
  "visible": false,
  "origin": {
    "type": "Model",
    "entry_id": "UIGroup",
    "sub_entity_id": null
  },
  "@components": [
    {
      "MobileOnly": false,
      "anchoredPosition": {
        "x": -9.536743E-07,
        "y": 0.0
      },
      "RectSize": {
        "x": 1866.755,
        "y": 1080.0
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
      "thumnail": "/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRwhMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCABkAMgDASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwDjqKXafb86Np9vzr3j5wT0opdp9vzo2n2/OgYDofpSU4A4PTp60m0+350AJR2pdp9vzo2nHb86AEopdp9vzo2n2/OgQHr+FJTiDnt09aTafb86BgOopKcAcjp+dJtPt+dACUvYfSjafb86XBx26etADaKXafb86Np9vzoEB6/jSU4g+350m0+350DBev4GkpwBz26etJtPt+dAC2ogW/Elx5gTbgOkaS7TnqY34cYyMZHJBzxgxXS+e07IJMOEA8xgScDB6AADjhewwMnGTJtPt+dLg7T06+tRyK9y+d2sWta1WXWtWuLxoDAk11Jc+WXVwhYKMA7Qf4eex44GOSqm0+350U4xUVZCnNzd2JRRRVEB6UUelFACjofpSUo6H6UlABR2oo7UDCiiigQp6/hSUp6/hSUAKOopKUdRSUAFL2H0pKXsPpQAlFFFACnr+NJSnr+NJQMVev4GkpV6/gaSgQUv8J+tJS/wn60AJRRRQAZpc0lFAC56UmaPSigYoPB+lGaB0P0pKADNLniko7UAGaM0UUCFPX8KTNKev4UlAxQeRSZpR1FJQAZp3YfSm0vYfSgBM0ZoooEKTSZpT1/GkoGKOv4GkzSr1/A0lABmlz8p+tJS/wAJ+tACZooooELg+howfQ0mfajPtQAuD6GjB9DRn2pM+1AxQDg8HpRg+hoHQ8dqM+1ABg+howcdDSZ9qXPHSgAwfQ0YPoaTPtRn2oEKQc9D0owfQ0Hr07UmfagYoByODRg+hoHUcUmfagBcH0NLg4HHam59qd2HHagBMH0NGD6Gkz7UZ9qBCkH0owfQ0H6UmfagY4A56djSYPoaB16djSZ9qAFwfQ0YO08HrSZ9qX+E8d6ADB9DRSZ9qKBBRR+NH40AHpRS+nNJ+NAxR0P0pKUdDz2pPxoAKO1H40vbrQAlFH40fjQIU9fwpKU9evak/GgYo6ikpR1HNJ+NABS9h9KT8aXsOe1ACUUfjR+NAhT1/GkpT9aT8aBir1/A0lKvXr2NJ+NABS/wn60n40v8J570AJRR+NFAgooooAPSij0ooAUdD9KSlHQ/SkoAKO1FHagYUUUUCFPX8KSlPX8KSgBR1FJSjqKSgApew+lJS9h9KAEooooAU9fxpKU9fxpKBir1/A0lKvX8DSUCCl/hP1pKX+E/WgBKKKKAJvKX1NHlL6miikMPKX1NHlL6miigA8pfU0eUvqaKKADyl9TR5S+poooAPKX1NHlL6miigAMSnuaPKX1NFFAB5S56mjyl9TRRQAeUvqaPLHqaKKADyl9TR5S+poooAPKX1NHlL6miigAEajuaPKX1NFFAB5S+po8pcYyaKKADyl9TRRRQB//Z",
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
}"UMOD.Core.UITransformComponent,MOD.Core.UIGroupComponent,MOD.Core.CanvasGroupComponent�
$1ad402a6-288c-4424-93a5-c0381ca9082c/ui/UIBattleCmd/DefBtn�{
  "name": "DefBtn",
  "path": "/ui/UIBattleCmd/DefBtn",
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
        "x": -180.0,
        "y": 30.7420082
      },
      "RectSize": {
        "x": 264.848633,
        "y": 117.52095
      },
      "OffsetMin": {
        "x": -312.424316,
        "y": -28.0184669
      },
      "OffsetMax": {
        "x": -47.5756836,
        "y": 89.50249
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 2,
      "AnchorsMin": {
        "x": 1.0,
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
        "x": 1921.27734,
        "y": 695.8552,
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
      "KeyCode": 0,
      "Enable": true,
      "@type": "MOD.Core.ButtonComponent"
    },
    {
      "turn_mgr": "",
      "EntityID": "",
      "Enable": true,
      "@type": "script.UIBattleControl"
    },
    {
      "Text": "대기",
      "FontSize": 60,
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
}"|MOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.ButtonComponent,script.UIBattleControl,MOD.Core.TextComponent�
$60756ae3-dfa0-4786-bb48-60978f014cf1/ui/UIBattleCmd/btnZoom�{
  "name": "btnZoom",
  "path": "/ui/UIBattleCmd/btnZoom",
  "nameEditable": true,
  "enable": false,
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
        "x": -832.21344,
        "y": 434.8995
      },
      "RectSize": {
        "x": 100.0,
        "y": 100.0
      },
      "OffsetMin": {
        "x": -882.21344,
        "y": 384.8995
      },
      "OffsetMax": {
        "x": -782.21344,
        "y": 484.8995
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
        "x": 388.6329,
        "y": 852.0,
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
        "DataId": "ddb97d3e2544ae948b5b24752a0c750b"
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
      "zoom": 0.0,
      "IsVictory": false,
      "Enable": true,
      "@type": "script.CommonButtonAction"
    }
  ],
  "@version": 1
}"hMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.ButtonComponent,script.CommonButtonAction�
$5fd85e7c-ea9e-4c42-b7b8-fc31c23cf100/ui/UIBattleCmd/AtkBtn�{
  "name": "AtkBtn",
  "path": "/ui/UIBattleCmd/AtkBtn",
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
        "x": -180.0,
        "y": 155.752258
      },
      "RectSize": {
        "x": 264.848633,
        "y": 117.52095
      },
      "OffsetMin": {
        "x": -312.424316,
        "y": 96.99178
      },
      "OffsetMax": {
        "x": -47.5756836,
        "y": 214.512726
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 2,
      "AnchorsMin": {
        "x": 1.0,
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
        "x": 1921.27734,
        "y": 782.6951,
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
      "KeyCode": 0,
      "Enable": true,
      "@type": "MOD.Core.ButtonComponent"
    },
    {
      "turn_mgr": "",
      "EntityID": "",
      "Enable": true,
      "@type": "script.UIBattleControl"
    },
    {
      "Text": "공격",
      "FontSize": 60,
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
}"|MOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.ButtonComponent,script.UIBattleControl,MOD.Core.TextComponent8Ϫ�暄����
 ab9cb26bdd90427fa3d9c22763493e45 f632dad4121d46e3a8e3e76f7cc1979c)ui://3adbc7b5-bdbd-43f6-af7f-51ebe3201e21"x-mod/ui2���'
$3adbc7b5-bdbd-43f6-af7f-51ebe3201e21/ui/UICameraCtrl�&{
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
        "x": -9.536743E-07,
        "y": 0.0
      },
      "RectSize": {
        "x": 1866.755,
        "y": 1080.0
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
      "thumnail": "/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRwhMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCABkAMgDASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwDAopcH0NGD6GuDlfY+q+s0f5196O5+FH/I13H/AF5v/wChpXsleJ/DW+tNO8STzX11BaxG1ZQ88gRSdycZPfg/lXq3/CU+Hv8AoPaX/wCBkf8AjXZRjLl2PBzCrCVa6knoa1FZP/CUeHv+g7pn/gXH/jR/wlPh7/oPaX/4GR/41ryS7HDzx7mtRWT/AMJT4e/6D2l/+Bkf+NH/AAlPh7/oO6X/AOBcf+NHJLsHPHua1FZP/CU+Hv8AoPaX/wCBkf8AjR/wlPh7/oPaX/4GR/40ckuwc8e5rUVk/wDCUeHv+g7pn/gXH/jR/wAJT4e/6D2l/wDgZH/jRyS7Bzx7mtRWT/wlPh7/AKDumf8AgXH/AI0f8JT4e/6D2l/+Bkf+NHJLsHPHua1FZP8AwlPh7/oPaX/4GR/40f8ACUeHv+g7pn/gXH/jRyS7Bzx7mtRWT/wlPh7/AKD2l/8AgZH/AI0f8JT4e/6D2l/+Bkf+NHJLsHPHua1FZP8AwlPh7/oO6Z/4Fx/40f8ACU+Hv+g9pf8A4GR/40ckuwc8e5rUVk/8JR4e/wCg7pn/AIFx/wCNH/CU+Hv+g9pf/gZH/jRyS7Bzx7nj/wAav+Rxs/8AsHp/6Mkrziu++L2oWWo+LLWayvLe5iFiil4JA4B3yHGQevI/OuAyPWuWdKo5P3X9x9BhatNUY+8vvFopMj1oqfY1P5X9x0e2p/zL7zpqKKK9A/Iite/6gf71UKv3v+oH+9VCvRw3wHdh/gFHQ/SkpR0P0pK3Ngo7UUdqBhRRRQIU9fwpKU9fwpKAFHUUlKOopKACl7D6UlL2H0oASiiigBT1/GkpT1/GkoGKvX8DSUq9fwNJQIqXX+sH0qGprr/WD6VDXo0vgRvHYKKKK0GdTRRRXyR4ZWvf9SP96qGav3v+oH+9VCvRw3wHdh/gFB4P0ozQOh+lJW5uGaXPFJR2oAM0ZoooEKev4UmaU9fwpKBig8ikzSjqKSgAzTuw+lNpew+lACZozRRQIUmkzSnr+NJQMUdfwNJmlXr+BpKAKt1/rR9Kgqa6/wBYPpUNejS+BG0dgooorQZ1NFFFfJHhla9/1I/3qo4PoavXv+pH+9VDPtXo4b4Duw/wCgHB4PSjB9DQOh47UZ9q3NwwfQ0YOOhpM+1LnjpQAYPoaMH0NJn2oz7UCFIOeh6UYPoaD16dqTPtQMUA5HBowfQ0DqOKTPtQAuD6GlwcDjtTc+1O7DjtQAmD6GjB9DSZ9qM+1AhSD6UYPoaD9KTPtQMcAc9OxpMH0NA69OxpM+1AFW6/1o+lQVPdf60fSoK9Gl8CNo7BRRRWgzqaKKK+SPDK17/qB/vVQq/e/wCpH+9VD8a9HDfAd2H+AUdD9KSlHQ89qT8a3Nwo7UfjS9utACUUfjR+NAhT1/CkpT169qT8aBijqKSlHUc0n40AFL2H0pPxpew57UAJRR+NH40CFPX8aSlP1pPxoGKvX8DSUq9evY0n40AVLr/WD6VDU91/rR9Kgr0aXwI2jsFFFFaDOpor6F/4RzQ/+gLp3/gKn+FH/COaH/0BdO/8BU/wr5DnM/7Hn/Mj5xvf9QP96qFfRmteHtEWyUro+ng+YOlsnofasH+wtH/6BVj/AOA6f4V00sUoRs0dFPLZwjbmPEh0P0pK9u/sLSP+gVY/+A6f4Uf2Fo//AECrH/wHT/CtPrsexp9Ql3PEaO1e3f2Fo/8A0CrH/wAB0/wo/sLSP+gVY/8AgOn+FH12PYPqEu54jRXt39haP/0CrH/wHT/Cj+wtH/6BVj/4Dp/hR9dj2F9Ql3PEj1/Ckr27+wtI/wCgVY/+A6f4Uf2Fo/8A0CrH/wAB0/wo+ux7D+oS7niQ6ikr27+wtI/6BVj/AOA6f4Uf2Fo//QKsf/AdP8KPrsewfUJdzxGl7D6V7b/YWj/9Aqx/8B0/wo/sLSP+gVY/+A6f4UfXY9g+oS7niNFe3f2Fo/8A0CrH/wAB0/wo/sLR/wDoFWP/AIDp/hR9dj2F9Ql3PEj1/Gkr27+wtI/6BVj/AOA6f4Uf2Fo//QKsf/AdP8KPrsew/qEu54kvX8DSV7d/YWkf9Aqx/wDAdP8ACj+wtH/6BVj/AOA6f4UfXY9g+oS7ng11/rB9Khr6Z0jwxoE1o7S6HpkjByMvaRk4wPatD/hEvDf/AEL+lf8AgFH/AIV0wzSEYpcrLWDklufK1FfVP/CJeG/+hf0r/wAAo/8ACir/ALWh/Kx/U5dzYooorwjvM3W/+PFf+ug/ka5+iigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigDf0P/AI8n/wCuh/kK06KKACiiigD/2Q==",
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
}"UMOD.Core.UITransformComponent,MOD.Core.UIGroupComponent,MOD.Core.CanvasGroupComponent�
$b1fa1f4b-d051-4c75-b8bd-69138d77a58e/ui/UICameraCtrl/UICameraCtrlUp�{
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
        "x": 1.52587891E-05,
        "y": -100.0001
      },
      "RectSize": {
        "x": 1362.88879,
        "y": 200.0
      },
      "OffsetMin": {
        "x": 1.00001526,
        "y": -200.000092
      },
      "OffsetMax": {
        "x": -0.999984741,
        "y": -9.918213E-05
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
        "x": 698.6324,
        "y": 851.0999,
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
$cb897aef-05c7-4a46-a089-4d96c94b3102!/ui/UICameraCtrl/UICameraCtrlLeft�{
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
        "x": 100.000061,
        "y": -7.62939453E-06
      },
      "RectSize": {
        "x": 200.000015,
        "y": 673.839661
      },
      "OffsetMin": {
        "x": 5.340576E-05,
        "y": 1.0
      },
      "OffsetMax": {
        "x": 200.000061,
        "y": -1.0
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 12,
      "AnchorsMin": {
        "x": 0.0,
        "y": 0.0
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
        "x": 119.7736,
        "y": 428.9999,
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
        "r": 0.06105423,
        "g": 0.5683594,
        "b": 0.4554047,
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
$aa54585a-3778-4787-8adf-618c3804891d"/ui/UICameraCtrl/UICameraCtrlRight�{
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
        "x": -100.0001,
        "y": 0.0
      },
      "RectSize": {
        "x": 200.0,
        "y": 670.2855
      },
      "OffsetMin": {
        "x": -200.000092,
        "y": 1.0
      },
      "OffsetMax": {
        "x": -9.918213E-05,
        "y": -1.0
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 14,
      "AnchorsMin": {
        "x": 1.0,
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
        "x": 1029.826,
        "y": 679.4631,
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
        "r": 0.07655716,
        "g": 0.251227677,
        "b": 0.6425781,
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
$006e3c03-ecc7-454d-bb26-594713fbddd7#/ui/UICameraCtrl/UICameraCtrlLeftUp�{
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
        "x": 100.0,
        "y": -100.0
      },
      "RectSize": {
        "x": 200.0,
        "y": 200.0
      },
      "OffsetMin": {
        "x": 0.0,
        "y": -200.0
      },
      "OffsetMax": {
        "x": 200.0,
        "y": 0.0
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
        "x": 119.7736,
        "y": 707.1362,
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
        "r": 0.6777344,
        "g": 0.2501793,
        "b": 0.2501793,
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
$e9b5f782-3d64-4bc4-b407-8887854659cb$/ui/UICameraCtrl/UICameraCtrlRightUp�{
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
        "x": -100.0,
        "y": -100.0
      },
      "RectSize": {
        "x": 200.0,
        "y": 200.0
      },
      "OffsetMin": {
        "x": -200.0,
        "y": -200.0
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
        "x": 999.9935,
        "y": 707.1362,
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
        "r": 0.5214844,
        "g": 0.147686,
        "b": 0.147686,
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
$60aca033-7173-4a94-991c-406769fc4402!/ui/UICameraCtrl/UICameraCtrlDown�{
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
        "x": -1.52587891E-05,
        "y": 99.99994
      },
      "RectSize": {
        "x": 1183.218,
        "y": 200.0
      },
      "OffsetMin": {
        "x": 1.0,
        "y": -6.10351563E-05
      },
      "OffsetMax": {
        "x": -1.0,
        "y": 199.999939
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 11,
      "AnchorsMin": {
        "x": 0.0,
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
        "x": 558.8835,
        "y": 148.8636,
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
        "r": 0.8027344,
        "g": 0.8027344,
        "b": 0.8027344,
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
}"jMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.ButtonComponent,script.CameraCtrlRaiseEvent�
$f7850ac7-77d6-4f15-b451-1777c5b3ffcf%/ui/UICameraCtrl/UICameraCtrlLeftDown�{
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
        "x": 100.0,
        "y": 100.0
      },
      "RectSize": {
        "x": 200.0,
        "y": 200.0
      },
      "OffsetMin": {
        "x": 0.0,
        "y": 0.0
      },
      "OffsetMax": {
        "x": 200.0,
        "y": 200.0
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
        "x": 119.7736,
        "y": 148.8636,
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
$e02e9afe-6b60-4545-8134-6cef0a418337&/ui/UICameraCtrl/UICameraCtrlRightDown�{
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
        "x": -100.0,
        "y": 100.0
      },
      "RectSize": {
        "x": 200.0,
        "y": 200.0
      },
      "OffsetMin": {
        "x": -200.0,
        "y": 0.0
      },
      "OffsetMax": {
        "x": 0.0,
        "y": 200.0
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
        "x": 999.9935,
        "y": 148.8636,
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
}"jMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.ButtonComponent,script.CameraCtrlRaiseEvent8���暄����
 93584b5eb4fa4b45935a465f45303233 f632dad4121d46e3a8e3e76f7cc1979c)ui://87c54dcf-d3b3-4b11-aad5-47c51a39d02a"x-mod/ui2��J
$87c54dcf-d3b3-4b11-aad5-47c51a39d02a/ui/UITitle�I{
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
        "x": -9.536743E-07,
        "y": 0.0
      },
      "RectSize": {
        "x": 1866.755,
        "y": 1080.0
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
      "thumnail": "/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRwhMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCABkAMgDASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwDlrD/kHW3/AFyT+QqxVew/5B1t/wBck/kKsUAFFFFABRRXS6B4F1nxDafa7ZYYbYkhJZ3KhyDg4ABP44xQBzSJc3F5bWdlY3N5dXD7I4oEyfqSSAoHck8degNdbafCbxHd2rm5t9KtgWcpDLOWY5LAltqFRkHPBP3jmuz8E+BNQ8Oa5JfX8tlKhgaNPKZmZWJXnlRjgEfjXzXfX13qd7LeX1xJcXMp3SSyNuZj9f0rtweDeJb1tYTdj0C98Nax4d/dahpIsrfJELRsGRuW/u/KCcZxnPPIFU67nwUNW8X/AAdv7WVn1C9t7/y7QzMNyKBG2NzegZ+p6HHTArO/4V34q/6BX/kxF/8AFVzVqbpVHB9BnMojyyLHGjO7EKqqMkk9ABWkfDeugZOi6lj/AK9X/wAK67w4J/CngjxB4gTTPN1m0bYsFyuwxLtU7iCNwGHLEZG4KAMda87h+MXjiKeOR9XSZUYMYntYgrgHodqg4PTgg+4row2CqYiLlBrQTdh1Fdt8R7Wzlu9M16wwLfVrYTDggscA7iD0yrLx7HvXE1xtW0YwooooAKKKKACiiigAqlKgF07Yw5xtZlDL6HI/z0q7RQBTh3GSJOCqFjkLjqAP6CgOEju4HVsTMp3AZxhs9PpVyigCpbgtcsxAwFIBEYTjPoOKKt0UAV7D/kHW3/XJP5CrFV7D/kHW3/XJP5CrFABRRRQAV0/xtk8jRPCVlaTu+m+Q7RnfxLtWMKxHTIU8H/aNcxXYWPjiH+ybfTtc0Cw1iG1ULbmdVygHHO5WB4wOAOBzmt8LWVGqqjV7CZ4nRX0PrF/o+h/DyfxE/hjR9Purr93p0UdmhYOwO12JTHABfpghRzzivnivpsLifrEXJRsiGrGhYa7q+lRtHp2q31mjHcy29w8YJ9SFI9BV+Hxx4rgnjmTxJqpaNgwD3bupIOeVYkEexBBr2Xw9c3/gf4QaPdWdjC11dSfaLgtGzrskyVdipGDt8ocn2q38SPiDe+E9Q0/T7Ozs7m7aEXEstxESg5IGwBsg5VjyTjjrXE8dGdV04009+v8AwDSFOU3ZHQeJo4z4Z8UTOBHey6GWuLcHIT93Lg5xyc7hn0QV8o7WPY16pqPxg8Rarpd3p89npaw3ULwOUikDBWUqcZc84NeeiEelGAjLDxkp9TrjgZy3PX9baHU/hP4R1OIsBbxLZ7WHUhNjH84T+dcTXZSLt+Bfh8f9Pr/+hz07wvaaVpnhPVPFmqWQ1AWcgihtmA2ljtGTnggmReoOMEgE4rxasb1pRj3f5nO4NT5FvexxdFdIfjf4kD5Gn6UEzwvlyZx9d/8ASr3jmx0/7DoOtWNmtkdVtRNJbxkbEO1CMAAc/Pg9M4zjOcurh50knLqVUozp/EcbVi0sbvUJTFZWs9zIF3FIYy5A9cDtyKr123jLxNqXgXwX4Vh8ONDZNqELT3EvlK7s4SMn72RyXOeOwAwBipo0ZVpqnHdmTOVu9I1OwiEt7p13bRltoeaBkBPXGSOvB/KqddZ8NfiVr/iDxXHoOvSRaja38cifPCieWVRmPCqAwIBBB9ueCDz+r2kdhrV/ZRFmjt7iSJC5ySFYgZ9+KrEYeeHnyTEncp0UUVgMKKKKACiiigCvYf8AIOtv+uSfyFWKr2H/ACDrb/rkn8hVigAooooAK7fTPDdl4Z05vEvjICCzhwYLJsGSdyMqpX1/2T6HdgA5w/B93aWPi3Tbi+Cm3WXBLAYUkEKxzwAGIOe2M1D8WvDfis+IptRuJbrVNIffNbSxKzR2qcZQqOEwAvzdGxnOcgdWEoQrVOWcrIPQ5Txp4xv/ABtrhvLkmO2jytrbA/LEn9WPGT3wOwAGLFatsMm0lQQC2OATnA/Q/lWx4Z8Kap4mv1tNMtmkOQJJmBEcQOeXbHHQ+5xwDXsdve+HfBkEXhC10w675kgOoMVDb5cjgIQQxGOF4AwBknJr2cRjKeGiqcF8jeMI07OerPOfC/xC8Q+GjHFFdtdWS4H2W5JdQo4wp6rx0xx7GvQLqPw78X/sssV62k61br5bQyqrmRMbiFGRvAO7BGCOcryKxfGvw0TTrA634fW5ksPmee2mRhJAMn5gGAYoOhzyAMkkZI4GyS5N5B9iE32reph8nO/fnjbjnOemK4Zyp1P3kNGezRwtOvH2lJ2ff/NHe3vwqsbex1iW38RGa40uBpZoGsih4UsBkt328EZ9a842V9La2JLfwBqL6jsOonSTFczKoG9/LYdQBxuZsDtnpzXziErGliZWfOzfKlOvGTm72Z6gEEvwK03HWG5Yn/v7J/8AFVHciPTvgbcCVyW1O8HlAL0IdeD+ELH8RWhpenz33we02wtwDNeXmxM5wP3rcnGTgbST7Csj4p3lvbPpfhixZ/I02EGQbuGcgbdwAALBec/9ND05rmi71ebzPOpYZ1cwcF0bf3M8wMder+NOPBvgn/sHj/0XFXmBSvZtYtbH4l2i6poN8VvLWIxnT58K2AcjjPyk568g8DIwa3xVRzijpzihKEYtLQ8wrofi6hfwp4GI7WT/APoENYU8E1tM8NxE8UqHDJIpVlPuD0rpfiou7wp4I/68m/8AQIanAS5cRF+v5HiUaftJqJ5/8Pr6bTfiFoM0IXe14kB3DI2yHy2/HDHHvXo/jzQ72PxXqd1b6bdfYyVkMywsY8lAWO7GOuc15LDNPp99b31o/l3NtKssT4B2upyDg8Hkd66/T/jL4ytNRhmvL9L23RsyW728SCRe43KoIPofXselerjsJPEtTp20RNSm6TsyKiuy+J2nwWPi4vAu37VAs8igADeSykjA77cn3JNcbXz5IUUUUAFFFFAFew/5B1t/1yT+QqxVew/5B1t/1yT+QqxQAUUUUAFb2h+MNa8PhY7O63WwOfs8w3x9+g6rySflIzWDRQB2Wo/E3xBf2jW6m3tN3WS2RlfHoCWOPqMHjrV+11NvB3wri1fToY21HUrlofPdQTF98AjjkAR5APGWzyOD59Xb/ECVbX4f+E9PhjCxzxC4bA/iCLk/iZWNXTtzK514GkquIhBq5i2nxT8WwXCyy30Vyi5zFLboFbjvtCn34Nd74t1u08FvbxaLo+m2upXMJMsscCgxoewwBnLDvx8vQ14mor2P4jeGtY1nXLe906ya4t1tVQujL97c56Zz0Ip1JJuyPVzvDww8afs1a97202t/mZOg65beINI1jQPEGom3k1GT7Ql7IRjeNpw2eABsXA4GMgEcVXb4Pa07FrbUdMlt2OYpC7guvY4CkDI9CfqazofAnief7mkyj/fdU/mRXTeDfh/fwa8J9e00LaxRlkDSxurSZGAQCcjBJ/AVk1c87B5liMJFxpPR90dO72vw78CW8dw/26S2Li2IiwZJXLsMcnaMMcnPTPrivB726uL+9mu7t2kuJnLyOwxknrx2+leh+I72913UmlvVaMREpHbnpEO4+vHJ/wAABm6f4Zk1nUYrOGM/OfnYLkIvdj9P16d68GWbc9XkpLyXc+sy2lTwtOVau7zlrJ/j/X/DHP6f4U1fVdFudVsbUz29vII2VDlycZOF6kDK5/3hjODjMsb260u+hvbKd4LmFtySJ1B/qOxB4I4r1nW/GS+EtRsNE0JI3stOXZcqduJm7rkDhhySR/ETkcYOT430Cy13TR4u8OR74nyb+FB8yN1LlexH8WPZuhJr34TlFanHhs4p4qu6NSNovb/J+v8AwCzZ6lYfE6x+xXwhsfEsCk28qjCXCjnb3P1HJH3hkbhVD4sWstp4f8H2s6bJobV45FyDhgsQIyOOorhdNtL681S2g0xJWvmkHk+UcMGHIIPbGM57YzXo/wAaVlW28OrcOrzBJxI6LtDNiLJAycDPbNdNFpVIyRy18BDD46Cg/ivp20/I8bkSvUW+Fvhbw1rMD+I/EzTIoWUWqWhQyDdxuILZU4IIAB9xXmjrXrfxZ/5Gq1/68k/9Deu3FYmpCKUHa9zz8zhyNLuc/wCLfEB8S69JfBGjgVRFAjY3BBnrjuSSe+M4ycVh0UV5J5QUUUUAFFFFAFew/wCQdbf9ck/kKsVXsP8AkHW3/XJP5CrFABRRRQAUUVB/aemozJLNc71OD5UAZfzLA/pQBPXfeJLd/EPwq0bULaDzJtMPlTCMhjHGoKkkdf4YyR2Bz05rmvC+gt4uuWj00XghTPmXM1uqxIcZwSHJJ6cAE8+nNdxp+q+Gvh8j248Q3eoT7t01raorRs3IzyMKQMZ+fJwM9hRe2p2YD20a8Z0Y8zXQ8fRC7BV6muy0q/1e2to4ItVvkiQYVFuHCqPQDPFdF/b3w81SdZf+EbuY3QbR5USwj8kkAP1rqNJ07wXqQVbOALKQD5Uksitz25bk/TNeHi4zr1OSnUSfq0/yPsMVmSjTXtaMlbyT/U5KDUtXOM6pfH63D/41eS71R8A6heNzwPOY8/nVnUdf8O6D4hi0d/C+qfbpZlitt+3ypySApVjJgg5HUcdwDmu1lvdP0qUwxwBXIBYQoBj0z0rhnllamufEVlFerf8AkeJPNKU3alTu/Rf8E5/xTq+gaeLFNetHa9uIssbYDdF0GW+YHGc46/dNc5qPjXRdH0m6sPDXny3NwMG8cFQoIPI6HcM8cAc5yeh0/Gnh208RWF3rdrNNFeWcW50mYlHjUEkAc7T1xjjOcjnNcb4X8EXHiK1lvZrpLGxQ7VnkXdvb0AyOB6568DPOPfpQw8rYiFn/AHv+CeLKrWt7Jt27HK1u+F/FF14Xv3ngjWaGVQssLMQGAOQQexHODg9TXUH4ZaevXxXbD6wr/wDHKif4d6Sn3vGFmP8Atkv/AMcrf21P+ZfeQqVR7Rf3EDfEK2tIZDofhrT9Mu3Up9oQKxCn0ARe+DzkcdDTfjRdM2s6ZYEZWC2MoYnkl2wf/RY/OnP4I8PxnD+N7BT7xqP/AGpXVaxb+C/E1nAms67p0t9FGI/tsFwkLnnJ4yRzzwcgZOMZrWlJJpo9DBSnSxCq1oya9GeEWlo99f29pGCXnlWJcerED+ten/FhgfFdsAQSLJAfb53rd0HwP4LtdQ+3aZfyaxd2i+fHbpexOQykFSAu3nIA+Y7eea828S+KLLV/EN5eXiX9tOX2NAbZcxbRt2nMmcjHPTnPA6VtXqc9kugszxEa00op6dyhRUA1GwmkSO3kuGdj/wAtYgo6ezGp6wPMCiiigAooooAr2H/IOtv+uSfyFWKr2H/IOtv+uSfyFWKACiiigArF0vSptc8SQaXbhvMurry9yoW2AtyxA7AZJ9ga2qt/C/8A5Krp3/XS4/8ARUlAHU+OvES6FZx+CNBzBZ2kKx3UoI3SkjJXIA65yx7kkcDOeI0jR9Q1y+Flpts1xOVLbVIAAHUknAA+vcgd6k8VAr4y1sEEH7fOef8Aro1db8LNc07SbvUoLu5gtLq6iUW1zcJmNCu4kMcjg5U4yAduMg4rWtBKKR9thm8HgnOhG8kr+r7mnYfCvXLRfnutPY9flkf/AOIqFbSayuXtrmNo5ozhlbtTNJ8JalpqXNrb/Eayh0mWPy4JYrpiynerkqgcKhJVgSGPBb142vE+rWmp64JLOTzI4ohGXxwxBJOPbmvk85wlGFP2kX719jkwWYYvE1XGtHTva1je08weJLe2tNSXfcWU8d1bTZG7dGwYckH0wfUE9+at6xFt1RmP8ag/0/pWL4VJfWYNqkhQxYgdBtI/mRW14gk2alGP+mQ/ma56tadfKr1NXGVr/wBetjzK1FU8W1Dqrkljax3lveWMpPk3MDRybTg4Ixx+BNc94PdNU+H1vZ2jq9zZyt50WcMMsxHHuG/Q+latjqQs5jJs35XbjOP89KW0h0e8mezttNTTZZoyouLEiGQd/vKAe2cHI4GQa6MsxOHnhFhKsrN3XXr52sctSlVhP2kVsZc2g6nKMpZv+JA/mayLrwprTA7bBz9GX/GuK8Qa54h0yTULT+39SMltK0W9buQZKvgkc+1cz/wl/ib/AKGLV/8AwNk/+KrrWQYdO6lL8P8AI6aec14bJfj/AJnX6x4Q8QjDjR7xwD/yzjLn8hmuZvrC806UQ31pPaysu4JPGUYjpnB7cH8qaPHPihYYoxruoZjkaTeblyzbgowcnBA28DHGT616F8Yolk1HSNQXpcWpUHPZTuH/AKHXq4XDRoe7Fns4DPKmJqKhUilvqjjPB9xLa+NdFkhkKMbyKMkf3WYKw/EEj8a2PirotjB4h1nUYJT53n2gaJY9iIZIpS2ePmJ8pW3D++wOSK5CC4e1u4biMkPE6upBxyDkV3vxuvZIvEUdgqJ5Vxa287tj5t0bXCjHtiQ5+gr0MQtmeXnkf3kZep5lp/8AyEYPqf5GujrnNP8A+QjB9T/6Ca6OuY8MKKKKACiiigCvYf8AIOtv+uSfyFWKKKACiiigAp1my2Wp2+oxxRG4t5UlRmXPzKQRn8qKKAO1+M2lWtrq+n6lCrLcXqOs3PDeXsCn64bH4D8fNl6UUVvP+Ej7nJm3h4XLVk5W5XHeutsnbA5oor4rNF77PYxWyPQtBH2LwbquqwHbeLDKUcgHbtXIxn3/AJCrPipiurRAf88B/wChNRRW+JSWUwt5HxN75hO/mY3mNjrWr4ZQTa1uYnMUbOMdzwOfzNFFeLl6/wBqp+qOvEfwZ+jPJvE6hvFGsKwBBvZwQf8AfasT7Da/8+8X/fIoor9BPmQ+w2v/AD7xf98ivQfi2oSx8NIowq27gflHRRV0/iPSyj/fIfP8meWMa9R+L1tBN4stWkiRyLFBlhn+OSiiujE7R+Z1538UPn+hwkUEUBYxRqhYYO0YyOuP0FSUUVyHhBRRRQAUUUUAf//Z",
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
}"UMOD.Core.UITransformComponent,MOD.Core.UIGroupComponent,MOD.Core.CanvasGroupComponent�
$5a9f5dc2-4cc2-41de-bdac-0ff20af0fc3f/ui/UITitle/btnStart�{
  "name": "btnStart",
  "path": "/ui/UITitle/btnStart",
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
        "x": 426.834656,
        "y": 142.28833
      },
      "RectSize": {
        "x": 333.440063,
        "y": 149.827011
      },
      "OffsetMin": {
        "x": 260.114624,
        "y": 67.3748245
      },
      "OffsetMax": {
        "x": 593.5547,
        "y": 217.201843
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
        "x": 490.638,
        "y": 389.8687,
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
      "KeyCode": 0,
      "Enable": true,
      "@type": "MOD.Core.ButtonComponent"
    },
    {
      "Text": "처음부터",
      "FontSize": 60,
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
    },
    {
      "zoom": 0.0,
      "IsVictory": false,
      "Enable": true,
      "@type": "script.CommonButtonAction"
    }
  ],
  "@version": 1
}"MOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.ButtonComponent,MOD.Core.TextComponent,script.CommonButtonAction�
$5a813319-67ae-4969-850c-f26927a3c2c2/ui/UITitle/btnGoOn�{
  "name": "btnGoOn",
  "path": "/ui/UITitle/btnGoOn",
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
        "x": -385.963257,
        "y": 142.2883
      },
      "RectSize": {
        "x": 333.440063,
        "y": 149.827026
      },
      "OffsetMin": {
        "x": -552.6833,
        "y": 67.37479
      },
      "OffsetMax": {
        "x": -219.243225,
        "y": 217.201813
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
        "x": 1457.18115,
        "y": 389.8687,
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
      "KeyCode": 0,
      "Enable": true,
      "@type": "MOD.Core.ButtonComponent"
    },
    {
      "Text": "이어하기",
      "FontSize": 60,
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
    },
    {
      "CurrentStage": "",
      "zoom": 0.0,
      "IsVictory": false,
      "Enable": true,
      "@type": "script.CommonButtonAction"
    }
  ],
  "@version": 1
}"MOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.ButtonComponent,MOD.Core.TextComponent,script.CommonButtonAction�
$3b458855-01ad-4dc0-b9db-7c7f02e024d3/ui/UITitle/MODText_2�{
  "name": "MODText_2",
  "path": "/ui/UITitle/MODText_2",
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
        "x": -263.434875,
        "y": 309.829651
      },
      "RectSize": {
        "x": 160.170273,
        "y": 100.0
      },
      "OffsetMin": {
        "x": -343.52002,
        "y": 259.829651
      },
      "OffsetMax": {
        "x": -183.349731,
        "y": 359.829651
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
        "x": 531.1317,
        "y": 728.9999,
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
      "Text": "여기를 누르시오",
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
    }
  ],
  "@version": 1
}"LMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.TextComponent�
$51bc2fdb-4228-4f4c-b95d-eb4b9ac9371e/ui/UITitle/MODImage_1�{
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
        "x": 9.030972,
        "y": -544.5156
      },
      "RectSize": {
        "x": 900.0,
        "y": 1000.0
      },
      "OffsetMin": {
        "x": -440.969025,
        "y": -1044.51563
      },
      "OffsetMax": {
        "x": 459.030975,
        "y": -44.515625
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
        "x": 963.8069,
        "y": 738.1749,
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
        "DataId": "39b0f83d97404844a18e48668ff66d6e"
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
}"5MOD.Core.UITransformComponent,MOD.Core.ImageComponent8�˜的����
 d94cd3a6642344d4850e8d24be189f24 f632dad4121d46e3a8e3e76f7cc1979c)ui://d9862672-a36b-45ad-81b3-ce0b5d28fec2"x-mod/ui2���H
$d9862672-a36b-45ad-81b3-ce0b5d28fec2/ui/UIChangeJob�G{
  "name": "UIChangeJob",
  "path": "/ui/UIChangeJob",
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
        "x": -9.536743E-07,
        "y": 0.0
      },
      "RectSize": {
        "x": 1866.755,
        "y": 1080.0
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
      "thumnail": "/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRwhMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCABkAMgDASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwDxzvRVyxjjKXc8kayi3hEgjYkKxLonOCD/ABE8HqBT/tUP/QKsf++5v/i6TaW4nJLc6b4YeL9P8FeJbnUtShuZYZbNoFW2VWbcXRs/MwGMKe9P/wCLV/8AU5f+Stct9qh/6BVj/wB9zf8AxdH2qH/oFWP/AH3N/wDF0uePcn2ke50tz/wrL7LN9l/4S77RsbyvN+zbN+ON2OcZxnFcXV/7VD/0CrH/AL7m/wDi6PtUP/QKsf8Avub/AOLo549w9pHuUKKuyXUXltjTLNSRjcrS5Hvy+Kog5ANNNPYpNPYWirUFxDEgQ2ME7EZLyu+evQbWHH59+ewl+1Q/9Aqx/wC+5v8A4uhyS3E5xWjZQoq/9qh/6BVj/wB9zf8AxdH2qH/oFWP/AH3N/wDF0uePcXtI9yhRV/7VD/0CrH/vub/4uj7VD/0CrH/vub/4ujnj3D2ke59N/B7/AJJXo3/bf/0fJXcVxXwlcP8ADHR2WJIgfO+SMsVH75/7xJ/Wu1qi1qFFFFABRRRQAUUUUAFcL8Yxn4U60P8Arh/6Pjruq4f4w/8AJK9Z/wC2H/o+OgD5RT75Pt6YoqSigC9Y/wDHjqv/AF6r/wCjoqgqex/48dV/69V/9HRVBWNXoc9foFFFFYmAUUUUAMl/1ZqJfuj6VLL/AKs1Ev3R9K6KWx00fhJE++P93+tSVGn3x/u/1qSs6nxGdb4gooorMyCiiigD6k+EP/JLtG/7b/8Ao6Su3riPhD/yS7Rv+2//AKOkrt6647I7YfCgoooplBRRRQAUUUUAFcP8Yf8Akles/wDbD/0fHXcVw/xh/wCSV6z/ANsP/R8dAHyrRRRQBesf+PHVf+vVf/R0VQVPY/8AHjqv/Xqv/o6KoKxq9Dnr9AooorEwCiiigBkv+rNRL90fSpZf9WaiX7o+ldFLY6aPwkiffH+7/WpKjT74/wB3+tSVnU+IzrfEFFFFZmQUUUUAfUnwh/5Jdo3/AG3/APR0ldvXEfCH/kl2jf8Abf8A9HSV29dcdkdsPhQUUUUygooooAKKKKACuH+MP/JK9Z/7Yf8Ao+Ou4rh/jD/ySvWf+2H/AKPjoA+VaKKKAL1j/wAeOq/9eq/+joqgohufIt7uMJu8+IR5zjbh1bPv93H41B50n9z/AD+dZ1IuWxlVg5WsT0VB50n9z/P50edJ/c/z+dZ+zkZexkT0VB50n9z/AD+dHnSf3P8AP50ezkHsZEkv+rNRL90fShpHYYKdf8+tAGABWsItLU2pxcVZkiffH+7/AFqSoWbbsKBmO35sgDByenPPGKTzpP7n+fzqZwbd0RUpylK6J6Kg86T+5/n86POk/uf5/Oo9nIj2Mieiuh/4V941/wChZv8A/v3/APXqrqPhDxTpFhJfahoV3bWsWN8siYVckAZ59SBR7OQexkexfDr4k+EtA8Cabpep6t5F7D5vmR/ZpWxmV2HKqR0IPWuq/wCFw+A/+g7/AOSk/wD8RXzf4e8I674sN02jWDXLWxTzQJEULu3Y+8w/unpW5/wqLx1/0AW/8CYf/i63SsjpirJI90/4XD4D/wCg7/5KT/8AxFH/AAuHwH/0Hf8AyUn/APiK+ade8Oat4YvkstYtDa3DxCVULq+UJIBypI6qfyqHTtF1XWPM/szTLy98rHmfZoGk2ZzjO0HGcH8qYz6c/wCFw+A/+g7/AOSk/wD8RR/wuHwH/wBB3/yUn/8AiK+ZtQ8P61pMCz6lpF/Zws2xZLm2eNS2M4BYDnAP5VDp+l6hq07QabY3N5Mq7zHbQtIwXIGcKCcZI596APp//hcPgP8A6Dv/AJKT/wDxFH/C4fAf/Qd/8lJ//iK+bp/CPiW2gknn8PatFDEpeSSSykVUUDJJJXAAHeof7BvP+EX/AOEhzF9i+2/Ycbvn8zZv6Y6Y75oA+l/+Fw+A/wDoO/8AkpP/APEVynxI+JHhLX/AGp6ZpmrefeT+V5cf2eVd22VGPLKB0B714PZ2V3qN0lrY2s1zcyZ2QwRl3bAycAcngE/hT9N0+fVdUtdPtgpnupVhjDHA3McDJ+poAq0VZ1Gxm0vU7vT7kKJ7WZ4JNpyNykqcH6iigCGNFdiGkWMerA4/QGunsPBvnNcpcz3rvFHbSoum2Bud6zReaCSzIFwCoIJyS3GQCa5+x1CbTp2mgS2dmUqRcW0c64yD92RWAPHXGfzrsdA+J3iXQLu7uIbTT7ia5igjfzLMIFSMMIwBFsH3Wxkg8BQOAKAMu28JRzSzx3OpxWEguGgijvTHBIuAGDzK8gKIVbOU8zkEYPy7qNn4bubzQJ9ZFzbR28JkBRy287GhU4AUjrcR4yR39Kt/8JC+o3l2114b03ULq6vJrxiyTq6s+Cyjy5FJQbcgHOMnnk1jLfahaWzWa3NzFbuNzQeYyowbaclehztQ++1fQUAddpHwx1bWfDz6varM6CORkRI0/eMshQoMyA7uC3TGAQCW4qpL4EeLQn1E6xYNMmnLfNaBsSKGaLCknAHyTIw5yzHaqnrWSuqSWFubOfRrH96vmTG4hfzJgw3RtuLZQAMCPL27gRu3Cnrf3BsRoMeiwi+f/RTLGJxcSfvd+xkD7GO7AwUJ4HcAgASHwxfzadDfrtFpLay3PnkN5cYjLgo7YwHJVQF7+YnI3CjTvDsup6Zc3cFxHJNEmUtIgXmdvNgjAK9QG8/5SM5KMMd6ZB4j1SHTG0yF4BaupRo/skR3AlCcnbkkmKM5zn5RVayv7u3ttQtIE3pe24ilXBJCq6S5GO48scnPGfrQB2fxA+Fs3gXS7W/Gp/boZ5vJY/ZxFsbaSP4znIDflWEngzUZIMoPMuHlsEiijXhxdxs6Hc2AMFVU54y3Xjm/4s+IGt+O9PSC/wBPsxHZN55ltYpAUBwnzZcgKSyjJHXHPPOEde1SXT5oZ5Wuo2uorhpbnMpV180gfNkYYzSMQQcnJ9cgG1d/D7UtPmsYbzzo5riSbfEIDvWOKGOZ2UEjeQHcYHBaMgMcimp8Odeub6DT7GJLnUGtpZ5rfzUQxmO4eBlyWweVBzwDk4zioh4su4b3TtWXQ9PENv50MayxzTRTAxhGjZpHZmCqy/IGwN3T5jlNU13Vdbv7TU006LSILfZYqdLha3iQ72kx1IDklmxntnHFAG9dfBjxpEFa3tUnBRCQbiNGViisw5bHDMyZzzsJ4BFddZeBvFdn8H9V8OHSmkv73VA4T7RFxCBG2/O/HWPGM55rLudVXwj8dGWRdT1G2soI4kiiHnTSE2kalsZALEKCx46e1ecW11qmn+JdOlWwxqVncRvDbNblWd/M8xQyjDMSWA9cYAPAoA6Pw/4J0SayF/r2tSxqbieCK0s1jZp/KRSxWct5S8vxu4bHyk5Fez2+k6Jrnw6ltNU061svD+/Filq/mvbRjCiV3XcBJuLsxyVAJ3E/OTwngzxR4i8Q3ZluppbLS9Ms5tQkhhluZZb6POwqpkn3nG1wrKcKwwQc4q9F8StCh1t7y3n8dRrAEeWyYRSwquVX5hIzMAxKjO7OW4IyKAPPPiN4KtvBGtQ2VrfXF2k8ZnBkgCiNCxCrvDfO3ynPCjp64HdR22oy+CNATw1JcwaN/ZrTz/2dcG2eW+BAlE07AhEALMN3B2FR1THU+NLCC+mbR9TmttSvZ902l6XcXpgjaXYN0jMGD43FlSLcT8zc7eYuV8MeF/E+hfDzxJYwMlnrF1NbvaeTfxKxCuN2HV8D5c9SM9KANjw3ps1rZ6quvXGoaj4Ue1m+1y6ldl4odj/Isa7N7MFw3mIVUlsABkAryb4f6Hr+v69Pa+HNU/s28S2aR5vtEkOYwygrlASeSpx04r0K80Hxpqfwsn0nULprnVpdWErJNqcbbrcRjALF8bd4ztz15xXJ+Btbj+GHje+PiC1nLizMDR2jRykMxjcHO4KRgdj3oA9y0TTNCXw5qAPiW41vTZrc297cXWp+fGAAxc7gcRkq+DgjhVPXJPmmt+D7K18EWOh6Zqkd1puo+LIVtb1GWX5JIdhJ2kBirBhwRnHbtmXesfCe/wBQ+1C08QWUM5MlxY2+1IJWUlhuUMSM5wNpAH+zyaseMPEln4g+FMNzYaXHaabZ+IEtrW1JPMSW5I34PU5OcHj1J+YgF74XeAZLLxrBq5uLpIrSBZ44Lqz8mVllE8XzqXOzBjJGC2QynjJx594b06bSPirpem3BVprTWI4HK5wSsoBIz24rqZfijYaL4WsrHwrp5tr+SFBcySbglsULMEi+Ysw8xnf5yww5BDA7Vjt/FemeLfF3g68k06WHxHHf28d9dKVEVyqsoDFQPv8A5YHHIxtAMD4keHdU0bxbqN7f2wit9RvrmW1cSo3mL5mc4Ukrwy9cdaKy/Gn/ACPfiH/sJ3P/AKNaigBvhe9isdZLzXFvbJJBLEZriOV0UMhBUiM7sOMxkjJUOWHIBHT6d4n0G2vtUt9esbHWba7SKcS2pkt4RLDA6oqoIkILFtpOABuzzjNcnotlaXj3jXaTyCCASpHBIEaRvNRSoJVuqs2OOuDzjB6nUfC2gWl3NaJJLPcokksaRTmMNHG90ZWZmib5kWKNcAAE7sbutAFXwrrOlWvjC71CG/ufDlnIvyqjmf8Ads6iSLPlNn5SzLuXgooJz8wjh8Vvp/ie/vp9QuNQee3hh+228pWRvLaF1+Z0UknyQhYrnkt8+MNQ0DQLXX73UIBfWtiiITbTXl7HEituBG/cAzrsV+UXIYrkAE1s3Hg6ysdP1ea7t74NaSywq0NyJhDIsSNsk8uJkI3uF3GROh+VSpFAGfrXiGxu7ZbGO28yBotMMssTsjM1vbNG4O4EA5kK5AxiMcHOTe03xZbWPizzo7uWOxm1sXNy+GZHtxPFIp29QQY88LuIOPate48K+FUOrBdO19/sVzfRzXNtE8ttbBDIEU/LlnULG2C4X58s/wDDXB6zp0On3USQM7xSWdtOHYg5Z4kZwCOwZmHtjB5oAs2GqaXb2d+kunZuL1wFZGYLaRqQ4CZJLZYKDu5CpwSWyu/ZeIdLbw/5rLYWOsWizxafJE12sluhLSDbgsrFmldQWKlMAkt2g8ReHNK0208Qi1hubd9N1C3toHvJS7XCt9oBZNqKoDBEYZ7KcMcgHkLeW1RnF1BNL02+VMEx65yrZ7elAHaprOiRfD6W1hmhh1CSyMTWq+Y26VriIu+GjIBMcMZyJMAj5UBOaqXvi+G68QprQW6do9QivBbzzbtoEkkhjQ4wqKXCj1OWwM7V5z7RpX/Pje/+Bi//ABqpYRY3CytBpeoyiFPMlKXKtsTIG44i4GSBk+ooAvjU7EeFtJsA7xXMOpz3E0yBmkiRkhAZBlVOdh4JzlByoPO9feMdLvfD9232QG5m11L8WN1LLL+78hlOZF2fKHIwMg4IByBXJRixlkMcel6i7hDIVW5UnaF3FseV0CgnPoM1fXQblrKS9Xwtr5tIw5ecE+WoQkNlvJwMEHPpg0Ad5oPxt1ldWsYtXu4n09I3W4ma2AkdiMgnZxww2jAA2nkE8hmv/FltU8Ti2uLhrnwk6qtxa28CCSUYyctIuQ27upXgDBVvmrg7fR5LuyS9tvDWuTWjuI0njfcjMWChQwhwSWIGPU4qrJFaRW6XEmkamkL/AHJGuAFbjPB8rB45oA6+58a2eka5ZXvhTULyzgTTntiZbRJZIw1zJL5ZDsQQAy4YMTgDvnHY+GPi3Ch1aDxF4nmmjkig+xXEVgsckbMjGXCqjDKsVX5sg7cjIJrx6NLKWR0j0rUneP76rcqSvzBef3XHzED6kClnitLZA9xpGpxKzFAZLgKCwAJHMXUBlOP9oetADvE2pHV/E+p6h9oe4Se5do5HzkpnCdefu4GO1ZVXPtGlf8+N7/4GL/8AGqiuJrJkUW1vcRvnkyTq4x9Ai0AQUUUUAFXv7Yv/AOwf7E8//iXfaftfk7F/1u3Zu3Yz93jGce1UaKACrFje3Gm39vfWknl3NvIssT7QdrKcg4PB5Heq9FAE97eT6jf3F9dSeZc3MrTSvgDc7EknA4HJPSioKKADvU815dXL757maVufmdyx5JY9fUsT9ST3oooAh3tuLbjkjGc0+eeW5nknnleWaVi8kkjFmdickknkknvRRQBZ/tjVCsy/2lebZmkeUee2JGcYctzyWHBJ696pUUUASCeVYHgEriF2V2jDHazKCASOhIDNg9sn1qufvN9f6UUUAFdv4Ato9Q0/xHBN/q7GzOsIAAQ8turhUcEEGMiVgw6njkc5KKAOx8IaDa33wx1TXJZJRdaTDemBF27G83T4VbeCDngccj3zXL6jqsUGk+IpU0rTxd22otYJdhXWUx3H2ouWKsAWAUKMjG3ggiiigDS+GdtHe+GdfvmHlSeH1i1O3WIACe4QSurSn7zABdm0FRtZuNxLVy2s3si+GPDloioqyWUlw7DOS3nTRYAzhBtQZCgbzy+4gEFFAHrmu+D9P8N+PbHUrOa6ebWLtZ7hZmUqrfb7RsJhQQMuepPauP8Ai14TsPBGh6FpOmyzy289zdXLNc7GcNthXAYKMDA6dz16DBRQB5VR3H1oooAkooooAKKKKACiiigAooooA//Z",
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
}"UMOD.Core.UITransformComponent,MOD.Core.UIGroupComponent,MOD.Core.CanvasGroupComponent�
$17a6df32-99ef-41a6-95e4-bd1d47de0b06/ui/UIChangeJob/bkg�{
  "name": "bkg",
  "path": "/ui/UIChangeJob/bkg",
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
        "x": 1833.85657,
        "y": 1078.0
      },
      "OffsetMin": {
        "x": 1.0,
        "y": 1.0
      },
      "OffsetMax": {
        "x": -1.0,
        "y": -1.0
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
        "x": 1407.66675,
        "y": 702.4999,
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
    }
  ],
  "@version": 1
}"5MOD.Core.UITransformComponent,MOD.Core.ImageComponent�
$7bfd13e7-6edd-423c-ac29-642fcec181b1/ui/UIChangeJob/title�{
  "name": "title",
  "path": "/ui/UIChangeJob/title",
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
        "x": 184.5855,
        "y": -148.370422
      },
      "RectSize": {
        "x": 365.789978,
        "y": 294.2668
      },
      "OffsetMin": {
        "x": 1.690506,
        "y": -295.503845
      },
      "OffsetMax": {
        "x": 367.480469,
        "y": -1.23701477
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
        "x": 899.2412,
        "y": 1167.55017,
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
      "Text": "전직",
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
      "Font": 0,
      "Enable": true,
      "@type": "MOD.Core.TextComponent"
    }
  ],
  "@version": 1
}"LMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.TextComponent�
$7e259ee5-583a-4e22-a3e6-977e54d10160/ui/UIChangeJob/sprJob1�{
  "name": "sprJob1",
  "path": "/ui/UIChangeJob/sprJob1",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MODUIEmpty",
    "sub_entity_id": null
  },
  "@components": [
    {
      "MobileOnly": false,
      "anchoredPosition": {
        "x": 200.0,
        "y": 90.0
      },
      "RectSize": {
        "x": 300.0,
        "y": 300.0
      },
      "OffsetMin": {
        "x": 50.0,
        "y": -60.0
      },
      "OffsetMax": {
        "x": 350.0,
        "y": 240.0
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 1,
      "AnchorsMin": {
        "x": 0.0,
        "y": 0.5
      },
      "AnchorsMax": {
        "x": 0.0,
        "y": 0.5
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": 909.949,
        "y": 958.0195,
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
        "DataId": "cde2f4ed61044b4896ac70ae9b25215a"
      },
      "LocalPosition": {
        "x": 0.0,
        "y": 0.0
      },
      "LocalScale": {
        "x": 1.0,
        "y": 1.0
      },
      "StartFrameIndex": 0,
      "EndFrameIndex": 3,
      "PlayRate": 1.0,
      "AnimClipPlayType": 1,
      "Color": {
        "r": 0.0,
        "g": 0.392156869,
        "b": 0.0,
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
      "@type": "MOD.Core.SpriteGUIRendererComponent"
    }
  ],
  "@version": 1
}"AMOD.Core.UITransformComponent,MOD.Core.SpriteGUIRendererComponent�
$b3f55da6-3519-4a41-a937-c874cf984b9e/ui/UIChangeJob/sprJob1/bkgJob1�{
  "name": "bkgJob1",
  "path": "/ui/UIChangeJob/sprJob1/bkgJob1",
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
        "x": 350.0,
        "y": 350.0
      },
      "OffsetMin": {
        "x": -175.0,
        "y": -175.0
      },
      "OffsetMax": {
        "x": 175.0,
        "y": 175.0
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
        "x": 0.0001,
        "y": 0.0001,
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
      "KeyCode": 0,
      "Enable": true,
      "@type": "MOD.Core.ButtonComponent"
    },
    {
      "zoom": 0.0,
      "IsVictory": false,
      "Enable": true,
      "@type": "script.CommonButtonAction"
    }
  ],
  "@version": 1
}"hMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.ButtonComponent,script.CommonButtonAction�
$9228fdbe-db16-4454-ada7-c4c28aadfc4e/ui/UIChangeJob/sprJob2�{
  "name": "sprJob2",
  "path": "/ui/UIChangeJob/sprJob2",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MODUIEmpty",
    "sub_entity_id": null
  },
  "@components": [
    {
      "MobileOnly": false,
      "anchoredPosition": {
        "x": 600.0,
        "y": 90.0
      },
      "RectSize": {
        "x": 300.0,
        "y": 300.0
      },
      "OffsetMin": {
        "x": 450.0,
        "y": -60.0
      },
      "OffsetMax": {
        "x": 750.0,
        "y": 240.0
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 1,
      "AnchorsMin": {
        "x": 0.0,
        "y": 0.5
      },
      "AnchorsMax": {
        "x": 0.0,
        "y": 0.5
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": 1187.814,
        "y": 958.0195,
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
        "DataId": "47f512a4570a4715a0a3702167ee67e4"
      },
      "LocalPosition": {
        "x": 0.0,
        "y": 0.0
      },
      "LocalScale": {
        "x": 1.0,
        "y": 1.0
      },
      "StartFrameIndex": 0,
      "EndFrameIndex": 3,
      "PlayRate": 1.0,
      "AnimClipPlayType": 1,
      "Color": {
        "r": 0.0,
        "g": 0.392156869,
        "b": 0.0,
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
      "@type": "MOD.Core.SpriteGUIRendererComponent"
    }
  ],
  "@version": 1
}"AMOD.Core.UITransformComponent,MOD.Core.SpriteGUIRendererComponent�
$c9d831a6-de50-42da-83f9-08fbff5e96a8/ui/UIChangeJob/sprJob2/bkgJob2�{
  "name": "bkgJob2",
  "path": "/ui/UIChangeJob/sprJob2/bkgJob2",
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
        "x": 350.0,
        "y": 350.0
      },
      "OffsetMin": {
        "x": -175.0,
        "y": -175.0
      },
      "OffsetMax": {
        "x": 175.0,
        "y": 175.0
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
        "x": 0.0498,
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
      "KeyCode": 0,
      "Enable": true,
      "@type": "MOD.Core.ButtonComponent"
    },
    {
      "zoom": 0.0,
      "IsVictory": false,
      "Enable": true,
      "@type": "script.CommonButtonAction"
    }
  ],
  "@version": 1
}"hMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.ButtonComponent,script.CommonButtonAction�
$8c80a818-5897-4e42-b998-db2f1741a6b3/ui/UIChangeJob/MODImage_2_2�{
  "name": "MODImage_2_2",
  "path": "/ui/UIChangeJob/MODImage_2_2",
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
        "x": -466.574738,
        "y": -156.33725
      },
      "RectSize": {
        "x": 100.0,
        "y": 100.000015
      },
      "OffsetMin": {
        "x": -516.5747,
        "y": -206.33725
      },
      "OffsetMax": {
        "x": -416.574738,
        "y": -106.337242
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 2,
      "AnchorsMin": {
        "x": 1.0,
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
        "x": 1706.205,
        "y": 628.1418,
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
}"5MOD.Core.UITransformComponent,MOD.Core.ImageComponent�
$95e77b7b-0c1a-4c01-a225-e5b93a0ccaac/ui/UIChangeJob/txtAtk�{
  "name": "txtAtk",
  "path": "/ui/UIChangeJob/txtAtk",
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
        "x": -331.6761,
        "y": -138.671051
      },
      "RectSize": {
        "x": 120.291695,
        "y": 112.048187
      },
      "OffsetMin": {
        "x": -391.82193,
        "y": -194.695145
      },
      "OffsetMax": {
        "x": -271.530243,
        "y": -82.64696
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 2,
      "AnchorsMin": {
        "x": 1.0,
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
        "x": 1799.91382,
        "y": 640.4139,
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
      "Text": "99",
      "FontSize": 60,
      "FontColor": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "AlignmentOptions": 3,
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
}"LMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.TextComponent�
$d268d985-8dd1-42dd-8ac8-eb4cccda0b4f/ui/UIChangeJob/MODImage_2_1_1�{
  "name": "MODImage_2_1_1",
  "path": "/ui/UIChangeJob/MODImage_2_1_1",
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
        "x": -233.812561,
        "y": -143.251
      },
      "RectSize": {
        "x": 100.0,
        "y": 100.000015
      },
      "OffsetMin": {
        "x": -283.812561,
        "y": -193.251
      },
      "OffsetMax": {
        "x": -183.812561,
        "y": -93.251
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 2,
      "AnchorsMin": {
        "x": 1.0,
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
        "x": 1867.896,
        "y": 637.2324,
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
        "DataId": "3e9d2ba77c6875d48a1a084f5f4a37b7"
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
}"5MOD.Core.UITransformComponent,MOD.Core.ImageComponent�
$d1517573-28e4-4b76-b28c-97be970653e4/ui/UIChangeJob/txtDef�{
  "name": "txtDef",
  "path": "/ui/UIChangeJob/txtDef",
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
        "x": -111.744141,
        "y": -147.3132
      },
      "RectSize": {
        "x": 120.291695,
        "y": 112.048187
      },
      "OffsetMin": {
        "x": -171.889984,
        "y": -203.3373
      },
      "OffsetMax": {
        "x": -51.5982933,
        "y": -91.28911
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 2,
      "AnchorsMin": {
        "x": 1.0,
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
        "x": 1952.69238,
        "y": 634.4105,
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
      "Text": "99",
      "FontSize": 60,
      "FontColor": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "AlignmentOptions": 3,
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
}"LMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.TextComponent�
$068069df-2efb-4445-92ed-34ac77218675/ui/UIChangeJob/txtJobName�{
  "name": "txtJobName",
  "path": "/ui/UIChangeJob/txtJobName",
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
        "x": -720.3723,
        "y": 247.698822
      },
      "RectSize": {
        "x": 1393.30664,
        "y": 294.741028
      },
      "OffsetMin": {
        "x": -1417.02563,
        "y": 100.328308
      },
      "OffsetMax": {
        "x": -23.7189941,
        "y": 395.069336
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
        "x": 1529.90137,
        "y": 533.6929,
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
      "Text": "군종요리사",
      "FontSize": 150,
      "FontColor": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "AlignmentOptions": 5,
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
}"LMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.TextComponent�
$67ee6499-25bf-4dd4-8489-0c4189326c06/ui/UIChangeJob/sprMe�{
  "name": "sprMe",
  "path": "/ui/UIChangeJob/sprMe",
  "nameEditable": true,
  "enable": true,
  "visible": true,
  "origin": {
    "type": "Model",
    "entry_id": "MODUIEmpty",
    "sub_entity_id": null
  },
  "@components": [
    {
      "MobileOnly": false,
      "anchoredPosition": {
        "x": -320.098145,
        "y": 221.3413
      },
      "RectSize": {
        "x": 500.000031,
        "y": 500.000061
      },
      "OffsetMin": {
        "x": -570.098145,
        "y": -28.6587372
      },
      "OffsetMax": {
        "x": -70.09813,
        "y": 471.3413
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 2,
      "AnchorsMin": {
        "x": 1.0,
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
        "x": 1823.95654,
        "y": 1049.25732,
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
        "DataId": "cde2f4ed61044b4896ac70ae9b25215a"
      },
      "LocalPosition": {
        "x": 0.0,
        "y": 0.0
      },
      "LocalScale": {
        "x": 1.0,
        "y": 1.0
      },
      "StartFrameIndex": 0,
      "EndFrameIndex": 3,
      "PlayRate": 1.0,
      "AnimClipPlayType": 2,
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
      "FillCenter": false,
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
      "@type": "MOD.Core.SpriteGUIRendererComponent"
    }
  ],
  "@version": 1
}"AMOD.Core.UITransformComponent,MOD.Core.SpriteGUIRendererComponent�
$fb7cce1c-b32e-471f-bd26-821ddaa7d677/ui/UIChangeJob/btnChangeJob�{
  "name": "btnChangeJob",
  "path": "/ui/UIChangeJob/btnChangeJob",
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
        "y": 68.90344
      },
      "RectSize": {
        "x": 562.759033,
        "y": 100.0
      },
      "OffsetMin": {
        "x": -281.379517,
        "y": 18.9034424
      },
      "OffsetMax": {
        "x": 281.379517,
        "y": 118.903442
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 6,
      "AnchorsMin": {
        "x": 0.5,
        "y": 0.0
      },
      "AnchorsMax": {
        "x": 0.5,
        "y": 0.0
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": 1408.66675,
        "y": 347.247,
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
      "KeyCode": 0,
      "Enable": true,
      "@type": "MOD.Core.ButtonComponent"
    },
    {
      "Text": "이대로 정합니다",
      "FontSize": 50,
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
    },
    {
      "CurrentStage": "",
      "zoom": 0.0,
      "IsVictory": false,
      "Enable": true,
      "@type": "script.CommonButtonAction"
    }
  ],
  "@version": 1
}"MOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.ButtonComponent,MOD.Core.TextComponent,script.CommonButtonAction�
$98651d29-e7d2-456d-a1e0-72572be89a09/ui/UIChangeJob/txtJobDesc�{
  "name": "txtJobDesc",
  "path": "/ui/UIChangeJob/txtJobDesc",
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
        "x": 458.479553,
        "y": -248.980011
      },
      "RectSize": {
        "x": 866.9591,
        "y": 285.285645
      },
      "OffsetMin": {
        "x": 25.0,
        "y": -391.622833
      },
      "OffsetMax": {
        "x": 891.9591,
        "y": -106.337189
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 1,
      "AnchorsMin": {
        "x": 0.0,
        "y": 0.5
      },
      "AnchorsMax": {
        "x": 0.0,
        "y": 0.5
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": 1089.505,
        "y": 722.543,
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
      "Text": "그들은 따뜻한 요리를 사랑합니다. 검은 전투 뿐 아니라 사냥감이나 채소를 획득할 때도 유리합니다",
      "FontSize": 50,
      "FontColor": {
        "r": 1.0,
        "g": 1.0,
        "b": 1.0,
        "a": 1.0
      },
      "AlignmentOptions": 0,
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
}"LMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.TextComponent8���的���u
 a04650d4666d46d3b0421a929117d83f f632dad4121d46e3a8e3e76f7cc1979c)ui://dc245be9-80cc-49fb-8016-4489f5b31730"x-mod/ui2�t�
$dc245be9-80cc-49fb-8016-4489f5b31730/ui/UIBattleGoal�{
  "name": "UIBattleGoal",
  "path": "/ui/UIBattleGoal",
  "nameEditable": true,
  "enable": false,
  "visible": false,
  "origin": {
    "type": "Model",
    "entry_id": "UIGroup",
    "sub_entity_id": null
  },
  "@components": [
    {
      "MobileOnly": false,
      "anchoredPosition": {
        "x": -9.536743E-07,
        "y": 0.0
      },
      "RectSize": {
        "x": 1866.755,
        "y": 1080.0
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
      "thumnail": "/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRwhMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCABkAMgDASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwDlrD/kHW3/AFyT+QqxVew/5B1t/wBck/kKsUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFUpUAunbGHONrMoZfQ5H+elXaKAKcO4yRJwVQschcdQB/QUBwkd3A6tiZlO4DOMNnp9KuUUAVLcFrlmIGApAIjCcZ9BxRVuigCvYf8g62/wCuSfyFWKr2H/IOtv8Arkn8hVigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigCvYf8g62/wCuSfyFWKr2H/IOtv8Arkn8hVigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigCvYf8g62/wCuSfyFWKr2H/IOtv8Arkn8hVigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigCvYf8g62/wCuSfyFWKr2H/IOtv8Arkn8hVigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigCvYf8g62/wCuSfyFWKr2H/IOtv8Arkn8hVigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigCvYf8g62/wCuSfyFWKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAP/Z",
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
}"UMOD.Core.UITransformComponent,MOD.Core.UIGroupComponent,MOD.Core.CanvasGroupComponent�
$693dfcf1-5172-4069-8f69-5a20e6ada4b4/ui/UIBattleGoal/MODImage_1�{
  "name": "MODImage_1",
  "path": "/ui/UIBattleGoal/MODImage_1",
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
        "x": 1.0,
        "y": 1.0
      },
      "OffsetMax": {
        "x": -1.0,
        "y": -1.0
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
      "Color": {
        "r": 0.9433594,
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
    }
  ],
  "@version": 1
}"5MOD.Core.UITransformComponent,MOD.Core.ImageComponent�
$2114dd20-6bc0-4d2f-8a70-c44c7c067e0e"/ui/UIBattleGoal/UIBattleGoalTitle�{
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
        "y": -200.0
      },
      "RectSize": {
        "x": 100.0,
        "y": 100.0
      },
      "OffsetMin": {
        "x": -108.8903,
        "y": -273.963226
      },
      "OffsetMax": {
        "x": 108.8903,
        "y": -126.036781
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
        "x": 559.8835,
        "y": 642.6961,
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
      "Text": "매복!",
      "FontSize": 300,
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
      "Font": 0,
      "Enable": true,
      "@type": "MOD.Core.TextComponent"
    }
  ],
  "@version": 1
}"LMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.TextComponent�
$527b35ed-4bc1-4aaf-aa64-a6cecb3451e6!/ui/UIBattleGoal/UIBattleGoalDesc�{
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
        "y": -78.81453
      },
      "RectSize": {
        "x": 1585.48279,
        "y": 500.0
      },
      "OffsetMin": {
        "x": 1.0,
        "y": -328.8145
      },
      "OffsetMax": {
        "x": -1.0,
        "y": 171.185471
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
        "x": 559.8835,
        "y": 376.9999,
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
      "Text": "배신당한 툰트라는 전투에 나서야 한다",
      "FontSize": 60,
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
}"LMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.TextComponent�
$d5e18367-c2d8-4fdc-8e00-602671f74e8a/ui/UIBattleGoal/RemoveButton�{
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
        "y": 0.0
      },
      "RectSize": {
        "x": 100.0,
        "y": 100.0
      },
      "OffsetMin": {
        "x": 1.0,
        "y": 1.0
      },
      "OffsetMax": {
        "x": -1.0,
        "y": -1.0
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
      "Color": {
        "r": 0.314453125,
        "g": 0.07062912,
        "b": 0.07062912,
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
      "KeyCode": 0,
      "Enable": true,
      "@type": "MOD.Core.ButtonComponent"
    },
    {
      "CurrentStage": "",
      "zoom": 0.0,
      "IsVictory": false,
      "Enable": true,
      "@type": "script.CommonButtonAction"
    }
  ],
  "@version": 1
}"hMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.ButtonComponent,script.CommonButtonAction8���蚄���}
 820db6b920494aed8d9f18d0fc54ffe3 f632dad4121d46e3a8e3e76f7cc1979c)ui://f3f988ac-4613-46d2-922d-bc36b1bcd47e"x-mod/ui2�|�
$f3f988ac-4613-46d2-922d-bc36b1bcd47e/ui/UIBattleResult�{
  "name": "UIBattleResult",
  "path": "/ui/UIBattleResult",
  "nameEditable": true,
  "enable": false,
  "visible": false,
  "origin": {
    "type": "Model",
    "entry_id": "UIGroup",
    "sub_entity_id": null
  },
  "@components": [
    {
      "MobileOnly": false,
      "anchoredPosition": {
        "x": -9.536743E-07,
        "y": 0.0
      },
      "RectSize": {
        "x": 1866.755,
        "y": 1080.0
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
      "thumnail": "/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRwhMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCABkAMgDASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwDlrD/kHW3/AFyT+QqxVew/5B1t/wBck/kKsUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFUpUAunbGHONrMoZfQ5H+elXaKAKcO4yRJwVQschcdQB/QUBwkd3A6tiZlO4DOMNnp9KuUUAVLcFrlmIGApAIjCcZ9BxRVuigCvYf8g62/wCuSfyFWKr2H/IOtv8Arkn8hVigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigCvYf8g62/wCuSfyFWKr2H/IOtv8Arkn8hVigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigCvYf8g62/wCuSfyFWKr2H/IOtv8Arkn8hVigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigCvYf8g62/wCuSfyFWKr2H/IOtv8Arkn8hVigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigCvYf8g62/wCuSfyFWKr2H/IOtv8Arkn8hVigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigCvYf8g62/wCuSfyFWKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAP/Z",
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
    },
    {
      "MapSize": {
        "x": 0.0,
        "y": 0.0
      },
      "TurnMgr": "0",
      "MapOffset": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0
      },
      "TileSpriteRUID": "",
      "Enable": true,
      "@type": "script.StateGameCommon"
    }
  ],
  "@version": 1
}"lMOD.Core.UITransformComponent,MOD.Core.UIGroupComponent,MOD.Core.CanvasGroupComponent,script.StateGameCommon�
$b2f9932f-5fa1-42f1-923a-d5ad26cf40e5"/ui/UIBattleResult/imageBackground�{
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
        "x": 1.0,
        "y": 1.0
      },
      "OffsetMax": {
        "x": -1.0,
        "y": -1.0
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
    }
  ],
  "@version": 1
}"5MOD.Core.UITransformComponent,MOD.Core.ImageComponent�
$9ac4d19e-b5d5-4584-9044-7f52c0ce5630!/ui/UIBattleResult/buttonContinue�{
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
        "x": 0.0,
        "y": 96.3945
      },
      "RectSize": {
        "x": 668.3784,
        "y": 100.0
      },
      "OffsetMin": {
        "x": -334.1892,
        "y": 46.3945
      },
      "OffsetMax": {
        "x": 334.1892,
        "y": 146.3945
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 6,
      "AnchorsMin": {
        "x": 0.5,
        "y": 0.0
      },
      "AnchorsMax": {
        "x": 0.5,
        "y": 0.0
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": 1388.66675,
        "y": 379.5875,
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
      "KeyCode": 0,
      "Enable": true,
      "@type": "MOD.Core.ButtonComponent"
    },
    {
      "Text": "계속",
      "FontSize": 50,
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
    },
    {
      "zoom": 0.0,
      "IsVictory": false,
      "Enable": true,
      "@type": "script.CommonButtonAction"
    }
  ],
  "@version": 1
}"MOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.ButtonComponent,MOD.Core.TextComponent,script.CommonButtonAction�
$117f427f-0e2a-4418-94ad-a8d639b26f2e/ui/UIBattleResult/textScore�{
  "name": "textScore",
  "path": "/ui/UIBattleResult/textScore",
  "nameEditable": true,
  "enable": false,
  "visible": false,
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
        "y": 0.0
      },
      "RectSize": {
        "x": 100.0,
        "y": 100.0
      },
      "OffsetMin": {
        "x": -170.526321,
        "y": -147.926437
      },
      "OffsetMax": {
        "x": 170.526321,
        "y": 147.926437
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
      "Text": "666",
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
      "Font": 0,
      "Enable": true,
      "@type": "MOD.Core.TextComponent"
    }
  ],
  "@version": 1
}"LMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.TextComponent�
$aaf060f2-3e19-46e7-a7a6-df88e996beb6/ui/UIBattleResult/txtResult�{
  "name": "txtResult",
  "path": "/ui/UIBattleResult/txtResult",
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
        "y": -234.274811
      },
      "RectSize": {
        "x": 654.741,
        "y": 443.9044
      },
      "OffsetMin": {
        "x": -327.3705,
        "y": -456.227
      },
      "OffsetMax": {
        "x": 327.3705,
        "y": -12.3226166
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
        "x": 1380.19385,
        "y": 924.0755,
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
      "Text": "승리!",
      "FontSize": 300,
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
      "Font": 0,
      "Enable": true,
      "@type": "MOD.Core.TextComponent"
    }
  ],
  "@version": 1
}"LMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.TextComponent8�Ż蚄���>
 7020b26f922c451e8f70b064efaa25a5 f632dad4121d46e3a8e3e76f7cc1979c)ui://f902518d-7424-45cb-b5fc-b55f59fd7898"x-mod/ui2�=�!
$f902518d-7424-45cb-b5fc-b55f59fd7898/ui/UIGameIntro� {
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
        "x": -9.536743E-07,
        "y": 0.0
      },
      "RectSize": {
        "x": 1866.755,
        "y": 1080.0
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
      "thumnail": "/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRwhMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCABkAMgDASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwDj/wCEfWkp3G0cnr6UnHqfyr3j50Sl/hP1o49T+VLxtPJ6+lADaKXj1P5Ucep/KgQDofpSU4YweT09KTj1P5UDEpR1/Cjj1P5UoxnqenpQA2il49T+VHHqfyoEC/eH1pKcMbhyevpScep/KgYlFLx6n8qOPU/lQIG+8frSU443Hk9fSk49T+VAxKU9fwo49T+VKcZ6np6UANopePU/lRx6n8qBDrVYDqKtcuiRpEXV3iEpVlO75UZlRicYwxwQTwTtFUZgrC4VI0RBtUBM4JHBbqeTjJwcZPGBgVcIUgZ9PSkwuMf0rPk1ua+091I3fFlt4Uivo/8AhHNqYl+VYi7q8LQxsGZnYlXDmRdoHQc4I+YrCwo//VRTpw5FYVSfPK9rC/wj60lL/CPrSVZmFL/CfrSUv8J+tACUUUUAKOh+lJSjofpSUAFKOv4UlKOv4UAJRRRQAq/eH1pKVfvD60lABRRRQArfeP1pKVvvH60lABSnr+FJSnr+FACUUUUAKeg+lJSnoPpSUAFFFFADsDaOR1pMD1FH8I+tJQMXA9RS4G08jrTaX+E/WgAwPUUYHqKSigQ4AYPI6UmB6igdD9KSgYuB6ilAGeo6U2lHX8KADA9RRgeopKKBDgBuHI60mB6ihfvD60lAxcD1FGB6ikooEOIG48jrSYHqKG+8frSUDFwPUUpAz1HSm0p6/hQAYHqKMD1FJRQIcQMDkdKTA9RQeg+lJQMXA9RRSUUCF/hH1pKdj5R06+tJj6fnQMSl/hP1ox9PzpcfKenX1oAbRS4+n50Y+n50CAdD9KSnAcHp09aTH0/OgYlKOv4UY+n50oHPbp60ANopcfT86MfT86BAv3h9aSnAfMOnX1pMfT86BiUUuPp+dGPp+dAgb7x+tJTiPmPTr60mPp+dAxKU9fwox9PzpSOe3T1oAbRS4+n50Y+n50CA9B9KSnEcDp09aTH0/OgYlFLj6fnRQIP4R9aSl/hH1pKACl/hP1pKX+E/WgBKKKKAFHQ/SkpR0P0pKAClHX8KSlHX8KAEooooAVfvD60lKv3h9aSgAooooAVvvH60lK33j9aSgApT1/CkpT1/CgBKKKKAFPQfSkpT0H0pKACiiigB207RwevpSbT6H8qP4R9aSgYu0+h/Kl2naeD19KbS/wAJ+tABtPofyo2n0P5UlFAhwU4PB6elJtPofyoHQ/SkoGLtPofypQpz0PT0ptKOv4UAG0+h/KjafQ/lSUUCHBTuHB6+lJtPofyoX7w+tJQMXafQ/lRtPofypKKBDip3Hg9fSk2n0P5UN94/WkoGLtPofypSpz0PT0ptKev4UAG0+h/KjafQ/lSUUCHFTgcHp6Um0+h/Kg9B9KSgYu0+h/KikooEL/CPrSUUUAFL/CfrRRQAlFFFACjofpSUUUAFZ2oTyxyqiOVG3PFFFZ1naGhtQSc1cp/aZ/8Anq//AH1R9pn/AOer/wDfVFFcfNLud3JHsAuZ8/65/wDvqj7TP/z1f/vqiijml3Dkj2D7TP8A89X/AO+qt6fPK85V3ZhtzgnNFFXTk+ZamdWMeR6Gm33j9aSiiu088KU9fwoooASiiigBT0H0pKKKACiiigD/2Q==",
      "DefaultShow": false,
      "GroupType": 2,
      "GroupOrder": 0,
      "Enable": true,
      "@type": "MOD.Core.UIGroupComponent"
    },
    {
      "GroupAapha": 10.0,
      "Interactable": true,
      "BlocksRaycasts": true,
      "Enable": true,
      "@type": "MOD.Core.CanvasGroupComponent"
    }
  ],
  "@version": 1
}"UMOD.Core.UITransformComponent,MOD.Core.UIGroupComponent,MOD.Core.CanvasGroupComponent�
$1ecfcaf1-359b-48ac-8b26-f153833ef255/ui/UIGameIntro/buttonSkip�{
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
        "x": 0.0,
        "y": 68.90344
      },
      "RectSize": {
        "x": 489.452362,
        "y": 100.0
      },
      "OffsetMin": {
        "x": -244.726181,
        "y": 18.9034424
      },
      "OffsetMax": {
        "x": 244.726181,
        "y": 118.903442
      },
      "UIScale": {
        "x": 1.0,
        "y": 1.0,
        "z": 1.0
      },
      "AlignmentOption": 6,
      "AnchorsMin": {
        "x": 0.5,
        "y": 0.0
      },
      "AnchorsMax": {
        "x": 0.5,
        "y": 0.0
      },
      "Pivot": {
        "x": 0.5,
        "y": 0.5
      },
      "UIMode": 1,
      "Position": {
        "x": 1408.66675,
        "y": 347.247,
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
      "KeyCode": 0,
      "Enable": true,
      "@type": "MOD.Core.ButtonComponent"
    },
    {
      "Text": "빨리빨리",
      "FontSize": 50,
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
    },
    {
      "zoom": 0.0,
      "IsVictory": false,
      "Enable": true,
      "@type": "script.CommonButtonAction"
    }
  ],
  "@version": 1
}"MOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.ButtonComponent,MOD.Core.TextComponent,script.CommonButtonAction8���蚄���c
 20ff41453bac4395a46c96b687bcc284 f632dad4121d46e3a8e3e76f7cc1979c)ui://ffa78631-e465-4f77-9cda-bcc025c3a874"x-mod/ui2�b�1
$ffa78631-e465-4f77-9cda-bcc025c3a874/ui/UIEnding�0{
  "name": "UIEnding",
  "path": "/ui/UIEnding",
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
        "x": -9.536743E-07,
        "y": 0.0
      },
      "RectSize": {
        "x": 1866.755,
        "y": 1080.0
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
      "thumnail": "/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRwhMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCABkAMgDASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwDjqKXafb86Np9vzr3j5wT0opdp9vzo2n2/OgYDofpSU4A4PTp60m0+350AJR2pdp9vzo2nHb86AEopdp9vzr0W51DWPDejeHx4WhRLe9tIzNcw26StcXLFsxs2DkqcgL1GSO3ETny2SLhDmu30PP7e1uL25S3tIJZ53HyxxIWZsDJwBz0BqGvZNL0XQrT4kWVxFeLYar5W+XRkhLLHI0JLBZB8oABzjnpx1AHnPhIXU+v2mn28VvILqZFk821jnIQH5iN4OMDJOMdPaojV5rtdEXKjy2T6u35GPa2txe3KW9rBLPO/3Y4kLMcDJwBz0BNJJa3EVvDcSQSpBPu8qRkIWTacHaehweuK9ns7K3h+JcDI1nZ2LKJ9LjtrGPF2DAwciVBwFyTgk5yPauA18f8AFvvB/T/l97/9NRSjW5mlb+tf8hzocsW77X/Nf5nJVYSyupbOS7jtpntosCSZYyUQk8At0Ga9A8I65Druvx2t54b8ORWKRvNczJYqvlIqk7iSSAM7Rn3p2gWdz4i8DeKodNs41nu7uOSK2jZVVB5gbaCcAAAH8qcqrW67fiEaKls77/gea0VLPby21xLbzKFlico67gcEHBFR7T7fnWxgB6/jSU4g+350m0+350AC9fwNJTgDnt09aTafb86AFtRAt+JLjzAm3AdI0l2nPUxvw4xkYyOSDnjBiul89p2QSYcIB5jAk4GD0AAHHC9hgZOMmTafb86XB2np19ajkV7l87tYta1qsutatcXjQGBJrqS58surhCwUYB2g/wAPPY8cDHJVTafb86KcYqKshTm5u7EoooqiA9KKPSigBR0P0pKUdD9KSgAo7UUdqBhXWeHJr+38I+Ib201W+tTZ+Rsigl2oxkfaxI9cAYIwa5Orlhq+o6X5n9n31za+Zjf5MhTdjOM469T+dTOPMrFQlyu7NPwtr0ej+L7bWdQM86oZGlK/NI5ZGGeSMnLZOTTfC99fJqUekW15JbW2qTxW9yYgu8oWxwxBI4Y9Pxph8W+Is/8AId1H/wACX/xrL+13P237b58n2rzPN87cd+/Od2euc85qeS97orntazO3OrN4I8cRaa1zeXWj6XM7xQMwJ3SRYJ7Dqx+mTjknOBf6xZ33hzw9pRE8bWDT/aJNgIxJIGBQbuSB2OOaiHi3xHkf8T3Uf/Al/wDGqV/q+o6p5f8AaF9c3Xl52edIX25xnGenQflSjTaab3/4f/MqVRNNLb/hv8jotV1/T9K0ZtA8MSO0Eyg3+oMpR7o4+6AeVQZPH1HqWtaL/wAkn8Tf9d7f/wBGLXD1fh1e+ttIudLin22V0VaaPYp3FSCOcZHIHQ0OnpZd0xKrq2+zRQooorUxFPX8aSlPX8aSgYq9fwNJSr1/A0lAgpf4T9aSl/hP1oASiiigAzS5pKKAFz0pM0elFAxQeD9KM0DofpSUAGaXPFJR2oAM0ZrodN8DeI9X0+K+sdO822lzsfz41zgkHgsD1Bq3/wAK08Xf9Aj/AMmYv/iqh1YLRtFqlUauov7jlD1/CkzXZ/DbQtN8QeIbm11S28+FLQyKu9lwwZBnKkHoTXVeAdA0mfxF4rtZ9Otp4bS7EcCzxiTy1DyjALZPQD8qidZQv5GlOhKdtdzyMHkUmaUdRSVsYBmndh9K7L4a+HbPxDrtzHqVo1xZw2xY4ZlAcsoXJUjnG7j2PpVLx9ocOgeK57S0t/Is2jSS3XeWypGCckk/eDdf5YrP2kefk6mnspKn7TocxmjNFFaGQpNJmlPX8aSgYo6/gaTNKvX8DSUAGaXPyn60lL/CfrQAmaKKKBC4PoaMH0NJn2oz7UALg+howfQ0Z9qTPtQMUA4PB6UYPoaB0PHajPtQAYPoaMHHQ0mfalzx0oA27Hxd4g0yyjs7LUpobePOyNQMDJJPb1Jr1X4Z6vqeo6NqWqazqXmwJII1MpCiIIu52J4GMMv/AHzXjOm6fcatqVvYWke+edwijB49ScdgOSewBr2PXrNtP0DSvAWjXES3t7GytI7soEagvIxwSy72BAGCMbh2rkxCj8KWr/I7MK56zb0X59g8B+FtK0TW57mx8S2mpyvbGMww7cqNyndw544A6d6Ph7/yNvjX/r+H/oyak8BeA9U8La3Pe309nJHJbGECB2JyWU91HHyml+Hv/I2+Nf8Ar+H/AKMmrnm7qbvfRfmdNNWcFa2r/I8SAORwa9D0P4WS3tlDqepavawac8Sz7oclthGTksAE47849K4rRrAarrNnYGUQi4lWPzCu7bk9cZGa9Kf4R+bFFFJ4q3xxAiNGt8hATkgDzOMkk12VqijpzW+VzioU3K75b/Owah4kstJ0dvC/gW2uLu4KN5t1bKzMDnDOCBlmOPvDgZGDwAJIdb0fxbpyaJ43jbTtXtz8s8i+STlc7skYQkAZVuD8pHYDV8JeAIfC2tHUf7ajucxNH5fk7OpHOd59PSoPE3w3h8ReILrVf7cS38/Z+68gPt2qF67xnp6Vy81K9r/Prc6+Sty3t5W6WOQ8R/DC70HT59SXVbWayhQMzOjo5JOAoUBhySBnI684HNcJg+hr1cfCICBoB4pAhZg5j+zfKWAIBx5mMgE8+5rzLVLMadq15YiQSi2neHzMY37WIzjJxnFdVGopac1/lY469Jxs+Wy9blUg+lGD6Gg/Skz7VuYDgDnp2NJg+hoHXp2NJn2oAXB9DRg7TwetJn2pf4Tx3oAMH0NFJn2ooEFFH40fjQAelFL6c0n40DFHQ/SkpR0PPak/GgAo7UfjS9utAHqlh4j8J+C/DEVxomL7WbmEAtKpDgknPmdkUEfcB5wvJzurzibWdSn1eTVWvZxfuxY3COVcEjHBHQY4wO3HSqP40fjWcKSjd7tmk6spJLZI9S+FWs6pqPie6ivtSvLqJbJmCTzs4B3pzgnryfzrc+Hn/I2+Nf8Ar+H/AKMmrz3wF4ksvC+uT3t8k7xSWxiAhUE5LKe5HHymuv8Ah34g0pdd8UXtzfW9pFeXKywi6lWMsC0p7nqMjOPWuWvBrmaWll+Z14eonyJvW7/I8lHUV2Oh6d4En0eCXWdav7bUG3ebFEhKr8xxj92f4cHr3rjh1HNJ+Ndko8ytexxQlyu9rnoX9kfDD/oY9U/79t/8Zpf7I+GGP+Rj1P8A79t/8Zrzz8aXsOe1Z+yf8z/r5Gntl/Kvx/zPQ/H3gLS/C2iQXtjcXkkklyIiJ3UjBVj2Uc/KK87r1/4razpeo+GbWKx1KzuZFvFYpBOrkDY4zgHpyK8g/Glh5ScLy3HiYxjUtHYU9fxpKU/Wk/GtzAVev4GkpV69expPxoAKX+E/Wk/Gl/hPPegBKKPxooEFFFFAB6UUelFACjofpSUo6H6UlABR2oo7UDCiiigQp6/hSUp6/hSUAKOopKUdRSUAFL2H0pKXsPpQAlFFFACnr+NJSnr+NJQMVev4GkpV6/gaSgQUv8J+tJS/wn60AJRRRQBN5S+po8pfU0UUhh5S+po8pfU0UUAHlL6mjyl9TRRQAeUvqaPKX1NFFAB5S+po8pfU0UUABiU9zR5S+poooAPKXPU0eUvqaKKADyl9TR5Y9TRRQAeUvqaPKX1NFFAB5S+po8pfU0UUAAjUdzR5S+poooAPKX1NHlLjGTRRQAeUvqaKKKAP/9k=",
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
}"UMOD.Core.UITransformComponent,MOD.Core.UIGroupComponent,MOD.Core.CanvasGroupComponent�
$d7062744-ddcb-4554-a1b6-ed985c4888f8/ui/UIEnding/txtSide�{
  "name": "txtSide",
  "path": "/ui/UIEnding/txtSide",
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
        "y": -200.0
      },
      "RectSize": {
        "x": 622.6854,
        "y": 234.4168
      },
      "OffsetMin": {
        "x": -311.3427,
        "y": -317.2084
      },
      "OffsetMax": {
        "x": 311.3427,
        "y": -82.7916
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
        "x": 975.9657,
        "y": 827.1166,
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
      "Text": "언젠가",
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
$f6825086-4e03-4371-8e71-49206dd56400/ui/UIEnding/txtMain�{
  "name": "txtMain",
  "path": "/ui/UIEnding/txtMain",
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
        "y": -609.6056
      },
      "RectSize": {
        "x": 736.0,
        "y": 592.0
      },
      "OffsetMin": {
        "x": -368.0,
        "y": -905.6056
      },
      "OffsetMax": {
        "x": 368.0,
        "y": -313.6056
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
        "x": 975.9657,
        "y": 679.9999,
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
      "Text": "계속",
      "FontSize": 400,
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
      "Font": 0,
      "Enable": true,
      "@type": "MOD.Core.TextComponent"
    }
  ],
  "@version": 1
}"LMOD.Core.UITransformComponent,MOD.Core.ImageComponent,MOD.Core.TextComponent8�Ê隄��