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

function Utils.createTextView()
	return luajava.newInstance("android.widget.TextView", context)
end

function Utils.createButton()
	return luajava.newInstance("android.widget.Button", context)
end

function Utils.createLinearLayout()
	return luajava.newInstance("android.widget.LinearLayout", context)
end

function Utils.createScrollView()
	return luajava.newInstance("android.widget.ScrollView", context)
end

function Utils.createOnClickListener(callback)
	return luajava.createProxy("android.view.View$OnClickListener", callback)
end

function Utils.toast(text)
	local Toast = luajava.bindClass("android.widget.Toast")
	Toast:makeText(context, ""..text, 0):show()
end
