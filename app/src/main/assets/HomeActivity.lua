function onCreate(activity)
	context = activity
	local rootView = luajava.newInstance("android.widget.LinearLayout", activity)
	activity:setContentView(rootView)
	rootView:setOrientation(1)
	local button1 = luajava.newInstance("android.widget.Button", activity)
	button1:setText("打开第二个界面")
	rootView:addView(button1)
	local btn1Listener = luajava.createProxy("android.view.View$OnClickListener", button1_cb)
	button1:setOnClickListener(btn1Listener)

	local recyclerView = luajava.newInstance("com.nightfarmer.cloudapp.recyclerview.LuaRecyclerView", activity)
	local gridLayoutManager = luajava.newInstance("android.support.v7.widget.GridLayoutManager",activity, 3)
	recyclerView:setLayoutManager(gridLayoutManager)
	local adapterProxy = luajava.createProxy("com.nightfarmer.cloudapp.recyclerview.LuaRecyclerAdapter", adapter)
	recyclerView:setAdapter(adapterProxy)
	rootView:addView(recyclerView)
end

button1_cb = {}
function button1_cb.onClick(view)
	local context = view:getContext()
	local IntentBuilder = luajava.bindClass("com.nightfarmer.cloudapp.IntentBuilder")
	local intent = IntentBuilder:newActivityIntent(context,"TestActivity")
	context:startActivity(intent)
end

adapter = {}
function adapter.onCreateViewHolder(parent)
	local button = luajava.newInstance("android.widget.Button", parent:getContext())
	parent:addView(button)
	local holder = luajava.newInstance("com.nightfarmer.cloudapp.recyclerview.LuaViewHolder", button)
	holder:putView("title", button)
	return holder
end
function adapter.onBindViewHolder(holder, position)
	holder:getView("title"):setText(funcList[position+1].name)
	
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
	{name="功能1",activity="TestActivity"},
	{name="功能2",activity="TestActivity"},
	{name="功能3",activity="TestActivity"},
	{name="功能4",activity="TestActivity"},
	{name="功能5",activity="TestActivity"},
	{name="功能6",activity="TestActivity"},
	{name="功能7",activity="TestActivity"},
	{name="功能8",activity="TestActivity"},
	{name="功能9",activity="TestActivity"},
	{name="功能10",activity="TestActivity"},
	{name="功能11",activity="TestActivity"},
	{name="功能12",activity="TestActivity"},
	{name="功能13",activity="TestActivity"},
}
