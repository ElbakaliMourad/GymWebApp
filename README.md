# GymWebApp

Website for gym management. 

After signing up using the membership Id number.

** Members can:
-- Edit their profile.
-- Check classes they are registered on, remove a class from their list, see available classes and register to the ones they wanted.
-- Check personal trainers, and set up an appointment with them.
-- Check visits history.

** Admins can:
-- Edit their profile.
-- Check the list of all members, edit/remove a member from list.
-- Check all the classes, edit/delete class, add new class, check class activity (how many users).
-- check all personal trainers, edit/delete trainer, add new trainers, check trainer activity (how many members used the service). 

++Make sure you edit the Java Resources/src/META-INF/persistence.xml properties to match your database properties, ex: database name, user, password.

- Sign up as new member so the JPA will create the database tables for you.
- Default member role is "Member". you will have to update the "role" (member table) from "Member" to "Admin" to have Admin powers.
