function onCreate(activity)
	activity:loadFile("Utils")
	activity:setTitle("应用程序管理")
	-- local rootView = luajava.newInstance("android.widget.LinearLayout", activity)
	local rootView = Utils.createLinearLayout()
	activity:setContentView(rootView)
	rootView:setOrientation(1)

	local recyclerView = Utils.createRecyclerView()
	local layoutManager = Utils.createLinearLayoutManager()
	recyclerView:setLayoutManager(layoutManager)
	initAdapterData()
	local adapter_cb = Utils.createRecyclerAdapter(adapter)
	recyclerView:setAdapter(adapter_cb)
	rootView:addView(recyclerView)
end

-------------------------------------------------------------------
function initAdapterData()
	local intent = Utils.createIntent()
	intent:setAction("android.intent.action.MAIN")
	intent:addCategory("android.intent.category.LAUNCHER")
	local packageManager = context:getPackageManager()
	local appList = packageManager:queryIntentActivities(intent, 0)
	appInfoList={}
	for i=0,appList:size()-1 do
		local infoObj = appList:get(i) 
		local appInfo={}
		appInfo.name = infoObj:loadLabel(packageManager)
		appInfo.icon = infoObj:loadIcon(packageManager)
		appInfo.infoObj = infoObj
		appInfoList[i] = appInfo
	end
	adapter.dataList = appInfoList
end
-------------------------------------------------------------------
adapter = {}
function adapter.onCreateViewHolder(parent, viewType)
	local content = Utils.createLinearLayout()
	local iv_icon = Utils.createImageView()
	content:addView(iv_icon)
	local tv_name = Utils.createTextView() 
	content:addView(tv_name)
	
	local holder = Utils.createRecyclerViewHolder(content)
	holder:putView("tv_name", tv_name)
	holder:putView("iv_icon", iv_icon)
	
	content:setClickable(true)
	local click_cb = {holder = holder}
	function click_cb.onClick(view)
		local activityInfo = click_cb.holder:getObject("infoObj").activityInfo
		local component = Utils.createComponent(activityInfo.packageName, activityInfo.name)
		local intent = Utils.createIntent()
		intent:setComponent(component)
		context:startActivity(intent)
	end
	local listener = Utils.createOnClickListener(click_cb)
	content:setOnClickListener(listener)
	
	return holder
end
function adapter.onBindViewHolder(holder, position)
	local appInfo = adapter.dataList[position]
	holder:putObject("infoObj", appInfo.infoObj)
	holder:getView("tv_name"):setText(""..appInfo.name)
	holder:getView("iv_icon"):setImageDrawable(appInfo.icon)
end
function adapter.getItemCount()
	return #adapter.dataList
end

--------------------------------------------------------------------

function onResume()

end

function onActivityResult()

end

