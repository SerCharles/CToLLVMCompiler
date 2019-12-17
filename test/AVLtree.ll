; ModuleID = ""
target triple = "x86_64-pc-linux-gnu"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"

@"root" = common global i32 undef
@"nodes" = common global [10000 x {i32, i32, i32, i32, i32}] zeroinitializer
@"avai" = common global i32 undef
define i32 @"max"(i32 %"a", i32 %"b") 
{
max.entry:
  %".4" = alloca i32
  store i32 %"a", i32* %".4"
  %".6" = alloca i32
  store i32 %"b", i32* %".6"
  br label %".8"
.8:
  %".11" = load i32, i32* %".4"
  %".12" = load i32, i32* %".6"
  %".13" = icmp sgt i32 %".11", %".12"
  br i1 %".13", label %".14", label %".15"
.9:
  %".20" = load i32, i32* %".6"
  ret i32 %".20"
.14:
  %".17" = load i32, i32* %".4"
  ret i32 %".17"
.15:
  br label %".9"
}

define void @"initTree"() 
{
initTree.entry:
  %"i" = alloca i32
  store i32 1, i32* @"avai"
  store i32 0, i32* @"root"
  store i32 0, i32* %"i"
  br label %".5"
.5:
  %".9" = load i32, i32* %"i"
  %".10" = icmp slt i32 %".9", 10000
  br i1 %".10", label %".6", label %".7"
.6:
  %".12" = load i32, i32* %"i"
  %".13" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".12"
  %".14" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".13", i32 0, i32 1
  store i32 1, i32* %".14"
  %".16" = load i32, i32* %"i"
  %".17" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".16"
  %".18" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".17", i32 0, i32 2
  store i32 0, i32* %".18"
  %".20" = load i32, i32* %"i"
  %".21" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".20"
  %".22" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".21", i32 0, i32 3
  store i32 0, i32* %".22"
  %".24" = load i32, i32* %"i"
  %".25" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".24"
  %".26" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".25", i32 0, i32 4
  store i32 0, i32* %".26"
  %".28" = load i32, i32* %"i"
  %".29" = add i32 %".28", 1
  store i32 %".29", i32* %"i"
  br label %".5"
.7:
  ret void
}

define i32 @"getHeight"(i32 %"node") 
{
getHeight.entry:
  %".3" = alloca i32
  store i32 %"node", i32* %".3"
  %"ret" = alloca i32
  br label %".5"
.5:
  %".8" = load i32, i32* %".3"
  %".9" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".8"
  %".10" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".9", i32 0, i32 1
  %".11" = load i32, i32* %".10"
  %".12" = icmp eq i32 %".11", 0
  br i1 %".12", label %".13", label %".14"
.6:
  %".24" = sub i32 0, 1
  store i32 %".24", i32* %"ret"
  %".26" = load i32, i32* %"ret"
  ret i32 %".26"
.13:
  %".16" = load i32, i32* %".3"
  %".17" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".16"
  %".18" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".17", i32 0, i32 2
  %".19" = load i32, i32* %".18"
  store i32 %".19", i32* %"ret"
  %".21" = load i32, i32* %"ret"
  ret i32 %".21"
.14:
  br label %".6"
}

