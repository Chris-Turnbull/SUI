local Layout = SUI:NewModule('Config.Layout.General')

function Layout:OnEnable()
  -- Database
  local db = SUI.db

  -- Data
  local Themes = SUI:GetModule("Data.Themes")
  local Fonts = SUI:GetModule("Data.Fonts")
  local Textures = SUI:GetModule("Data.Textures")

  -- Layout
  Layout.layout = {
    layoutConfig = { padding = { top = 15 } },
    database = db.profile.general,
    rows = {
      {
        header = {
          type = 'header',
          label = 'General'
        }
      },
      {
        theme = {
          key = 'theme',
          type = 'dropdown',
          label = 'Theme',
          options = Themes.data,
          column = 4,
          order = 1
        },
        font = {
          key = 'font',
          type = 'dropdown',
          label = 'Font',
          options = Fonts.data,
          column = 4,
          order = 2
        },
        texture = {
          key = 'texture',
          type = 'dropdown',
          label = 'Texture',
          options = Textures.data,
          column = 4,
          order = 3
        }
      },
      {
        color = {
          key = 'color',
          type = 'color',
          label = 'Custom Color',
          column = 3,
          update = function() end,
          cancel = function() end
        }
      },
      {
        header = {
          type = 'header',
          label = 'Automation'
        },
      },
      {
        repair = {
          key = 'automation.repair',
          type = 'checkbox',
          label = 'Repair',
          tooltip = 'Repairs your gear automatically',
          column = 3,
          order = 1
        },
        sell = {
          key = 'automation.sell',
          type = 'checkbox',
          label = 'Sell',
          tooltip = 'Sells grey items automatically',
          column = 3,
          order = 2
        },
        delete = {
          key = 'automation.delete',
          type = 'checkbox',
          label = 'Delete',
          tooltip = 'Inserts "DELETE" when deleting Rare+ items',
          column = 3,
          order = 3
        },
        duel = {
          key = 'automation.decline',
          type = 'checkbox',
          label = 'Duel',
          tooltip = 'Declines duels automatically',
          column = 3,
          order = 3
        }
      },
      {
        release  = {
          key = 'automation.release',
          type = 'checkbox',
          label = 'Release',
          tooltip = 'Release automatically when you died',
          column = 3,
          order = 1
        },
        resurrect = {
          key = 'automation.resurrect',
          type = 'checkbox',
          label = 'Resurrect',
          tooltip = 'Accept ress automatically',
          column = 3,
          order = 2
        },
        invite = {
          key = 'automation.invite',
          type = 'checkbox',
          label = 'Invite',
          tooltip = 'Accept group invite automatically',
          column = 3,
          order = 3
        },
        cinematic = {
          key = 'automation.cinematic',
          type = 'checkbox',
          label = 'Cinematic',
          tooltip = 'Skip cinematics automatically',
          column = 3,
          order = 4
        },
      },
      {
        header = {
          type = 'header',
          label = 'Cosmetic'
        },
      },
      {
        afk = {
          key = 'cosmetic.afkscreen',
          type = 'checkbox',
          label = 'AFK Screen',
          tooltip = 'coming soon',
          column = 3,
          order = 1
        },
        talkhead = {
          key = 'cosmetic.talkinghead',
          type = 'checkbox',
          label = 'Talkinghead',
          tooltip = 'Show Talkinghead frame',
          column = 3,
          order = 2
        }
      },
      {
        header = {
          type = 'header',
          label = 'Display'
        },
      },
      {
        items = {
          key = 'display.ilvl',
          type = 'checkbox',
          label = 'Item Infos',
          tooltip = 'Display item level on item icons',
          column = 3,
          order = 1
        },
        avgilvl = {
          key = 'display.avgilvl',
          type = 'checkbox',
          label = 'Average iLvl',
          tooltip = 'Display average item level on inspected players',
          column = 3,
          order = 1
        },
        fps = {
          key = 'display.fps',
          type = 'checkbox',
          label = 'FPS',
          tooltip = 'Show current FPS',
          column = 2,
          order = 2
        },
        ms = {
          key = 'display.ms',
          type = 'checkbox',
          label = 'MS',
          tooltip = 'Show current ping',
          column = 2,
          order = 3
        }
      }
    },
  }
end
