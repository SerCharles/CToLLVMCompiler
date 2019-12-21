; ModuleID = ""
target triple = "x86_64-pc-linux-gnu"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"

@"a" = internal global i32 undef
@"b" = internal global i32 undef
@"d" = internal global [10 x i32] undef
@"x" = internal global [10 x {i32, [10 x double]}] zeroinitializer
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

define i32 @"main"() 
{
main.entry:
  %"i" = alloca i32
  store i32 0, i32* %"i"
  br label %".3"
.3:
  %".8" = load i32, i32* %"i"
  %".9" = icmp eq i32 %".8", 0
  %".10" = load i32, i32* %"i"
  %".11" = icmp ne i32 %".10", 0
  br i1 %".11", label %".6", label %".7"
.4:
  ret i32 0
.6:
  %".13" = getelementptr inbounds [8 x i8], [8 x i8]* @".str1", i32 0, i32 0
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".13")
  br label %".4"
.7:
  %".16" = getelementptr inbounds [8 x i8], [8 x i8]* @".str2", i32 0, i32 0
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".16")
  br label %".4"
}

@".str1" = constant [8 x i8] c"i == 0\0a\00"
@".str2" = constant [8 x i8] c"i != 0\0a\00"