define i32 @"leftLeftRotation"(i32 %"node") 
{
leftLeftRotation.entry:
  %".3" = alloca i32
  store i32 %"node", i32* %".3"
  %"temp" = alloca i32
  %".5" = load i32, i32* %".3"
  %".6" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".5"
  %".7" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".6", i32 0, i32 3
  %".8" = load i32, i32* %".7"
  store i32 %".8", i32* %"temp"
  %"p1" = alloca i32
  %"p2" = alloca i32
  %".10" = load i32, i32* %".3"
  %".11" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".10"
  %".12" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".11", i32 0, i32 3
  %".13" = load i32, i32* %".12"
  %".14" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".13"
  %".15" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".14", i32 0, i32 4
  %".16" = load i32, i32* %".15"
  %".17" = load i32, i32* %".3"
  %".18" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".17"
  %".19" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".18", i32 0, i32 3
  store i32 %".16", i32* %".19"
  %".21" = load i32, i32* %".3"
  %".22" = load i32, i32* %"temp"
  %".23" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".22"
  %".24" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".23", i32 0, i32 4
  store i32 %".21", i32* %".24"
  %"param" = alloca i32
  %".26" = load i32, i32* %".3"
  %".27" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".26"
  %".28" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".27", i32 0, i32 3
  %".29" = load i32, i32* %".28"
  store i32 %".29", i32* %"param"
  %".31" = load i32, i32* %"param"
  %".32" = call i32 @"getHeight"(i32 %".31")
  store i32 %".32", i32* %"p1"
  %".34" = load i32, i32* %".3"
  %".35" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".34"
  %".36" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".35", i32 0, i32 4
  %".37" = load i32, i32* %".36"
  store i32 %".37", i32* %"param"
  %".39" = load i32, i32* %"param"
  %".40" = call i32 @"getHeight"(i32 %".39")
  store i32 %".40", i32* %"p2"
  %".42" = load i32, i32* %"p1"
  %".43" = load i32, i32* %"p2"
  %".44" = call i32 @"max"(i32 %".42", i32 %".43")
  %".45" = add i32 %".44", 1
  %".46" = load i32, i32* %".3"
  %".47" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".46"
  %".48" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".47", i32 0, i32 2
  store i32 %".45", i32* %".48"
  %".50" = load i32, i32* %"temp"
  %".51" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".50"
  %".52" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".51", i32 0, i32 3
  %".53" = load i32, i32* %".52"
  store i32 %".53", i32* %"param"
  %".55" = load i32, i32* %"param"
  %".56" = call i32 @"getHeight"(i32 %".55")
  store i32 %".56", i32* %"p1"
  %".58" = load i32, i32* %"temp"
  %".59" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".58"
  %".60" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".59", i32 0, i32 4
  %".61" = load i32, i32* %".60"
  store i32 %".61", i32* %"param"
  %".63" = load i32, i32* %"param"
  %".64" = call i32 @"getHeight"(i32 %".63")
  store i32 %".64", i32* %"p2"
  %".66" = load i32, i32* %"p1"
  %".67" = load i32, i32* %"p2"
  %".68" = call i32 @"max"(i32 %".66", i32 %".67")
  %".69" = add i32 %".68", 1
  %".70" = load i32, i32* %"temp"
  %".71" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".70"
  %".72" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".71", i32 0, i32 2
  store i32 %".69", i32* %".72"
  %".74" = load i32, i32* %"temp"
  ret i32 %".74"
}

