function onCreate(activity)
	activity:loadFile("Utils")
	activity:setTitle("设置页")
	local rootView = luajava.newInstance("android.widget.LinearLayout", activity)
	activity:setContentView(rootView)
	rootView:setOrientation(1)

	local button = Utils.createButton()
	rootView:addView(button)
	local buttonListener = Utils.createOnClickListener(button_cb)
	button:setOnClickListener(buttonListener)
	button:setText("更新脚本")
end

button_cb={}
function button_cb.onClick(view)
	local FileUpdateUtil = luajava.bindClass("com.nightfarmer.cloudapp.update.FileUpdateUtil")
	local updateListener = luajava.createProxy("com.nightfarmer.cloudapp.update.UpdateCheckCallback",update_cb)
	update_cb.view = view
	view:setText("正在获取更新列表")
	FileUpdateUtil:checkUpdate(updateListener)
end

update_cb={}
function update_cb.onSuccess(versionInfo)
	Utils.toast("sss")
	update_cb.view:setText("获取成功")
end

function update_cb.onFailure()
	Utils.toast("fff")
	update_cb.view:setText("获取失败")
end

function onResume()

end

function onActivityResult()

end
