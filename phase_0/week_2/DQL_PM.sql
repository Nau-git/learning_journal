-- melihat jumlah data
select count(*)
from teachers

-- melihat total salary dosen
select sum(salary)
from teachers

-- melihat gaji dosen tertinggi yg mengajar di MIT
select id, first_name, last_name, max(salary)
from teachers
where school='MIT'

-- melihat rata2 gaji dosen yg mengajar di Harvard
select avg(salary)
from teachers
where school='Harvard University'

-- pembulatan ke bawah = floor, ke atas = ceil
select ceil(avg(salary))
from teachers
where school='Harvard University'

-- cari dosen dengan first_name berawalan 'sam'
select *
from teachers
where first_name like 'sam%'  -- ignore karakter setelah sam

-- cari dosen dengan first_name yang MENGANDUNG 'sam'
select *
from teachers
where first_name like '%sam%' 

-- cari jumlah dosen di tiap uni 
select school, count(id) as total_dosen
FROM teachers
group by school

-- cari gaji tertinggi di tiap uni
select school, max(salary)
from teachers
group by school

-- cari gaji rata2 di tiap uni + dibulatkan ke bawah
select school, floor(avg(salary))
from teachers
group by school


-- sub query

-- menampilkan guru dgn gaji tertinggi
select *
from teachers
where salary=(
  select max(salary)
  from teachers
)

-- menampilkan tiap dosen yg memiliki gaji tertinggi di tiap uni
select *
from teachers
where (school, salary) in (  
  select school, max(salary)
  from teachers
  group by school
) -- pake IN karena ada 2: school dan salary

-- menampilkan minimum gaji di tiap uni
select *
from teachers
where (school, salary) in (  
  select school, min(salary)
  from teachers
  group by school
  )


-- Join table teachers dgn courses
select *
from teachers
join courses on teachers.id=courses.teachers_id; -- teachers.id -> namaTable.namaKolom

select *
from teachers
join courses on teachers.id=courses.teachers_id 
order by teachers.id -- opsi diurutkan


select *
from teachers
JOIN courses on teachers.id=courses.teachers_id
where courses.name='physics'
order by courses.name


-- siapa dosen dgn gaji tertinggi yang ngajar calculus (SALAH)
select teachers.id, teachers.first_name, teachers.last_name, teachers.school, max(teachers.salary)
from teachers
JOIN courses on teachers.id=courses.teachers_id
where courses.name='calculus'

-- siapa dosen dgn gaji tertinggi yang ngajar calculus (BENAR)
select *
from teachers
WHERE salary=(
  SELECT max(salary)
  from teachers
  JOIN courses on teachers.id=courses.teachers_id
  where courses.name='calculus'
)

-- siapa dosen dgn gaji tertinggi yang ngajar fisika (SALAH)
select teachers.id, teachers.first_name, teachers.last_name, teachers.school, min(teachers.salary)
from teachers
JOIN courses on teachers.id=courses.teachers_id
where courses.name='physics'

-- siapa dosen dgn gaji tertinggi yang ngajar fisika (BENAR)
select *
from teachers
WHERE salary=(
  SELECT MIN(salary)
  from teachers
  JOIN courses on teachers.id=courses.teachers_id
  where courses.name='physics'
)



-- melihat dosen dgn jumlah mata kuliah yg diajarkan
select teachers.id, teachers.first_name, teachers.last_name, count(courses.id) as total_matkul
from teachers
join courses on teachers.id=courses.teachers_id
group by teachers.id

select teachers.id, teachers.first_name, teachers.last_name, count(courses.id) as total_matkul
from teachers
join courses on teachers.id=courses.teachers_id
group by teachers.id
order by total_matkul desc


-- filtering -> pake HAVING
-- melihat dosen dgn jumlah mata kuliah yg diajarkan > 1
select teachers.id, teachers.first_name, teachers.last_name, count(courses.id) as total_matkul
from teachers
join courses on teachers.id=courses.teachers_id
group by teachers.id
having total_matkul>1
order by total_matkul asc