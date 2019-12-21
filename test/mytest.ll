; ModuleID = ""
target triple = "x86_64-pc-linux-gnu"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"

@"a" = internal global i32 887
@"b" = internal global i8 99
define i32 @"main"() 
{
main.entry:
  %".2" = getelementptr inbounds [8 x i8], [8 x i8]* @".str0", i32 0, i32 0
  %".3" = load i32, i32* @"a"
  %".4" = call i32 (i8*, ...) @"printf"(i8* %".2", i32 %".3")
  %".5" = getelementptr inbounds [8 x i8], [8 x i8]* @".str1", i32 0, i32 0
  %".6" = load i8, i8* @"b"
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".5", i8 %".6")
  ret i32 0
}

declare i32 @"printf"(i8* %".1", ...) 

@".str0" = constant [8 x i8] c"a = %d\0a\00"
@".str1" = constant [8 x i8] c"b = %c\0a\00"