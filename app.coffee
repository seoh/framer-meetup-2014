###										###
#				Sending Email			  #
###										###


# Inspired by Google: http://googledevkr.blogspot.kr/2014/08/material.html
# Especially: http://4.bp.blogspot.com/-7Wz33_F5V7c/U-MoO8ijNMI/AAAAAAAAAdY/dCgHlv4iZDw/s1600/pic16.gif

# Backbone: http://www.sketchappsources.com/
# Icon: https://github.com/google/iosched

Sketch = Framer.Importer.load "imported/material"

screenLayer	= Sketch.screen
iconLayer	= Sketch.icon
checkLayer	= Sketch.check
sendLayer	= Sketch.send

screenLayer.center()

iconLayer.superLayer = screenLayer
[iconLayer.width, iconLayer.height] = [62, 62]

checkLayer.superLayer = iconLayer
sendLayer.superLayer = iconLayer


[iconLayer.x, iconLayer.y] = [281,145]
iconLayer.style =
	borderRadius: '32px'
	overflowY: 'hidden'
	webkitMaskImage: '-webkit-radial-gradient(circle, white, black)' 
# 	border: '1px solid red'


[checkLayer.x, checkLayer.y] = [0,0]
[sendLayer.x, sendLayer.y] = [0,30]
sendLayer.opacity = 0

subject = new Layer
	x: 50
	y: 50
	width: 200
	height: 100
	backgroundColor: 'transparent'
	superLayer: screenLayer
	
subject.style =
	fontSize: '2em'
	paddingTop: '.5em'

content = new Layer
	x: 30
	y: 200
	width: 300
	height: 100
	backgroundColor: 'transparent'
	superLayer: screenLayer
	
content.style =
	fontSize: '.8em'
	color: 'darkgrey'
	overflow: 'scroll'


subjectStr = 'Subject'
contentStr = '''
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.
'''

subject.html = subjectStr
content.html = contentStr

Framer.Defaults.Animation =
  curve: "spring(260, 30, 0, 0.1)"

checkLayer.states.add
	change: { opacity:0, rotationZ:-180, y:-40 }

sendLayer.states.add
	change: { opacity:1, rotationZ:-180, x: -3, y: -6 }

subject.states.animationOptions = content.states.animationOptions =
	curve: 'bezier-curve'
	curveOptions: [.5,-1,0,1]

subject.states.add
	disapear: { x: 300, opacity: 0 }

content.states.add
	disapear: { x: 300, opacity: 0 }

checkLayer.states.next()
sendLayer.states.next()

screenLayer.on Events.Click, ->
	checkLayer.states.next()
	sendLayer.states.next()

	subject.states.next()
	content.states.next()
		