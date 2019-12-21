; ModuleID = ""
target triple = "x86_64-pc-linux-gnu"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"

@"a" = common global i32 i32 1
@"b" = common global i8 i8 49
define i32 @"main"() 
{
main.entry:
  %"c" = alloca i32
  store i32 2, i32* %"c"
  %"S" = alloca [1024 x i8]
  %"T" = alloca [1024 x i8]
  %"nxt" = alloca [1024 x i32]
  %"lenS" = alloca i32
  %"lenT" = alloca i32
  %"i" = alloca i32
  %"j" = alloca i32
  %"flag" = alloca i32
  store i32 0, i32* %"flag"
  %".4" = getelementptr inbounds [1024 x i8], [1024 x i8]* %"S", i32 0, i32 0
  %".5" = call i32 (...) @"gets"(i8* %".4")
  %".6" = getelementptr inbounds [1024 x i8], [1024 x i8]* %"T", i32 0, i32 0
  %".7" = call i32 (...) @"gets"(i8* %".6")
  %".8" = getelementptr inbounds [1024 x i8], [1024 x i8]* %"S", i32 0, i32 0
  %".9" = call i32 @"strlen"(i8* %".8")
  store i32 %".9", i32* %"lenS"
  %".11" = getelementptr inbounds [1024 x i8], [1024 x i8]* %"T", i32 0, i32 0
  %".12" = call i32 @"strlen"(i8* %".11")
  store i32 %".12", i32* %"lenT"
  %".14" = sub i32 0, 1
  %".15" = getelementptr inbounds [1024 x i32], [1024 x i32]* %"nxt", i32 0, i32 0
  store i32 %".14", i32* %".15"
  store i32 1, i32* %"i"
  %".18" = sub i32 0, 1
  store i32 %".18", i32* %"j"
  br label %".20"
.20:
  %".24" = load i32, i32* %"i"
  %".25" = load i32, i32* %"lenT"
  %".26" = icmp slt i32 %".24", %".25"
  br i1 %".26", label %".21", label %".22"
.21:
  br label %".28"
.22:
  store i32 0, i32* %"i"
  %".77" = sub i32 0, 1
  store i32 %".77", i32* %"j"
  br label %".79"
.28:
  %".32" = load i32, i32* %"j"
  %".33" = icmp sge i32 %".32", 0
  %".34" = load i32, i32* %"i"
  %".35" = getelementptr inbounds [1024 x i8], [1024 x i8]* %"T", i32 0, i32 %".34"
  %".36" = load i8, i8* %".35"
  %".37" = load i32, i32* %"j"
  %".38" = add i32 %".37", 1
  %".39" = getelementptr inbounds [1024 x i8], [1024 x i8]* %"T", i32 0, i32 %".38"
  %".40" = load i8, i8* %".39"
  %".41" = icmp ne i8 %".36", %".40"
  %".42" = and i1 %".33", %".41"
  br i1 %".42", label %".29", label %".30"
.29:
  %".44" = load i32, i32* %"j"
  %".45" = getelementptr inbounds [1024 x i32], [1024 x i32]* %"nxt", i32 0, i32 %".44"
  %".46" = load i32, i32* %".45"
  store i32 %".46", i32* %"j"
  br label %".28"
.30:
  br label %".49"
.49:
  %".54" = load i32, i32* %"i"
  %".55" = getelementptr inbounds [1024 x i8], [1024 x i8]* %"T", i32 0, i32 %".54"
  %".56" = load i8, i8* %".55"
  %".57" = load i32, i32* %"j"
  %".58" = add i32 %".57", 1
  %".59" = getelementptr inbounds [1024 x i8], [1024 x i8]* %"T", i32 0, i32 %".58"
  %".60" = load i8, i8* %".59"
  %".61" = icmp eq i8 %".56", %".60"
  br i1 %".61", label %".52", label %".53"
.50:
  %".68" = load i32, i32* %"j"
  %".69" = load i32, i32* %"i"
  %".70" = getelementptr inbounds [1024 x i32], [1024 x i32]* %"nxt", i32 0, i32 %".69"
  store i32 %".68", i32* %".70"
  %".72" = load i32, i32* %"i"
  %".73" = add i32 %".72", 1
  store i32 %".73", i32* %"i"
  br label %".20"
.52:
  %".63" = load i32, i32* %"j"
  %".64" = add i32 %".63", 1
  store i32 %".64", i32* %"j"
  br label %".50"
.53:
  br label %".50"
.79:
  %".83" = load i32, i32* %"i"
  %".84" = load i32, i32* %"lenS"
  %".85" = icmp slt i32 %".83", %".84"
  br i1 %".85", label %".80", label %".81"
.80:
  br label %".87"
.81:
  br label %".153"
.87:
  %".91" = load i32, i32* %"j"
  %".92" = icmp sge i32 %".91", 0
  %".93" = load i32, i32* %"i"
  %".94" = getelementptr inbounds [1024 x i8], [1024 x i8]* %"S", i32 0, i32 %".93"
  %".95" = load i8, i8* %".94"
  %".96" = load i32, i32* %"j"
  %".97" = add i32 %".96", 1
  %".98" = getelementptr inbounds [1024 x i8], [1024 x i8]* %"T", i32 0, i32 %".97"
  %".99" = load i8, i8* %".98"
  %".100" = icmp ne i8 %".95", %".99"
  %".101" = and i1 %".92", %".100"
  br i1 %".101", label %".88", label %".89"
.88:
  %".103" = load i32, i32* %"j"
  %".104" = getelementptr inbounds [1024 x i32], [1024 x i32]* %"nxt", i32 0, i32 %".103"
  %".105" = load i32, i32* %".104"
  store i32 %".105", i32* %"j"
  br label %".87"
.89:
  br label %".108"
.108:
  %".113" = load i32, i32* %"i"
  %".114" = getelementptr inbounds [1024 x i8], [1024 x i8]* %"S", i32 0, i32 %".113"
  %".115" = load i8, i8* %".114"
  %".116" = load i32, i32* %"j"
  %".117" = add i32 %".116", 1
  %".118" = getelementptr inbounds [1024 x i8], [1024 x i8]* %"T", i32 0, i32 %".117"
  %".119" = load i8, i8* %".118"
  %".120" = icmp eq i8 %".115", %".119"
  br i1 %".120", label %".111", label %".112"
.109:
  br label %".127"
.111:
  %".122" = load i32, i32* %"j"
  %".123" = add i32 %".122", 1
  store i32 %".123", i32* %"j"
  br label %".109"
.112:
  br label %".109"
.127:
  %".132" = load i32, i32* %"j"
  %".133" = load i32, i32* %"lenT"
  %".134" = sub i32 %".133", 1
  %".135" = icmp eq i32 %".132", %".134"
  br i1 %".135", label %".130", label %".131"
.128:
  %".149" = load i32, i32* %"i"
  %".150" = add i32 %".149", 1
  store i32 %".150", i32* %"i"
  br label %".79"
.130:
  %".137" = getelementptr inbounds [4 x i8], [4 x i8]* @".str0", i32 0, i32 0
  %".138" = load i32, i32* %"i"
  %".139" = load i32, i32* %"j"
  %".140" = sub i32 %".138", %".139"
  %".141" = call i32 (i8*, ...) @"printf"(i8* %".137", i32 %".140")
  store i32 1, i32* %"flag"
  %".143" = load i32, i32* %"j"
  %".144" = getelementptr inbounds [1024 x i32], [1024 x i32]* %"nxt", i32 0, i32 %".143"
  %".145" = load i32, i32* %".144"
  store i32 %".145", i32* %"j"
  br label %".128"
.131:
  br label %".128"
.153:
  %".158" = load i32, i32* %"flag"
  %".159" = icmp eq i32 %".158", 0
  br i1 %".159", label %".156", label %".157"
.154:
  ret i32 0
.156:
  %".161" = getelementptr inbounds [7 x i8], [7 x i8]* @".str1", i32 0, i32 0
  %".162" = call i32 (i8*, ...) @"printf"(i8* %".161")
  br label %".154"
.157:
  br label %".154"
}