define i32 @"rightRightRotation"(i32 %"node") 
{
rightRightRotation.entry:
  %".3" = alloca i32
  store i32 %"node", i32* %".3"
  %"temp" = alloca i32
  %".5" = load i32, i32* %".3"
  %".6" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".5"
  %".7" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".6", i32 0, i32 4
  %".8" = load i32, i32* %".7"
  store i32 %".8", i32* %"temp"
  %"p1" = alloca i32
  %"p2" = alloca i32
  %".10" = load i32, i32* %".3"
  %".11" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".10"
  %".12" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".11", i32 0, i32 4
  %".13" = load i32, i32* %".12"
  %".14" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".13"
  %".15" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".14", i32 0, i32 3
  %".16" = load i32, i32* %".15"
  %".17" = load i32, i32* %".3"
  %".18" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".17"
  %".19" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".18", i32 0, i32 4
  store i32 %".16", i32* %".19"
  %".21" = load i32, i32* %".3"
  %".22" = load i32, i32* %"temp"
  %".23" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".22"
  %".24" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".23", i32 0, i32 3
  store i32 %".21", i32* %".24"
  %"param" = alloca i32
  %".26" = load i32, i32* %".3"
  %".27" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".26"
  %".28" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".27", i32 0, i32 3
  %".29" = load i32, i32* %".28"
  store i32 %".29", i32* %"param"
  %".31" = load i32, i32* %"param"
  %".32" = call i32 @"getHeight"(i32 %".31")
  store i32 %".32", i32* %"p1"
  %".34" = load i32, i32* %".3"
  %".35" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".34"
  %".36" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".35", i32 0, i32 4
  %".37" = load i32, i32* %".36"
  store i32 %".37", i32* %"param"
  %".39" = load i32, i32* %"param"
  %".40" = call i32 @"getHeight"(i32 %".39")
  store i32 %".40", i32* %"p2"
  %".42" = load i32, i32* %"p1"
  %".43" = load i32, i32* %"p2"
  %".44" = call i32 @"max"(i32 %".42", i32 %".43")
  %".45" = add i32 %".44", 1
  %".46" = load i32, i32* %".3"
  %".47" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".46"
  %".48" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".47", i32 0, i32 2
  store i32 %".45", i32* %".48"
  %".50" = load i32, i32* %"temp"
  %".51" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".50"
  %".52" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".51", i32 0, i32 3
  %".53" = load i32, i32* %".52"
  store i32 %".53", i32* %"param"
  %".55" = load i32, i32* %"param"
  %".56" = call i32 @"getHeight"(i32 %".55")
  store i32 %".56", i32* %"p1"
  %".58" = load i32, i32* %"temp"
  %".59" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".58"
  %".60" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".59", i32 0, i32 4
  %".61" = load i32, i32* %".60"
  store i32 %".61", i32* %"param"
  %".63" = load i32, i32* %"param"
  %".64" = call i32 @"getHeight"(i32 %".63")
  store i32 %".64", i32* %"p2"
  %".66" = load i32, i32* %"p1"
  %".67" = load i32, i32* %"p2"
  %".68" = call i32 @"max"(i32 %".66", i32 %".67")
  %".69" = add i32 %".68", 1
  %".70" = load i32, i32* %"temp"
  %".71" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".70"
  %".72" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".71", i32 0, i32 2
  store i32 %".69", i32* %".72"
  %".74" = load i32, i32* %"temp"
  ret i32 %".74"
}

define i32 @"leftRightRotation"(i32 %"node") 
{
leftRightRotation.entry:
  %".3" = alloca i32
  store i32 %"node", i32* %".3"
  %"ret" = alloca i32
  %"param" = alloca i32
  %".5" = load i32, i32* %".3"
  %".6" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".5"
  %".7" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".6", i32 0, i32 3
  %".8" = load i32, i32* %".7"
  store i32 %".8", i32* %"param"
  %".10" = load i32, i32* %"param"
  %".11" = call i32 @"rightRightRotation"(i32 %".10")
  %".12" = load i32, i32* %".3"
  %".13" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".12"
  %".14" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".13", i32 0, i32 3
  store i32 %".11", i32* %".14"
  %".16" = load i32, i32* %".3"
  %".17" = call i32 @"leftLeftRotation"(i32 %".16")
  store i32 %".17", i32* %"ret"
  %".19" = load i32, i32* %"ret"
  ret i32 %".19"
}

define i32 @"rightLeftRotation"(i32 %"node") 
{
rightLeftRotation.entry:
  %".3" = alloca i32
  store i32 %"node", i32* %".3"
  %"ret" = alloca i32
  %"param" = alloca i32
  %".5" = load i32, i32* %".3"
  %".6" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".5"
  %".7" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".6", i32 0, i32 4
  %".8" = load i32, i32* %".7"
  store i32 %".8", i32* %"param"
  %".10" = load i32, i32* %"param"
  %".11" = call i32 @"leftLeftRotation"(i32 %".10")
  %".12" = load i32, i32* %".3"
  %".13" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".12"
  %".14" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".13", i32 0, i32 4
  store i32 %".11", i32* %".14"
  %".16" = load i32, i32* %".3"
  %".17" = call i32 @"rightRightRotation"(i32 %".16")
  store i32 %".17", i32* %"ret"
  %".19" = load i32, i32* %"ret"
  ret i32 %".19"
}

