//Poi2012]Fibonacci Representation
var
	ca,cas,ans,i:longint;
	k,n:int64;
	f:array[0..100]of int64;
begin
assign(input,'2796.in'); reset(input);
assign(output,'2796.out'); rewrite(output);
	f[1]:=1; f[2]:=1;
	for i:=3 to 90 do f[i]:=f[i-1]+f[i-2];
	readln(ca);
	for cas:=1 to ca do begin
		readln(n);
		ans:=0;
		while n>0 do begin
			inc(ans);
			for i:=1 to 90 do if f[i]>n then break;
			k:=n-f[i-1]; if f[i]-n<k then k:=f[i]-n;
			n:=k;
		end;
		writeln(ans);
	end;
close(output);
end.
