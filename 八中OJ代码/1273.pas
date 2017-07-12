//BeiJingWc2008]ађСа
var
        n,m,i,j,x,mo,t,l,r:longint;
        g:array[0..20]of longint;
        s:array[0..20,0..100000]of longint;
        ch:char;
        ans:int64;
begin
assign(input,'1273.in'); reset(input);
assign(output,'1273.out'); rewrite(output);
        readln(n,m);
        for i:=0 to 17 do g[i]:=1<<i; mo:=g[16];
        for i:=1 to n do begin
                readln(x);
                for j:=1 to 16 do inc(s[j,x mod g[j]]);
        end;

        for i:=1 to 16 do
        for j:=1 to g[i] do
        inc(s[i,j],s[i,j-1]);

        t:=1;
        for i:=1 to m do begin
                readln(ch,x);
                if ch='A' then t:=(t+x)mod g[16]
                else begin
                        if x>16 then continue;
                        l:=(g[x]-t+mo)mod g[x+1];
                        r:=(g[x+1]-t+mo)mod g[x+1];
                        if l<=r then inc(ans, s[x+1,r]-s[x+1,l] )
                                else inc(ans, n-s[x+1,l]+s[x+1,r] );
                end;
        end;
        writeln(ans);
close(output);
end.