define i32 @"insert"(i32 %"node", i32 %"elem") 
{
insert.entry:
  %".4" = alloca i32
  store i32 %"node", i32* %".4"
  %".6" = alloca i32
  store i32 %"elem", i32* %".6"
  %"param" = alloca i32
  %"p1" = alloca i32
  %"p2" = alloca i32
  br label %".8"
.8:
  %".11" = load i32, i32* %".4"
  %".12" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".11"
  %".13" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".12", i32 0, i32 1
  %".14" = load i32, i32* %".13"
  %".15" = icmp ne i32 %".14", 0
  br i1 %".15", label %".16", label %".17"
.9:
  ret i32 0
.16:
  %"i" = alloca i32
  %".19" = load i32, i32* @"avai"
  store i32 %".19", i32* %"i"
  br label %".21"
.17:
  %".49" = load i32, i32* %".6"
  %".50" = load i32, i32* %".4"
  %".51" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".50"
  %".52" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".51", i32 0, i32 0
  %".53" = load i32, i32* %".52"
  %".54" = icmp slt i32 %".49", %".53"
  br i1 %".54", label %".55", label %".56"
.21:
  %".25" = load i32, i32* %"i"
  %".26" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".25"
  %".27" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".26", i32 0, i32 1
  %".28" = load i32, i32* %".27"
  %".29" = icmp eq i32 %".28", 0
  br i1 %".29", label %".22", label %".23"
.22:
  %".31" = load i32, i32* %"i"
  %".32" = add i32 %".31", 1
  store i32 %".32", i32* %"i"
  br label %".21"
.23:
  %".35" = load i32, i32* %"i"
  %".36" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".35"
  %".37" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".36", i32 0, i32 1
  store i32 0, i32* %".37"
  %".39" = load i32, i32* %".6"
  %".40" = load i32, i32* %"i"
  %".41" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".40"
  %".42" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".41", i32 0, i32 0
  store i32 %".39", i32* %".42"
  %".44" = load i32, i32* %"i"
  %".45" = add i32 %".44", 1
  store i32 %".45", i32* @"avai"
  %".47" = load i32, i32* %"i"
  ret i32 %".47"
.55:
  %".58" = load i32, i32* %".4"
  %".59" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".58"
  %".60" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".59", i32 0, i32 3
  %".61" = load i32, i32* %".60"
  store i32 %".61", i32* %"param"
  %".63" = load i32, i32* %"param"
  %".64" = load i32, i32* %".6"
  %".65" = call i32 @"insert"(i32 %".63", i32 %".64")
  %".66" = load i32, i32* %".4"
  %".67" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".66"
  %".68" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".67", i32 0, i32 3
  store i32 %".65", i32* %".68"
  %".70" = load i32, i32* %".4"
  %".71" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".70"
  %".72" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".71", i32 0, i32 3
  %".73" = load i32, i32* %".72"
  %".74" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".73"
  %".75" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".74", i32 0, i32 2
  %".76" = load i32, i32* %".75"
  store i32 %".76", i32* %"p1"
  %".78" = load i32, i32* %".4"
  %".79" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".78"
  %".80" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".79", i32 0, i32 4
  %".81" = load i32, i32* %".80"
  %".82" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".81"
  %".83" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".82", i32 0, i32 2
  %".84" = load i32, i32* %".83"
  store i32 %".84", i32* %"p2"
  %".86" = load i32, i32* %"p1"
  %".87" = load i32, i32* %"p2"
  %".88" = call i32 @"max"(i32 %".86", i32 %".87")
  %".89" = add i32 %".88", 1
  %".90" = load i32, i32* %".4"
  %".91" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".90"
  %".92" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".91", i32 0, i32 2
  store i32 %".89", i32* %".92"
  %".94" = load i32, i32* %".4"
  %".95" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".94"
  %".96" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".95", i32 0, i32 3
  %".97" = load i32, i32* %".96"
  store i32 %".97", i32* %"p1"
  %".99" = load i32, i32* %".4"
  %".100" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".99"
  %".101" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".100", i32 0, i32 4
  %".102" = load i32, i32* %".101"
  store i32 %".102", i32* %"p2"
  br label %".104"
.56:
  %".143" = load i32, i32* %".6"
  %".144" = load i32, i32* %".4"
  %".145" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".144"
  %".146" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".145", i32 0, i32 0
  %".147" = load i32, i32* %".146"
  %".148" = icmp sgt i32 %".143", %".147"
  br i1 %".148", label %".149", label %".150"
.104:
  %".107" = load i32, i32* %"p1"
  %".108" = call i32 @"getHeight"(i32 %".107")
  %".109" = load i32, i32* %"p2"
  %".110" = call i32 @"getHeight"(i32 %".109")
  %".111" = sub i32 %".108", %".110"
  %".112" = icmp eq i32 %".111", 2
  br i1 %".112", label %".113", label %".114"
.105:
  %".141" = load i32, i32* %".4"
  ret i32 %".141"
.113:
  br label %".116"
.114:
  br label %".105"
.116:
  %".119" = load i32, i32* %".6"
  %".120" = load i32, i32* %".4"
  %".121" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".120"
  %".122" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".121", i32 0, i32 3
  %".123" = load i32, i32* %".122"
  %".124" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".123"
  %".125" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".124", i32 0, i32 0
  %".126" = load i32, i32* %".125"
  %".127" = icmp slt i32 %".119", %".126"
  br i1 %".127", label %".128", label %".129"
.117:
  br label %".105"
.128:
  %".131" = load i32, i32* %".4"
  %".132" = call i32 @"leftLeftRotation"(i32 %".131")
  store i32 %".132", i32* %".4"
  br label %".117"
.129:
  %".135" = load i32, i32* %".4"
  %".136" = call i32 @"leftRightRotation"(i32 %".135")
  store i32 %".136", i32* %".4"
  br label %".117"
.149:
  %".152" = load i32, i32* %".4"
  %".153" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".152"
  %".154" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".153", i32 0, i32 4
  %".155" = load i32, i32* %".154"
  store i32 %".155", i32* %"param"
  %".157" = load i32, i32* %"param"
  %".158" = load i32, i32* %".6"
  %".159" = call i32 @"insert"(i32 %".157", i32 %".158")
  %".160" = load i32, i32* %".4"
  %".161" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".160"
  %".162" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".161", i32 0, i32 4
  store i32 %".159", i32* %".162"
  %".164" = load i32, i32* %".4"
  %".165" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".164"
  %".166" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".165", i32 0, i32 3
  %".167" = load i32, i32* %".166"
  %".168" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".167"
  %".169" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".168", i32 0, i32 2
  %".170" = load i32, i32* %".169"
  store i32 %".170", i32* %"p1"
  %".172" = load i32, i32* %".4"
  %".173" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".172"
  %".174" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".173", i32 0, i32 4
  %".175" = load i32, i32* %".174"
  %".176" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".175"
  %".177" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".176", i32 0, i32 2
  %".178" = load i32, i32* %".177"
  store i32 %".178", i32* %"p2"
  %".180" = load i32, i32* %"p1"
  %".181" = load i32, i32* %"p2"
  %".182" = call i32 @"max"(i32 %".180", i32 %".181")
  %".183" = add i32 %".182", 1
  %".184" = load i32, i32* %".4"
  %".185" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".184"
  %".186" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".185", i32 0, i32 2
  store i32 %".183", i32* %".186"
  %".188" = load i32, i32* %".4"
  %".189" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".188"
  %".190" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".189", i32 0, i32 3
  %".191" = load i32, i32* %".190"
  store i32 %".191", i32* %"p1"
  %".193" = load i32, i32* %".4"
  %".194" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".193"
  %".195" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".194", i32 0, i32 4
  %".196" = load i32, i32* %".195"
  store i32 %".196", i32* %"p2"
  br label %".198"
.150:
  br label %".9"
.198:
  %".201" = load i32, i32* %"p1"
  %".202" = call i32 @"getHeight"(i32 %".201")
  %".203" = load i32, i32* %"p2"
  %".204" = call i32 @"getHeight"(i32 %".203")
  %".205" = sub i32 %".202", %".204"
  %".206" = sub i32 0, 2
  %".207" = icmp eq i32 %".205", %".206"
  br i1 %".207", label %".208", label %".209"
.199:
  %".236" = load i32, i32* %".4"
  ret i32 %".236"
.208:
  br label %".211"
.209:
  br label %".199"
.211:
  %".214" = load i32, i32* %".6"
  %".215" = load i32, i32* %".4"
  %".216" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".215"
  %".217" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".216", i32 0, i32 4
  %".218" = load i32, i32* %".217"
  %".219" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".218"
  %".220" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".219", i32 0, i32 0
  %".221" = load i32, i32* %".220"
  %".222" = icmp sgt i32 %".214", %".221"
  br i1 %".222", label %".223", label %".224"
.212:
  br label %".199"
.223:
  %".226" = load i32, i32* %".4"
  %".227" = call i32 @"rightRightRotation"(i32 %".226")
  store i32 %".227", i32* %".4"
  br label %".212"
.224:
  %".230" = load i32, i32* %".4"
  %".231" = call i32 @"rightLeftRotation"(i32 %".230")
  store i32 %".231", i32* %".4"
  br label %".212"
}