declare i32 @"gets"(...) 

declare i32 @"strlen"(i8* %".1") 

declare i32 @"printf"(i8* %".1", ...) 

@".str0" = constant [4 x i8] c"%d\0a\00"
@".str1" = constant [7 x i8] c"False\0a\00"
define i32 @"main2"() 
{
main2.entry:
  %"s" = alloca [1024 x i8]
  %"len" = alloca i32
  %"i" = alloca i32
  %".2" = getelementptr inbounds [1024 x i8], [1024 x i8]* %"s", i32 0, i32 0
  %".3" = call i32 (...) @"gets"(i8* %".2")
  %".4" = getelementptr inbounds [1024 x i8], [1024 x i8]* %"s", i32 0, i32 0
  %".5" = call i32 @"strlen"(i8* %".4")
  store i32 %".5", i32* %"len"
  br label %".7"
.7:
  %".12" = load i32, i32* %"len"
  %".13" = icmp slt i32 %".12", 0
  %".14" = load i32, i32* %"len"
  %".15" = icmp sgt i32 %".14", 1024
  %".16" = or i1 %".13", %".15"
  br i1 %".16", label %".10", label %".11"
.8:
  ret i32 0
.10:
  %".18" = getelementptr inbounds [17 x i8], [17 x i8]* @".str2", i32 0, i32 0
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".18")
  br label %".8"
.11:
  store i32 0, i32* %"i"
  br label %".22"
.22:
  %".26" = load i32, i32* %"i"
  %".27" = load i32, i32* %"i"
  %".28" = add i32 %".26", %".27"
  %".29" = load i32, i32* %"len"
  %".30" = icmp slt i32 %".28", %".29"
  br i1 %".30", label %".23", label %".24"
.23:
  br label %".32"
.24:
  %".56" = getelementptr inbounds [6 x i8], [6 x i8]* @".str4", i32 0, i32 0
  %".57" = call i32 (i8*, ...) @"printf"(i8* %".56")
  br label %".8"
.32:
  %".37" = load i32, i32* %"i"
  %".38" = getelementptr inbounds [1024 x i8], [1024 x i8]* %"s", i32 0, i32 %".37"
  %".39" = load i8, i8* %".38"
  %".40" = load i32, i32* %"len"
  %".41" = sub i32 %".40", 1
  %".42" = load i32, i32* %"i"
  %".43" = sub i32 %".41", %".42"
  %".44" = getelementptr inbounds [1024 x i8], [1024 x i8]* %"s", i32 0, i32 %".43"
  %".45" = load i8, i8* %".44"
  %".46" = icmp ne i8 %".39", %".45"
  br i1 %".46", label %".35", label %".36"
.33:
  %".52" = load i32, i32* %"i"
  %".53" = add i32 %".52", 1
  store i32 %".53", i32* %"i"
  br label %".22"
.35:
  %".48" = getelementptr inbounds [7 x i8], [7 x i8]* @".str3", i32 0, i32 0
  %".49" = call i32 (i8*, ...) @"printf"(i8* %".48")
  ret i32 0
.36:
  br label %".33"
}

@".str2" = constant [17 x i8] c"Error detected!\0a\00"
@".str3" = constant [7 x i8] c"False\0a\00"
@".str4" = constant [6 x i8] c"True\0a\00"