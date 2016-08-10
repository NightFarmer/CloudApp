function onCreate(activity)
	activity:setTitle("这是第二个界面")
	local rootView = luajava.newInstance("android.widget.LinearLayout", activity)
	activity:setContentView(rootView)
	rootView:setOrientation(1)
	local button1 = luajava.newInstance("android.widget.Button", activity)
	button1:setText("打开第三个界面")
	rootView:addView(button1)
	local btn1Listener = luajava.createProxy("android.view.View$OnClickListener", button1_cb)
	button1:setOnClickListener(btn1Listener)
end

button1_cb = {}
function button1_cb.onClick(view)
	local context = view:getContext()
	local IntentBuilder = luajava.bindClass("com.nightfarmer.cloudapp.IntentBuilder")
	local intent = IntentBuilder:newActivityIntent(context,"TestActivity3")
	context:startActivity(intent)
end

function onResume()

end

function onActivityResult()

end