define void @"addNode"(i32 %"elem") 
{
addNode.entry:
  %".3" = alloca i32
  store i32 %"elem", i32* %".3"
  %".5" = load i32, i32* @"root"
  %".6" = load i32, i32* %".3"
  %".7" = call i32 @"insert"(i32 %".5", i32 %".6")
  store i32 %".7", i32* @"root"
  ret void
}

define i32 @"search"(i32 %"node", i32 %"elem") 
{
search.entry:
  %".4" = alloca i32
  store i32 %"node", i32* %".4"
  %".6" = alloca i32
  store i32 %"elem", i32* %".6"
  %"ret" = alloca i32
  %"p" = alloca i32
  br label %".8"
.8:
  %".11" = load i32, i32* %".4"
  %".12" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".11"
  %".13" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".12", i32 0, i32 1
  %".14" = load i32, i32* %".13"
  %".15" = icmp ne i32 %".14", 0
  br i1 %".15", label %".16", label %".17"
.9:
  br label %".21"
.16:
  ret i32 0
.17:
  br label %".9"
.21:
  %".24" = load i32, i32* %".6"
  %".25" = load i32, i32* %".4"
  %".26" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".25"
  %".27" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".26", i32 0, i32 0
  %".28" = load i32, i32* %".27"
  %".29" = icmp eq i32 %".24", %".28"
  br i1 %".29", label %".30", label %".31"
.22:
  ret i32 0
.30:
  %".33" = load i32, i32* %".4"
  ret i32 %".33"
.31:
  %".35" = load i32, i32* %".6"
  %".36" = load i32, i32* %".4"
  %".37" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".36"
  %".38" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".37", i32 0, i32 0
  %".39" = load i32, i32* %".38"
  %".40" = icmp slt i32 %".35", %".39"
  br i1 %".40", label %".41", label %".42"
.41:
  %".44" = load i32, i32* %".4"
  %".45" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".44"
  %".46" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".45", i32 0, i32 3
  %".47" = load i32, i32* %".46"
  store i32 %".47", i32* %"p"
  %".49" = load i32, i32* %"p"
  %".50" = load i32, i32* %".6"
  %".51" = call i32 @"search"(i32 %".49", i32 %".50")
  store i32 %".51", i32* %"ret"
  %".53" = load i32, i32* %"ret"
  ret i32 %".53"
.42:
  %".55" = load i32, i32* %".4"
  %".56" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".55"
  %".57" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".56", i32 0, i32 4
  %".58" = load i32, i32* %".57"
  store i32 %".58", i32* %"p"
  %".60" = load i32, i32* %"p"
  %".61" = load i32, i32* %".6"
  %".62" = call i32 @"search"(i32 %".60", i32 %".61")
  store i32 %".62", i32* %"ret"
  %".64" = load i32, i32* %"ret"
  ret i32 %".64"
}

