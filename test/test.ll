; ModuleID = ""
target triple = "x86_64-pc-linux-gnu"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"

@"a" = common global i32 undef
@"b" = common global i32 undef
@"d" = common global [10 x i32] undef
@"x" = common global [10 x {i32, [10 x double]}] zeroinitializer
define void @"void_foo"() 
{
void_foo.entry:
  %".2" = getelementptr inbounds [10 x i8], [10 x i8]* @".str0", i32 0, i32 0
  %".3" = call i32 (i8*, ...) @"printf"(i8* %".2")
  ret void
}

declare i32 @"printf"(i8* %".1", ...) 

@".str0" = constant [10 x i8] c"void_foo\0a\00"
define i32 @"foo"(i32 %"a", i32 %"b") 
{
foo.entry:
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

define i32 @"main"() 
{
main.entry:
  %"i" = alloca i32
  store i32 0, i32* %"i"
  br label %".3"
.3:
  %".6" = load i32, i32* %"i"
  %".7" = icmp eq i32 %".6", 0
  %".8" = load i32, i32* %"i"
  %".9" = icmp ne i32 %".8", 0
  br i1 %".9", label %".10", label %".11"
.4:
  ret i32 0
.10:
  %".13" = getelementptr inbounds [8 x i8], [8 x i8]* @".str1", i32 0, i32 0
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".13")
  br label %".4"
.11:
  %".16" = getelementptr inbounds [8 x i8], [8 x i8]* @".str2", i32 0, i32 0
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".16")
  br label %".4"
}

@".str1" = constant [8 x i8] c"i == 0\0a\00"
@".str2" = constant [8 x i8] c"i != 0\0a\00"