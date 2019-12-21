; ModuleID = ""
target triple = "x86_64-pc-linux-gnu"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"

@"root" = internal global i32 undef
@"nodes" = internal global [10000 x {i32, i32, i32, i32, i32}] zeroinitializer
@"avai" = internal global i32 undef
define i32 @"max"(i32 %"a", i32 %"b") 
{
max.entry:
  %".4" = alloca i32
  store i32 %"a", i32* %".4"
  %".6" = alloca i32
  store i32 %"b", i32* %".6"
  br label %".8"
.8:
  %".13" = load i32, i32* %".4"
  %".14" = load i32, i32* %".6"
  %".15" = icmp sgt i32 %".13", %".14"
  br i1 %".15", label %".11", label %".12"
.9:
  %".20" = load i32, i32* %".6"
  ret i32 %".20"
.11:
  %".17" = load i32, i32* %".4"
  ret i32 %".17"
.12:
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
  %".10" = load i32, i32* %".3"
  %".11" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".10"
  %".12" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".11", i32 0, i32 1
  %".13" = load i32, i32* %".12"
  %".14" = icmp eq i32 %".13", 0
  br i1 %".14", label %".8", label %".9"
.6:
  %".24" = sub i32 0, 1
  store i32 %".24", i32* %"ret"
  %".26" = load i32, i32* %"ret"
  ret i32 %".26"
.8:
  %".16" = load i32, i32* %".3"
  %".17" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".16"
  %".18" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".17", i32 0, i32 2
  %".19" = load i32, i32* %".18"
  store i32 %".19", i32* %"ret"
  %".21" = load i32, i32* %"ret"
  ret i32 %".21"
.9:
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
  %".13" = load i32, i32* %".4"
  %".14" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".13"
  %".15" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".14", i32 0, i32 1
  %".16" = load i32, i32* %".15"
  %".17" = icmp ne i32 %".16", 0
  br i1 %".17", label %".11", label %".12"
.9:
  ret i32 0
.11:
  %"i" = alloca i32
  %".19" = load i32, i32* @"avai"
  store i32 %".19", i32* %"i"
  br label %".21"
.12:
  %".51" = load i32, i32* %".6"
  %".52" = load i32, i32* %".4"
  %".53" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".52"
  %".54" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".53", i32 0, i32 0
  %".55" = load i32, i32* %".54"
  %".56" = icmp slt i32 %".51", %".55"
  br i1 %".56", label %".49", label %".50"
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
.49:
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
.50:
  %".145" = load i32, i32* %".6"
  %".146" = load i32, i32* %".4"
  %".147" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".146"
  %".148" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".147", i32 0, i32 0
  %".149" = load i32, i32* %".148"
  %".150" = icmp sgt i32 %".145", %".149"
  br i1 %".150", label %".143", label %".144"
.104:
  %".109" = load i32, i32* %"p1"
  %".110" = call i32 @"getHeight"(i32 %".109")
  %".111" = load i32, i32* %"p2"
  %".112" = call i32 @"getHeight"(i32 %".111")
  %".113" = sub i32 %".110", %".112"
  %".114" = icmp eq i32 %".113", 2
  br i1 %".114", label %".107", label %".108"
.105:
  %".141" = load i32, i32* %".4"
  ret i32 %".141"
.107:
  br label %".116"
.108:
  br label %".105"
.116:
  %".121" = load i32, i32* %".6"
  %".122" = load i32, i32* %".4"
  %".123" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".122"
  %".124" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".123", i32 0, i32 3
  %".125" = load i32, i32* %".124"
  %".126" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".125"
  %".127" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".126", i32 0, i32 0
  %".128" = load i32, i32* %".127"
  %".129" = icmp slt i32 %".121", %".128"
  br i1 %".129", label %".119", label %".120"
.117:
  br label %".105"
.119:
  %".131" = load i32, i32* %".4"
  %".132" = call i32 @"leftLeftRotation"(i32 %".131")
  store i32 %".132", i32* %".4"
  br label %".117"
.120:
  %".135" = load i32, i32* %".4"
  %".136" = call i32 @"leftRightRotation"(i32 %".135")
  store i32 %".136", i32* %".4"
  br label %".117"
.143:
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
.144:
  br label %".9"
.198:
  %".203" = load i32, i32* %"p1"
  %".204" = call i32 @"getHeight"(i32 %".203")
  %".205" = load i32, i32* %"p2"
  %".206" = call i32 @"getHeight"(i32 %".205")
  %".207" = sub i32 %".204", %".206"
  %".208" = sub i32 0, 2
  %".209" = icmp eq i32 %".207", %".208"
  br i1 %".209", label %".201", label %".202"
.199:
  %".236" = load i32, i32* %".4"
  ret i32 %".236"
.201:
  br label %".211"
.202:
  br label %".199"
.211:
  %".216" = load i32, i32* %".6"
  %".217" = load i32, i32* %".4"
  %".218" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".217"
  %".219" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".218", i32 0, i32 4
  %".220" = load i32, i32* %".219"
  %".221" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".220"
  %".222" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".221", i32 0, i32 0
  %".223" = load i32, i32* %".222"
  %".224" = icmp sgt i32 %".216", %".223"
  br i1 %".224", label %".214", label %".215"
.212:
  br label %".199"
.214:
  %".226" = load i32, i32* %".4"
  %".227" = call i32 @"rightRightRotation"(i32 %".226")
  store i32 %".227", i32* %".4"
  br label %".212"
.215:
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
  %".13" = load i32, i32* %".4"
  %".14" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".13"
  %".15" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".14", i32 0, i32 1
  %".16" = load i32, i32* %".15"
  %".17" = icmp ne i32 %".16", 0
  br i1 %".17", label %".11", label %".12"
.9:
  br label %".21"
.11:
  ret i32 0
.12:
  br label %".9"
.21:
  %".26" = load i32, i32* %".6"
  %".27" = load i32, i32* %".4"
  %".28" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".27"
  %".29" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".28", i32 0, i32 0
  %".30" = load i32, i32* %".29"
  %".31" = icmp eq i32 %".26", %".30"
  br i1 %".31", label %".24", label %".25"
.22:
  ret i32 0
.24:
  %".33" = load i32, i32* %".4"
  ret i32 %".33"
.25:
  %".37" = load i32, i32* %".6"
  %".38" = load i32, i32* %".4"
  %".39" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".38"
  %".40" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".39", i32 0, i32 0
  %".41" = load i32, i32* %".40"
  %".42" = icmp slt i32 %".37", %".41"
  br i1 %".42", label %".35", label %".36"
.35:
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
.36:
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
  %".10" = load i32, i32* %".3"
  %".11" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".10"
  %".12" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".11", i32 0, i32 1
  %".13" = load i32, i32* %".12"
  %".14" = icmp ne i32 %".13", 0
  br i1 %".14", label %".8", label %".9"
.6:
  %".20" = getelementptr inbounds [18 x i8], [18 x i8]* @".str1", i32 0, i32 0
  %".21" = load i32, i32* %".3"
  %".22" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".21"
  %".23" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".22", i32 0, i32 0
  %".24" = load i32, i32* %".23"
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".20", i32 %".24")
  br label %".26"
