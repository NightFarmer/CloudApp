function onCreate(activity)
	activity:loadFile("Utils")
	activity:setTitle("设置页")
	local rootView = Utils.createLinearLayout()
	activity:setContentView(rootView)
	rootView:setOrientation(1)


	local button = Utils.createButton()
	rootView:addView(button)
	local buttonListener = Utils.createOnClickListener(button_cb)
	button:setOnClickListener(buttonListener)
	button:setText("更新脚本")

	local scrollView = Utils.createScrollView()
	rootView:addView(scrollView)

	contentView = Utils.createLinearLayout()
	contentView:setOrientation(1)
	scrollView:addView(contentView)



end

button_cb={}
function button_cb.onClick(view)
	FileUpdateUtil = luajava.bindClass("com.nightfarmer.cloudapp.update.FileUpdateUtil")
	local updateListener = luajava.createProxy("com.nightfarmer.cloudapp.update.UpdateCheckCallback",update_cb)
	update_cb.view = view
	view:setText("正在更新...")
	local textView = Utils.createTextView()
	textView:setText("开始获取更新列表..")
	contentView:addView(textView)
	FileUpdateUtil:checkUpdate(updateListener)
end

update_cb={}
function update_cb.onSuccess(versionInfo)
	local fileList = FileUpdateUtil:getFileToUpdate(context, versionInfo)
	HttpCall = luajava.bindClass("com.nightfarmer.cloudapp.net.HttpCall")
	local textView = Utils.createTextView()
	textView:setText("开始更新文件...")
	contentView:addView(textView)
	downLoadFile(versionInfo)
end

function downLoadFile(versionInfo)
	local fileList = versionInfo.fileList
	if fileList:size()>0 then
		local file = fileList:get(0)
		local update_cb = createDL_CB()
		update_cb.versionInfo = versionInfo
		local dl_Listener = luajava.createProxy("com.nightfarmer.cloudapp.net.HttpCallback",update_cb)
		HttpCall:downLoad(context,versionInfo.downLoadHost..file.name,file.name,dl_Listener)
	else
		FileUpdateUtil:updateVersionInfo(context, versionInfo) 
		local textView = Utils.createTextView()
		textView:setText("更新完成!")
		contentView:addView(textView)
		update_cb.view:setText("更新完成")
	end
end

function createDL_CB()
	local dl_cb = {}
	function dl_cb.onSuccess()
		local textView = Utils.createTextView()
		local fileList = dl_cb.versionInfo.fileList;
		textView:setText(fileList:get(0).name)
		contentView:addView(textView)
		fileList:remove(0)
	end
	function dl_cb.onFailure()

	end
	function dl_cb.onFinish()
		downLoadFile(dl_cb.versionInfo)
	end
	function dl_cb.onProcess()

	end
	return dl_cb
end


function update_cb.onFailure()
	update_cb.view:setText("获取失败")
end

function onResume()

end

function onActivityResult()

end
