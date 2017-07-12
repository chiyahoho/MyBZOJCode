//[Oibh]新型计算机 
var
  n,i,l,r,p,ans:longint;
  a,q,t:array[0..2000000]of longint;
  f:array[0..2000000]of boolean;
procedure add(p:longint);
begin
  if (p<=0)or(p>n+1)or f[p] then exit;
  inc(r);
  q[r]:=p; t[r]:=t[l]+1;
  f[p]:=true;
end;
begin
assign(input,'2259.in'); reset(input);
assign(output,'2259.out'); rewrite(output);
  readln(n);
  for i:=1 to n do read(a[i]);
  ans:=maxlongint;
  q[1]:=1; t[1]:=0; f[1]:=true;
  l:=0; r:=1;
  while l<r do begin
      inc(l);
      p:=q[l];
      if (p>=n+1)and(ans>p-n-1+t[l]) then ans:=p-n-1+t[l];
      p:=p+a[p]+1;
      while (p<n+1)and(not f[p]) do begin
            f[p]:=true;
            inc(r);
            q[r]:=p; t[r]:=t[l];
            p:=p+a[p]+1;
      end;
      if (p>=n+1)and(ans>p-n-1+t[l]) then ans:=p-n-1+t[l];
      if l<>1 then begin add(q[l]-1); add(q[l]+1); end;
  end;
  if n<>0 then writeln(ans) else writeln(0);
close(output);
end.