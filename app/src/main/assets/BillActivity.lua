function onCreate(activity)
	activity:loadFile("Utils")
	activity:setTitle("表单提交测试")
	local rootView = Utils.createLinearLayout()
	activity:setContentView(rootView)
	rootView:setOrientation(1)

    local line1 = Utils.createLinearLayout()
    local lb1 = Utils.createTextView()
    lb1:setText("姓名：")
    line1:addView(lb1)
    et_name = Utils.createEditText()
    et_name:setSingleLine()
    local lengthFilter = luajava.newInstance("android.text.InputFilter$LengthFilter",10)
    local myList = luajava.newInstance("java.util.ArrayList")
    myList:add(lengthFilter)
    et_name:setFilters(myList:toArray(context:emptyArray("android.text.InputFilter")))
    line1:addView(et_name)
    local lp = et_name:getLayoutParams()
    context:setFloatValue(lp,"weight","1")
    et_name:setLayoutParams(lp)
    rootView:addView(line1)
    
    local line2 = Utils.createLinearLayout()
    local lb2 = Utils.createTextView()
    lb2:setText("电话：")
    line2:addView(lb2)
    et_tel = Utils.createEditText()
    et_tel:setSingleLine()
    line2:addView(et_tel)
    local lp = et_tel:getLayoutParams()
    context:setFloatValue(lp,"weight","1")
    et_tel:setLayoutParams(lp)
    local InputType = luajava.bindClass("android.text.InputType")
    et_tel:setInputType(InputType.TYPE_CLASS_PHONE)
    rootView:addView(line2)
    
end

--------------------------------------------------------------------
function onResume()

end

function onActivityResult()

end
