function onCreate(activity)
	activity:setTitle("应用程序管理")
	local rootView = luajava.newInstance("android.widget.LinearLayout", activity)
	activity:setContentView(rootView)
	rootView:setOrientation(1)

end

function onResume()

end

function onActivityResult()

end

