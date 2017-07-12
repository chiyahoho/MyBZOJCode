//Ctsc2011]ĞÒ¸£Â·¾¶
const   o=0.0000001;
var
        ans,tt,p:double;
        n,m,i,j,k,y,u,v,uu,et:longint;
        f:array[0..200,0..200,0..200]of double;
        w,g:array[0..10000]of double;
        h:array[0..10000]of longint;
        e:array[0..100000]of record v,n:longint; end;

procedure add(u,v:longint);
begin
        inc(et);
        e[et].v:=v;
        e[et].n:=h[u];
        h[u]:=et;
end;

procedure tget(a:double; var b:double);
begin if a>b then b:=a; end;

begin
assign(input,'2306.in'); reset(input);
assign(output,'2306.out'); rewrite(output);
        readln(n,m);
        for i:=1 to n do read(w[i]); readln;
        readln(uu);
        readln(p);
        for i:=1 to m do begin
                readln(u,v);
                add(u,v);
        end;

        g[0]:=1; for i:=1 to n+1 do g[i]:=g[i-1]*p;
        for i:=1 to n do
        for j:=1 to n do
        for k:=0 to n+2 do
        f[i,j,k]:=-1000;
        for i:=1 to n do f[i,i,0]:=w[i];

        for k:=0 to n do
        for i:=1 to n do
        for j:=1 to n do if f[i,j,k]>-o then begin
                y:=h[j];
                while y<>0 do begin
                        v:=e[y].v;
                        tget(f[i,j,k]+w[v]*g[k+1],f[i,v,k+1]);
                        y:=e[y].n;
                end;
        end;

        for i:=1 to n do begin
                tt:=0;
                for k:=1 to n+1 do if f[i,i,k]-w[i]>-o then tget( (f[i,i,k]-w[i]) / (1-g[k]),tt);
                for k:=1 to n+1 do if f[uu,i,k]>-o then
                tget(f[uu,i,k]+tt*g[k],ans);
        end;
        writeln(ans:0:1);
close(output);
end.
