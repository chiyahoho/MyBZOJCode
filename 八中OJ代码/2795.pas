//Poi2012]A Horrible Poem
const	mo=19950317; maxN=1200000; bace=13331;
var
	i,n,j,k,m,u,v,l,ans:longint;
	s,g:array[0..maxN]of int64;
	f,a:array[0..maxN]of longint;
	ch:char;

function check(u,l,k:longint):boolean;
begin
	k:=l div k;
	exit( ((mo+s[u+l-1]-s[u+k-1])*g[u]+(mo+s[u+k-1]-s[u-1])*((g[u+k]*g[l-k+1])mod mo))mod mo=((mo+s[u+l-1]-s[u-1])*g[u+k])mod mo );
end;

begin
assign(input,'2795.in'); reset(input);
assign(output,'2795.out'); rewrite(output);
	readln(n); g[1]:=1;
	for i:=1 to n do begin
		read(ch);
		k:=ord(ch)-ord('a');
		if i<>1 then g[i]:=(g[i-1]*bace)mod mo;
		s[i]:=(s[i-1]+k*g[i])mod mo;
		f[i]:=i;
	end;
	readln;
	for i:=2 to n do begin
		if f[i]=i then begin inc(a[0]); a[a[0]]:=i; end;
		for j:=1 to a[0] do if i*a[j]<=n then begin
			f[i*a[j]]:=a[j];
			if i mod a[j]=0 then break;
		end
		else break;
	end;
	
	readln(m);
	for i:=1 to m do begin
		readln(u,v); l:=v-u+1; ans:=l;
		while l>1 do begin
			if check(u,ans,f[l]) then ans:=ans div f[l];
			l:=l div f[l];
		end;
		writeln(ans);
	end;
close(output);
end.
