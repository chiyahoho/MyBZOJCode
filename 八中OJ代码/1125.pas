//POI2008]Poc
const   mo=6000007; base=131;
        maxN=1200; maxL=120; maxM=10000000;
var
        n,l,m,tot,i,j,x1,y1,x2,y2,cc:longint;
        wd:array[0..maxN,0..maxL]of longint;
        g:array[0..maxL]of longint;
        now,ans,pre:array[0..maxN]of longint;
        t:array[0..mo]of longint;
        s,ls,rs:array[0..maxM]of longint;
        ch:char;
        fg:boolean;

procedure insert(p,l,r,a,c:longint);
var     mi:longint;
begin
        if s[p]<c then s[p]:=c;
        if l=r then begin s[p]:=c; exit; end;
        mi:=(l+r)>>1;
        if a<=mi then begin
                if ls[p]=0 then begin inc(tot); ls[p]:=tot; end;
                insert(ls[p],l,mi,a,c);
        end
        else begin
                if rs[p]=0 then begin inc(tot); rs[p]:=tot; end;
                insert(rs[p],mi+1,r,a,c);
        end;
end;

function get(p,l,r,a,b,x:longint):longint;
var     mi:longint;
begin
        if (l=a)and(r=b) then begin
                if ans[x]<s[p] then ans[x]:=s[p];
                exit;
        end;
        mi:=(l+r)>>1;
        if (b<=mi)and(ls[p]>0) then get(ls[p],l,mi,a,b,x)
        else if (a>mi)and(rs[p]>0) then get(rs[p],mi+1,r,a,b,x)
        else begin
                if ls[p]>0 then get(ls[p],l,mi,a,mi,x);
                if rs[p]>0 then get(rs[p],mi+1,r,mi+1,b,x);
        end;
end;

begin
assign(input,'1125.in'); reset(input);
assign(output,'1125.out'); rewrite(output);
        readln(n,l,m);
        tot:=mo;
        g[1]:=1;
        for i:=2 to l do g[i]:=(g[i-1]*base)mod mo;
        for i:=1 to n do begin
                for j:=1 to l do begin
                        read(ch);
                        wd[i,j]:=ord(ch)-ord('a');
                        now[i]:=(now[i]+wd[i,j]*g[j])mod mo;
                end;
                readln;
                inc(t[now[i]]);
                insert(now[i],0,m,0,t[now[i]]);
        end;
        for i:=1 to m do begin
                readln(x1,y1,x2,y2);
                if x1=x2 then fg:=false else fg:=true;
                get(now[x1],0,m,pre[x1],i-1,x1);
                if fg then get(now[x2],0,m,pre[x2],i-1,x2);
                pre[x1]:=i; pre[x2]:=i;
                dec(t[now[x1]]); if fg then dec(t[now[x2]]);
                insert(now[x1],0,m,i,t[now[x1]]);
                if fg then insert(now[x2],0,m,i,t[now[x2]]);

                now[x1]:=( now[x1] - ((wd[x1,y1]*g[y1])mod mo) + wd[x2,y2]*g[y1] +mo)mod mo;
                now[x2]:=( now[x2] - ((wd[x2,y2]*g[y2])mod mo) + wd[x1,y1]*g[y2] +mo)mod mo;
                inc(t[now[x1]]); if fg then inc(t[now[x2]]);
                insert(now[x1],0,m,i,t[now[x1]]);
                if fg then insert(now[x2],0,m,i,t[now[x2]]);
                cc:=wd[x1,y1]; wd[x1,y1]:=wd[x2,y2]; wd[x2,y2]:=cc;
        end;
        for i:=1 to n do get(now[i],0,m,pre[i],m,i);
        for i:=1 to n do writeln(ans[i]);
close(output);
end.
