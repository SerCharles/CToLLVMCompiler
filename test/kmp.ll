; ModuleID = ""
target triple = "x86_64-pc-linux-gnu"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"

define i32 @"main"() 
{
main.entry:
  %"S" = alloca [1024 x i8]
  %"T" = alloca [1024 x i8]
  %"nxt" = alloca [1024 x i32]
  %"lenS" = alloca i32
  %"lenT" = alloca i32
  %"i" = alloca i32
  %"j" = alloca i32
  %"flag" = alloca i32
  store i32 0, i32* %"flag"
  %".3" = getelementptr inbounds [1024 x i8], [1024 x i8]* %"S", i32 0, i32 0
  %".4" = call i32 (...) @"gets"(i8* %".3")
  %".5" = getelementptr inbounds [1024 x i8], [1024 x i8]* %"T", i32 0, i32 0
  %".6" = call i32 (...) @"gets"(i8* %".5")
  %".7" = getelementptr inbounds [1024 x i8], [1024 x i8]* %"S", i32 0, i32 0
  %".8" = call i32 @"strlen"(i8* %".7")
  store i32 %".8", i32* %"lenS"
  %".10" = getelementptr inbounds [1024 x i8], [1024 x i8]* %"T", i32 0, i32 0
  %".11" = call i32 @"strlen"(i8* %".10")
  store i32 %".11", i32* %"lenT"
  %".13" = sub i32 0, 1
  %".14" = getelementptr inbounds [1024 x i32], [1024 x i32]* %"nxt", i32 0, i32 0
  store i32 %".13", i32* %".14"
  store i32 1, i32* %"i"
  %".17" = sub i32 0, 1
  store i32 %".17", i32* %"j"
  br label %".19"
.19:
  %".23" = load i32, i32* %"i"
  %".24" = load i32, i32* %"lenT"
  %".25" = icmp slt i32 %".23", %".24"
  br i1 %".25", label %".20", label %".21"
.20:
  br label %".27"
.21:
  store i32 0, i32* %"i"
  %".76" = sub i32 0, 1
  store i32 %".76", i32* %"j"
  br label %".78"
.27:
  %".31" = load i32, i32* %"j"
  %".32" = icmp sge i32 %".31", 0
  %".33" = load i32, i32* %"i"
  %".34" = getelementptr inbounds [1024 x i8], [1024 x i8]* %"T", i32 0, i32 %".33"
  %".35" = load i8, i8* %".34"
  %".36" = load i32, i32* %"j"
  %".37" = add i32 %".36", 1
  %".38" = getelementptr inbounds [1024 x i8], [1024 x i8]* %"T", i32 0, i32 %".37"
  %".39" = load i8, i8* %".38"
  %".40" = icmp ne i8 %".35", %".39"
  %".41" = and i1 %".32", %".40"
  br i1 %".41", label %".28", label %".29"
.28:
  %".43" = load i32, i32* %"j"
  %".44" = getelementptr inbounds [1024 x i32], [1024 x i32]* %"nxt", i32 0, i32 %".43"
  %".45" = load i32, i32* %".44"
  store i32 %".45", i32* %"j"
  br label %".27"
.29:
  br label %".48"
.48:
  %".51" = load i32, i32* %"i"
  %".52" = getelementptr inbounds [1024 x i8], [1024 x i8]* %"T", i32 0, i32 %".51"
  %".53" = load i8, i8* %".52"
  %".54" = load i32, i32* %"j"
  %".55" = add i32 %".54", 1
  %".56" = getelementptr inbounds [1024 x i8], [1024 x i8]* %"T", i32 0, i32 %".55"
  %".57" = load i8, i8* %".56"
  %".58" = icmp eq i8 %".53", %".57"
  br i1 %".58", label %".59", label %".60"
.49:
  %".67" = load i32, i32* %"j"
  %".68" = load i32, i32* %"i"
  %".69" = getelementptr inbounds [1024 x i32], [1024 x i32]* %"nxt", i32 0, i32 %".68"
  store i32 %".67", i32* %".69"
  %".71" = load i32, i32* %"i"
  %".72" = add i32 %".71", 1
  store i32 %".72", i32* %"i"
  br label %".19"
.59:
  %".62" = load i32, i32* %"j"
  %".63" = add i32 %".62", 1
  store i32 %".63", i32* %"j"
  br label %".49"
.60:
  br label %".49"
.78:
  %".82" = load i32, i32* %"i"
  %".83" = load i32, i32* %"lenS"
  %".84" = icmp slt i32 %".82", %".83"
  br i1 %".84", label %".79", label %".80"
.79:
  br label %".86"
.80:
  br label %".152"
.86:
  %".90" = load i32, i32* %"j"
  %".91" = icmp sge i32 %".90", 0
  %".92" = load i32, i32* %"i"
  %".93" = getelementptr inbounds [1024 x i8], [1024 x i8]* %"S", i32 0, i32 %".92"
  %".94" = load i8, i8* %".93"
  %".95" = load i32, i32* %"j"
  %".96" = add i32 %".95", 1
  %".97" = getelementptr inbounds [1024 x i8], [1024 x i8]* %"T", i32 0, i32 %".96"
  %".98" = load i8, i8* %".97"
  %".99" = icmp ne i8 %".94", %".98"
  %".100" = and i1 %".91", %".99"
  br i1 %".100", label %".87", label %".88"
.87:
  %".102" = load i32, i32* %"j"
  %".103" = getelementptr inbounds [1024 x i32], [1024 x i32]* %"nxt", i32 0, i32 %".102"
  %".104" = load i32, i32* %".103"
  store i32 %".104", i32* %"j"
  br label %".86"
.88:
  br label %".107"
.107:
  %".110" = load i32, i32* %"i"
  %".111" = getelementptr inbounds [1024 x i8], [1024 x i8]* %"S", i32 0, i32 %".110"
  %".112" = load i8, i8* %".111"
  %".113" = load i32, i32* %"j"
  %".114" = add i32 %".113", 1
  %".115" = getelementptr inbounds [1024 x i8], [1024 x i8]* %"T", i32 0, i32 %".114"
  %".116" = load i8, i8* %".115"
  %".117" = icmp eq i8 %".112", %".116"
  br i1 %".117", label %".118", label %".119"
.108:
  br label %".126"
.118:
  %".121" = load i32, i32* %"j"
  %".122" = add i32 %".121", 1
  store i32 %".122", i32* %"j"
  br label %".108"
.119:
  br label %".108"
.126:
  %".129" = load i32, i32* %"j"
  %".130" = load i32, i32* %"lenT"
  %".131" = sub i32 %".130", 1
  %".132" = icmp eq i32 %".129", %".131"
  br i1 %".132", label %".133", label %".134"
.127:
  %".148" = load i32, i32* %"i"
  %".149" = add i32 %".148", 1
  store i32 %".149", i32* %"i"
  br label %".78"
.133:
  %".136" = getelementptr inbounds [4 x i8], [4 x i8]* @".str0", i32 0, i32 0
  %".137" = load i32, i32* %"i"
  %".138" = load i32, i32* %"j"
  %".139" = sub i32 %".137", %".138"
  %".140" = call i32 (i8*, ...) @"printf"(i8* %".136", i32 %".139")
  store i32 1, i32* %"flag"
  %".142" = load i32, i32* %"j"
  %".143" = getelementptr inbounds [1024 x i32], [1024 x i32]* %"nxt", i32 0, i32 %".142"
  %".144" = load i32, i32* %".143"
  store i32 %".144", i32* %"j"
  br label %".127"
.134:
  br label %".127"
.152:
  %".155" = load i32, i32* %"flag"
  %".156" = icmp eq i32 %".155", 0
  br i1 %".156", label %".157", label %".158"
.153:
  ret i32 0
.157:
  %".160" = getelementptr inbounds [7 x i8], [7 x i8]* @".str1", i32 0, i32 0
  %".161" = call i32 (i8*, ...) @"printf"(i8* %".160")
  br label %".153"
.158:
  br label %".153"
}

declare i32 @"gets"(...) 

declare i32 @"strlen"(i8* %".1") 

declare i32 @"printf"(i8* %".1", ...) 

@".str0" = constant [4 x i8] c"%d\0a\00"
@".str1" = constant [7 x i8] c"False\0a\00"