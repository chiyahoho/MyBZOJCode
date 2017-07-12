//[FJOI2007]ÂÖ×´²¡¶¾ 
type gj=array[0..5000]of longint;
var
  n,i:longint;
  f,g:array[0..200]of gj;
  ans:gj;

function jia(a,b:gj):gj;
var c:gj;
i:longint;
begin
  fillchar(c,sizeof(c),0);
  if a[0]>b[0] then c[0]:=a[0] else c[0]:=b[0];
  for i:=1 to c[0] do c[i]:=a[i]+b[i];
  for i:=1 to c[0] do if c[i]>=10 then begin
        dec(c[i],10);
        inc(c[i+1],1);
  end;
  if c[c[0]+1]>0 then inc(c[0]);
  jia:=c;
end;

begin
assign(input,'1002.in'); reset(input);
assign(output,'1002.out'); rewrite(output);
  readln(n);
  f[1,0]:=1; f[1,1]:=1; g[1,0]:=1;; g[1,1]:=1;
  for i:=2 to n do begin
        f[i]:=jia(f[i-1],f[i-1]);
        f[i]:=jia(f[i],g[i-1]);
        g[i]:=jia(f[i-1],g[i-1]);
  end;
  for i:=1 to n do ans:=jia(ans,f[i]);
  ans:=jia(ans,g[n]);
  dec(ans[1]); i:=1;
  while ans[i]<0 do begin
        inc(ans[i],10);
        inc(i); dec(ans[i]);
  end;
  if ans[ans[0]]=0 then dec(ans[0]);
  for i:=ans[0] downto 1 do write(ans[i]);
close(output);
end.
