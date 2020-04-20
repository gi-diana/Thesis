function [Y] = lewis_factor(Zn)
load lewisdata
i=1;


 while lewisdata.Z(i)<Zn
         i=i+1;
 end

 Y=lewisdata.Y(i);

end

