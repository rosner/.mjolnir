local application = require "mjolnir.application"
local hotkey = require "mjolnir.hotkey"
local window = require "mjolnir.window"
local alert = require "mjolnir.alert"

-- bundle identifier
local skype_id = 'com.skype.skype'
local hipchat_id = 'com.hipchat.HipChat'
local messages_id = 'com.apple.iChat'

-- shortcuts
local shiftctrl = {'shift', 'ctrl'}
local ctrlaltcmd = {'ctrl', 'alt', 'cmd'}

function focus_and_maximize(app_id)
    local app = application.applicationsforbundleid(app_id)[1]
    app:activate(true)
    local mainwindow = app:allwindows()[1]
    mainwindow:maximize()
end

-- Focus hipchat and maximize its window on the current screen
hotkey.bind(ctrlaltcmd, 'H', function()
    focus_and_maximize(hipchat_id)
end
)

-- vim like splits
hotkey.bind(shiftctrl, 'H', function()
    window.focusedwindow():movetounit({x=0, y=0, w=0.5, h=1.0})
end
)

hotkey.bind(shiftctrl, 'L', function()
    window.focusedwindow():movetounit({x=0.5, y=0, w=0.5, h=1})
end
)

hotkey.bind(shiftctrl, 'J', function()
    window.focusedwindow():movetounit({x=0, y=0.5, w=1, h=0.5})
end
)

hotkey.bind(shiftctrl, 'K', function()
    window.focusedwindow():movetounit({x=0, y=0, w=1, h=0.5})
end
)

hotkey.bind(shiftctrl, 'M', function()
    window.focusedwindow():maximize()
end
)
