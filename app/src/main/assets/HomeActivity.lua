
function onCreate(activity)
	activity:loadFile("Utils")
	local rootView = Utils.createLinearLayout()
	activity:setContentView(rootView)
	rootView:setOrientation(1)
	local button1 = Utils.createButton()
	button1:setText("欢迎欢迎，热烈欢迎")
	rootView:addView(button1)
	local btn1Listener = Utils.createOnClickListener(button1_cb)
	button1:setOnClickListener(btn1Listener)

	local recyclerView = Utils.createRecyclerView()
	local gridLayoutManager = Utils.createGridLayoutManager(3)
	recyclerView:setLayoutManager(gridLayoutManager)
	local adapterProxy = Utils.createRecyclerAdapter(adapter)
	recyclerView:setAdapter(adapterProxy)
	rootView:addView(recyclerView)
end

button1_cb = {}
function button1_cb.onClick(view)
	Utils.startActivity("TestActivity")
	Utils.func3()
end

adapter = {}
function adapter.onCreateViewHolder(parent)
	local button = Utils.createButton()
	parent:addView(button)
	local holder = Utils.createRecyclerViewHolder(button)
	local btnClickCB = {holder = holder}
	function btnClickCB.onClick(view)
		local itemData = btnClickCB.holder:getObject("data")
 		local activity = itemData.activity
		Utils.startActivity(activity,{name=itemData.name})
	end
	local btnListener = Utils.createOnClickListener(btnClickCB)
	button:setOnClickListener(btnListener)
	holder:putView("title", button)
	return holder
end
function adapter.onBindViewHolder(holder, position)
	holder:getView("title"):setText(funcList[position+1].name)
	holder:putObject("data",funcList[position+1])
end

function adapter.getItemCount()
	-- #funcList
	return table.getn(funcList)
end

function onResume()

end

function onActivityResult()

end

funcList={
	{name="管理应用",activity="ManageAppActivity"},
	{name="表单演示",activity="BillActivity"},
	{name="功能3",activity="TestActivity"},
	{name="功能4",activity="TestActivity"},
	{name="功能5",activity="TestActivity"},
	{name="功能6",activity="TestActivity"},
	{name="功能7",activity="TestActivity"},
	{name="功能8",activity="TestActivity"},
	{name="功能9",activity="TestActivity"},
	{name="功能10",activity="TestActivity"},
	{name="功能11",activity="TestActivity"},
	{name="不存在的功能",activity="TestActivity22"},
	{name="更新脚本",activity="SettingActivity"},
}
