//HNOI2006]公路修建问题
var
        n,k,m,i,l,r,mi,ans:longint;
        a,b,c1,c2,fa:array[0..100000]of longint;

function gf(u:longint):longint;
begin
        if fa[u]=u then exit(u);
        fa[u]:=gf(fa[u]);
        exit(fa[u]);
end;

function check(tt:longint):boolean;
var     t,i,u,v:longint;
begin
        t:=0;
        for i:=1 to n do fa[i]:=i;
        for i:=1 to m do if c1[i]<=tt then begin
                u:=gf(a[i]); v:=gf(b[i]);
                if u<>v then begin
                        fa[v]:=u;
                        inc(t);
                end;
        end;
        if t<k then exit(false);
        for i:=1 to m do if c2[i]<=tt then begin
                u:=gf(a[i]); v:=gf(b[i]);
                if u<>v then begin
                        fa[v]:=u;
                        inc(t);
                end;
        end;
        exit(t=n-1);
end;

begin
assign(input,'1196.in'); reset(input);
assign(output,'1196.out'); rewrite(output);
        readln(n,k,m);
        for i:=1 to m do readln(a[i],b[i],c1[i],c2[i]);
        l:=0; r:=30000;
        while l<=r do begin
                mi:=(l+r)>>1;
                if check(mi) then begin
                        ans:=mi;
                        r:=mi-1;
                end
                else l:=mi+1;
        end;
        writeln(ans);
close(output);
end.