; ModuleID = ""
target triple = "x86_64-pc-linux-gnu"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"

define i32 @"main"() 
{
main.entry:
  %"expr" = alloca [1000 x i8]
  %"st_num" = alloca [1000 x i32]
  %"st_op" = alloca [1000 x i8]
  %"st_num_pt" = alloca i32
  %".2" = sub i32 0, 1
  store i32 %".2", i32* %"st_num_pt"
  %"st_op_pt" = alloca i32
  %".4" = sub i32 0, 1
  store i32 %".4", i32* %"st_op_pt"
  %".6" = getelementptr inbounds [1000 x i8], [1000 x i8]* %"expr", i32 0, i32 0
  %".7" = call i32 (...) @"gets"(i8* %".6")
  %"len" = alloca i32
  %".8" = getelementptr inbounds [1000 x i8], [1000 x i8]* %"expr", i32 0, i32 0
  %".9" = call i32 @"strlen"(i8* %".8")
  store i32 %".9", i32* %"len"
  %"i" = alloca i32
  %".11" = load i32, i32* %"len"
  %".12" = sub i32 %".11", 1
  store i32 %".12", i32* %"i"
  br label %".14"
.14:
  %".18" = load i32, i32* %"i"
  %".19" = icmp sge i32 %".18", 0
  br i1 %".19", label %".15", label %".16"
.15:
  %".21" = load i32, i32* %"i"
  %".22" = getelementptr inbounds [1000 x i8], [1000 x i8]* %"expr", i32 0, i32 %".21"
  %".23" = load i8, i8* %".22"
  %".24" = load i32, i32* %"i"
  %".25" = add i32 %".24", 1
  %".26" = getelementptr inbounds [1000 x i8], [1000 x i8]* %"expr", i32 0, i32 %".25"
  store i8 %".23", i8* %".26"
  %".28" = load i32, i32* %"i"
  %".29" = sub i32 %".28", 1
  store i32 %".29", i32* %"i"
  br label %".14"
.16:
  %".32" = getelementptr inbounds [1000 x i8], [1000 x i8]* %"expr", i32 0, i32 0
  store i8 40, i8* %".32"
  %".34" = load i32, i32* %"len"
  %".35" = add i32 %".34", 1
  %".36" = getelementptr inbounds [1000 x i8], [1000 x i8]* %"expr", i32 0, i32 %".35"
  store i8 41, i8* %".36"
  %".38" = load i32, i32* %"len"
  %".39" = add i32 %".38", 2
  store i32 %".39", i32* %"len"
  %".41" = load i32, i32* %"len"
  %".42" = sub i32 %".41", 1
  store i32 %".42", i32* %"i"
  %"num" = alloca i32
  store i32 0, i32* %"num"
  %"k" = alloca i32
  store i32 1, i32* %"k"
  br label %".46"
.46:
  %".50" = load i32, i32* %"i"
  %".51" = icmp sge i32 %".50", 0
  br i1 %".51", label %".47", label %".48"
.47:
  br label %".53"
.48:
  %".416" = getelementptr inbounds [4 x i8], [4 x i8]* @".str0", i32 0, i32 0
  %".417" = getelementptr inbounds [1000 x i32], [1000 x i32]* %"st_num", i32 0, i32 0
  %".418" = load i32, i32* %".417"
  %".419" = call i32 (i8*, ...) @"printf"(i8* %".416", i32 %".418")
  ret i32 0
.53:
  %".56" = load i32, i32* %"i"
  %".57" = getelementptr inbounds [1000 x i8], [1000 x i8]* %"expr", i32 0, i32 %".56"
  %".58" = load i8, i8* %".57"
  %".59" = icmp eq i8 %".58", 43
  br i1 %".59", label %".60", label %".61"
.54:
  br label %".46"
.60:
  br label %".63"
.61:
  %".133" = load i32, i32* %"i"
  %".134" = getelementptr inbounds [1000 x i8], [1000 x i8]* %"expr", i32 0, i32 %".133"
  %".135" = load i8, i8* %".134"
  %".136" = icmp eq i8 %".135", 45
  br i1 %".136", label %".137", label %".138"
.63:
  %".67" = load i32, i32* %"st_op_pt"
  %".68" = icmp sge i32 %".67", 0
  %".69" = load i32, i32* %"st_op_pt"
  %".70" = getelementptr inbounds [1000 x i8], [1000 x i8]* %"st_op", i32 0, i32 %".69"
  %".71" = load i8, i8* %".70"
  %".72" = icmp eq i8 %".71", 42
  %".73" = load i32, i32* %"st_op_pt"
  %".74" = getelementptr inbounds [1000 x i8], [1000 x i8]* %"st_op", i32 0, i32 %".73"
  %".75" = load i8, i8* %".74"
  %".76" = icmp eq i8 %".75", 47
  %".77" = or i1 %".72", %".76"
  %".78" = and i1 %".68", %".77"
  br i1 %".78", label %".64", label %".65"
.64:
  br label %".80"
.65:
  %".123" = load i32, i32* %"st_op_pt"
  %".124" = add i32 %".123", 1
  store i32 %".124", i32* %"st_op_pt"
  %".126" = load i32, i32* %"st_op_pt"
  %".127" = getelementptr inbounds [1000 x i8], [1000 x i8]* %"st_op", i32 0, i32 %".126"
  store i8 43, i8* %".127"
  %".129" = load i32, i32* %"i"
  %".130" = sub i32 %".129", 1
  store i32 %".130", i32* %"i"
  br label %".54"
.80:
  %".83" = load i32, i32* %"st_op_pt"
  %".84" = getelementptr inbounds [1000 x i8], [1000 x i8]* %"st_op", i32 0, i32 %".83"
  %".85" = load i8, i8* %".84"
  %".86" = icmp eq i8 %".85", 42
  br i1 %".86", label %".87", label %".88"
.81:
  %".116" = load i32, i32* %"st_num_pt"
  %".117" = sub i32 %".116", 1
  store i32 %".117", i32* %"st_num_pt"
  %".119" = load i32, i32* %"st_op_pt"
  %".120" = sub i32 %".119", 1
  store i32 %".120", i32* %"st_op_pt"
  br label %".63"
.87:
  %".90" = load i32, i32* %"st_num_pt"
  %".91" = getelementptr inbounds [1000 x i32], [1000 x i32]* %"st_num", i32 0, i32 %".90"
  %".92" = load i32, i32* %".91"
  %".93" = load i32, i32* %"st_num_pt"
  %".94" = sub i32 %".93", 1
  %".95" = getelementptr inbounds [1000 x i32], [1000 x i32]* %"st_num", i32 0, i32 %".94"
  %".96" = load i32, i32* %".95"
  %".97" = mul i32 %".92", %".96"
  %".98" = load i32, i32* %"st_num_pt"
  %".99" = sub i32 %".98", 1
  %".100" = getelementptr inbounds [1000 x i32], [1000 x i32]* %"st_num", i32 0, i32 %".99"
  store i32 %".97", i32* %".100"
  br label %".81"
.88:
  %".103" = load i32, i32* %"st_num_pt"
  %".104" = getelementptr inbounds [1000 x i32], [1000 x i32]* %"st_num", i32 0, i32 %".103"
  %".105" = load i32, i32* %".104"
  %".106" = load i32, i32* %"st_num_pt"
  %".107" = sub i32 %".106", 1
  %".108" = getelementptr inbounds [1000 x i32], [1000 x i32]* %"st_num", i32 0, i32 %".107"
  %".109" = load i32, i32* %".108"
  %".110" = sdiv i32 %".105", %".109"
  %".111" = load i32, i32* %"st_num_pt"
  %".112" = sub i32 %".111", 1
  %".113" = getelementptr inbounds [1000 x i32], [1000 x i32]* %"st_num", i32 0, i32 %".112"
  store i32 %".110", i32* %".113"
  br label %".81"
.137:
  br label %".140"
.138:
  %".210" = load i32, i32* %"i"
  %".211" = getelementptr inbounds [1000 x i8], [1000 x i8]* %"expr", i32 0, i32 %".210"
  %".212" = load i8, i8* %".211"
  %".213" = icmp eq i8 %".212", 42
  br i1 %".213", label %".214", label %".215"
.140:
  %".144" = load i32, i32* %"st_op_pt"
  %".145" = icmp sge i32 %".144", 0
  %".146" = load i32, i32* %"st_op_pt"
  %".147" = getelementptr inbounds [1000 x i8], [1000 x i8]* %"st_op", i32 0, i32 %".146"
  %".148" = load i8, i8* %".147"
  %".149" = icmp eq i8 %".148", 42
  %".150" = load i32, i32* %"st_op_pt"
  %".151" = getelementptr inbounds [1000 x i8], [1000 x i8]* %"st_op", i32 0, i32 %".150"
  %".152" = load i8, i8* %".151"
  %".153" = icmp eq i8 %".152", 47
  %".154" = or i1 %".149", %".153"
  %".155" = and i1 %".145", %".154"
  br i1 %".155", label %".141", label %".142"
.141:
  br label %".157"
.142:
  %".200" = load i32, i32* %"st_op_pt"
  %".201" = add i32 %".200", 1
  store i32 %".201", i32* %"st_op_pt"
  %".203" = load i32, i32* %"st_op_pt"
  %".204" = getelementptr inbounds [1000 x i8], [1000 x i8]* %"st_op", i32 0, i32 %".203"
  store i8 45, i8* %".204"
  %".206" = load i32, i32* %"i"
  %".207" = sub i32 %".206", 1
  store i32 %".207", i32* %"i"
  br label %".54"
.157:
  %".160" = load i32, i32* %"st_op_pt"
  %".161" = getelementptr inbounds [1000 x i8], [1000 x i8]* %"st_op", i32 0, i32 %".160"
  %".162" = load i8, i8* %".161"
  %".163" = icmp eq i8 %".162", 42
  br i1 %".163", label %".164", label %".165"
.158:
  %".193" = load i32, i32* %"st_num_pt"
  %".194" = sub i32 %".193", 1
  store i32 %".194", i32* %"st_num_pt"
  %".196" = load i32, i32* %"st_op_pt"
  %".197" = sub i32 %".196", 1
  store i32 %".197", i32* %"st_op_pt"
  br label %".140"
.164:
  %".167" = load i32, i32* %"st_num_pt"
  %".168" = getelementptr inbounds [1000 x i32], [1000 x i32]* %"st_num", i32 0, i32 %".167"
  %".169" = load i32, i32* %".168"
  %".170" = load i32, i32* %"st_num_pt"
  %".171" = sub i32 %".170", 1
  %".172" = getelementptr inbounds [1000 x i32], [1000 x i32]* %"st_num", i32 0, i32 %".171"
  %".173" = load i32, i32* %".172"
  %".174" = mul i32 %".169", %".173"
  %".175" = load i32, i32* %"st_num_pt"
  %".176" = sub i32 %".175", 1
  %".177" = getelementptr inbounds [1000 x i32], [1000 x i32]* %"st_num", i32 0, i32 %".176"
  store i32 %".174", i32* %".177"
  br label %".158"
.165:
  %".180" = load i32, i32* %"st_num_pt"
  %".181" = getelementptr inbounds [1000 x i32], [1000 x i32]* %"st_num", i32 0, i32 %".180"
  %".182" = load i32, i32* %".181"
  %".183" = load i32, i32* %"st_num_pt"
  %".184" = sub i32 %".183", 1
  %".185" = getelementptr inbounds [1000 x i32], [1000 x i32]* %"st_num", i32 0, i32 %".184"
  %".186" = load i32, i32* %".185"
  %".187" = sdiv i32 %".182", %".186"
  %".188" = load i32, i32* %"st_num_pt"
  %".189" = sub i32 %".188", 1
  %".190" = getelementptr inbounds [1000 x i32], [1000 x i32]* %"st_num", i32 0, i32 %".189"
  store i32 %".187", i32* %".190"
  br label %".158"
.214:
  %".217" = load i32, i32* %"st_op_pt"
  %".218" = add i32 %".217", 1
  store i32 %".218", i32* %"st_op_pt"
  %".220" = load i32, i32* %"st_op_pt"
  %".221" = getelementptr inbounds [1000 x i8], [1000 x i8]* %"st_op", i32 0, i32 %".220"
  store i8 42, i8* %".221"
  %".223" = load i32, i32* %"i"
  %".224" = sub i32 %".223", 1
  store i32 %".224", i32* %"i"
  br label %".54"
.215:
  %".227" = load i32, i32* %"i"
  %".228" = getelementptr inbounds [1000 x i8], [1000 x i8]* %"expr", i32 0, i32 %".227"
  %".229" = load i8, i8* %".228"
  %".230" = icmp eq i8 %".229", 47
  br i1 %".230", label %".231", label %".232"
.231:
  %".234" = load i32, i32* %"st_op_pt"
  %".235" = add i32 %".234", 1
  store i32 %".235", i32* %"st_op_pt"
  %".237" = load i32, i32* %"st_op_pt"
  %".238" = getelementptr inbounds [1000 x i8], [1000 x i8]* %"st_op", i32 0, i32 %".237"
  store i8 47, i8* %".238"
  %".240" = load i32, i32* %"i"
  %".241" = sub i32 %".240", 1
  store i32 %".241", i32* %"i"
  br label %".54"
.232:
  %".244" = load i32, i32* %"i"
  %".245" = getelementptr inbounds [1000 x i8], [1000 x i8]* %"expr", i32 0, i32 %".244"
  %".246" = load i8, i8* %".245"
  %".247" = icmp eq i8 %".246", 41
  br i1 %".247", label %".248", label %".249"
.248:
  %".251" = load i32, i32* %"st_op_pt"
  %".252" = add i32 %".251", 1
  store i32 %".252", i32* %"st_op_pt"
  %".254" = load i32, i32* %"st_op_pt"
  %".255" = getelementptr inbounds [1000 x i8], [1000 x i8]* %"st_op", i32 0, i32 %".254"
  store i8 41, i8* %".255"
  %".257" = load i32, i32* %"i"
  %".258" = sub i32 %".257", 1
  store i32 %".258", i32* %"i"
  br label %".54"
.249:
  %".261" = load i32, i32* %"i"
  %".262" = getelementptr inbounds [1000 x i8], [1000 x i8]* %"expr", i32 0, i32 %".261"
  %".263" = load i8, i8* %".262"
  %".264" = icmp eq i8 %".263", 40
  br i1 %".264", label %".265", label %".266"
.265:
  br label %".268"
.266:
  store i32 0, i32* %"num"
  store i32 1, i32* %"k"
  br label %".373"
.268:
  %".272" = load i32, i32* %"st_op_pt"
  %".273" = getelementptr inbounds [1000 x i8], [1000 x i8]* %"st_op", i32 0, i32 %".272"
  %".274" = load i8, i8* %".273"
  %".275" = icmp ne i8 %".274", 41
  br i1 %".275", label %".269", label %".270"
.269:
  %"ch" = alloca i8
  %".277" = load i32, i32* %"st_op_pt"
  %".278" = getelementptr inbounds [1000 x i8], [1000 x i8]* %"st_op", i32 0, i32 %".277"
  %".279" = load i8, i8* %".278"
  store i8 %".279", i8* %"ch"
  %".281" = load i32, i32* %"st_op_pt"
  %".282" = sub i32 %".281", 1
  store i32 %".282", i32* %"st_op_pt"
  br label %".284"
.270:
  %".364" = load i32, i32* %"st_op_pt"
  %".365" = sub i32 %".364", 1
  store i32 %".365", i32* %"st_op_pt"
  %".367" = load i32, i32* %"i"
  %".368" = sub i32 %".367", 1
  store i32 %".368", i32* %"i"
  br label %".54"
.284:
  %".287" = load i8, i8* %"ch"
  %".288" = icmp eq i8 %".287", 43
  br i1 %".288", label %".289", label %".290"
.285:
  %".360" = load i32, i32* %"st_num_pt"
  %".361" = sub i32 %".360", 1
  store i32 %".361", i32* %"st_num_pt"
  br label %".268"
.289:
  %".292" = load i32, i32* %"st_num_pt"
  %".293" = getelementptr inbounds [1000 x i32], [1000 x i32]* %"st_num", i32 0, i32 %".292"
  %".294" = load i32, i32* %".293"
  %".295" = load i32, i32* %"st_num_pt"
  %".296" = sub i32 %".295", 1
  %".297" = getelementptr inbounds [1000 x i32], [1000 x i32]* %"st_num", i32 0, i32 %".296"
  %".298" = load i32, i32* %".297"
  %".299" = add i32 %".294", %".298"
  %".300" = load i32, i32* %"st_num_pt"
  %".301" = sub i32 %".300", 1
  %".302" = getelementptr inbounds [1000 x i32], [1000 x i32]* %"st_num", i32 0, i32 %".301"
  store i32 %".299", i32* %".302"
  br label %".285"
.290:
  %".305" = load i8, i8* %"ch"
  %".306" = icmp eq i8 %".305", 45
  br i1 %".306", label %".307", label %".308"
.307:
  %".310" = load i32, i32* %"st_num_pt"
  %".311" = getelementptr inbounds [1000 x i32], [1000 x i32]* %"st_num", i32 0, i32 %".310"
  %".312" = load i32, i32* %".311"
  %".313" = load i32, i32* %"st_num_pt"
  %".314" = sub i32 %".313", 1
  %".315" = getelementptr inbounds [1000 x i32], [1000 x i32]* %"st_num", i32 0, i32 %".314"
  %".316" = load i32, i32* %".315"
  %".317" = sub i32 %".312", %".316"
  %".318" = load i32, i32* %"st_num_pt"
  %".319" = sub i32 %".318", 1
  %".320" = getelementptr inbounds [1000 x i32], [1000 x i32]* %"st_num", i32 0, i32 %".319"
  store i32 %".317", i32* %".320"
  br label %".285"
.308:
  %".323" = load i8, i8* %"ch"
  %".324" = icmp eq i8 %".323", 42
  br i1 %".324", label %".325", label %".326"
.325:
  %".328" = load i32, i32* %"st_num_pt"
  %".329" = getelementptr inbounds [1000 x i32], [1000 x i32]* %"st_num", i32 0, i32 %".328"
  %".330" = load i32, i32* %".329"
  %".331" = load i32, i32* %"st_num_pt"
  %".332" = sub i32 %".331", 1
  %".333" = getelementptr inbounds [1000 x i32], [1000 x i32]* %"st_num", i32 0, i32 %".332"
  %".334" = load i32, i32* %".333"
  %".335" = mul i32 %".330", %".334"
  %".336" = load i32, i32* %"st_num_pt"
  %".337" = sub i32 %".336", 1
  %".338" = getelementptr inbounds [1000 x i32], [1000 x i32]* %"st_num", i32 0, i32 %".337"
  store i32 %".335", i32* %".338"
  br label %".285"
.326:
  %".341" = load i8, i8* %"ch"
  %".342" = icmp eq i8 %".341", 47
  br i1 %".342", label %".343", label %".344"
.343:
  %".346" = load i32, i32* %"st_num_pt"
  %".347" = getelementptr inbounds [1000 x i32], [1000 x i32]* %"st_num", i32 0, i32 %".346"
  %".348" = load i32, i32* %".347"
  %".349" = load i32, i32* %"st_num_pt"
  %".350" = sub i32 %".349", 1
  %".351" = getelementptr inbounds [1000 x i32], [1000 x i32]* %"st_num", i32 0, i32 %".350"
  %".352" = load i32, i32* %".351"
  %".353" = sdiv i32 %".348", %".352"
  %".354" = load i32, i32* %"st_num_pt"
  %".355" = sub i32 %".354", 1
  %".356" = getelementptr inbounds [1000 x i32], [1000 x i32]* %"st_num", i32 0, i32 %".355"
  store i32 %".353", i32* %".356"
  br label %".285"
.344:
  br label %".285"
.373:
  %".377" = load i32, i32* %"i"
  %".378" = icmp sge i32 %".377", 0
  %".379" = load i32, i32* %"i"
  %".380" = getelementptr inbounds [1000 x i8], [1000 x i8]* %"expr", i32 0, i32 %".379"
  %".381" = load i8, i8* %".380"
  %".382" = icmp sge i8 %".381", 48
  %".383" = and i1 %".378", %".382"
  %".384" = load i32, i32* %"i"
  %".385" = getelementptr inbounds [1000 x i8], [1000 x i8]* %"expr", i32 0, i32 %".384"
  %".386" = load i8, i8* %".385"
  %".387" = icmp sle i8 %".386", 57
  %".388" = and i1 %".383", %".387"
  br i1 %".388", label %".374", label %".375"
.374:
  %".390" = load i32, i32* %"num"
  %".391" = load i32, i32* %"i"
  %".392" = getelementptr inbounds [1000 x i8], [1000 x i8]* %"expr", i32 0, i32 %".391"
  %".393" = load i8, i8* %".392"
  %".394" = sub i8 %".393", 48
  %".395" = load i32, i32* %"k"
  %".396" = sext i8 %".394" to i32
  %".397" = mul i32 %".396", %".395"
  %".398" = add i32 %".390", %".397"
  store i32 %".398", i32* %"num"
  %".400" = load i32, i32* %"k"
  %".401" = mul i32 %".400", 10
  store i32 %".401", i32* %"k"
  %".403" = load i32, i32* %"i"
  %".404" = sub i32 %".403", 1
  store i32 %".404", i32* %"i"
  br label %".373"
.375:
  %".407" = load i32, i32* %"st_num_pt"
  %".408" = add i32 %".407", 1
  store i32 %".408", i32* %"st_num_pt"
  %".410" = load i32, i32* %"num"
  %".411" = load i32, i32* %"st_num_pt"
  %".412" = getelementptr inbounds [1000 x i32], [1000 x i32]* %"st_num", i32 0, i32 %".411"
  store i32 %".410", i32* %".412"
  br label %".54"
}

declare i32 @"gets"(...) 

declare i32 @"strlen"(i8* %".1") 

declare i32 @"printf"(i8* %".1", ...) 

@".str0" = constant [4 x i8] c"%d\0a\00"