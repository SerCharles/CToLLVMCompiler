; ModuleID = ""
target triple = "x86_64-pc-linux-gnu"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"

define i32 @"main"() 
{
main.entry:
  %"i" = alloca i32
  store i32 5, i32* %"i"
  br label %".3"
.3:
  %".7" = load i32, i32* %"i"
  %".8" = icmp sgt i32 %".7", 0
  br i1 %".8", label %".4", label %".5"
.4:
  %".10" = getelementptr inbounds [8 x i8], [8 x i8]* @".str0", i32 0, i32 0
  %".11" = load i32, i32* %"i"
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".10", i32 %".11")
  %".13" = load i32, i32* %"i"
  %".14" = sub i32 %".13", 1
  store i32 %".14", i32* %"i"
  br label %".3"
.5:
  ret i32 0
}

declare i32 @"printf"(i8* %".1", ...) 

@".str0" = constant [8 x i8] c"i = %d\0a\00"