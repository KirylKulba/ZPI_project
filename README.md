# ZPI_project

This is the backend part of my final semester project, that was made in collaboration with my uni-teammates. 

## Overview 

Many people around the world enjoy traveling and discovering new places. To facilitate trip planning and assist in its realization, we have created a web application that allows users to take advantage of various offers provided by people from all over the world. Moreover, it supports establishing connections with individuals who share the same passion for traveling and seeking adventures.

## Tech stack
- Spring
  - Spring Boot
  - Spring Data
  - Spring Security
- PostgreSQL
- ORM - Hibernate

## Functional requirements

- Creating an account in the application using an email address.
- Account activation through an activation link sent to the provided email in the registration form.
- The possibility to log in to the previously created account.
- Completing the profile with detailed information after the first login.
- Viewing one's own profile.
- Editing personal data displayed in the profile.
- The ability to set a profile picture.
- Changing the account password in the user's profile.
- Creating a new post in one of the 5 categories:
  1. accommodation proposal,
  2. shared transportation proposal,
  3. shared travel proposal,
  4. guided tour proposal, or other.
- Upon creation, a new post defaults to the Active status.
- Viewing one's own posts in their profile.
- Editing information contained in one's own posts.
- The ability to add attachments in the form of pictures when creating and editing posts.
- Deleting one's own posts.
- Changing the status (Active/Inactive) for one's own posts.
- Viewing all active posts existing in the system, except one's own.
- Searching for posts on the board by name among all active posts.
- Filtering posts on the board among all active posts.
- Viewing detailed information about the selected post.
- Viewing the profile of the post owner.
- Contacting the post owner through the chat feature.
- Viewing all previous chats.
