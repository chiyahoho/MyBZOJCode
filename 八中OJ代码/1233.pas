//Usaco2009Open]¸É²İ¶Ñtower 
var
        i,l,r,n:longint;
        a,s,h,f,q:array[0..300000]of longint;
begin
assign(input,'1233.in'); reset(input);
assign(output,'1233.out'); rewrite(output);
        readln(n);
        for i:=1 to n do begin readln(a[i]); s[i]:=s[i-1]+a[i]; end;
        l:=1; r:=1; q[1]:=n+1;
        for i:=n downto 1 do begin
                while (r-l>0)and(s[q[l+1]-1]-s[i-1]>=f[q[l+1]]) do inc(l);
                f[i]:=s[q[l]-1]-s[i-1];
                h[i]:=h[q[l]]+1;
                while (r>=l)and(f[i]<=f[q[r]]-(s[q[r]-1]-s[i-1])) do dec(r);
                inc(r); q[r]:=i;
        end;
        writeln(h[1]);
close(output);
end.