%演示nargchk的使用
%msgText = nargchk(minArgs,maxArgs,numArgs) 验证输入参数的数目，如果输入数目 numArgs 小于 minArgs 或大于 maxArgs，则返回消息。
%此语法等同于 msgText = nargchk(minArgs,maxArgs,numArgs,'string')。返回值是一个字符向量

%使用有效的输入数目调用 checkInputs 函数。nargchk 返回一个空字符向量。
checkInputs(13,7)

%调用具有太少输入的 checkInputs 函数。
%checkInputs(42)

%调用具有太多输入的 checkInputs 函数。
checkInputs(0,1,1,2,3)

