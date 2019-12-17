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
  %".11" = load i32, i32* %"len"
  %".12" = icmp slt i32 %".11", 0
  %".13" = load i32, i32* %"len"
  %".14" = icmp sgt i32 %".13", 1024
  %".15" = or i1 %".12", %".14"
  br i1 %".15", label %".16", label %".17"
.9:
  ret i32 0
.16:
  %".19" = getelementptr inbounds [17 x i8], [17 x i8]* @".str0", i32 0, i32 0
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".19")
  br label %".9"
.17:
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
  %".39" = load i32, i32* %"i"
  %".40" = getelementptr inbounds [1024 x i8], [1024 x i8]* %"s", i32 0, i32 %".39"
  %".41" = load i8, i8* %".40"
  %".42" = load i32, i32* %"len"
  %".43" = sub i32 %".42", 1
  %".44" = load i32, i32* %"i"
  %".45" = sub i32 %".43", %".44"
  %".46" = getelementptr inbounds [1024 x i8], [1024 x i8]* %"s", i32 0, i32 %".45"
  %".47" = load i8, i8* %".46"
  %".48" = icmp ne i8 %".41", %".47"
  br i1 %".48", label %".49", label %".50"
.37:
  %".57" = load i32, i32* %"i"
  %".58" = add i32 %".57", 1
  store i32 %".58", i32* %"i"
  br label %".23"
.49:
  %".52" = getelementptr inbounds [7 x i8], [7 x i8]* @".str1", i32 0, i32 0
  %".53" = call i32 (i8*, ...) @"printf"(i8* %".52")
  store i32 1, i32* %"flag"
  br label %".37"
.50:
  br label %".37"
.61:
  %".64" = load i32, i32* %"flag"
  %".65" = icmp eq i32 %".64", 0
  br i1 %".65", label %".66", label %".67"
.62:
  br label %".9"
.66:
  %".69" = getelementptr inbounds [6 x i8], [6 x i8]* @".str2", i32 0, i32 0
  %".70" = call i32 (i8*, ...) @"printf"(i8* %".69")
  br label %".62"
.67:
  br label %".62"
}

declare i32 @"gets"(...) 

declare i32 @"strlen"(i8* %".1") 

declare i32 @"printf"(i8* %".1", ...) 

@".str0" = constant [17 x i8] c"Error detected!\0a\00"
@".str1" = constant [7 x i8] c"False\0a\00"
@".str2" = constant [6 x i8] c"True\0a\00"