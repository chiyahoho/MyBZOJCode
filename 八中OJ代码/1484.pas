//HNOI2009]通往城堡之路
const   oo=100000000000;
var
        ca,i,p,n,s:longint;
        max,cha,mm,d,ans:int64;
        a,b:array[0..10000]of int64;

begin
assign(input,'1484.in'); reset(input);
assign(output,'1484.out'); rewrite(output);
readln(ca);
for ca:=ca downto 1 do begin
        readln(n,d);
        for i:=1 to n do read(a[i]); readln;
        if abs(a[1]-a[n])>(n-1)*d then begin writeln('impossible'); continue; end;

        b[1]:=a[1];
        for i:=2 to n do b[i]:=b[i-1]-d;

        while a[n]<>b[n] do begin
                cha:=oo; max:=-oo; s:=0;
                for i:=n downto 2 do begin
                        if a[i]<=b[i] then dec(s)
                        else begin
                                inc(s);
                                if a[i]-b[i]<cha then cha:=a[i]-b[i];
                        end;
                        if (s>max)and(b[i]<b[i-1]+d) then begin
                                max:=s; p:=i; mm:=cha;
                        end;
                end;
                if b[p-1]-b[p]+d<mm then mm:=b[p-1]-b[p]+d;

                for i:=p to n do inc(b[i],mm);
        end;

        ans:=0;
        for i:=1 to n do inc(ans,abs(a[i]-b[i]));
        writeln(ans);
end;
close(output);
end.