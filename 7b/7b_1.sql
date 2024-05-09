create or replace function fibonacci(fib int)
returns int
language plpgsql
as $$
declare x1 int default 0;
declare x2 int default 1;
declare x3 int;
begin
	if fib = 1 then
	return x1;
	elseif fib = 2 or fib = 3 then
	return x2;
	else
		while fib>2 loop
			x3=x1+x2;
			x1=x2;
			x2=x3;
			fib=fib-1;
		end loop;
		return x3;
	end if;
end;
$$;
 

create or replace procedure procedura1(n int) language plpgsql as $$
declare x int default 1;
begin 
	while n>0 loop
		raise notice '%', fibonacci(x);
		x=x+1;
		n=n-1;
	end loop;
end;
$$;

call procedura1(10)