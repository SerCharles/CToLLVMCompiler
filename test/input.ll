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
  %".52" = load i32, i32* %"i"
  %".53" = getelementptr inbounds [1024 x i8], [1024 x i8]* %"T", i32 0, i32 %".52"
  %".54" = load i8, i8* %".53"
  %".55" = load i32, i32* %"j"
  %".56" = add i32 %".55", 1
  %".57" = getelementptr inbounds [1024 x i8], [1024 x i8]* %"T", i32 0, i32 %".56"
  %".58" = load i8, i8* %".57"
  %".59" = icmp eq i8 %".54", %".58"
  br i1 %".59", label %".60", label %".61"
.50:
  %".68" = load i32, i32* %"j"
  %".69" = load i32, i32* %"i"
  %".70" = getelementptr inbounds [1024 x i32], [1024 x i32]* %"nxt", i32 0, i32 %".69"
  store i32 %".68", i32* %".70"
  %".72" = load i32, i32* %"i"
  %".73" = add i32 %".72", 1
  store i32 %".73", i32* %"i"
  br label %".20"
.60:
  %".63" = load i32, i32* %"j"
  %".64" = add i32 %".63", 1
  store i32 %".64", i32* %"j"
  br label %".50"
.61:
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
  %".111" = load i32, i32* %"i"
  %".112" = getelementptr inbounds [1024 x i8], [1024 x i8]* %"S", i32 0, i32 %".111"
  %".113" = load i8, i8* %".112"
  %".114" = load i32, i32* %"j"
  %".115" = add i32 %".114", 1
  %".116" = getelementptr inbounds [1024 x i8], [1024 x i8]* %"T", i32 0, i32 %".115"
  %".117" = load i8, i8* %".116"
  %".118" = icmp eq i8 %".113", %".117"
  br i1 %".118", label %".119", label %".120"
.109:
  br label %".127"
.119:
  %".122" = load i32, i32* %"j"
  %".123" = add i32 %".122", 1
  store i32 %".123", i32* %"j"
  br label %".109"
.120:
  br label %".109"
.127:
  %".130" = load i32, i32* %"j"
  %".131" = load i32, i32* %"lenT"
  %".132" = sub i32 %".131", 1
  %".133" = icmp eq i32 %".130", %".132"
  br i1 %".133", label %".134", label %".135"
.128:
  %".149" = load i32, i32* %"i"
  %".150" = add i32 %".149", 1
  store i32 %".150", i32* %"i"
  br label %".79"
.134:
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
.135:
  br label %".128"
.153:
  %".156" = load i32, i32* %"flag"
  %".157" = icmp eq i32 %".156", 0
  br i1 %".157", label %".158", label %".159"
.154:
  ret i32 0
.158:
  %".161" = getelementptr inbounds [7 x i8], [7 x i8]* @".str1", i32 0, i32 0
  %".162" = call i32 (i8*, ...) @"printf"(i8* %".161")
  br label %".154"
.159:
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
  %".10" = load i32, i32* %"len"
  %".11" = icmp slt i32 %".10", 0
  %".12" = load i32, i32* %"len"
  %".13" = icmp sgt i32 %".12", 1024
  %".14" = or i1 %".11", %".13"
  br i1 %".14", label %".15", label %".16"
.8:
  ret i32 0
.15:
  %".18" = getelementptr inbounds [17 x i8], [17 x i8]* @".str2", i32 0, i32 0
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".18")
  br label %".8"
.16:
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
  %".35" = load i32, i32* %"i"
  %".36" = getelementptr inbounds [1024 x i8], [1024 x i8]* %"s", i32 0, i32 %".35"
  %".37" = load i8, i8* %".36"
  %".38" = load i32, i32* %"len"
  %".39" = sub i32 %".38", 1
  %".40" = load i32, i32* %"i"
  %".41" = sub i32 %".39", %".40"
  %".42" = getelementptr inbounds [1024 x i8], [1024 x i8]* %"s", i32 0, i32 %".41"
  %".43" = load i8, i8* %".42"
  %".44" = icmp ne i8 %".37", %".43"
  br i1 %".44", label %".45", label %".46"
.33:
  %".52" = load i32, i32* %"i"
  %".53" = add i32 %".52", 1
  store i32 %".53", i32* %"i"
  br label %".22"
.45:
  %".48" = getelementptr inbounds [7 x i8], [7 x i8]* @".str3", i32 0, i32 0
  %".49" = call i32 (i8*, ...) @"printf"(i8* %".48")
  ret i32 0
.46:
  br label %".33"
}

@".str2" = constant [17 x i8] c"Error detected!\0a\00"
@".str3" = constant [7 x i8] c"False\0a\00"
@".str4" = constant [6 x i8] c"True\0a\00"