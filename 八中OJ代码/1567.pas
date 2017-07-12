//JSOI2008]Blue MaryµÄÕ½ÒÛµØÍ¼
const   mo=9000007; base=33;
var
        n,i,j,k,l,r,ans,mi:longint;
        x:int64;
        a,b,s1,s2,g:array[0..100,0..100]of int64;
        gg:array[0..10000]of int64;

function check(l:longint):boolean;
var     ai,bi,aj,bj:longint;
        opt1,opt2:int64;
begin
        for ai:=l to n do
        for aj:=l to n do
        for bi:=l to n do
        for bj:=l to n do begin
                opt1:=( s1[ai,aj]-s1[ai,aj-l]-s1[ai-l,aj]+s1[ai-l,aj-l] +mo+mo)mod mo;
                opt2:=( s2[bi,bj]-s2[bi,bj-l]-s2[bi-l,bj]+s2[bi-l,bj-l] +mo+mo)mod mo;
                if (opt1*g[bi-l+1,bj-l+1])mod mo=(opt2*g[ai-l+1,aj-l+1])mod mo then exit(true);
        end;
        exit(false);
end;

begin
assign(input,'1567.in'); reset(input);
assign(output,'1567.out'); rewrite(output);
        readln(n);
        for i:=1 to n do
        for j:=1 to n do begin read(x); a[i,j]:=x mod mo; end;
        for i:=1 to n do
        for j:=1 to n do begin read(x); b[i,j]:=x mod mo; end;

        gg[1]:=1; for i:=2 to n*n do gg[i]:=(gg[i-1]*base)mod mo;
        for i:=1 to n do
        for j:=1 to n do g[i,j]:=gg[(i-1)*n+j];

        for i:=1 to n do
        for j:=1 to n do begin
                s1[i,j]:=s1[i-1,j];
                for k:=1 to j do s1[i,j]:=(s1[i,j]+a[i,k]*g[i,k])mod mo;
                s2[i,j]:=s2[i-1,j];
                for k:=1 to j do s2[i,j]:=(s2[i,j]+b[i,k]*g[i,k])mod mo;
        end;

        l:=1; r:=n;
        while l<=r do begin
                mi:=(l+r)>>1;
                if check(mi) then begin
                        ans:=mi;
                        l:=mi+1;
                end
                else r:=mi-1;
        end;
        writeln(ans);
close(output);
end.
