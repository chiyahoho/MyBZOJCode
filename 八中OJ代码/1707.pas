//Usaco2007 Nov]tanning·ÖÅä·ÀÉ¹Ëª
var
        i,j,n,m,ans:longint;
        a,b,c,t:array[0..10000]of longint;

procedure swap(var a,b:longint);
var c:longint;begin c:=a; a:=b; b:=c; end;

procedure sort1(l,r:longint);
var
  i,j,x:longint;
begin
  i:=l; j:=r;
  x:=b[(l+r)>>1];
  repeat
    while b[i]<x do inc(i);
    while x<b[j] do dec(j);
    if not(i>j) then begin
      swap(b[i],b[j]);
      swap(a[i],a[j]);
      inc(i); dec(j);
    end;
  until i>j;
  if l<j then sort1(l,j);
  if i<r then sort1(i,r);
end;

procedure sort2(l,r:longint);
var
  i,j,x:longint;
begin
  i:=l; j:=r;
  x:=c[(l+r)>>1];
  repeat
    while c[i]<x do inc(i);
    while x<c[j] do dec(j);
    if not(i>j) then begin
      swap(c[i],c[j]);
      swap(t[i],t[j]);
      inc(i); dec(j);
    end;
  until i>j;
  if l<j then sort2(l,j);
  if i<r then sort2(i,r);
end;

begin
assign(input,'1707.in'); reset(input);
assign(output,'1707.out'); rewrite(output);
        readln(n,m);
        for i:=1 to n do readln(a[i],b[i]);
        for i:=1 to m do readln(c[i],t[i]);
        sort1(1,n); sort2(1,m);
        for i:=1 to n do
        for j:=1 to m do
        if (a[i]<=c[j])and(c[j]<=b[i])and(t[j]>0) then begin
                inc(ans);
                dec(t[j]);
                break;
        end;
        writeln(ans);
close(output);
end.