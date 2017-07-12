//2010Beijing Wc]ÍâÐÇÁªÂç
var
        n,i,j,p,tot:longint;
        a:array[0..5000000]of longint;
        t:array[0..5000000,'0'..'1']of longint;
        s:array[0..10000]of char;

procedure dfs(p:longint);
begin
        if a[p]=1 then exit;
        writeln(a[p]);
        if t[p,'0']>0 then dfs(t[p,'0']);
        if t[p,'1']>0 then dfs(t[p,'1']);
end;

begin
assign(input,'2251.in'); reset(input);
assign(output,'2251.out'); rewrite(output);
        readln(n);
        for i:=1 to n do read(s[i]);
        for i:=1 to n do begin
                p:=0;
                for j:=i to n do begin
                        if t[p,s[j]]=0 then begin inc(tot); t[p,s[j]]:=tot; end;
                        p:=t[p,s[j]];
                        inc(a[p]);
                end;
        end;
        if t[0,'0']>0 then dfs(t[0,'0']);
        if t[0,'1']>0 then dfs(t[0,'1']);
close(output);
end.