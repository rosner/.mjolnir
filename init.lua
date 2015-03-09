local application = require "mjolnir.application"
local hotkey = require "mjolnir.hotkey"
local window = require "mjolnir.window"
local alert = require "mjolnir.alert"

-- bundle identifier
local skype_id = 'com.skype.skype'
local hipchat_id = 'com.hipchat.HipChat'
local messages_id = 'com.apple.iChat'

-- shortcuts
local shiftctrl = {"shift", "ctrl"}
local ctrlaltcmd = {"ctrl", "alt", "cmd"}

function focus_and_maximize(app_id)
    local app = application.applicationsforbundleid(app_id)[1]
    app:activate(true)
    local mainwindow = app:allwindows()[1]
    mainwindow:maximize()
end

-- Focus hipchat and maximize its window on the current screen
hotkey.bind(ctrlaltcmd, "H", function()
    focus_and_maximize(hipchat_id)
end
)