define i32 @"searchNode"(i32 %"elem") 
{
searchNode.entry:
  %".3" = alloca i32
  store i32 %"elem", i32* %".3"
  %"ret" = alloca i32
  %".5" = load i32, i32* @"root"
  %".6" = load i32, i32* %".3"
  %".7" = call i32 @"search"(i32 %".5", i32 %".6")
  store i32 %".7", i32* %"ret"
  %".9" = load i32, i32* %"ret"
  ret i32 %".9"
}

define void @"removeNode"(i32 %"elem") 
{
removeNode.entry:
  %".3" = alloca i32
  store i32 %"elem", i32* %".3"
  ret void
}

define void @"printNode"(i32 %"node") 
{
printNode.entry:
  %".3" = alloca i32
  store i32 %"node", i32* %".3"
  br label %".5"
.5:
  %".8" = load i32, i32* %".3"
  %".9" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".8"
  %".10" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".9", i32 0, i32 1
  %".11" = load i32, i32* %".10"
  %".12" = icmp ne i32 %".11", 0
  br i1 %".12", label %".13", label %".14"
.6:
  %".20" = getelementptr inbounds [18 x i8], [18 x i8]* @".str1", i32 0, i32 0
  %".21" = load i32, i32* %".3"
  %".22" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".21"
  %".23" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".22", i32 0, i32 0
  %".24" = load i32, i32* %".23"
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".20", i32 %".24")
  br label %".26"
