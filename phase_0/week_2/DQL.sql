-- Get all data : gak disarankan karena ambil banyak bandwidth
select * from teachers

-- Get id, first_name, last_name
select id, first_name, last_name
from teachers

-- Membatasi jumlah output menjadi 4
select * 
from teachers
limit 0, 4    -- 0 = starting point, 4 = banyak data yang diambil

select * 
from teachers
limit 1, 2   -- 1 = starting point, 2 = banyak data yg diambil

-- Mengurutkan data berdasarkan column first_name
select *
from teachers
order by first_name asc

-- Mencari dosen yg mengajar di Harvard
select *
from teachers
where school='Harvard University'

-- mencari dosen yg mengajar di harvard atau standford (Cara 1)
select *
from teachers
where school='Harvard University' or school='Standford University'

-- mencari dosen yg mengajar di harvard atau standford (Cara 2)
select *
from teachers
where school in ('Harvard University', 'Standford University')

-- mencari unique university
select DISTINCT (school)
from teachers

-- mencari JUMLAH unique university
select count(DISTINCT(school))
from teachers

-- mencari JUMLAH unique university
select count(DISTINCT(school)) as jumlah_universitas  -- kasih nama
from teachers

-- melihat berapa banyak jumlah data
select count(*)
from teachers

-- melihat data dosen bernama 'james'
select *
from teachers
where first_name='james' -- tanpa binary

-- melihat data dosen bernama 'james'
select *
from teachers
where binary first_name='james' -- dengan binary
