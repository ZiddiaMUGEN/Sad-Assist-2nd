;; state to force the enemy to release a Normal-type Helper we can control.
[Statedef 11223344]

[State 11223344]
type = Helper
trigger1 = !NumHelper(11223344)
id = 11223344
name = "SadAssist Controller"
helpertype = Normal
pausemovetime = 99999999
supermovetime = 99999999
stateno = 11223344
ignorehitpause = 1
persistent = 256

[State 11223344]
type = RemapPal
trigger1 = 1
source = 1,1
dest = 1,1+(random%12)
ignorehitpause = 1
persistent = 256

[State 11223344]
type = SelfState
trigger1 = !IsHelper
trigger1 = NumHelper(11223344)
value = 5900
ignorehitpause = 1
persistent = 256

;; state the captured Helper enters, to run sctrls I couldnt reproduce with Lua
[Statedef 11223345]

[State 11223345]
type = PosSet
trigger1 = 1
x = root,Pos x
y = root,Pos y
ignorehitpause = 1
persistent = 256

[State 11223345]
type = Turn
trigger1 = Facing != root,Facing
ignorehitpause = 1
persistent = 256

[State 11223345]
type = AssertSpecial
trigger1 = 1
flag = Invisible
flag2 = NoShadow
ignorehitpause = 1
persistent = 256

[State 11223345]
type = NotHitBy
trigger1 = 1
value = SCA
ignorehitpause = 1
persistent = 256

[State 11223345]
type = PlayerPush
trigger1 = 1
value = 0
ignorehitpause = 1
persistent = 256

[State 11223345]
type = ChangeAnim
trigger1 = 1
value = root,Anim
elem = root,AnimElemNo(0)
ignorehitpause = 1
persistent = 256

[State 0, AfterImage]
type = AfterImage
trigger1 = Random < 10
time = random%72
length = random%24
;palcolor = 256
;palinvertall = 0
;palbright = 30,30,30
palcontrast = random%255,random%255,random%255
;palpostbright = 0,0,0
paladd = random%33,random%33,random%33
palmul = .9,.9,.9
timegap = 1
framegap = 1
;trans = add ;"none","add1","sub"
;ignorehitpause =
;persistent =

[State 0, PlaySnd]
type = PlaySnd
trigger1 = 1
value = random%5001,random%5
channel = random%10
[State 0, PlaySnd]
type = PlaySnd
trigger1 = root,MoveType != I
value = random%5001,random%5
channel = random%10
[State 0, PlaySnd]
type = PlaySnd
trigger1 = EnemyNear,MoveType = H
value = random%5001,random%5
channel = random%10
[State 0, PlaySnd]
type = PlaySnd
trigger1 = !root,Alive
value = random%5001,random%5
channel = random%10
[State 0, PlaySnd]
type = PlaySnd
trigger1 = root,Life < (0.2 * root,LifeMax)
value = random%5001,random%5
channel = random%10

[State 0, HitDef]
type = HitDef
trigger1 = random < 10
attr = SCA,NA
hitflag = MAFD        ;HLAFD+-
guardflag = MA         ;HLA
animtype = light
air.animtype = hard
priority = random%9,Hit
damage = random%300,random%300
pausetime = 0,random%20
guard.pausetime = random%50,random%50
sparkno = random%9999
guard.sparkno = random%9999
sparkxy = -random%100,-random%300
hitsound = S1,random%5
guardsound = S2,0
ground.type = High
ground.slidetime = random%60
ground.hittime = random%60
air.hittime = random%60
yaccel = random%100*0.01
ground.velocity = -15+random%20,-15+random%20
air.velocity = -15+random%20,-15+random%20
p1facing = ifelse(random<500,-1,1)
p2facing = ifelse(random<500,-1,1)
fall = ifelse(random<500,0,1)
fall.damage = random%50
air.fall = ifelse(random<500,0,1)
down.bounce = 1
getpower = -100+random%200,-100+random%200
givepower = -100+random%200,-100+random%200
envshake.time = random%18
envshake.freq = random%180
envshake.ampl = random%18
envshake.phase = random%180

[State 0, PowerAdd]
type = PowerAdd
trigger1 = 1
value = Ceil(Vel X*2 + Vel Y*5)
[State 0, PowerAdd]
type = PowerAdd
trigger1 = 1
value = -50+random%100