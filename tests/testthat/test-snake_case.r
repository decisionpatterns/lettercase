library(testthat)
library(lettercase)
library(magrittr)

context( "str_snake_case" )

str_snake_case( 'mission_of_burma' ) %>% expect_equal( 'mission_of_burma' ) 
str_snake_case( 'mission-of-burma' ) %>% expect_equal( 'mission_of_burma' )
str_snake_case( 'mission.of.burma' ) %>% expect_equal( 'mission_of_burma' )
str_snake_case( 'Mission of Burma' ) %>% expect_equal( 'mission_of_burma' )
str_snake_case( 'MissionOfBurma'   ) %>% expect_equal( 'mission_of_burma' )
str_snake_case( 'missionOfBurma'   ) %>% expect_equal( 'mission_of_burma' )
str_snake_case( ' .mission.of.burma. ' ) %>% expect_equal( 'mission_of_burma' )

str_snake_case( 'mission' )         %>% expect_equal( 'mission' )
str_snake_case( 'Mission' )         %>% expect_equal( 'mission' )

str_snake_case( "Catch-22" )        %>% expect_equal( 'catch_22' ) 
str_snake_case( "Catch.22" )        %>% expect_equal( 'catch_22' )
str_snake_case( "Catch_22" )        %>% expect_equal( 'catch_22' )
str_snake_case( "Catch  22" )       %>% expect_equal( 'catch_22' )
str_snake_case( " Catch 22 " )      %>% expect_equal( 'catch_22' )

str_snake_case( "patient.dob" )     %>% expect_equal( 'patient_dob' )
str_snake_case( "patientDob" )      %>% expect_equal( 'patient_dob' )
str_snake_case( "PatientDob" )      %>% expect_equal( 'patient_dob' )
