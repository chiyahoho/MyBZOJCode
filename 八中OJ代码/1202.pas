//HNOI2005]½Æ»«µÄÉÌÈË
var
        n,m,ca,i,u,v,l,fu,fv:longint;
        flag:boolean;
        a,fa:array[0..1000]of longint;

function gf(u:longint):longint;
var     k:longint;
begin
        if fa[u]=u then exit(u);
        k:=gf(fa[u]);
        inc(a[u],a[fa[u]]);
        fa[u]:=k;
        exit(k);
end;

begin
assign(input,'1202.in'); reset(input);
assign(output,'1202.out'); rewrite(output);
readln(ca);
for ca:=ca downto 1 do begin
        readln(n,m);
        flag:=true;
        for i:=0 to n do begin a[i]:=0; fa[i]:=i; end;
        for i:=1 to m do begin
                readln(u,v,l); dec(u);
                fu:=gf(u); fv:=gf(v);
                if fu<>fv then begin
                        fa[fu]:=fv;
                        a[fu]:=a[v]-l-a[u];
                end
                else if a[v]-a[u]<>l then flag:=false;
        end;
        if flag then writeln('true') else writeln('false');
end;
close(output);
end.
