###################Vignettes in package dplyr###########################


##<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<Columnwise operations>>>>>>>>>>>>>>>>>>>


library(dplyr, warn.conflicts = FALSE)

#data starwars
View(starwars)
dim(starwars)

starwars %>%
  summarise(across(where(is.character),
                   n_distinct))
#####  1.  Rows  ####
###   Filter rows

starwars %>% filter(skin_color == "light",
                    eye_color == 'brown')
#same as this code
starwars[starwars$skin_color == "light" & starwars$eye_color == "brown",]


###  Arrange rows
starwars %>% arrange(height, mass)

#using descending order
starwars %>% arrange(desc(height))

#choosing rows dpending on their position with slice
starwars %>% slice(5:10)

#slice randomly
starwars %>% slice_sample(n = 20)
#using proportion
starwars %>% slice_sample(prop = 0.10)

 ##Bootstrapping
starwars %>% 
   filter(!is.na(height)) %>%
   slice_max(height, n = 10)
View(starwars)

##Select Columns
#select specific cols
starwars %>% 
  select(hair_color,skin_color, eye_color)

#select from hair_color to eye_color
starwars %>% 
  select(hair_color:eye_color)

#select all except hair_color to eye_color
starwars %>% 
  select(!(hair_color:eye_color))


#select all cols ending with "color"
starwars %>% 
   select(ends_with("color"))

 #renaming using "select" function
starwars %>% 
   select( home_world = homeworld)

#Adding new columns

starwars %>% 
  mutate(height_m = height/100) %>% 
  select( height_m, height, everything())

starwars %>% 
  mutate(
    height_m = height/100,
    BMI = mass/(height_m^2)
    ) %>%
  select(BMI, everything())

starwars_BMI = starwars %>% 
  mutate(
    height_m = height/100,
    BMI = mass/(height_m^2),
    .keep = "none"
  ) 

#change cols order

starwars %>% 
  relocate(
    sex:homeworld,
    .before = height
    )

#summarise
starwars %>% 
  summarise(
  height = mean (
    height,
    na.rm =  TRUE)
  )

#summary making
# step one
 #stepwise summary
a1 = group_by(starwars, species, sex)
a2 = select(a1, height, mass)
a3 = summarise(a2,
               height = mean(
                 height,
                 na.rm = TRUE),
               mass = mean(
                 mass,
                 na.rm = TRUE)
               )

# OR otherwise
#fnctions calling each other
summarise(
  select(
    group_by(starwars, species, sex),
    height, mass),
  height = mean(height, na.rm = TRUE),
  mass = mean( mass, na.rm = TRUE)
)

#inside-out summmary

starwars %>% 
  group_by(species, sex) %>%
  select(height, mass) %>%
  summarise(
    height = mean(height, na.rm = TRUE),
    mass = mean(mass,na.rm = TRUE)
  )


#<>>>>>>><<<< Data Masking >><<<<<<<<>>>>>

starwars %>% filter(homeworld == "Naboo" &
                      starwars$species == "Human")


















































































































































































