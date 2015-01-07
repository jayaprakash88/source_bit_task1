class Source_class
def initialize
@hash=[["1*3",5000],["3*3",15000],["1*3",6000],["2*3",2000],["1*3",2000],["2*3",3000],["3*3",10000],["1*3",15000]]
end
def source_method
first_out=[]
first_avoid_min_val=[]
@hash.each do |x|
 if (x[0]=="1*3")
  if first_out.empty?
   first_out[0] = @hash.index(x).to_s 
   first_out[1] = x[1] 
   first_avoid_min_val << x[1] 
  else
   first_avoid_min_val.each do |min_val|
   if min_val.to_f < x[1].to_f
   first_out[0] = first_out[0].to_s + ',' + @hash.index(x).to_s 
   first_out[1] = first_out[1].to_f + x[1].to_f 
   first_avoid_min_val << x[1] 
   break;
  end
 end
end
end
end
#p first_out
first_max=[0,0]
z= first_out[0].split(',')
z.each do |y|
first=@hash[y.to_i]
first_max[0] = y.to_i if first_max[1].to_f  < first[1].to_f	
first_max[1] = first[1].to_f if first_max[1].to_f  < first[1].to_f	
end
#p first_out
#p first_max

second_max=[0,0]
@hash.each do |x|
 if (x[0]=="2*3")
 second_max[0] = @hash.index(x).to_s if second_max[1].to_f  < x[1].to_f	
 second_max[1] = x[1].to_f if second_max[1].to_f  < x[1].to_f
end
end
#p second_max
third_max=[0,0]
@hash.each do |x|
 if (x[0]=="3*3")
 third_max[0] = @hash.index(x).to_s if third_max[1].to_f  < x[1].to_f	
 third_max[1] = x[1].to_f if third_max[1].to_f  < x[1].to_f
end
end
#p third_max
combine_first_second_max = []
combine_first_second_max[0]=first_max[0].to_s + ',' + second_max[0].to_s
combine_first_second_max[1]=first_max[1].to_f + second_max[1].to_f
#p combine_first_second_max
result=[]
if first_out[1].to_f < combine_first_second_max[1].to_f
if combine_first_second_max[1].to_f < third_max[1].to_f
result = third_max
else
result = combine_first_second_max
end
elsif first_out[1].to_f > third_max[1].to_f
result= first_out
else
result= third_max
end
p result
end
end
Source_class.new.source_method
