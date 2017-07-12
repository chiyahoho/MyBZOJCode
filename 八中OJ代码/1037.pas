//[ZJOI2008]ÉúÈÕ¾Û»áParty
var
  n,m,k,i,j,k1,k2,ans:longint;
  f:array[0..160,0..160,0..22,0..22]of longint;

function max(a,b:longint):longint;
begin if a>b then exit(a); exit(b); end;
begin
assign(input,'1037.in'); reset(input);
assign(output,'1037.out'); rewrite(output);
  readln(n,m,k);
  f[0,0,0,0]:=1;
  for i:=0 to n do
    for j:=0 to m do
      for k1:=0 to k do
        for k2:=0 to k do begin
            f[i+1,j,k1+1,max(k2-1,0)]:=(f[i+1,j,k1+1,max(k2-1,0)]+f[i,j,k1,k2]) mod 12345678;
            f[i,j+1,max(k1-1,0),k2+1]:=(f[i,j+1,max(k1-1,0),k2+1]+f[i,j,k1,k2]) mod 12345678;
        end;
  for k1:=0 to k do for k2:=0 to k do ans:=(ans+f[n,m,k1,k2])mod 12345678;
  writeln(ans);
close(output);
end.
