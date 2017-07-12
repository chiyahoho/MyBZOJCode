//Poi2011]Difference
var
        n,i,j,t,ans,ff:longint;
        ch,ch1,ch2:char;
        fr,now:array['a'..'z']of longint;
        a,nt:array[0..1200000]of longint;
        flag:boolean;
begin
assign(input,'2213.in'); reset(input);
assign(output,'2213.out'); rewrite(output);
        readln(n);
        for i:=1 to n do begin
                read(ch);
                if fr[ch]=0 then fr[ch]:=i;
                nt[now[ch]]:=i; now[ch]:=i;
        end;
        for ch:='a' to 'z' do nt[now[ch]]:=n+1;
        for ch1:='a' to 'z' do
        for ch2:='a' to 'z' do if (ch1<>ch2)and(fr[ch1]>0)and(fr[ch2]>0) then begin
                i:=fr[ch1]; j:=fr[ch2]; ff:=0; flag:=false;
                while (i<=now[ch1])or(j<=now[ch2]) do begin
                         if i<j then begin
                                inc(ff); i:=nt[i];
                                if (ff>ans) and(flag) then ans:=ff
                                else if ff-1>ans then ans:=ff-1;
                         end
                         else begin
                                dec(ff); j:=nt[j]; flag:=true;
                                if ff<0 then begin ff:=0; flag:=false; end;
                         end;
                end;
                while i<=now[ch1] do begin
                        inc(ff); i:=nt[i];
                        if (ff>ans) and(flag) then ans:=ff
                        else if ff-1>ans then ans:=ff-1;
                end;
        end;
        writeln(ans);
close(output);
end.
