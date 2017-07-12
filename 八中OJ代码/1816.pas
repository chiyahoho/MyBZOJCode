//Cqoi2010]ÆË¿ËÅÆ
var
        i:longint;
        n,l,r,m,s,ans:int64;
        a:array[0..1000]of int64;

begin
assign(input,'1816.in'); reset(input);
assign(output,'1816.out'); rewrite(output);
        readln(n,a[n+1]);
        for i:=1 to n do read(a[i]);
        inc(n);
        l:=0; r:=10000000000;
        while l<=r do begin
                m:=(l+r)>>1; s:=0;
                for i:=1 to n do if m>a[i] then inc(s,m-a[i]);
                if s<=m then begin
                        ans:=m;
                        l:=m+1;
                end
                else r:=m-1;
        end;
        writeln(ans);
close(output);
end.
