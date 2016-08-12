-- 文件名为 Utils.lua
-- 定义一个名为 Utils 的模块
Utils = {}
 
-- 定义一个常量
Utils.constant = "这是一个常量"
 
-- 定义一个函数
function Utils.func1()
    io.write("这是一个公有函数！\n")
end
 
local function func2()
    print("这是一个私有函数！")
    Utils.toast("来自子文件的方法")
end
 
function Utils.func3()
    func2()
end
 
function Utils.startActivity(activity, dataTable)
	local intent = context:createActivityIntent(activity)
	if(dataTable) then
		for k,v in pairs(dataTable) do
			intent:putExtra(k,v)
		end
	end
	context:startActivity(intent)
end

function Utils.createIntent()
	return luajava.newInstance("android.content.Intent")
end

function Utils.createComponent(pkg, clsName)
	return luajava.newInstance("android.content.ComponentName", pkg, clsName)
end

function Utils.createTextView()
	return luajava.newInstance("android.widget.TextView", context)
end

function Utils.createButton()
	return luajava.newInstance("android.widget.Button", context)
end

function Utils.createEditText()
	return luajava.newInstance("android.widget.EditText", context)
end

function Utils.createImageView()
	return luajava.newInstance("android.widget.ImageView", context)
end

function Utils.createLinearLayout()
	return luajava.newInstance("android.widget.LinearLayout", context)
end


function Utils.createLinearLayoutParams(width, height)
	return luajava.newInstance("android.widget.LinearLayout$LayoutParams", width, height)
end

function Utils.createScrollView()
	return luajava.newInstance("android.widget.ScrollView", context)
end

function Utils.createOnClickListener(callback)
	return luajava.createProxy("android.view.View$OnClickListener", callback)
end


function Utils.createRecyclerView()
	return luajava.newInstance("com.nightfarmer.cloudapp.recyclerview.LuaRecyclerView", context)
end

function Utils.createLinearLayoutManager()
	return luajava.newInstance("android.support.v7.widget.LinearLayoutManager", context)
end

function Utils.createGridLayoutManager(column)
	return luajava.newInstance("android.support.v7.widget.GridLayoutManager", context, column)
end


function Utils.createRecyclerAdapter(callback)
	return luajava.createProxy("com.nightfarmer.cloudapp.recyclerview.LuaRecyclerAdapter", callback)
end

function Utils.createRecyclerViewHolder(itemView)
	return luajava.newInstance("com.nightfarmer.cloudapp.recyclerview.LuaViewHolder", itemView)
end

function Utils.toast(text)
	local Toast = luajava.bindClass("android.widget.Toast")
	Toast:makeText(context, ""..text, 0):show()
end
