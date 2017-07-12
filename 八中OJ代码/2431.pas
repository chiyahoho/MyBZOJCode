//HAOI2009]ÄæÐò¶ÔÊýÁÐ
var
        i,j,n,m:longint;
        f,s:array[0..1200,-1..1200]of longint;

function max(a,b:longint):longint;
begin if a>b then exit(a); exit(b); end;

begin
assign(input,'2431.in'); reset(input);
assign(output,'2431.out'); rewrite(output);
        readln(n,m);
        for j:=0 to m do s[0,j]:=1;
        for i:=1 to n do
        for j:=0 to m do begin
                f[i,j]:=(s[i-1,j]-s[i-1,max(-1,j-i)])mod 10000;
                s[i,j]:=s[i,j-1]+f[i,j];
        end;
        writeln(f[n,m]);
close(output);
end.