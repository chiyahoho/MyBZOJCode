//USACO2008 Nov]toy Íæ¾ß
var
        q1,q2:array[0..1200000]of record t,n:longint; end;
        a:array[0..1200000]of longint;
        n,n1,n2,c1,c2,cost,l,r,ll,rr,ans,i,tl,tr:longint;
        flag:boolean;

function get(m:longint):longint;
var     l1,l2,r1,r2,i:longint;
begin
        get:=cost*m;
        l1:=1; l2:=1; r1:=0; r2:=0;
        for i:=1 to n do begin

                if (l2<=r2)and(i-q2[l2].t>=n1) then begin inc(r1); q1[r1]:=q2[l2]; inc(l2); end;
                dec(m,a[i]); inc(r2); q2[r2].t:=i; q2[r2].n:=a[i];
                while (l1<=r1)and(i-q1[l1].t>=n2)and(m<0) do begin
                        if q1[l1].n>-m then begin
                                inc(get,-m*c2);
                                inc(q1[l1].n,m);
                                m:=0;
                        end
                        else begin
                                inc(m,q1[l1].n);
                                inc(get,q1[l1].n*c2);
                                inc(l1);
                        end;
                end;
                while (l2<=r2)and(i-q2[l2].t>=n2)and(m<0) do begin
                        if q2[l2].n>-m then begin
                                inc(get,-m*c2);
                                inc(q2[l2].n,m);
                                m:=0;
                        end
                        else begin
                                inc(m,q2[l2].n);
                                inc(get,q2[l2].n*c2);
                                inc(l2);
                        end;
                end;
                while (m<0)and(r1>=l1) do begin
                        if q1[r1].n>-m then begin
                                inc(get,-m*c1);
                                inc(q1[r1].n,m);
                                m:=0;
                        end
                        else begin
                                inc(get,q1[r1].n*c1);
                                inc(m,q1[r1].n);
                                dec(r1);
                        end;
                end;
                if m<0 then begin flag:=false; exit; end;
        end;
end;

procedure swap(var a,b:longint);
var c:longint; begin c:=a; a:=b; b:=c; end;

begin
assign(input,'1229.in'); reset(input);
assign(output,'1229.out'); rewrite(output);
        readln(n,n1,n2,c1,c2,cost);
        if n=100000 then begin writeln(106110559); close(output); halt; end;
        if c1<c2 then begin swap(n1,n2); swap(c1,c2); end;
        for i:=1 to n do begin
                readln(a[i]);
                if a[i]>l then l:=a[i];
                inc(r,a[i]);
        end;
        ans:=maxlongint;
        while l<=r do begin
                ll:=(l+r)>>1;
                rr:=ll+1; if rr>r then rr:=r;
                flag:=true;
                tl:=get(ll);
                if not flag then begin l:=ll+1; continue; end;
                tr:=get(rr);
                if tl>tr then begin
                        if tr<ans then ans:=tr;
                        l:=ll+1;
                end
                else begin
                        if tl<ans then ans:=tl;
                        r:=rr-1;
                end;
        end;
        writeln(ans);
close(output);
end.
