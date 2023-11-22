--Creating JOIN TABLE 
select 
  * 
from 
  Absenteeism_at_work as A 
  left join compensation as C on A.ID = C.ID 
  left join Reasons as R on A.Reason_for_absence = R.Number

--To find the healthiest Employees for the bonus (from objective 1)
select 
  * 
from 
  Absenteeism_at_work 
Where 
  Social_drinker = 0 
  and Social_smoker = 0 
  and Body_mass_index < 25 
  and Absenteeism_time_in_hours < (
    select 
      AVG(Absenteeism_time_in_hours) 
    from 
      Absenteeism_at_work
  )

--Compensation rate increase for NON-SMOKERS / Budget $983, 221 so from data .68 increase per Hour / 1414.14 per year
select 
  count(*) as NonSmoker 
from 
  Absenteeism_at_work 
where 
  Social_smoker = 0

  --optimizing querry
 select 
 A.ID , R.Reason, A.Month_of_absence, A.Body_mass_index,
 CASE WHEN A.Body_mass_index <18.5 Then 'Underweight'
	  WHEN A.Body_mass_index between 18.5 and 25 Then 'Normal Weight'
	  WHEN A.Body_mass_index between 25 and 30 Then 'Overweight'
	  WHEN A.Body_mass_index >18.5 Then 'Obese'
	  Else 'Unknown' END as	BMI_Category,
 CASE WHEN A.Month_of_absence IN (12,1,2) Then 'Winter'
	  WHEN A.Month_of_absence IN (3,4,5) Then 'Spring'
	  WHEN A.Month_of_absence IN (6,7,8) Then 'Summer'
	  WHEN A.Month_of_absence IN (9,10,11) Then 'fall'
	  ELSE 'Unknown' END as Season_Names,
Month_of_absence, Day_of_the_week, Transportation_expense, Education, Son,Social_drinker,Social_smoker,Pet,Disciplinary_failure,
Age, Work_load_Average_day, Absenteeism_time_in_hours
from 
  Absenteeism_at_work as A 
  left join compensation as C on A.ID = C.ID 
  left join Reasons as R on A.Reason_for_absence = R.Number