.13:
  %".16" = getelementptr inbounds [6 x i8], [6 x i8]* @".str0", i32 0, i32 0
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".16")
  ret void
.14:
  br label %".6"
.26:
  %".29" = load i32, i32* %".3"
  %".30" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".29"
  %".31" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".30", i32 0, i32 3
  %".32" = load i32, i32* %".31"
  %".33" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".32"
  %".34" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".33", i32 0, i32 1
  %".35" = load i32, i32* %".34"
  %".36" = icmp ne i32 %".35", 0
  br i1 %".36", label %".37", label %".38"
.27:
  br label %".53"
.37:
  %".40" = getelementptr inbounds [22 x i8], [22 x i8]* @".str2", i32 0, i32 0
  %".41" = call i32 (i8*, ...) @"printf"(i8* %".40")
  br label %".27"
.38:
  %".43" = getelementptr inbounds [20 x i8], [20 x i8]* @".str3", i32 0, i32 0
  %".44" = load i32, i32* %".3"
  %".45" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".44"
  %".46" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".45", i32 0, i32 3
  %".47" = load i32, i32* %".46"
  %".48" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".47"
  %".49" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".48", i32 0, i32 0
  %".50" = load i32, i32* %".49"
  %".51" = call i32 (i8*, ...) @"printf"(i8* %".43", i32 %".50")
  br label %".27"
.53:
  %".56" = load i32, i32* %".3"
  %".57" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".56"
  %".58" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".57", i32 0, i32 4
  %".59" = load i32, i32* %".58"
  %".60" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".59"
  %".61" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".60", i32 0, i32 1
  %".62" = load i32, i32* %".61"
  %".63" = icmp ne i32 %".62", 0
  br i1 %".63", label %".64", label %".65"
.54:
  ret void
.64:
  %".67" = getelementptr inbounds [6 x i8], [6 x i8]* @".str4", i32 0, i32 0
  %".68" = call i32 (i8*, ...) @"printf"(i8* %".67")
  br label %".54"
.65:
  %".70" = getelementptr inbounds [4 x i8], [4 x i8]* @".str5", i32 0, i32 0
  %".71" = load i32, i32* %".3"
  %".72" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".71"
  %".73" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".72", i32 0, i32 4
  %".74" = load i32, i32* %".73"
  %".75" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".74"
  %".76" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".75", i32 0, i32 0
  %".77" = load i32, i32* %".76"
  %".78" = call i32 (i8*, ...) @"printf"(i8* %".70", i32 %".77")
  br label %".54"
}

