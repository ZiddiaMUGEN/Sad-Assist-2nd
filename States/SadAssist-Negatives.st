[Statedef -2]

;; this does basically everything, lol
[State -2, Execute Lua]
type = DisplayToClipboard
trigger1 = !IsHelper
text = "!lua Functions/EveryFrame.lua"
ignorehitpause = 1
persistent = 256

[State -2, Invisible]
type = AssertSpecial
trigger1 = 1
flag = Invisible
flag2 = NoShadow
ignorehitpause = 1
persistent = 256

[State -2, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
ignorehitpause = 1
persistent = 256

[State -2, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
ignorehitpause = 1
persistent = 256

[State -2, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0
ignorehitpause = 1
persistent = 256

[State 0, Pause]
type = Pause
trigger1 = Random%6 = 0
trigger1 = Life < 0.5*LifeMax
trigger1 = RoundState = 2
time = 1
movetime = 0
[State 0, Pause]
type = Pause
trigger1 = Random%6 = 1
trigger1 = Life < 0.2*LifeMax
trigger1 = RoundState = 2
time = 1
movetime = 0

[State -2, Force Custom State Root]
type = DisplayToClipboard
triggerall = !IsHelper
triggerall = RoundState < 3 ;; this is important to avoid accidentally deleting root on round change
triggerall = NumPartner
trigger1 = !partner,NumHelper(11223344)
text = "!lua Functions/CaptureRoot.lua"
ignorehitpause = 1
persistent = 256

[State -2, Force Custom State Released Helper]
type = DisplayToClipboard
triggerall = !IsHelper
trigger1 = NumPartner
trigger1 = partner,NumHelper(11223344)
trigger2 = !NumPartner
text = "!lua Functions/CaptureHelper.lua"
ignorehitpause = 1
persistent = 256