//Poi2012]Prefixuffix
const 	mo=1000000007;
var
	n,i,l,n2,ans:longint;
	f,g,a:array[0..2000000]of int64;
	ch:char;
	o,o1,o2:int64;
begin
assign(input,'2803.in'); reset(input);
assign(output,'2803.out'); rewrite(output);
	readln(n); g[1]:=1;
	for i:=1 to n do begin
		read(ch);
		a[i]:=ord(ch)-ord('a');
		if i<>1 then g[i]:=(g[i-1]*29)mod mo;
	end;
	n2:=n div 2; o:=1;
	for l:=n2 downto 1 do begin
		f[l]:=f[l+1]+2;
		o1:=(a[l+1]*o+o1*29+a[l+f[l]]*g[f[l]]*o)mod mo;
		o2:=(a[n+1-(l+f[l])]*o+o2*29+a[n+1-(l+1)]*g[f[l]]*o)mod mo;
		while (n2-l<f[l])or( (f[l]>0)and(o1<>o2) ) do begin
			o1:=((mo+o1-(a[l+f[l]]*g[f[l]]*o)mod mo)mod mo)*29 mod mo;
			o2:=(mo+o2-(a[n+1-(l+f[l])]*o)mod mo)mod mo;
			o:=(o*29)mod mo;
			dec(f[l]);
		end;
	end;
	o1:=0; o2:=0; ans:=0;
	for i:=1 to n2-1 do begin
		o1:=(o1+a[i]*g[i])mod mo;
		o2:=(o2*29+a[n+1-i])mod mo;
		if (o1=o2)and(f[i]>0)and(f[i]+i>ans) then ans:=f[i]+i; 
	end;
	writeln(ans);
close(output);
end.