declare i32 @"printf"(i8* %".1", ...) 

@".str0" = constant [6 x i8] c"NULL\0a\00"
@".str1" = constant [18 x i8] c"%d left child is \00"
@".str2" = constant [22 x i8] c"NULL, right child is \00"
@".str3" = constant [20 x i8] c"%d, right child is \00"
@".str4" = constant [6 x i8] c"NULL\0a\00"
@".str5" = constant [4 x i8] c"%d\0a\00"
define void @"printAVL"(i32 %"node") 
{
printAVL.entry:
  %".3" = alloca i32
  store i32 %"node", i32* %".3"
  br label %".5"
.5:
  %".8" = load i32, i32* %".3"
  %".9" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".8"
  %".10" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".9", i32 0, i32 1
  %".11" = load i32, i32* %".10"
  %".12" = icmp ne i32 %".11", 0
  br i1 %".12", label %".13", label %".14"
.6:
  %".18" = load i32, i32* %".3"
  call void @"printNode"(i32 %".18")
  %"p" = alloca i32
  %".20" = load i32, i32* %".3"
  %".21" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".20"
  %".22" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".21", i32 0, i32 3
  %".23" = load i32, i32* %".22"
  store i32 %".23", i32* %"p"
  %".25" = load i32, i32* %"p"
  call void @"printAVL"(i32 %".25")
  %".27" = load i32, i32* %".3"
  %".28" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".27"
  %".29" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".28", i32 0, i32 4
  %".30" = load i32, i32* %".29"
  store i32 %".30", i32* %"p"
  %".32" = load i32, i32* %"p"
  call void @"printAVL"(i32 %".32")
  ret void
.13:
  ret void
.14:
  br label %".6"
}

define i32 @"main"() 
{
main.entry:
  %"n" = alloca i32
  %"i" = alloca i32
  %"elem" = alloca i32
  %"comm" = alloca i32
  %"p" = alloca i32
  call void @"initTree"()
  br label %".3"
.3:
  %".7" = icmp ne i32 1, 0
  br i1 %".7", label %".4", label %".5"
.4:
  %".9" = getelementptr inbounds [5 x i8], [5 x i8]* @".str6", i32 0, i32 0
  %".10" = call i32 (i8*, ...) @"scanf"(i8* %".9", i32* %"comm", i32* %"elem")
  br label %".11"
.5:
  ret i32 0
.11:
  %".14" = load i32, i32* %"comm"
  %".15" = icmp eq i32 %".14", 0
  br i1 %".15", label %".16", label %".17"
.12:
  br label %".3"
.16:
  %".19" = load i32, i32* %"elem"
  call void @"addNode"(i32 %".19")
  %".21" = load i32, i32* @"root"
  call void @"printAVL"(i32 %".21")
  br label %".12"
.17:
  %".24" = load i32, i32* %"comm"
  %".25" = icmp eq i32 %".24", 1
  br i1 %".25", label %".26", label %".27"
.26:
  %".29" = load i32, i32* %"elem"
  call void @"removeNode"(i32 %".29")
  %".31" = load i32, i32* @"root"
  call void @"printAVL"(i32 %".31")
  br label %".12"
.27:
  %".34" = load i32, i32* %"comm"
  %".35" = icmp eq i32 %".34", 2
  br i1 %".35", label %".36", label %".37"
.36:
  %".39" = load i32, i32* %"elem"
  %".40" = call i32 @"searchNode"(i32 %".39")
  store i32 %".40", i32* %"p"
  %".42" = load i32, i32* %"p"
  call void @"printNode"(i32 %".42")
  br label %".12"
.37:
  br label %".12"
}

declare i32 @"scanf"(i8* %".1", ...) 

@".str6" = constant [5 x i8] c"%d%d\00"