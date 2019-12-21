; ModuleID = ""
target triple = "x86_64-pc-linux-gnu"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"

define i32 @"main"() 
{
main.entry:
  %"s" = alloca [1024 x i8]
  %"len" = alloca i32
  %"i" = alloca i32
  %"flag" = alloca i32
  store i32 0, i32* %"flag"
  %".3" = getelementptr inbounds [1024 x i8], [1024 x i8]* %"s", i32 0, i32 0
  %".4" = call i32 (...) @"gets"(i8* %".3")
  %".5" = getelementptr inbounds [1024 x i8], [1024 x i8]* %"s", i32 0, i32 0
  %".6" = call i32 @"strlen"(i8* %".5")
  store i32 %".6", i32* %"len"
  br label %".8"
.8:
  %".13" = load i32, i32* %"len"
  %".14" = icmp slt i32 %".13", 0
  %".15" = load i32, i32* %"len"
  %".16" = icmp sgt i32 %".15", 1024
  %".17" = or i1 %".14", %".16"
  br i1 %".17", label %".11", label %".12"
.9:
  ret i32 0
.11:
  %".19" = getelementptr inbounds [17 x i8], [17 x i8]* @".str0", i32 0, i32 0
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".19")
  br label %".9"
.12:
  store i32 0, i32* %"i"
  br label %".23"
.23:
  %".27" = load i32, i32* %"i"
  %".28" = load i32, i32* %"i"
  %".29" = add i32 %".27", %".28"
  %".30" = load i32, i32* %"len"
  %".31" = icmp slt i32 %".29", %".30"
  %".32" = load i32, i32* %"flag"
  %".33" = icmp eq i32 %".32", 0
  %".34" = and i1 %".31", %".33"
  br i1 %".34", label %".24", label %".25"
.24:
  br label %".36"
.25:
  br label %".61"
.36:
  %".41" = load i32, i32* %"i"
  %".42" = getelementptr inbounds [1024 x i8], [1024 x i8]* %"s", i32 0, i32 %".41"
  %".43" = load i8, i8* %".42"
  %".44" = load i32, i32* %"len"
  %".45" = sub i32 %".44", 1
  %".46" = load i32, i32* %"i"
  %".47" = sub i32 %".45", %".46"
  %".48" = getelementptr inbounds [1024 x i8], [1024 x i8]* %"s", i32 0, i32 %".47"
  %".49" = load i8, i8* %".48"
  %".50" = icmp ne i8 %".43", %".49"
  br i1 %".50", label %".39", label %".40"
.37:
  %".57" = load i32, i32* %"i"
  %".58" = add i32 %".57", 1
  store i32 %".58", i32* %"i"
  br label %".23"
.39:
  %".52" = getelementptr inbounds [7 x i8], [7 x i8]* @".str1", i32 0, i32 0
  %".53" = call i32 (i8*, ...) @"printf"(i8* %".52")
  store i32 1, i32* %"flag"
  br label %".37"
.40:
  br label %".37"
.61:
  %".66" = load i32, i32* %"flag"
  %".67" = icmp eq i32 %".66", 0
  br i1 %".67", label %".64", label %".65"
.62:
  br label %".9"
.64:
  %".69" = getelementptr inbounds [6 x i8], [6 x i8]* @".str2", i32 0, i32 0
  %".70" = call i32 (i8*, ...) @"printf"(i8* %".69")
  br label %".62"
.65:
  br label %".62"
}

declare i32 @"gets"(...) 

declare i32 @"strlen"(i8* %".1") 

declare i32 @"printf"(i8* %".1", ...) 

@".str0" = constant [17 x i8] c"Error detected!\0a\00"
@".str1" = constant [7 x i8] c"False\0a\00"
@".str2" = constant [6 x i8] c"True\0a\00"