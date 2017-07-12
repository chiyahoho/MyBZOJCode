//[ZJOI2008]ÅİÅİÌÃBNB
type ty=array[0..1000000]of longint;
var
  i,n:longint;
  a,b,z1,z2,s1,s2:ty;

procedure swap(var a,b:longint);
var c:longint;
begin c:=a; a:=b; b:=c; end;

procedure sort(l,r:longint);
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
      inc(i); dec(j);
    end;
  until i>j;
  if l<j then sort(l,j);
  if i<r then sort(i,r);
end;

function main(a,b:ty):longint;
var p1,p2,i,ans,t:longint;
begin
  fillchar(s1,sizeof(s1),0);
  fillchar(s2,sizeof(s2),0);

  p1:=1; p2:=1;
  for i:=1 to n do begin
        while (a[i]>=b[p1])and(p1<=n) do inc(p1);
        while (a[i]>b[p2])and(p2<=n) do inc(p2);
        z1[i]:=i-p1+1; z2[i]:=i-p2+1;
        inc(s1[z1[i]]); inc(s2[z2[i]]);
  end;

  ans:=-maxlongint; t:=0;
  for i:=1 to n do begin
        if z2[i]<=0 then inc(t);
        if z1[i]<=0 then inc(t);
  end;
  if t>ans then ans:=t;
  for i:=1 to n do begin
        dec(s1[z1[i]]); dec(s2[z2[i]]);
        if z1[i]-i+1<=0 then dec(t);
        if z2[i]-i+1<=0 then dec(t);
        inc(t,s1[i]);
        inc(t,s2[i]);
        if t>ans then ans:=t;
  end;
  exit(ans);
end;

begin
assign(input,'1034.in'); reset(input);
assign(output,'1034.out'); rewrite(output);
  readln(n);
  for i:=1 to n do readln(b[i]);
  sort(1,n); a:=b;
  for i:=1 to n do readln(b[i]);
  sort(1,n);
  write(main(a,b),' ',2*n-main(b,a));
close(output);
end.
