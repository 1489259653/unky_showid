Config = {}
Config.Colors = { -- https://docs.fivem.net/docs/game-references/hud-colors/
    text=6, --文本颜色 当前为红色
    drive = 9, --开车小图标 当前为蓝色
    star = 6, --五角星 当前为红颜色
    ['DefaultTag'] = 0 --[[ Colors for tags are added in 'Config.DisplayStaffTag'. ]]
}
Config.debug = true -- 测试模式
Config.ClientTickTime = 10*1000  --10 秒
Config.cronExpress= "* * * * *" --每分钟向所有客户端发送一次最新数据
Config.newPlayerTime = 60 * 8 -- 3 小时
Config.Disctance = 20 --显示距离
Config.offsetY = 1.0 --文字显示比人的腰部高多少
Config.Color = {r=255,g=0,b=0,a=255}  --r 红色 g 绿色 b蓝色 a透明度255不透明