.8:
  %".16" = getelementptr inbounds [6 x i8], [6 x i8]* @".str0", i32 0, i32 0
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".16")
  ret void
.9:
  br label %".6"
.26:
  %".31" = load i32, i32* %".3"
  %".32" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".31"
  %".33" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".32", i32 0, i32 3
  %".34" = load i32, i32* %".33"
  %".35" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".34"
  %".36" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".35", i32 0, i32 1
  %".37" = load i32, i32* %".36"
  %".38" = icmp ne i32 %".37", 0
  br i1 %".38", label %".29", label %".30"
.27:
  br label %".53"
.29:
  %".40" = getelementptr inbounds [22 x i8], [22 x i8]* @".str2", i32 0, i32 0
  %".41" = call i32 (i8*, ...) @"printf"(i8* %".40")
  br label %".27"
.30:
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
  %".58" = load i32, i32* %".3"
  %".59" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".58"
  %".60" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".59", i32 0, i32 4
  %".61" = load i32, i32* %".60"
  %".62" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".61"
  %".63" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".62", i32 0, i32 1
  %".64" = load i32, i32* %".63"
  %".65" = icmp ne i32 %".64", 0
  br i1 %".65", label %".56", label %".57"
.54:
  ret void
.56:
  %".67" = getelementptr inbounds [6 x i8], [6 x i8]* @".str4", i32 0, i32 0
  %".68" = call i32 (i8*, ...) @"printf"(i8* %".67")
  br label %".54"
.57:
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
  %".10" = load i32, i32* %".3"
  %".11" = getelementptr inbounds [10000 x {i32, i32, i32, i32, i32}], [10000 x {i32, i32, i32, i32, i32}]* @"nodes", i32 0, i32 %".10"
  %".12" = getelementptr inbounds {i32, i32, i32, i32, i32}, {i32, i32, i32, i32, i32}* %".11", i32 0, i32 1
  %".13" = load i32, i32* %".12"
  %".14" = icmp ne i32 %".13", 0
  br i1 %".14", label %".8", label %".9"
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
.8:
  ret void
.9:
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
  %".16" = load i32, i32* %"comm"
  %".17" = icmp eq i32 %".16", 0
  br i1 %".17", label %".14", label %".15"
.12:
  br label %".3"
.14:
  %".19" = load i32, i32* %"elem"
  call void @"addNode"(i32 %".19")
  %".21" = load i32, i32* @"root"
  call void @"printAVL"(i32 %".21")
  br label %".12"
.15:
  %".26" = load i32, i32* %"comm"
  %".27" = icmp eq i32 %".26", 1
  br i1 %".27", label %".24", label %".25"
.24:
  %".29" = load i32, i32* %"elem"
  call void @"removeNode"(i32 %".29")
  %".31" = load i32, i32* @"root"
  call void @"printAVL"(i32 %".31")
  br label %".12"
.25:
  %".36" = load i32, i32* %"comm"
  %".37" = icmp eq i32 %".36", 2
  br i1 %".37", label %".34", label %".35"
.34:
  %".39" = load i32, i32* %"elem"
  %".40" = call i32 @"searchNode"(i32 %".39")
  store i32 %".40", i32* %"p"
  %".42" = load i32, i32* %"p"
  call void @"printNode"(i32 %".42")
  br label %".12"
.35:
  br label %".12"
}

declare i32 @"scanf"(i8* %".1", ...) 

@".str6" = constant [5 x i8] c"%d%d\00"