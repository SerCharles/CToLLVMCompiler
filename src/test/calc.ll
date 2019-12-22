; ModuleID = ""
target triple = "x86_64-pc-linux-gnu"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"

define i32 @"main"() 
{
main.entry:
  %"InputExpression" = alloca [2000 x i8]
  %"OperationUpdated" = alloca [2000 x i8]
  %"NumUpdated" = alloca [2000 x i32]
  %"PresentNum" = alloca i32
  %".2" = sub i32 0, 1
  store i32 %".2", i32* %"PresentNum"
  %"PresentOperator" = alloca i32
  %".4" = sub i32 0, 1
  store i32 %".4", i32* %"PresentOperator"
  %"DecimalProcess" = alloca i32
  store i32 1, i32* %"DecimalProcess"
  %"StrLength" = alloca i32
  %"num" = alloca i32
  store i32 0, i32* %"num"
  %"i" = alloca i32
  %".8" = getelementptr inbounds [2000 x i8], [2000 x i8]* %"InputExpression", i32 0, i32 0
  %".9" = call i32 (...) @"gets"(i8* %".8")
  %".10" = getelementptr inbounds [2000 x i8], [2000 x i8]* %"InputExpression", i32 0, i32 0
  %".11" = call i32 @"strlen"(i8* %".10")
  store i32 %".11", i32* %"StrLength"
  %".13" = load i32, i32* %"StrLength"
  %".14" = sub i32 %".13", 1
  store i32 %".14", i32* %"i"
  br label %".16"
.16:
  %".20" = load i32, i32* %"i"
  %".21" = icmp sge i32 %".20", 0
  br i1 %".21", label %".17", label %".18"
.17:
  %".23" = load i32, i32* %"i"
  %".24" = getelementptr inbounds [2000 x i8], [2000 x i8]* %"InputExpression", i32 0, i32 %".23"
  %".25" = load i8, i8* %".24"
  %".26" = load i32, i32* %"i"
  %".27" = add i32 %".26", 1
  %".28" = getelementptr inbounds [2000 x i8], [2000 x i8]* %"InputExpression", i32 0, i32 %".27"
  store i8 %".25", i8* %".28"
  %".30" = load i32, i32* %"i"
  %".31" = sub i32 %".30", 1
  store i32 %".31", i32* %"i"
  br label %".16"
.18:
  %".34" = load i32, i32* %"StrLength"
  %".35" = add i32 %".34", 1
  store i32 %".35", i32* %"i"
  %".37" = getelementptr inbounds [2000 x i8], [2000 x i8]* %"InputExpression", i32 0, i32 0
  store i8 40, i8* %".37"
  %".39" = load i32, i32* %"StrLength"
  %".40" = add i32 %".39", 1
  %".41" = getelementptr inbounds [2000 x i8], [2000 x i8]* %"InputExpression", i32 0, i32 %".40"
  store i8 41, i8* %".41"
  %".43" = load i32, i32* %"StrLength"
  %".44" = add i32 %".43", 2
  store i32 %".44", i32* %"StrLength"
  br label %".46"
.46:
  %".50" = load i32, i32* %"i"
  %".51" = icmp sge i32 %".50", 0
  br i1 %".51", label %".47", label %".48"
.47:
  br label %".53"
.48:
  %".417" = getelementptr inbounds [4 x i8], [4 x i8]* @".str0", i32 0, i32 0
  %".418" = getelementptr inbounds [2000 x i32], [2000 x i32]* %"NumUpdated", i32 0, i32 0
  %".419" = load i32, i32* %".418"
  %".420" = call i32 (i8*, ...) @"printf"(i8* %".417", i32 %".419")
  ret i32 0
.53:
  %".58" = load i32, i32* %"i"
  %".59" = getelementptr inbounds [2000 x i8], [2000 x i8]* %"InputExpression", i32 0, i32 %".58"
  %".60" = load i8, i8* %".59"
  %".61" = icmp eq i8 %".60", 43
  br i1 %".61", label %".56", label %".57"
.54:
  br label %".46"
.56:
  br label %".63"
.57:
  %".135" = load i32, i32* %"i"
  %".136" = getelementptr inbounds [2000 x i8], [2000 x i8]* %"InputExpression", i32 0, i32 %".135"
  %".137" = load i8, i8* %".136"
  %".138" = icmp eq i8 %".137", 45
  br i1 %".138", label %".133", label %".134"
.63:
  %".67" = load i32, i32* %"PresentOperator"
  %".68" = icmp sge i32 %".67", 0
  %".69" = load i32, i32* %"PresentOperator"
  %".70" = getelementptr inbounds [2000 x i8], [2000 x i8]* %"OperationUpdated", i32 0, i32 %".69"
  %".71" = load i8, i8* %".70"
  %".72" = icmp eq i8 %".71", 42
  %".73" = load i32, i32* %"PresentOperator"
  %".74" = getelementptr inbounds [2000 x i8], [2000 x i8]* %"OperationUpdated", i32 0, i32 %".73"
  %".75" = load i8, i8* %".74"
  %".76" = icmp eq i8 %".75", 47
  %".77" = or i1 %".72", %".76"
  %".78" = and i1 %".68", %".77"
  br i1 %".78", label %".64", label %".65"
.64:
  br label %".80"
.65:
  %".123" = load i32, i32* %"PresentOperator"
  %".124" = add i32 %".123", 1
  store i32 %".124", i32* %"PresentOperator"
  %".126" = load i32, i32* %"PresentOperator"
  %".127" = getelementptr inbounds [2000 x i8], [2000 x i8]* %"OperationUpdated", i32 0, i32 %".126"
  store i8 43, i8* %".127"
  %".129" = load i32, i32* %"i"
  %".130" = sub i32 %".129", 1
  store i32 %".130", i32* %"i"
  br label %".54"
.80:
  %".85" = load i32, i32* %"PresentOperator"
  %".86" = getelementptr inbounds [2000 x i8], [2000 x i8]* %"OperationUpdated", i32 0, i32 %".85"
  %".87" = load i8, i8* %".86"
  %".88" = icmp eq i8 %".87", 42
  br i1 %".88", label %".83", label %".84"
.81:
  %".116" = load i32, i32* %"PresentOperator"
  %".117" = sub i32 %".116", 1
  store i32 %".117", i32* %"PresentOperator"
  %".119" = load i32, i32* %"PresentNum"
  %".120" = sub i32 %".119", 1
  store i32 %".120", i32* %"PresentNum"
  br label %".63"
.83:
  %".90" = load i32, i32* %"PresentNum"
  %".91" = getelementptr inbounds [2000 x i32], [2000 x i32]* %"NumUpdated", i32 0, i32 %".90"
  %".92" = load i32, i32* %".91"
  %".93" = load i32, i32* %"PresentNum"
  %".94" = sub i32 %".93", 1
  %".95" = getelementptr inbounds [2000 x i32], [2000 x i32]* %"NumUpdated", i32 0, i32 %".94"
  %".96" = load i32, i32* %".95"
  %".97" = mul i32 %".92", %".96"
  %".98" = load i32, i32* %"PresentNum"
  %".99" = sub i32 %".98", 1
  %".100" = getelementptr inbounds [2000 x i32], [2000 x i32]* %"NumUpdated", i32 0, i32 %".99"
  store i32 %".97", i32* %".100"
  br label %".81"
.84:
  %".103" = load i32, i32* %"PresentNum"
  %".104" = getelementptr inbounds [2000 x i32], [2000 x i32]* %"NumUpdated", i32 0, i32 %".103"
  %".105" = load i32, i32* %".104"
  %".106" = load i32, i32* %"PresentNum"
  %".107" = sub i32 %".106", 1
  %".108" = getelementptr inbounds [2000 x i32], [2000 x i32]* %"NumUpdated", i32 0, i32 %".107"
  %".109" = load i32, i32* %".108"
  %".110" = sdiv i32 %".105", %".109"
  %".111" = load i32, i32* %"PresentNum"
  %".112" = sub i32 %".111", 1
  %".113" = getelementptr inbounds [2000 x i32], [2000 x i32]* %"NumUpdated", i32 0, i32 %".112"
  store i32 %".110", i32* %".113"
  br label %".81"
.133:
  br label %".140"
.134:
  %".212" = load i32, i32* %"i"
  %".213" = getelementptr inbounds [2000 x i8], [2000 x i8]* %"InputExpression", i32 0, i32 %".212"
  %".214" = load i8, i8* %".213"
  %".215" = icmp eq i8 %".214", 42
  br i1 %".215", label %".210", label %".211"
.140:
  %".144" = load i32, i32* %"PresentOperator"
  %".145" = icmp sge i32 %".144", 0
  %".146" = load i32, i32* %"PresentOperator"
  %".147" = getelementptr inbounds [2000 x i8], [2000 x i8]* %"OperationUpdated", i32 0, i32 %".146"
  %".148" = load i8, i8* %".147"
  %".149" = icmp eq i8 %".148", 42
  %".150" = load i32, i32* %"PresentOperator"
  %".151" = getelementptr inbounds [2000 x i8], [2000 x i8]* %"OperationUpdated", i32 0, i32 %".150"
  %".152" = load i8, i8* %".151"
  %".153" = icmp eq i8 %".152", 47
  %".154" = or i1 %".149", %".153"
  %".155" = and i1 %".145", %".154"
  br i1 %".155", label %".141", label %".142"
.141:
  br label %".157"
.142:
  %".200" = load i32, i32* %"PresentOperator"
  %".201" = add i32 %".200", 1
  store i32 %".201", i32* %"PresentOperator"
  %".203" = load i32, i32* %"PresentOperator"
  %".204" = getelementptr inbounds [2000 x i8], [2000 x i8]* %"OperationUpdated", i32 0, i32 %".203"
  store i8 45, i8* %".204"
  %".206" = load i32, i32* %"i"
  %".207" = sub i32 %".206", 1
  store i32 %".207", i32* %"i"
  br label %".54"
.157:
  %".162" = load i32, i32* %"PresentOperator"
  %".163" = getelementptr inbounds [2000 x i8], [2000 x i8]* %"OperationUpdated", i32 0, i32 %".162"
  %".164" = load i8, i8* %".163"
  %".165" = icmp eq i8 %".164", 42
  br i1 %".165", label %".160", label %".161"
.158:
  %".193" = load i32, i32* %"PresentNum"
  %".194" = sub i32 %".193", 1
  store i32 %".194", i32* %"PresentNum"
  %".196" = load i32, i32* %"PresentOperator"
  %".197" = sub i32 %".196", 1
  store i32 %".197", i32* %"PresentOperator"
  br label %".140"
.160:
  %".167" = load i32, i32* %"PresentNum"
  %".168" = getelementptr inbounds [2000 x i32], [2000 x i32]* %"NumUpdated", i32 0, i32 %".167"
  %".169" = load i32, i32* %".168"
  %".170" = load i32, i32* %"PresentNum"
  %".171" = sub i32 %".170", 1
  %".172" = getelementptr inbounds [2000 x i32], [2000 x i32]* %"NumUpdated", i32 0, i32 %".171"
  %".173" = load i32, i32* %".172"
  %".174" = mul i32 %".169", %".173"
  %".175" = load i32, i32* %"PresentNum"
  %".176" = sub i32 %".175", 1
  %".177" = getelementptr inbounds [2000 x i32], [2000 x i32]* %"NumUpdated", i32 0, i32 %".176"
  store i32 %".174", i32* %".177"
  br label %".158"
.161:
  %".180" = load i32, i32* %"PresentNum"
  %".181" = getelementptr inbounds [2000 x i32], [2000 x i32]* %"NumUpdated", i32 0, i32 %".180"
  %".182" = load i32, i32* %".181"
  %".183" = load i32, i32* %"PresentNum"
  %".184" = sub i32 %".183", 1
  %".185" = getelementptr inbounds [2000 x i32], [2000 x i32]* %"NumUpdated", i32 0, i32 %".184"
  %".186" = load i32, i32* %".185"
  %".187" = sdiv i32 %".182", %".186"
  %".188" = load i32, i32* %"PresentNum"
  %".189" = sub i32 %".188", 1
  %".190" = getelementptr inbounds [2000 x i32], [2000 x i32]* %"NumUpdated", i32 0, i32 %".189"
  store i32 %".187", i32* %".190"
  br label %".158"
.210:
  %".217" = load i32, i32* %"PresentOperator"
  %".218" = add i32 %".217", 1
  store i32 %".218", i32* %"PresentOperator"
  %".220" = load i32, i32* %"PresentOperator"
  %".221" = getelementptr inbounds [2000 x i8], [2000 x i8]* %"OperationUpdated", i32 0, i32 %".220"
  store i8 42, i8* %".221"
  %".223" = load i32, i32* %"i"
  %".224" = sub i32 %".223", 1
  store i32 %".224", i32* %"i"
  br label %".54"
.211:
  %".229" = load i32, i32* %"i"
  %".230" = getelementptr inbounds [2000 x i8], [2000 x i8]* %"InputExpression", i32 0, i32 %".229"
  %".231" = load i8, i8* %".230"
  %".232" = icmp eq i8 %".231", 47
  br i1 %".232", label %".227", label %".228"
.227:
  %".234" = load i32, i32* %"PresentOperator"
  %".235" = add i32 %".234", 1
  store i32 %".235", i32* %"PresentOperator"
  %".237" = load i32, i32* %"PresentOperator"
  %".238" = getelementptr inbounds [2000 x i8], [2000 x i8]* %"OperationUpdated", i32 0, i32 %".237"
  store i8 47, i8* %".238"
  %".240" = load i32, i32* %"i"
  %".241" = sub i32 %".240", 1
  store i32 %".241", i32* %"i"
  br label %".54"
.228:
  %".246" = load i32, i32* %"i"
  %".247" = getelementptr inbounds [2000 x i8], [2000 x i8]* %"InputExpression", i32 0, i32 %".246"
  %".248" = load i8, i8* %".247"
  %".249" = icmp eq i8 %".248", 41
  br i1 %".249", label %".244", label %".245"
.244:
  %".251" = load i32, i32* %"PresentOperator"
  %".252" = add i32 %".251", 1
  store i32 %".252", i32* %"PresentOperator"
  %".254" = load i32, i32* %"PresentOperator"
  %".255" = getelementptr inbounds [2000 x i8], [2000 x i8]* %"OperationUpdated", i32 0, i32 %".254"
  store i8 41, i8* %".255"
  %".257" = load i32, i32* %"i"
  %".258" = sub i32 %".257", 1
  store i32 %".258", i32* %"i"
  br label %".54"
.245:
  %".263" = load i32, i32* %"i"
  %".264" = getelementptr inbounds [2000 x i8], [2000 x i8]* %"InputExpression", i32 0, i32 %".263"
  %".265" = load i8, i8* %".264"
  %".266" = icmp eq i8 %".265", 40
  br i1 %".266", label %".261", label %".262"
.261:
  br label %".268"
.262:
  store i32 0, i32* %"num"
  store i32 1, i32* %"DecimalProcess"
  br label %".373"
.268:
  %".272" = load i32, i32* %"PresentOperator"
  %".273" = getelementptr inbounds [2000 x i8], [2000 x i8]* %"OperationUpdated", i32 0, i32 %".272"
  %".274" = load i8, i8* %".273"
  %".275" = icmp ne i8 %".274", 41
  br i1 %".275", label %".269", label %".270"
.269:
  %"OperatorGet" = alloca i8
  %".277" = load i32, i32* %"PresentOperator"
  %".278" = getelementptr inbounds [2000 x i8], [2000 x i8]* %"OperationUpdated", i32 0, i32 %".277"
  %".279" = load i8, i8* %".278"
  store i8 %".279", i8* %"OperatorGet"
  %".281" = load i32, i32* %"PresentOperator"
  %".282" = sub i32 %".281", 1
  store i32 %".282", i32* %"PresentOperator"
  br label %".284"
.270:
  %".364" = load i32, i32* %"PresentOperator"
  %".365" = sub i32 %".364", 1
  store i32 %".365", i32* %"PresentOperator"
  %".367" = load i32, i32* %"i"
  %".368" = sub i32 %".367", 1
  store i32 %".368", i32* %"i"
  br label %".54"
.284:
  %".289" = load i8, i8* %"OperatorGet"
  %".290" = icmp eq i8 %".289", 47
  br i1 %".290", label %".287", label %".288"
.285:
  %".360" = load i32, i32* %"PresentNum"
  %".361" = sub i32 %".360", 1
  store i32 %".361", i32* %"PresentNum"
  br label %".268"
.287:
  %".292" = load i32, i32* %"PresentNum"
  %".293" = getelementptr inbounds [2000 x i32], [2000 x i32]* %"NumUpdated", i32 0, i32 %".292"
  %".294" = load i32, i32* %".293"
  %".295" = load i32, i32* %"PresentNum"
  %".296" = sub i32 %".295", 1
  %".297" = getelementptr inbounds [2000 x i32], [2000 x i32]* %"NumUpdated", i32 0, i32 %".296"
  %".298" = load i32, i32* %".297"
  %".299" = sdiv i32 %".294", %".298"
  %".300" = load i32, i32* %"PresentNum"
  %".301" = sub i32 %".300", 1
  %".302" = getelementptr inbounds [2000 x i32], [2000 x i32]* %"NumUpdated", i32 0, i32 %".301"
  store i32 %".299", i32* %".302"
  br label %".285"
.288:
  %".307" = load i8, i8* %"OperatorGet"
  %".308" = icmp eq i8 %".307", 43
  br i1 %".308", label %".305", label %".306"
.305:
  %".310" = load i32, i32* %"PresentNum"
  %".311" = getelementptr inbounds [2000 x i32], [2000 x i32]* %"NumUpdated", i32 0, i32 %".310"
  %".312" = load i32, i32* %".311"
  %".313" = load i32, i32* %"PresentNum"
  %".314" = sub i32 %".313", 1
  %".315" = getelementptr inbounds [2000 x i32], [2000 x i32]* %"NumUpdated", i32 0, i32 %".314"
  %".316" = load i32, i32* %".315"
  %".317" = add i32 %".312", %".316"
  %".318" = load i32, i32* %"PresentNum"
  %".319" = sub i32 %".318", 1
  %".320" = getelementptr inbounds [2000 x i32], [2000 x i32]* %"NumUpdated", i32 0, i32 %".319"
  store i32 %".317", i32* %".320"
  br label %".285"
.306:
  %".325" = load i8, i8* %"OperatorGet"
  %".326" = icmp eq i8 %".325", 45
  br i1 %".326", label %".323", label %".324"
.323:
  %".328" = load i32, i32* %"PresentNum"
  %".329" = getelementptr inbounds [2000 x i32], [2000 x i32]* %"NumUpdated", i32 0, i32 %".328"
  %".330" = load i32, i32* %".329"
  %".331" = load i32, i32* %"PresentNum"
  %".332" = sub i32 %".331", 1
  %".333" = getelementptr inbounds [2000 x i32], [2000 x i32]* %"NumUpdated", i32 0, i32 %".332"
  %".334" = load i32, i32* %".333"
  %".335" = sub i32 %".330", %".334"
  %".336" = load i32, i32* %"PresentNum"
  %".337" = sub i32 %".336", 1
  %".338" = getelementptr inbounds [2000 x i32], [2000 x i32]* %"NumUpdated", i32 0, i32 %".337"
  store i32 %".335", i32* %".338"
  br label %".285"
.324:
  %".343" = load i8, i8* %"OperatorGet"
  %".344" = icmp eq i8 %".343", 42
  br i1 %".344", label %".341", label %".342"
.341:
  %".346" = load i32, i32* %"PresentNum"
  %".347" = getelementptr inbounds [2000 x i32], [2000 x i32]* %"NumUpdated", i32 0, i32 %".346"
  %".348" = load i32, i32* %".347"
  %".349" = load i32, i32* %"PresentNum"
  %".350" = sub i32 %".349", 1
  %".351" = getelementptr inbounds [2000 x i32], [2000 x i32]* %"NumUpdated", i32 0, i32 %".350"
  %".352" = load i32, i32* %".351"
  %".353" = mul i32 %".348", %".352"
  %".354" = load i32, i32* %"PresentNum"
  %".355" = sub i32 %".354", 1
  %".356" = getelementptr inbounds [2000 x i32], [2000 x i32]* %"NumUpdated", i32 0, i32 %".355"
  store i32 %".353", i32* %".356"
  br label %".285"
.342:
  br label %".285"
.373:
  %".377" = load i32, i32* %"i"
  %".378" = icmp sge i32 %".377", 0
  %".379" = load i32, i32* %"i"
  %".380" = getelementptr inbounds [2000 x i8], [2000 x i8]* %"InputExpression", i32 0, i32 %".379"
  %".381" = load i8, i8* %".380"
  %".382" = icmp sle i8 %".381", 57
  %".383" = and i1 %".378", %".382"
  %".384" = load i32, i32* %"i"
  %".385" = getelementptr inbounds [2000 x i8], [2000 x i8]* %"InputExpression", i32 0, i32 %".384"
  %".386" = load i8, i8* %".385"
  %".387" = icmp sge i8 %".386", 48
  %".388" = and i1 %".383", %".387"
  br i1 %".388", label %".374", label %".375"
.374:
  %".390" = load i32, i32* %"num"
  %".391" = load i32, i32* %"i"
  %".392" = getelementptr inbounds [2000 x i8], [2000 x i8]* %"InputExpression", i32 0, i32 %".391"
  %".393" = load i8, i8* %".392"
  %".394" = sub i8 %".393", 48
  %".395" = load i32, i32* %"DecimalProcess"
  %".396" = sext i8 %".394" to i32
  %".397" = mul i32 %".396", %".395"
  %".398" = add i32 %".390", %".397"
  store i32 %".398", i32* %"num"
  %".400" = load i32, i32* %"DecimalProcess"
  %".401" = mul i32 %".400", 10
  store i32 %".401", i32* %"DecimalProcess"
  %".403" = load i32, i32* %"i"
  %".404" = sub i32 %".403", 1
  store i32 %".404", i32* %"i"
  br label %".373"
.375:
  %".407" = load i32, i32* %"num"
  %".408" = load i32, i32* %"PresentNum"
  %".409" = add i32 %".408", 1
  %".410" = getelementptr inbounds [2000 x i32], [2000 x i32]* %"NumUpdated", i32 0, i32 %".409"
  store i32 %".407", i32* %".410"
  %".412" = load i32, i32* %"PresentNum"
  %".413" = add i32 %".412", 1
  store i32 %".413", i32* %"PresentNum"
  br label %".54"
}

declare i32 @"gets"(...) 

declare i32 @"strlen"(i8* %".1") 

declare i32 @"printf"(i8* %".1", ...) 

@".str0" = constant [4 x i8] c"%d\0a\00"