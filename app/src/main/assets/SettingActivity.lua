function onCreate(activity)
	activity:setTitle("设置页")
	local rootView = luajava.newInstance("android.widget.LinearLayout", activity)
	activity:setContentView(rootView)
	rootView:setOrientation(1)

end

function onResume()

end

function onActivityResult()

end