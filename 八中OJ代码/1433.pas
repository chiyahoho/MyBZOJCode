//ZJOI2009]¼ÙÆÚµÄËÞÉá
const   oo=maxlongint>>1;
var
        ca,cas,i,j,x,ans,et,tt,ss,n:longint;
        h,y,f1,f2,g,vg:array[0..130]of longint;
        e:array[-100000..100000]of record v,n,l:longint; end;

function min(a,b:longint):longint;
begin if a>b then exit(b); exit(a); end;

procedure add(u,v,l:longint);
begin
        inc(et);
        e[et].v:=v; e[-et].v:=u;
        e[et].l:=l; e[-et].l:=0;
        e[et].n:=h[u]; e[-et].n:=h[v];
        h[u]:=et; h[v]:=-et;
end;

function sap(u,flow:longint):longint;
var     ff:longint;
begin
        if u=tt then exit(flow);
        sap:=0;
        while y[u]<>0 do begin
                if (g[u]=g[e[y[u]].v]+1)and(e[y[u]].l>0) then begin
                        ff:=sap(e[y[u]].v,min(flow-sap,e[y[u]].l));
                        inc(sap,ff);
                        dec(e[y[u]].l,ff);
                        inc(e[-y[u]].l,ff);
                        if sap=flow then exit;
                end;
                y[u]:=e[y[u]].n;
        end;
        if g[ss]=tt then exit;
        dec(vg[g[u]]); if vg[g[u]]=0 then g[ss]:=tt;
        inc(g[u]); inc(vg[g[u]]);
        y[u]:=h[u];
end;

begin
assign(input,'1433.in'); reset(input);
assign(output,'1433.out'); rewrite(output);
readln(ca);
for cas:=1 to ca do begin
        readln(n);
        ss:=0; tt:=2*n+1; et:=0; ans:=0;
        fillchar(h,sizeof(h),0);
        fillchar(g,sizeof(g),0);
        fillchar(vg,sizeof(vg),0);

        for i:=1 to n do begin
                read(f1[i]);
                if f1[i]=1 then add(i+n,tt,1);
        end;
        readln;
        for i:=1 to n do begin
                read(f2[i]);
                if (f1[i]=0)or(f2[i]=0) then begin add(0,i,1); inc(ans); end;
        end;
        readln;
        for i:=1 to n do begin
                add(i,i+n,1);
                for j:=1 to n do begin
                        read(x);
                        if x=1 then add(i,j+n,1);
                end;
                readln;
        end;

        for i:=0 to tt do y[i]:=h[i];
        g[0]:=1; vg[1]:=1; vg[0]:=oo;
        while g[0]<tt do dec(ans,sap(0,oo));

        if ans=0 then writeln('^_^') else writeln('T_T');
end;
close(output);
end.
